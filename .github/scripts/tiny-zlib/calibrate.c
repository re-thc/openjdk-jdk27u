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
typedef struct{int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);}api;
#define API(P) {P##deflateInit2_,P##deflate,P##deflateReset,P##deflateEnd}
#ifdef STOCK_B
static api libs[]={API(jdk_ng_),API()};
#else
static api libs[]={API(jdk_ng_),API(cand_)};
#endif
static uint64_t now(clockid_t c){struct timespec t;if(clock_gettime(c,&t))abort();return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
typedef struct{uint64_t periods,throttled,throttled_us,usage_us;} throttle;
static throttle stats(void){throttle t={0};FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)abort();char key[80];unsigned long long v;while(fscanf(f,"%79s %llu",key,&v)==2){if(!strcmp(key,"nr_periods"))t.periods=v;else if(!strcmp(key,"nr_throttled"))t.throttled=v;else if(!strcmp(key,"throttled_usec"))t.throttled_us=v;else if(!strcmp(key,"usage_usec"))t.usage_us=v;}fclose(f);return t;}
int main(int argc,char**argv){if(argc!=2)return 1;unsigned char in[64],out[2][1024],decoded[64];FILE*f=fopen(argv[1],"rb");if(!f||fread(in,1,64,f)!=64)abort();fclose(f);z_stream s[2];for(int k=0;k<2;k++){memset(&s[k],0,sizeof(s[k]));if(libs[k].init(&s[k],6,8,15,8,0,ZLIB_VERSION,sizeof(s[k]))!=Z_OK)abort();for(int i=0;i<64;i++){if(libs[k].reset(&s[k])!=Z_OK)abort();s[k].next_in=in;s[k].avail_in=64;s[k].next_out=out[k];s[k].avail_out=1024;if(libs[k].def(&s[k],Z_FINISH)!=Z_STREAM_END)abort();}}
puts("cell,block,pair,order,arm,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttle_periods,throttled_periods,throttled_us,cgroup_usage_us,output_bytes");
const int iterations=128,blocks=12,pairs=20;for(int cell=0;cell<2;cell++)for(int block=0;block<blocks;block++)for(int pair=0;pair<pairs;pair++)for(int order=0;order<2;order++){int k=(pair+block)%2?1-order:order;struct rusage ra,rb;throttle ta=stats();getrusage(RUSAGE_THREAD,&ra);uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);for(int i=0;i<iterations;i++){if(libs[k].reset(&s[k])!=Z_OK)abort();if(cell){s[k].next_in=in;s[k].avail_in=64;s[k].next_out=out[k];s[k].avail_out=1024;if(libs[k].def(&s[k],Z_FINISH)!=Z_STREAM_END)abort();}}uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);getrusage(RUSAGE_THREAD,&rb);throttle tb=stats();printf("%s,%d,%d,%d,%d,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%llu,%llu,%lu\n",cell?"reuse":"reset",block,pair,order,k,iterations,(unsigned long long)(w1-w0),(unsigned long long)(c1-c0),rb.ru_nvcsw-ra.ru_nvcsw,rb.ru_nivcsw-ra.ru_nivcsw,rb.ru_minflt-ra.ru_minflt,rb.ru_majflt-ra.ru_majflt,(unsigned long long)(tb.periods-ta.periods),(unsigned long long)(tb.throttled-ta.throttled),(unsigned long long)(tb.throttled_us-ta.throttled_us),(unsigned long long)(tb.usage_us-ta.usage_us),s[k].total_out);}
for(int k=0;k<2;k++){if(libs[k].reset(&s[k])!=Z_OK)abort();s[k].next_in=in;s[k].avail_in=64;s[k].next_out=out[k];s[k].avail_out=1024;if(libs[k].def(&s[k],Z_FINISH)!=Z_STREAM_END)abort();uLong n=64;if(uncompress(decoded,&n,out[k],s[k].total_out)!=Z_OK||n!=64||memcmp(in,decoded,64))abort();if(libs[k].end(&s[k])!=Z_OK)abort();}return 0;}
