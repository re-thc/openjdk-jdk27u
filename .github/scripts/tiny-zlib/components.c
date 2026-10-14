#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <zlib.h>
extern int jdk_ng_deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);
extern int jdk_ng_deflate(z_streamp,int);
extern int jdk_ng_deflateReset(z_streamp);
extern int jdk_ng_deflateEnd(z_streamp);
static uint64_t now(void) {struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static int ng,level;
static void init(z_stream*s) {memset(s,0,sizeof(*s));if((ng?jdk_ng_deflateInit2_(s,level,8,15,8,0,ZLIB_VERSION,sizeof(*s)):deflateInit2(s,level,8,15,8,0))!=Z_OK)abort();}
static void reset(z_stream*s){if((ng?jdk_ng_deflateReset(s):deflateReset(s))!=Z_OK)abort();}
static void end(z_stream*s){if((ng?jdk_ng_deflateEnd(s):deflateEnd(s))!=Z_OK)abort();}
static size_t finish(z_stream*s,unsigned char*in,size_t n,unsigned char*out,size_t cap){s->next_in=in;s->avail_in=n;s->next_out=out;s->avail_out=cap;if((ng?jdk_ng_deflate(s,Z_FINISH):deflate(s,Z_FINISH))!=Z_STREAM_END)abort();return s->total_out;}
static voidpf alloc_trace(voidpf opaque,uInt a,uInt b){(void)opaque;fprintf(stderr,"alloc,%u,%u,%zu\n",a,b,(size_t)a*b);return malloc((size_t)a*b);}
static void free_trace(voidpf opaque,voidpf p){(void)opaque;free(p);}
int main(int argc,char**argv){if(argc!=6)return 1;FILE*f=fopen(argv[1],"rb");if(!f)abort();fseek(f,0,SEEK_END);size_t n=ftell(f);rewind(f);unsigned char*in=malloc(n+1);if(fread(in,1,n,f)!=n)abort();fclose(f);size_t cap=n+n/8+1024;unsigned char*out=malloc(cap),*decoded=malloc(n+1);ng=atoi(argv[2]);level=atoi(argv[3]);char*mode=argv[4];uint64_t budget=(uint64_t)(atof(argv[5])*1e9);z_stream s;size_t len=0;uint64_t count=0,elapsed=0,start=now(),last;
if(!strcmp(mode,"alloc")){memset(&s,0,sizeof(s));s.zalloc=alloc_trace;s.zfree=free_trace;if((ng?jdk_ng_deflateInit2_(&s,level,8,15,8,0,ZLIB_VERSION,sizeof(s)):deflateInit2(&s,level,8,15,8,0))!=Z_OK)abort();end(&s);return 0;}
init(&s);for(int w=0;w<32;w++){reset(&s);len=finish(&s,in,n,out,cap);}end(&s);
int create=!strcmp(mode,"create"),initend=!strcmp(mode,"initend"),fin=!strcmp(mode,"finish"),res=!strcmp(mode,"reset"),timer=!strcmp(mode,"timer"),loop=!strcmp(mode,"loop");
if(!create&&!initend)init(&s);start=now();do {if(create||initend)init(&s);else if(!timer&&!loop)reset(&s);uint64_t a=0,b=0;
if(fin||timer){a=now();if(fin)len=finish(&s,in,n,out,cap);b=now();elapsed+=b-a;}
else if(!initend&&!res&&!loop)len=finish(&s,in,n,out,cap);
if(create||initend)end(&s);count++;last=now();}while(last-start<budget);
if(!create&&!initend)end(&s);if(!fin&&!timer)elapsed=last-start;
/* Independently verify the representative output, outside every timer. */
init(&s);len=finish(&s,in,n,out,cap);end(&s);uLong d=n;if(uncompress(decoded,&d,out,len)!=Z_OK||d!=n||memcmp(in,decoded,n))abort();
printf("%s,%d,%s,%zu,%.3f,%zu,%llu\n",ng?"ng":"stock",level,mode,n,(double)elapsed/count,len,(unsigned long long)count);free(in);free(out);free(decoded);return 0;}
