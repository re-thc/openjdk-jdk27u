#define _GNU_SOURCE 1
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <sys/resource.h>
#include <zlib.h>
#define DECL(P) extern int P##deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);extern int P##deflate(z_streamp,int);extern int P##deflateReset(z_streamp);extern int P##deflateEnd(z_streamp);
DECL(jdk_ng_) DECL(cand_)
typedef struct {int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);} api;
#define API(P) {P##deflateInit2_,P##deflate,P##deflateReset,P##deflateEnd}
#ifdef CANDIDATE_A
#define ARM_A API(cand_)
#else
#define ARM_A API(jdk_ng_)
#endif
#ifdef STOCK_B
static api libs[]={ARM_A,API()};
#else
static api libs[]={ARM_A,API(cand_)};
#endif
static uint64_t now(clockid_t c) {struct timespec t;if(clock_gettime(c,&t))abort();return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
typedef struct {uint64_t periods,throttled,throttled_us,usage_us;} throttle;
static throttle stats(void) {throttle t={0};FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)abort();char key[80];unsigned long long v;while(fscanf(f,"%79s %llu",key,&v)==2){if(!strcmp(key,"nr_periods"))t.periods=v;else if(!strcmp(key,"nr_throttled"))t.throttled=v;else if(!strcmp(key,"throttled_usec"))t.throttled_us=v;else if(!strcmp(key,"usage_usec"))t.usage_us=v;}fclose(f);return t;}
static void init(api*a,z_stream*s,int level) {memset(s,0,sizeof(*s));if(a->init(s,level,8,15,8,0,ZLIB_VERSION,sizeof(*s))!=Z_OK)abort();}
static size_t finish(api*a,z_stream*s,unsigned char*in,size_t n,unsigned char*out,size_t cap) {s->next_in=in;s->avail_in=n;s->next_out=out;s->avail_out=cap;if(a->def(s,Z_FINISH)!=Z_STREAM_END)abort();return s->total_out;}
int main(int argc,char**argv) {
    if(argc!=7)return 1;
    FILE*f=fopen(argv[1],"rb");if(!f)abort();fseek(f,0,SEEK_END);size_t n=ftell(f);rewind(f);
    unsigned char*in=malloc(n+1);if(!in||fread(in,1,n,f)!=n)abort();fclose(f);
    int level=atoi(argv[2]),iterations=atoi(argv[4]),blocks=atoi(argv[5]),pairs=atoi(argv[6]);
    int create=!strcmp(argv[3],"create"),initend=!strcmp(argv[3],"initend"),resetonly=!strcmp(argv[3],"reset");
    if(iterations<1||blocks<2||pairs<1)abort();
    size_t cap=n+n/8+1024,lens[2]={0};unsigned char*out[2],*decoded=malloc(n+1);z_stream s[2];
    /* Both arms use the default allocator. Identical warmup primes each backend;
     * no allocator configuration is changed. State/order and faults are recorded. */
    for(int k=0;k<2;k++) {out[k]=malloc(cap);if(!out[k])abort();init(&libs[k],&s[k],level);for(int w=0;w<64;w++){if(libs[k].reset(&s[k])!=Z_OK)abort();finish(&libs[k],&s[k],in,n,out[k],cap);}if(libs[k].end(&s[k])!=Z_OK)abort();}
    if(!create&&!initend)for(int k=0;k<2;k++)init(&libs[k],&s[k],level);
    puts("mode,level,size,block,pair,order,arm,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttle_periods,throttled_periods,throttled_us,cgroup_usage_us,output_bytes");
    for(int block=0;block<blocks;block++)for(int pair=0;pair<pairs;pair++)for(int order=0;order<2;order++) {
        int k=(block+pair)%2?1-order:order;api*a=&libs[k];struct rusage ra,rb;throttle ta=stats();getrusage(RUSAGE_THREAD,&ra);
        uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);
        for(int i=0;i<iterations;i++) {
            if(create||initend)init(a,&s[k],level);else if(a->reset(&s[k])!=Z_OK)abort();
            if(!initend&&!resetonly)lens[k]=finish(a,&s[k],in,n,out[k],cap);
            if((create||initend)&&a->end(&s[k])!=Z_OK)abort();
        }
        uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);getrusage(RUSAGE_THREAD,&rb);throttle tb=stats();
        printf("%s,%d,%zu,%d,%d,%d,%d,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%llu,%llu,%zu\n",argv[3],level,n,block,pair,order,k,iterations,(unsigned long long)(w1-w0),(unsigned long long)(c1-c0),rb.ru_nvcsw-ra.ru_nvcsw,rb.ru_nivcsw-ra.ru_nivcsw,rb.ru_minflt-ra.ru_minflt,rb.ru_majflt-ra.ru_majflt,(unsigned long long)(tb.periods-ta.periods),(unsigned long long)(tb.throttled-ta.throttled),(unsigned long long)(tb.throttled_us-ta.throttled_us),(unsigned long long)(tb.usage_us-ta.usage_us),lens[k]);
    }
    /* Every measured cell gets untimed stock-inflate guards; a separate full
     * differential matrix checks every complete test stream, not every timed call. */
    for(int k=0;k<2;k++) {
        if(create||initend)init(&libs[k],&s[k],level);else if(libs[k].reset(&s[k])!=Z_OK)abort();
        lens[k]=finish(&libs[k],&s[k],in,n,out[k],cap);uLong size=n;
        if(uncompress(decoded,&size,out[k],lens[k])!=Z_OK||size!=n||memcmp(in,decoded,n))abort();
        if(libs[k].end(&s[k])!=Z_OK)abort();
    }
#ifndef STOCK_B
    if(lens[0]!=lens[1]||memcmp(out[0],out[1],lens[0]))abort();
#endif
    for(int k=0;k<2;k++)free(out[k]);
    free(in);free(decoded);return 0;
}
