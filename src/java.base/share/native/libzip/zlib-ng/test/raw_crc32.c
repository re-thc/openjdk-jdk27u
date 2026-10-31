/* Vendor-level raw inflate CRC32 correctness probe.
 * Copyright (C) 2026 Teamoffy Pte. Ltd.
 * For conditions of distribution and use, see copyright notice in zlib.h.
 *
 * Standalone test; no timing and no JDK private-state access.
 * Optional TEST_SIMD uses GNU ld --wrap to count internal fold operations.
 */
#ifndef _GNU_SOURCE
#define _GNU_SOURCE 1
#endif
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>
#ifdef __unix__
#include <sys/mman.h>
#include <unistd.h>
#endif
#include "zlib-ng.h"
#define REQUIRE(c) do { if (!(c)) { fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#c); abort(); } } while (0)
static unsigned cases, last_positive_reads;
#ifdef TEST_SIMD
static unsigned long fold_finals,fold_updates,fold_copies;
#endif
static uint32_t crc_ref(const uint8_t *p,size_t n) {
    uint32_t crc=~0U;
    while(n--) {crc^=*p++;for(int j=0;j<8;j++)crc=(crc>>1)^((0U-(crc&1))&0xedb88320U);}
    return ~crc;
}
static uint32_t adler_ref(const uint8_t *p,size_t n) {
    uint32_t a=1,b=0;while(n--){a=(a+*p++)%65521;b=(b+a)%65521;}return (b<<16)|a;
}
typedef struct {uint8_t *p;size_t n;int wrap;} Enc;
static Enc encode(const uint8_t *p,size_t n,int wrap,const uint8_t *dict,size_t dn) {
    zng_stream z={0};Enc e={malloc(n*2+4096),0,wrap};REQUIRE(e.p);
    REQUIRE(zng_deflateInit2(&z,6,Z_DEFLATED,wrap,8,Z_DEFAULT_STRATEGY)==Z_OK);
    if(dict)REQUIRE(zng_deflateSetDictionary(&z,dict,(unsigned)dn)==Z_OK);
    z.next_in=p;z.avail_in=(unsigned)n;z.next_out=e.p;z.avail_out=(unsigned)(n*2+4096);
    REQUIRE(zng_deflate(&z,Z_FINISH)==Z_STREAM_END);e.n=(size_t)z.total_out;
    REQUIRE(zng_deflateEnd(&z)==Z_OK);memset(e.p+e.n,0xa6,13);return e;
}
static int drive(zng_stream *z,Enc e,const uint8_t *p,size_t n,int crc,size_t is,size_t os,int flush,int truncated) {
    uint8_t *buf=malloc(os+32);REQUIRE(buf);size_t feed=0,got=0;int status=Z_OK;
    size_t provided=e.n+(truncated?-1:13);unsigned steps=0;last_positive_reads=0;
#ifdef TEST_SIMD
    unsigned long initial_finals=fold_finals;
    unsigned long initial_updates=fold_updates+fold_copies;
#endif
    do {
        if(z->avail_in==0 && feed<provided) {size_t k=provided-feed;if(k>is)k=is;z->next_in=e.p+feed;z->avail_in=(unsigned)k;feed+=k;}
        memset(buf,0xc9,os+32);z->next_out=buf;z->avail_out=(unsigned)os;
        unsigned old=z->avail_in;status=zng_inflate(z,flush);size_t made=os-z->avail_out;
        REQUIRE(got+made<=n);REQUIRE(!memcmp(buf,p+got,made));got+=made;if(made)last_positive_reads++;
        for(size_t k=os;k<os+32;k++)REQUIRE(buf[k]==0xc9);
        if(crc && status!=Z_STREAM_END)REQUIRE(z->adler==0);
        REQUIRE(status==Z_OK || status==Z_BUF_ERROR || status==Z_STREAM_END);
        if(status==Z_STREAM_END)break;
        if(feed==provided && z->avail_in==0 && made==0)break;
        REQUIRE(old!=z->avail_in || made || feed<provided || (z->data_type & 384));
        REQUIRE(++steps<4000000);
    } while(1);
    if(truncated)REQUIRE(status!=Z_STREAM_END);
    else {
        REQUIRE(status==Z_STREAM_END);REQUIRE(got==n);REQUIRE(z->total_out==n);REQUIRE(z->total_in==e.n);
        if(crc || e.wrap==31)REQUIRE(z->adler==crc_ref(p,n));
        else if(e.wrap==15)REQUIRE(z->adler==adler_ref(p,n));
#ifdef TEST_SIMD
        unsigned long completed_finals=fold_finals;
        if(!crc)REQUIRE(completed_finals==initial_finals && fold_updates+fold_copies==initial_updates);
        if(crc) {
            REQUIRE(completed_finals-initial_finals<=1);
            if(fold_updates+fold_copies!=initial_updates)
                REQUIRE(completed_finals==initial_finals+1);
        }
#endif
        unsigned in=z->avail_in;const uint8_t *next=z->next_in;uint32_t check=z->adler;
        z->next_out=buf;z->avail_out=(unsigned)os;REQUIRE(zng_inflate(z,Z_NO_FLUSH)==Z_STREAM_END);
        REQUIRE(z->avail_in==in && z->next_in==next && z->adler==check);
#ifdef TEST_SIMD
        REQUIRE(fold_finals==completed_finals);
#endif
    }
    free(buf);cases++;return status;
}
static size_t requested,allocations;
static void *alloc_track(void *v,unsigned n,unsigned s){(void)v;requested+=(size_t)n*s;allocations++;return calloc(n,s);}
static void free_track(void *v,void *p){(void)v;free(p);}
#ifdef TEST_SIMD
#define Z_INTERNAL
#include "crc32_raw.h"
extern void crc32_raw_copy_pclmulqdq(crc32_raw_state *,uint8_t *,const uint8_t *,size_t);
extern void crc32_raw_update_pclmulqdq(crc32_raw_state *,const uint8_t *,size_t);
extern uint32_t crc32_raw_final_pclmulqdq(crc32_raw_state *);
extern void crc32_raw_copy_avx2(crc32_raw_state *,uint8_t *,const uint8_t *,size_t);
extern void crc32_raw_update_avx2(crc32_raw_state *,const uint8_t *,size_t);
extern void crc32_raw_copy_avx512(crc32_raw_state *,uint8_t *,const uint8_t *,size_t);
extern void crc32_raw_update_avx512(crc32_raw_state *,const uint8_t *,size_t);
extern uint32_t __real_crc32_raw_final_pclmulqdq(crc32_raw_state *);
uint32_t __wrap_crc32_raw_final_pclmulqdq(crc32_raw_state *s){fold_finals++;return __real_crc32_raw_final_pclmulqdq(s);}
#define WRAP_COPY(suffix) \
extern void __real_crc32_raw_copy_##suffix(crc32_raw_state*,uint8_t*,const uint8_t*,size_t); \
void __wrap_crc32_raw_copy_##suffix(crc32_raw_state *s,uint8_t *d,const uint8_t *p,size_t n){fold_copies++;__real_crc32_raw_copy_##suffix(s,d,p,n);}
#define WRAP_UPDATE(suffix) \
extern void __real_crc32_raw_update_##suffix(crc32_raw_state*,const uint8_t*,size_t); \
void __wrap_crc32_raw_update_##suffix(crc32_raw_state *s,const uint8_t *p,size_t n){fold_updates++;__real_crc32_raw_update_##suffix(s,p,n);}
WRAP_COPY(pclmulqdq) WRAP_COPY(avx2) WRAP_COPY(avx512)
WRAP_UPDATE(pclmulqdq) WRAP_UPDATE(avx2) WRAP_UPDATE(avx512)
typedef void (*Copy)(crc32_raw_state*,uint8_t*,const uint8_t*,size_t);
typedef void (*Update)(crc32_raw_state*,const uint8_t*,size_t);
static void fold_backend(const char *name,Copy copy,Update update) {
    uint8_t src[65583],dst[65583];
    for(size_t i=0;i<sizeof(src);i++)src[i]=(uint8_t)(i*17+i/23);
    size_t sizes[]={0,1,15,16,17,31,32,63,64,65,127,255,256,511,512,513,4096,32769,65483};
    size_t chunks[]={1,3,15,16,17,31,63,64,65,511,512,8192};
    unsigned total=0;
    for(unsigned l=0;l<sizeof(sizes)/sizeof(*sizes);l++)for(unsigned j=0;j<sizeof(chunks)/sizeof(*chunks);j++)for(unsigned align=0;align<32;align++) {
        crc32_raw_state s __attribute__((aligned(16)));memset(&s,0,sizeof(s));uint32_t seed=0x9db42487;memcpy(s.fold,&seed,4);
        size_t n=sizes[l],off=0;memset(dst,0x65,sizeof(dst));
        copy(&s,dst+align,src+align,0);
        while(off<n){size_t k=n-off;if(k>chunks[j])k=chunks[j];copy(&s,dst+align+off,src+align+off,k);off+=k;}
        REQUIRE(!memcmp(src+align,dst+align,n));REQUIRE(dst[align+n]==0x65);
        REQUIRE(crc32_raw_final_pclmulqdq(&s)==crc_ref(src+align,n));
        REQUIRE(crc32_raw_final_pclmulqdq(&s)==crc_ref(src+align,n));
        memset(&s,0,sizeof(s));memcpy(s.fold,&seed,4);off=0;
        while(off<n){size_t k=n-off;if(k>chunks[j])k=chunks[j];update(&s,src+align+off,k);off+=k;}
        REQUIRE(crc32_raw_final_pclmulqdq(&s)==crc_ref(src+align,n));total++;
    }
    printf("fold %s: %u fragmentation/alignment cases passed\n",name,total);
    unsigned independent=0;
    size_t short_sizes[]={0,1,15,16,17,31,32,63,64,65,127,255,511,512,513};
    for(unsigned l=0;l<sizeof(short_sizes)/sizeof(*short_sizes);l++)for(unsigned sa=0;sa<32;sa++) {
        size_t n=short_sizes[l];uint32_t wanted=crc_ref(src+sa,n);
        for(unsigned da=0;da<32;da++) {
            crc32_raw_state s __attribute__((aligned(16)));memset(&s,0,sizeof(s));uint32_t seed=0x9db42487;memcpy(s.fold,&seed,4);
            memset(dst,0x65,da+n+32);size_t first=n<17?n:17;
            copy(&s,dst+da,src+sa,first);
            copy(&s,dst+da+first,src+sa+first,n-first);
            REQUIRE(!memcmp(src+sa,dst+da,n));REQUIRE(crc32_raw_final_pclmulqdq(&s)==wanted);
            for(unsigned j=0;j<da;j++)REQUIRE(dst[j]==0x65);
            for(size_t j=da+n;j<da+n+32;j++)REQUIRE(dst[j]==0x65);
            independent++;
        }
    }
    printf("fold %s: %u independent source/destination alignment cases passed\n",name,independent);
#ifdef __unix__
    long page=sysconf(_SC_PAGESIZE);REQUIRE(page>=4096);
    uint8_t *gs=mmap(NULL,(size_t)page*3,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
    uint8_t *gd=mmap(NULL,(size_t)page*3,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
    REQUIRE(gs!=MAP_FAILED && gd!=MAP_FAILED);
    REQUIRE(mprotect(gs+page,(size_t)page,PROT_READ|PROT_WRITE)==0);
    REQUIRE(mprotect(gd+page,(size_t)page,PROT_READ|PROT_WRITE)==0);
    for(long i=0;i<page;i++)gs[page+i]=(uint8_t)(i*13+i/7);
    REQUIRE(mprotect(gs+page,(size_t)page,PROT_READ)==0);
    size_t guarded_sizes[]={0,1,2,3,7,15,16,17,31,32,63,64,65,127,255,511,512,513,4096};
    for(unsigned l=0;l<sizeof(guarded_sizes)/sizeof(*guarded_sizes);l++) {
        size_t n=guarded_sizes[l];const uint8_t *p=gs+page*2-n;uint8_t *d=gd+page*2-n;
        crc32_raw_state s __attribute__((aligned(16)));memset(&s,0,sizeof(s));uint32_t seed=0x9db42487;memcpy(s.fold,&seed,4);
        copy(&s,d,p,n);REQUIRE(!memcmp(d,p,n));REQUIRE(crc32_raw_final_pclmulqdq(&s)==crc_ref(p,n));
        memset(&s,0,sizeof(s));memcpy(s.fold,&seed,4);
        update(&s,p,n);REQUIRE(crc32_raw_final_pclmulqdq(&s)==crc_ref(p,n));
    }
    REQUIRE(munmap(gs,(size_t)page*3)==0 && munmap(gd,(size_t)page*3)==0);
    printf("fold %s: %zu guarded input/output sizes passed\n",name,sizeof(guarded_sizes)/sizeof(*guarded_sizes));
#endif
}
#endif
static void finish_prefix(zng_stream *z,const uint8_t *p,size_t n,size_t got) {
    uint8_t out[257];int status;
    do {
        z->next_out=out;z->avail_out=sizeof(out);status=zng_inflate(z,Z_NO_FLUSH);
        size_t made=sizeof(out)-z->avail_out;
        REQUIRE(got+made<=n && !memcmp(out,p+got,made));got+=made;
        REQUIRE(status==Z_OK || status==Z_STREAM_END);
    } while(status!=Z_STREAM_END);
    REQUIRE(got==n && z->total_out==n && z->adler==crc_ref(p,n));cases++;
}
static void lifecycle_edges(const uint8_t *plain) {
    Enc e=encode(plain,64,-15,NULL,0);uint8_t out[64];
    int flushes[]={Z_NO_FLUSH,Z_FINISH,Z_BLOCK,Z_TREES};
    for(unsigned j=0;j<sizeof(flushes)/sizeof(*flushes);j++)for(int enabled=0;enabled<2;enabled++) {
        zng_stream z={0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);
        if(enabled)REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
        for(unsigned k=0;k<3;k++) {
            z.next_in=e.p;z.avail_in=0;z.next_out=out;z.avail_out=k==1?0:sizeof(out);
            REQUIRE(zng_inflate(&z,flushes[j])==Z_BUF_ERROR);
            REQUIRE(z.total_in==0 && z.total_out==0);
            if(enabled)REQUIRE(z.adler==0);
        }
        /* Zero input can advance HEAD; rejection must leave an enabled CRC intact. */
        REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_STREAM_ERROR);
        zng_stream clone={0};REQUIRE(zng_inflateCopy(&clone,&z)==Z_OK);
        drive(&z,e,plain,64,enabled,3,17,Z_NO_FLUSH,0);
        REQUIRE(zng_inflateEnd(&z)==Z_OK);
        drive(&clone,e,plain,64,enabled,17,31,Z_NO_FLUSH,0);
        REQUIRE(zng_inflateEnd(&clone)==Z_OK);
    }
    for(unsigned n=0;n<2;n++) {
        Enc cold=encode(plain,n?64:0,-15,NULL,0);zng_stream z={0},clone={0};
        REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
        REQUIRE(zng_inflateCopy(&clone,&z)==Z_OK);
        drive(&z,cold,plain,n?64:0,1,1,1,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&z)==Z_OK);
        drive(&clone,cold,plain,n?64:0,1,3,17,Z_FINISH,0);
        zng_stream done={0};REQUIRE(zng_inflateCopy(&done,&clone)==Z_OK);uint32_t crc=clone.adler;
        REQUIRE(zng_inflateReset(&clone)==Z_OK);clone.avail_in=0;
        drive(&clone,cold,plain,n?64:0,1,7,31,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&clone)==Z_OK);
#ifdef TEST_SIMD
        unsigned long done_finals=fold_finals;
#endif
        for(unsigned k=0;k<3;k++) {
            done.next_out=out;done.avail_out=sizeof(out);uint32_t ai=done.avail_in;const uint8_t *ni=done.next_in;
            REQUIRE(zng_inflate(&done,Z_NO_FLUSH)==Z_STREAM_END);
            REQUIRE(done.adler==crc && done.next_in==ni && done.avail_in==ai);
        }
#ifdef TEST_SIMD
        REQUIRE(fold_finals==done_finals);
#endif
        REQUIRE(zng_inflateResetKeep(&done)==Z_OK);done.avail_in=0;
        drive(&done,cold,plain,n?64:0,1,17,31,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&done)==Z_OK);free(cold.p);
    }
    /* A cold copy can opt in without changing the source's ordinary raw mode. */
    zng_stream plain_z={0},opted={0};REQUIRE(zng_inflateInit2(&plain_z,-15)==Z_OK);
    REQUIRE(zng_inflateCopy(&opted,&plain_z)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&opted)==Z_OK);
    drive(&plain_z,e,plain,64,0,3,17,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&plain_z)==Z_OK);
    drive(&opted,e,plain,64,1,7,31,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&opted)==Z_OK);free(e.p);

    e=encode(plain,65483,-15,NULL,0);
    for(unsigned phase=0;phase<3;phase++) {
        zng_stream z={0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
        if(phase==1) {
            z.next_in=e.p;z.avail_in=(unsigned)e.n;z.next_out=out;z.avail_out=17;
            REQUIRE(zng_inflate(&z,Z_NO_FLUSH)==Z_OK && z.total_out==17);
        } else if(phase==2)drive(&z,e,plain,65483,1,512,257,Z_NO_FLUSH,0);
        int bad_bits[]={7,-7,48};
        for(unsigned k=0;k<sizeof(bad_bits)/sizeof(*bad_bits);k++) {
            zng_stream before=z;REQUIRE(zng_inflateReset2(&z,bad_bits[k])==Z_STREAM_ERROR);
            REQUIRE(z.next_in==before.next_in && z.avail_in==before.avail_in);
            REQUIRE(z.next_out==before.next_out && z.avail_out==before.avail_out);
            REQUIRE(z.total_in==before.total_in && z.total_out==before.total_out && z.adler==before.adler);
        }
        if(phase==0)drive(&z,e,plain,65483,1,17,257,Z_NO_FLUSH,0);
        else if(phase==1)finish_prefix(&z,plain,65483,17);
        else {z.next_out=out;z.avail_out=sizeof(out);REQUIRE(zng_inflate(&z,Z_NO_FLUSH)==Z_STREAM_END && z.adler==crc_ref(plain,65483));}
        REQUIRE(zng_inflateReset(&z)==Z_OK);z.avail_in=0;
        drive(&z,e,plain,65483,1,512,257,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&z)==Z_OK);
    }
    free(e.p);
    e=encode(plain,65483,-15,plain+32,8192);zng_stream dict={0};
    REQUIRE(zng_inflateInit2(&dict,-15)==Z_OK);REQUIRE(zng_inflateSetDictionary(&dict,plain+32,8192)==Z_OK);
    REQUIRE(zng_inflateEnableRawCRC32(&dict)==Z_OK);drive(&dict,e,plain,65483,1,17,257,Z_NO_FLUSH,0);
    REQUIRE(zng_inflateEnd(&dict)==Z_OK);free(e.p);
    puts("lifecycle edges: zero progress, cold/completed copy, independent opt-in, failed Reset2 and cold dictionary passed");
}
static uint8_t *load(const char *path,size_t *n) {
    FILE *f=fopen(path,"rb");REQUIRE(f);REQUIRE(fseek(f,0,SEEK_END)==0);long size=ftell(f);REQUIRE(size>=0);rewind(f);
    uint8_t *p=malloc((size_t)size+13);REQUIRE(p);REQUIRE(fread(p,1,(size_t)size,f)==(size_t)size);REQUIRE(fclose(f)==0);memset(p+size,0xa6,13);*n=(size_t)size;return p;
}
int main(int argc,char **argv) {
#ifdef TEST_SIMD
    if(__builtin_cpu_supports("pclmul") && __builtin_cpu_supports("sse4.1"))fold_backend("pclmul",crc32_raw_copy_pclmulqdq,crc32_raw_update_pclmulqdq);
    if(__builtin_cpu_supports("pclmul") && __builtin_cpu_supports("sse4.1") && __builtin_cpu_supports("avx2") && __builtin_cpu_supports("vpclmulqdq"))fold_backend("vpclmul-avx2",crc32_raw_copy_avx2,crc32_raw_update_avx2);
    if(__builtin_cpu_supports("pclmul") && __builtin_cpu_supports("sse4.1") && __builtin_cpu_supports("avx512f") && __builtin_cpu_supports("avx512dq") && __builtin_cpu_supports("avx512bw") && __builtin_cpu_supports("avx512vl") && __builtin_cpu_supports("vpclmulqdq"))fold_backend("vpclmul-avx512",crc32_raw_copy_avx512,crc32_raw_update_avx512);
#endif
    uint8_t *plain=malloc(200001);REQUIRE(plain);uint32_t random=123;
    size_t sizes[]={0,1,15,16,17,63,64,65,511,512,513,32767,32768,32769,65483,129153,200000};
    size_t chunks[][2]={{1,1},{3,17},{17,257},{512,512},{512,8192},{32768,65536},{65536,200001}};
    for(int pattern=0;pattern<2;pattern++) {
        for(size_t j=0;j<200001;j++){random^=random<<13;random^=random>>17;random^=random<<5;plain[j]=(uint8_t)(pattern?j%23:random);}
        for(unsigned l=0;l<sizeof(sizes)/sizeof(*sizes);l++) {
            size_t n=sizes[l];Enc e=encode(plain,n,-15,NULL,0);
            for(unsigned j=0;j<sizeof(chunks)/sizeof(*chunks);j++)for(int finish=0;finish<2;finish++) {
                size_t is=chunks[j][0],os=chunks[j][1];if(n>1024 && is==1){is=7;os=31;}
                zng_stream z={0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
                drive(&z,e,plain,n,1,is,os,finish?Z_FINISH:Z_NO_FLUSH,0);
                REQUIRE(zng_inflateReset(&z)==Z_OK);REQUIRE(z.adler==0);z.avail_in=0;
                drive(&z,e,plain,n,1,is,os,Z_NO_FLUSH,0);
                REQUIRE(zng_inflateResetKeep(&z)==Z_OK);REQUIRE(z.adler==0);z.avail_in=0;
                drive(&z,e,plain,n,1,is,os,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&z)==Z_OK);
            }
            if(n>0){zng_stream z={0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);drive(&z,e,plain,n,1,7,257,Z_NO_FLUSH,1);REQUIRE(zng_inflateEnd(&z)==Z_OK);}
            free(e.p);
            for(int w=0;w<3;w++) {int wb=w==0?-15:w==1?15:31;Enc d=encode(plain,n,wb,NULL,0);zng_stream z={0};REQUIRE(zng_inflateInit2(&z,wb)==Z_OK);if(w)REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_STREAM_ERROR);drive(&z,d,plain,n,0,17,511,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&z)==Z_OK);free(d.p);}
        }
    }
    /* Explicit empty/intermediate blocks and all supported inflate flush modes. */
    uint8_t blocks[]={0,0,0,255,255,0,5,0,250,255,'h','e','l','l','o',3,0};
    uint8_t wrapped_blocks[sizeof(blocks)+13];memcpy(wrapped_blocks,blocks,sizeof(blocks));memset(wrapped_blocks+sizeof(blocks),0xa6,13);
    Enc be={wrapped_blocks,sizeof(blocks),-15};int flushes[]={Z_NO_FLUSH,Z_PARTIAL_FLUSH,Z_SYNC_FLUSH,Z_BLOCK,Z_TREES,Z_FINISH};
    for(unsigned i=0;i<sizeof(flushes)/sizeof(*flushes);i++)for(unsigned j=1;j<=17;j+=8){zng_stream w={0};REQUIRE(zng_inflateInit2(&w,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&w)==Z_OK);drive(&w,be,(const uint8_t*)"hello",5,1,j,j,flushes[i],0);REQUIRE(zng_inflateEnd(&w)==Z_OK);}
    /* Small window wraps and output larger than the history window. */
    for(int wb=9;wb<=15;wb+=2)for(unsigned j=0;j<3;j++) {
        Enc a=encode(plain,200000,-wb,NULL,0);zng_stream w={0};REQUIRE(zng_inflateInit2(&w,-wb)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&w)==Z_OK);
        drive(&w,a,plain,200000,1,512,j==0?511:j==1?8192:200001,j==2?Z_FINISH:Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&w)==Z_OK);free(a.p);
    }
    /* Reset2 disables the extension; dictionaries are history, not payload CRC. */
    Enc e=encode(plain,65483,-15,plain+32,8192);zng_stream z={0};
    z.zalloc=alloc_track;z.zfree=free_track;REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);size_t a=allocations,bytes=requested;
    REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);REQUIRE(allocations==a);
    REQUIRE(zng_inflateSetDictionary(&z,plain+32,8192)==Z_OK);drive(&z,e,plain,65483,1,7,31,Z_NO_FLUSH,0);
    REQUIRE(zng_inflateReset2(&z,-15)==Z_OK);uint32_t old=z.adler;REQUIRE(zng_inflateSetDictionary(&z,plain+32,8192)==Z_OK);z.avail_in=0;
    drive(&z,e,plain,65483,0,7,31,Z_NO_FLUSH,0);REQUIRE(z.adler==old);REQUIRE(allocations==a);REQUIRE(zng_inflateEnd(&z)==Z_OK);free(e.p);
    printf("inflate allocator: %zu calls, %zu requested bytes; enable/reset/dictionary allocate none\n",a,bytes);
    /* Invalid payload rejects normally, reset recovers, and activation is cold-only. */
    uint8_t bad[]={7};z=(zng_stream){0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
    uint8_t out[128];z.next_in=bad;z.avail_in=1;z.next_out=out;z.avail_out=sizeof(out);REQUIRE(zng_inflate(&z,Z_NO_FLUSH)==Z_DATA_ERROR);
    REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_STREAM_ERROR);REQUIRE(zng_inflateReset(&z)==Z_OK);z.avail_in=0;e=encode(plain,64,-15,NULL,0);drive(&z,e,plain,64,1,512,128,Z_NO_FLUSH,0);REQUIRE(zng_inflateEnd(&z)==Z_OK);free(e.p);
    REQUIRE(zng_inflateEnableRawCRC32(NULL)==Z_STREAM_ERROR);
    for(int wb=15;wb<=31;wb+=16){e=encode(plain,65483,wb,NULL,0);e.p[e.n-(wb==31?8:4)]^=1;z=(zng_stream){0};REQUIRE(zng_inflateInit2(&z,wb)==Z_OK);z.next_in=e.p;z.avail_in=(unsigned)e.n;uint8_t *tmp=malloc(70000);z.next_out=tmp;z.avail_out=70000;REQUIRE(zng_inflate(&z,Z_FINISH)==Z_DATA_ERROR);REQUIRE(zng_inflateEnd(&z)==Z_OK);free(tmp);free(e.p);}
    /* Real gzip members: the caller skips each header and owns each trailer. */
    size_t lens[]={0,64,65483};Enc members[3];size_t total=7;
    for(unsigned m=0;m<3;m++){members[m]=encode(plain,lens[m],31,NULL,0);REQUIRE(members[m].p[3]==0);total+=members[m].n;}
    uint8_t *joined=malloc(total);size_t pos=0;
    for(unsigned m=0;m<3;m++){memcpy(joined+pos,members[m].p,members[m].n);pos+=members[m].n;}
    memset(joined+pos,0xa6,7);z=(zng_stream){0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
    z.next_in=joined+10;z.avail_in=(unsigned)(total-10);
    for(unsigned m=0;m<3;m++) {
        size_t got=0;int status;
        do{z.next_out=out;z.avail_out=sizeof(out);status=zng_inflate(&z,Z_NO_FLUSH);size_t k=sizeof(out)-z.avail_out;REQUIRE(got+k<=lens[m]);REQUIRE(!memcmp(out,plain+got,k));got+=k;REQUIRE(status==Z_OK || status==Z_STREAM_END);}while(status!=Z_STREAM_END);
        REQUIRE(got==lens[m]);REQUIRE(z.total_in==members[m].n-18);REQUIRE(z.adler==crc_ref(plain,lens[m]));
        const uint8_t *t=z.next_in;uint32_t check=(uint32_t)t[0]|((uint32_t)t[1]<<8)|((uint32_t)t[2]<<16)|((uint32_t)t[3]<<24);REQUIRE(check==z.adler);
        uint32_t size=(uint32_t)t[4]|((uint32_t)t[5]<<8)|((uint32_t)t[6]<<16)|((uint32_t)t[7]<<24);REQUIRE(size==lens[m]);
        z.next_in+=8;z.avail_in-=8;
        if(m!=2){z.next_in+=10;z.avail_in-=10;REQUIRE(zng_inflateReset(&z)==Z_OK);}
        cases++;free(members[m].p);
    }
    REQUIRE(z.avail_in==7 && z.next_in[0]==0xa6);REQUIRE(zng_inflateEnd(&z)==Z_OK);free(joined);
    /* Late malformed block retains produced-byte accounting without final CRC. */
    uint8_t late[]={0,5,0,250,255,'h','e','l','l','o',7};z=(zng_stream){0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
    z.next_in=late;z.avail_in=sizeof(late);z.next_out=out;z.avail_out=sizeof(out);REQUIRE(zng_inflate(&z,Z_NO_FLUSH)==Z_DATA_ERROR);REQUIRE(z.total_out==5 && !memcmp(out,"hello",5));REQUIRE(z.adler==0);REQUIRE(zng_inflateEnd(&z)==Z_OK);cases++;
    /* Copy a live folded accumulator and finish both independent streams. */
    e=encode(plain,65483,-15,NULL,0);z=(zng_stream){0};REQUIRE(zng_inflateInit2(&z,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&z)==Z_OK);
    z.next_in=e.p;z.avail_in=(unsigned)e.n;z.next_out=out;z.avail_out=17;REQUIRE(zng_inflate(&z,Z_NO_FLUSH)==Z_OK);REQUIRE(z.total_out==17 && !memcmp(out,plain,17));
    zng_stream clone={0};REQUIRE(zng_inflateCopy(&clone,&z)==Z_OK);zng_stream *streams[]={&z,&clone};
    for(unsigned j=0;j<2;j++){zng_stream *a=streams[j];size_t got=17;int status;
        do{a->next_out=out;a->avail_out=sizeof(out);status=zng_inflate(a,Z_NO_FLUSH);size_t k=sizeof(out)-a->avail_out;REQUIRE(got+k<=65483 && !memcmp(out,plain+got,k));got+=k;REQUIRE(status==Z_OK || status==Z_STREAM_END);}while(status!=Z_STREAM_END);
        REQUIRE(got==65483 && a->adler==crc_ref(plain,65483));REQUIRE(zng_inflateEnd(a)==Z_OK);cases++;
    }free(e.p);
    lifecycle_edges(plain);
    if(argc==3) {
        const char *pnames[]={"json4k","message64k","building-html"};const char *gnames[]={"tiny64.gz","request64k-L1-ng.gz","offline-html-L9-stock.gz"};
        for(unsigned k=0;k<3;k++) {
            char path[2048];size_t pn,gn;REQUIRE(snprintf(path,sizeof(path),"%s/inputs/%s",argv[1],pnames[k])<(int)sizeof(path));uint8_t *p=load(path,&pn);if(k==0)pn=64;
            REQUIRE(snprintf(path,sizeof(path),k==0?"%s/%s":"%s/streams/%s",k==0?argv[2]:argv[1],gnames[k])<(int)sizeof(path));uint8_t *g=load(path,&gn);REQUIRE(gn>=18 && g[3]==0);Enc body={g+10,gn-18,-15};
            for(unsigned j=0;j<3;j++){size_t cap=j==0?512:j==1?8192:16384;zng_stream w={0};REQUIRE(zng_inflateInit2(&w,-15)==Z_OK);REQUIRE(zng_inflateEnableRawCRC32(&w)==Z_OK);
#ifdef TEST_SIMD
                unsigned long before_c=fold_copies,before_u=fold_updates,before_f=fold_finals;
#endif
                drive(&w,body,p,pn,1,512,cap,Z_NO_FLUSH,0);
                printf("fixture %s input512 output%zu: %u positive vendor calls",pnames[k],cap,last_positive_reads);
#ifdef TEST_SIMD
                printf(", %lu fold-copy updates, %lu noncopy updates, %lu final reductions",fold_copies-before_c,fold_updates-before_u,fold_finals-before_f);
                if(fold_copies!=before_c || fold_updates!=before_u)REQUIRE(fold_finals-before_f==1);
#endif
                puts("");REQUIRE(zng_inflateEnd(&w)==Z_OK);
            }free(g);free(p);
        }
    }
    free(plain);printf("PASS %u raw/default/reset/dictionary/error/member/copy cases\n",cases);return 0;
}
