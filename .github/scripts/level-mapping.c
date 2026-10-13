#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <zlib.h>
extern int jdk_ng_deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);
extern int jdk_ng_deflate(z_streamp,int);
extern int jdk_ng_deflateReset(z_streamp);
extern int jdk_ng_deflateEnd(z_streamp);
static double now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC,&t);
    return t.tv_sec+t.tv_nsec*1e-9;
}
static void init(z_stream* s,int ng,int level) {
    memset(s,0,sizeof(*s));
    int r=ng ? jdk_ng_deflateInit2_(s,level,Z_DEFLATED,MAX_WBITS,8,
                      Z_DEFAULT_STRATEGY,ZLIB_VERSION,sizeof(*s))
             : deflateInit(s,level);
    if(r!=Z_OK) abort();
}
static size_t compress_stream(z_stream* s,int ng,unsigned char* input,size_t n,
                              unsigned char* output,size_t capacity) {
    s->next_in=input;s->avail_in=n;s->next_out=output;s->avail_out=capacity;
    int r=ng ? jdk_ng_deflate(s,Z_FINISH) : deflate(s,Z_FINISH);
    if(r!=Z_STREAM_END) abort();
    return s->total_out;
}
static void end(z_stream* s,int ng) {
    if((ng ? jdk_ng_deflateEnd(s) : deflateEnd(s))!=Z_OK) abort();
}
int main(int argc,char** argv) {
    if(argc!=3) return 1;
    FILE* f=fopen(argv[1],"rb");if(!f) return 1;
    fseek(f,0,SEEK_END);size_t all=ftell(f);rewind(f);
    unsigned char* corpus=malloc(all);if(!corpus || !all) abort();
    if(fread(corpus,1,all,f)!=all) abort();fclose(f);
    int reverse=atoi(argv[2]);
    size_t sizes[]={64,1024,65536,all};
    int levels[]={1,1,2,3,3,6,6,9,9};
    int ngs[]={0,1,1,1,0,0,1,0,1};
    puts("size,mode,library,level,ns,compressed_bytes");
    for(int si=0;si<4;si++) {
        size_t n=sizes[si],capacity=n+n/8+512;
        unsigned char* input=malloc(n),*compressed=malloc(capacity),*decoded=malloc(n);
        if(!input || !compressed || !decoded) abort();
        for(size_t i=0;i<n;i++) input[i]=corpus[i%all];
        for(int lifecycle=0;lifecycle<2;lifecycle++) {
            for(int bi=0;bi<9;bi++) {
                int index=reverse ? 8-bi : bi,ng=ngs[index],level=levels[index];
                z_stream s;size_t out=0;unsigned int count=0;
                init(&s,ng,level);
                for(int warm=0;warm<5;warm++) {
                    if((ng ? jdk_ng_deflateReset(&s) : deflateReset(&s))!=Z_OK) abort();
                    out=compress_stream(&s,ng,input,n,compressed,capacity);
                }
                end(&s,ng);
                if(!lifecycle) init(&s,ng,level);
                double start=now(),finish;
                do {
                    if(lifecycle) init(&s,ng,level);
                    else if((ng ? jdk_ng_deflateReset(&s) : deflateReset(&s))!=Z_OK) abort();
                    out=compress_stream(&s,ng,input,n,compressed,capacity);
                    if(lifecycle) end(&s,ng);
                    ++count;finish=now();
                } while(finish-start<0.15);
                if(!lifecycle) end(&s,ng);
                uLong decoded_size=n;
                if(uncompress(decoded,&decoded_size,compressed,out)!=Z_OK ||
                   decoded_size!=n || memcmp(input,decoded,n)!=0) abort();
                printf("%zu,%s,%s,%d,%.3f,%zu\n",n,lifecycle?"create":"reuse",
                       ng?"zlib-ng":"zlib",level,(finish-start)*1e9/count,out);
            }
        }
        free(input);free(compressed);free(decoded);
    }
    free(corpus);return 0;
}
