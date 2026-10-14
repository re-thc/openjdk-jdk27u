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
static api lib[]={API(jdk_ng_),API(cand_),API()};
static uint64_t now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static void init(api*a,z_stream*s,int l){memset(s,0,sizeof(*s));if(a->init(s,l,8,15,8,0,ZLIB_VERSION,sizeof(*s))!=Z_OK)abort();}
static size_t finish(api*a,z_stream*s,unsigned char*in,size_t n,unsigned char*out,size_t cap){s->next_in=in;s->avail_in=n;s->next_out=out;s->avail_out=cap;if(a->def(s,Z_FINISH)!=Z_STREAM_END)abort();return s->total_out;}
int main(int argc,char**argv){if(argc!=6)return 1;FILE*f=fopen(argv[1],"rb");if(!f)abort();fseek(f,0,SEEK_END);size_t n=ftell(f);rewind(f);unsigned char*in=malloc(n+1);if(fread(in,1,n,f)!=n)abort();fclose(f);int l=atoi(argv[2]),reverse=atoi(argv[4]);char*mode=argv[3];int create=!strcmp(mode,"create"),initend=!strcmp(mode,"initend"),fin=!strcmp(mode,"finish"),res=!strcmp(mode,"reset"),timer=!strcmp(mode,"timer");uint64_t budget=atof(argv[5])*1e9;size_t cap=n+n/8+1024;unsigned char*out[3],*decoded=malloc(n+1);z_stream s[3];size_t lens[3]={0};uint64_t elapsed[3]={0},count=0;for(int k=0;k<3;k++){out[k]=malloc(cap);init(&lib[k],&s[k],l);for(int w=0;w<32;w++){if(lib[k].reset(&s[k])!=Z_OK)abort();finish(&lib[k],&s[k],in,n,out[k],cap);}if(create||initend){if(lib[k].end(&s[k])!=Z_OK)abort();}}
uint64_t start=now();do{for(int i=0;i<3;i++){int k=(i+count)%3;if(reverse)k=2-k;api*a=&lib[k];if(fin&&a->reset(&s[k])!=Z_OK)abort();uint64_t t=now();if(create||initend)init(a,&s[k],l);else if(!fin&&!timer&&a->reset(&s[k])!=Z_OK)abort();if(!initend&&!res&&!timer)lens[k]=finish(a,&s[k],in,n,out[k],cap);if((create||initend)&&a->end(&s[k])!=Z_OK)abort();elapsed[k]+=now()-t;}count++;}while(now()-start<budget);
for(int k=0;k<3;k++){if(create||initend)init(&lib[k],&s[k],l);else if(lib[k].reset(&s[k])!=Z_OK)abort();lens[k]=finish(&lib[k],&s[k],in,n,out[k],cap);if(lib[k].end(&s[k])!=Z_OK)abort();uLong d=n;if(uncompress(decoded,&d,out[k],lens[k])!=Z_OK||d!=n||memcmp(in,decoded,n))abort();printf("%s,%d,%s,%zu,%.3f,%zu,%llu\n",k==0?"baseline":k==1?"candidate":"stock",l,mode,n,(double)elapsed[k]/count,lens[k],(unsigned long long)count);}if(lens[0]!=lens[1]||memcmp(out[0],out[1],lens[0]))abort();return 0;}
