#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>
#define DECL(P) extern int P##deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);extern int P##deflate(z_streamp,int);extern int P##deflateReset(z_streamp);extern int P##deflateEnd(z_streamp);extern int P##deflateSetDictionary(z_streamp,const Bytef*,uInt);extern int P##deflateParams(z_streamp,int,int);
DECL(jdk_ng_) DECL(cand_)
typedef struct {int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);int(*dict)(z_streamp,const Bytef*,uInt);int(*params)(z_streamp,int,int);} api;
#define API(P) {P##deflateInit2_,P##deflate,P##deflateReset,P##deflateEnd,P##deflateSetDictionary,P##deflateParams}
static api libs[]={API(jdk_ng_),API(cand_)};
static unsigned char dictionary[40000];
static void fail(const char*msg){fprintf(stderr,"FAIL %s\n",msg);abort();}
typedef struct {unsigned char *p;size_t len,cap;} bytes;
static void space(bytes*b,z_stream*s,size_t chunk){if(b->len+chunk>b->cap){b->cap=(b->len+chunk)*2;b->p=realloc(b->p,b->cap);if(!b->p)abort();}s->next_out=b->p+b->len;s->avail_out=chunk;}
static void pump(api*a,z_stream*s,bytes*b,const unsigned char*p,size_t n,int flush,size_t outchunk){s->next_in=(Bytef*)p;s->avail_in=n;int rc;size_t loops=0;do{space(b,s,outchunk);uInt avail=s->avail_out;rc=a->def(s,flush);b->len+=avail-s->avail_out;if(rc!=Z_OK&&rc!=Z_STREAM_END&&rc!=Z_BUF_ERROR)fail("deflate return");if(++loops>20000000)fail("stalled");if(rc==Z_STREAM_END)break;}while(s->avail_in||!s->avail_out||flush==Z_FINISH);if(s->avail_in)fail("unconsumed input");if(flush==Z_FINISH&&rc!=Z_STREAM_END)fail("unfinished");}
static void verify(bytes*b,const unsigned char*input,size_t n,int wb,int dict){z_stream z={0};if(inflateInit2(&z,wb)!=Z_OK)fail("inflate init");unsigned char*out=malloc(n+16);if(wb<0&&dict&&inflateSetDictionary(&z,dictionary,sizeof(dictionary))!=Z_OK)fail("raw dict");z.next_in=b->p;z.avail_in=b->len;z.next_out=out;z.avail_out=n+16;int rc=inflate(&z,Z_FINISH);if(rc==Z_NEED_DICT&&dict){if(inflateSetDictionary(&z,dictionary,sizeof(dictionary))!=Z_OK)fail("dict");rc=inflate(&z,Z_FINISH);}if(rc!=Z_STREAM_END||z.total_out!=n||memcmp(input,out,n))fail("stock inflate");inflateEnd(&z);free(out);}
static bytes compress_case(api*a,z_stream*s,const unsigned char*in,size_t n,int level,int strategy,int wb,int scenario,int dict,int mem,int reuse){bytes b={0};if(reuse){if(a->reset(s)!=Z_OK)fail("reset");if(a->params(s,level,strategy)!=Z_OK)fail("reset params");}else{memset(s,0,sizeof(*s));if(a->init(s,level,8,wb,mem,strategy,ZLIB_VERSION,sizeof(*s))!=Z_OK)fail("init");}if(dict&&a->dict(s,dictionary,sizeof(dictionary))!=Z_OK)fail("set dict");
unsigned char unused=0;s->next_in=(Bytef*)in;s->avail_in=n;s->next_out=&unused;s->avail_out=0;int zero=a->def(s,Z_NO_FLUSH);if(zero!=Z_BUF_ERROR&&zero!=Z_OK)fail("zero output");
size_t outchunk=scenario==1?(n>65536?127:1):scenario==2?7:scenario==3?31:n+n/8+1024;size_t offset=0;size_t inchunk=scenario==1?(n>65536?4096:63):scenario==2?(n>65536?8191:1):n;
if(scenario>=3){size_t first=n<64?n:64;pump(a,s,&b,in,first,Z_NO_FLUSH,outchunk);offset=first;
 if(scenario==3){int rc;do{space(&b,s,outchunk);uInt avail=s->avail_out;rc=a->params(s,(level+3)%10,(strategy+1)%5);b.len+=avail-s->avail_out;}while(rc==Z_BUF_ERROR);if(rc!=Z_OK)fail("params");}
 else if(scenario==4)pump(a,s,&b,in+offset,0,Z_FULL_FLUSH,outchunk);
}
while(offset<n){size_t count=n-offset;if(inchunk&&count>inchunk)count=inchunk;pump(a,s,&b,in+offset,count,Z_NO_FLUSH,outchunk);offset+=count;}
pump(a,s,&b,in+n,0,Z_FINISH,outchunk);verify(&b,in,n,wb,dict);return b;}
int main(int argc,char**argv){if(argc<2)return 1;for(size_t i=0;i<sizeof(dictionary);i++)dictionary[i]=(unsigned char)(i%97);unsigned long cases=0;uint64_t output=0;for(int fidx=1;fidx<argc;fidx++){FILE*f=fopen(argv[fidx],"rb");if(!f)abort();fseek(f,0,SEEK_END);size_t n=ftell(f);rewind(f);unsigned char*in=malloc(n+1);if(fread(in,1,n,f)!=n)abort();fclose(f);
for(int level=0;level<=9;level++)for(int strategy=0;strategy<=4;strategy++)for(int raw=0;raw<2;raw++)for(int scenario=0;scenario<5;scenario++)for(int dict=0;dict<2;dict++){
/* Long inputs cover every level/strategy and transitions; tiny inputs cover the full matrix. */
if(n>65536&&(level!=1&&level!=6&&level!=9))continue;if(n>1024&&scenario==2)continue;
int wb=raw?-15:15,mem=(scenario==2?1:scenario==4?9:8);z_stream s[2];for(int reuse=0;reuse<2;reuse++){bytes b[2];for(int lib=0;lib<2;lib++)b[lib]=compress_case(&libs[lib],&s[lib],in,n,level,strategy,wb,scenario,dict,mem,reuse);if(b[0].len!=b[1].len||memcmp(b[0].p,b[1].p,b[0].len)){fprintf(stderr,"file=%s n=%zu level=%d strategy=%d raw=%d scenario=%d dict=%d reuse=%d\n",argv[fidx],n,level,strategy,raw,scenario,dict,reuse);fail("compressed byte equality");}output+=b[0].len;cases++;free(b[0].p);free(b[1].p);}for(int lib=0;lib<2;lib++)if(libs[lib].end(&s[lib])!=Z_OK)fail("end");}
free(in);printf("PASS %s cases=%lu output=%llu\n",argv[fidx],cases,(unsigned long long)output);fflush(stdout);}printf("TOTAL %lu paired cases; %lu stock-inflate checks\n",cases,cases*2);return 0;}
