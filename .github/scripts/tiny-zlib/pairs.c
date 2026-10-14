#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <zlib.h>
#define DECL(P) extern int P##deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);extern int P##deflate(z_streamp,int);extern int P##deflateReset(z_streamp);extern int P##deflateEnd(z_streamp);
DECL(jdk_ng_) DECL(cand_)
typedef struct{int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);}api;
#define API(P) {P##deflateInit2_,P##deflate,P##deflateReset,P##deflateEnd}
static api lib[]={API(jdk_ng_),API(cand_)};
static uint64_t now(clockid_t c){struct timespec t;clock_gettime(c,&t);return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static void init(api*a,z_stream*s,int l){memset(s,0,sizeof(*s));if(a->init(s,l,8,15,8,0,ZLIB_VERSION,sizeof(*s))!=Z_OK)abort();}
static size_t finish(api*a,z_stream*s,unsigned char*in,size_t n,unsigned char*out,size_t cap){s->next_in=in;s->avail_in=n;s->next_out=out;s->avail_out=cap;if(a->def(s,Z_FINISH)!=Z_STREAM_END)abort();return s->total_out;}
int main(int argc,char**argv){if(argc!=6)return 1;FILE*f=fopen(argv[1],"rb");if(!f)abort();fseek(f,0,SEEK_END);size_t n=ftell(f);rewind(f);unsigned char*in=malloc(n+1);if(fread(in,1,n,f)!=n)abort();fclose(f);int l=atoi(argv[2]),create=atoi(argv[3]),reverse=atoi(argv[4]);uint64_t budget=atof(argv[5])*1e9;size_t cap=n+n/8+1024;unsigned char*out=malloc(cap),*ref=malloc(cap),*decoded=malloc(n+1);size_t ref_len=0;for(int i=0;i<2;i++){int k=reverse?1-i:i;api*a=&lib[k];z_stream s;init(a,&s,l);for(int w=0;w<32;w++){if(a->reset(&s)!=Z_OK)abort();finish(a,&s,in,n,out,cap);}if(a->end(&s)!=Z_OK)abort();if(!create)init(a,&s,l);uint64_t count=0,wall=now(CLOCK_MONOTONIC),cpu=now(CLOCK_THREAD_CPUTIME_ID),last;size_t len=0;do{if(create)init(a,&s,l);else if(a->reset(&s)!=Z_OK)abort();len=finish(a,&s,in,n,out,cap);if(create&&a->end(&s)!=Z_OK)abort();count++;last=now(CLOCK_MONOTONIC);}while(last-wall<budget);uint64_t cputime=now(CLOCK_THREAD_CPUTIME_ID)-cpu;if(!create&&a->end(&s)!=Z_OK)abort();uLong d=n;if(uncompress(decoded,&d,out,len)!=Z_OK||d!=n||memcmp(in,decoded,n))abort();if(i==0){memcpy(ref,out,len);ref_len=len;}else if(len!=ref_len||memcmp(ref,out,len))abort();printf("%s,%d,%s,%zu,%.3f,%.3f,%zu,%llu\n",k?"candidate":"baseline",l,create?"create":"reuse",n,(double)(last-wall)/count,(double)cputime/count,len,(unsigned long long)count);}return 0;}
