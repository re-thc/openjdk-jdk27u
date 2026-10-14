#define _GNU_SOURCE 1
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <sys/resource.h>
#include <zlib.h>

#define DECL(P) extern int P##deflateInit2_(z_streamp,int,int,int,int,int,const char*,int);extern int P##deflate(z_streamp,int);extern int P##deflateReset(z_streamp);extern int P##deflateEnd(z_streamp);
DECL(jdk_ng_) DECL(cand_)
typedef struct {
    int (*init)(z_streamp,int,int,int,int,int,const char*,int);
    int (*def)(z_streamp,int);
    int (*reset)(z_streamp);
    int (*end)(z_streamp);
} api;
#define API(P) {P##deflateInit2_,P##deflate,P##deflateReset,P##deflateEnd}
static api libraries[] = {API(jdk_ng_), API(cand_)};
static uint64_t now(clockid_t c) {
    struct timespec t;
    if (clock_gettime(c, &t)) abort();
    return (uint64_t)t.tv_sec * 1000000000 + t.tv_nsec;
}
typedef struct { uint64_t periods, throttled, throttled_us, usage_us; } throttle;
static throttle stats(void) {
    throttle t = {0};
    FILE *f = fopen("/sys/fs/cgroup/cpu.stat", "r");
    if (!f) abort();
    char key[80]; unsigned long long v;
    while (fscanf(f, "%79s %llu", key, &v) == 2) {
        if (!strcmp(key,"nr_periods")) t.periods=v;
        else if (!strcmp(key,"nr_throttled")) t.throttled=v;
        else if (!strcmp(key,"throttled_usec")) t.throttled_us=v;
        else if (!strcmp(key,"usage_usec")) t.usage_us=v;
    }
    fclose(f); return t;
}
static void function_address(const char *mode, int library, const char *name, void *address) {
    Dl_info info = {0};
    if (!dladdr(address, &info)) abort();
    fprintf(stderr,"FUNCTION mode=%s library=%d name=%s address=%p base=%p offset=%llu file=%s\n",
            mode,library,name,address,info.dli_fbase,
            (unsigned long long)((uintptr_t)address-(uintptr_t)info.dli_fbase),info.dli_fname);
}
static void finish(api *a,z_stream *s,unsigned char *in,unsigned char *out) {
    if (a->reset(s)!=Z_OK) abort();
    s->next_in=in; s->avail_in=64; s->next_out=out; s->avail_out=1024;
    if (a->def(s,Z_FINISH)!=Z_STREAM_END) abort();
}
static int allocation_ordinal;
static int measure_mode(const char *filename,const char *mode) {
    int shared=!strcmp(mode,"shared-stream");
    int reversed=!strcmp(mode,"two-states");
    int separate=!strcmp(mode,"separate-libraries");
    if (!shared&&!reversed&&!separate) return 1;
    unsigned char in[64],out[2][1024],decoded[64];
    FILE *f=fopen(filename,"rb");
    if (!f||fread(in,1,64,f)!=64) abort();
    fclose(f);
    z_stream streams[2]; api *owners[2]={&libraries[0],separate?&libraries[1]:&libraries[0]};
    int states=shared?1:2;
    for (int library=0;library<(separate?2:1);library++) {
        function_address(mode,library,"init",(void *)libraries[library].init);
        function_address(mode,library,"reset",(void *)libraries[library].reset);
        function_address(mode,library,"deflate",(void *)libraries[library].def);
        function_address(mode,library,"end",(void *)libraries[library].end);
    }
    /* Default allocator, no tracing allocator or allocation tuning. Record each
       initialization's actual returned state and its allocation order. */
    for (int slot=0;slot<states;slot++) {
        memset(&streams[slot],0,sizeof(streams[slot]));
        if (owners[slot]->init(&streams[slot],6,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))!=Z_OK) abort();
        fprintf(stderr,"STATE mode=%s allocation_order=%d mode_allocation_order=%d slot=%d library=%d stream=%p state=%p input=%p output=%p\n",
                mode,allocation_ordinal++,slot,slot,separate?slot:0,(void *)&streams[slot],(void *)streams[slot].state,(void *)in,(void *)out[slot]);
        /* Same initial 64 reset/finish warmups per owned state as the retained control. */
        for (int i=0;i<64;i++) finish(owners[slot],&streams[slot],in,out[slot]);
    }
    /* Give both logical arms 64 warmups even when they share one state. */
    if (shared) for (int i=0;i<64;i++) finish(owners[0],&streams[0],in,out[0]);
    fprintf(stderr,"MAPS_BEGIN mode=%s\n",mode);
    f=fopen("/proc/self/maps","r"); if (!f) abort();
    char line[4096]; while (fgets(line,sizeof(line),f)) fputs(line,stderr); fclose(f);
    fprintf(stderr,"MAPS_END mode=%s\n",mode);
    for (int cell=0;cell<2;cell++) for (int block=0;block<12;block++)
        fprintf(stderr,"ASSIGNMENT mode=%s cell=%s block=%d A_slot=%d B_slot=%d\n",mode,cell?"reuse":"reset",block,
                shared?0:reversed?block%2:0,shared?0:reversed?1-block%2:1);
    fflush(stderr);
    puts("cell,block,pair,order,arm,slot,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttle_periods,throttled_periods,throttled_us,cgroup_usage_us,output_bytes");
    const int iterations=128,blocks=12,pairs=20;
    for (int cell=0;cell<2;cell++) for (int block=0;block<blocks;block++)
    for (int pair=0;pair<pairs;pair++) for (int order=0;order<2;order++) {
        int arm=(pair+block)%2?1-order:order;
        int slot=shared?0:reversed?(arm+block)%2:arm;
        api *a=owners[slot]; z_stream *s=&streams[slot];
        struct rusage ra,rb; throttle ta=stats(); getrusage(RUSAGE_THREAD,&ra);
        uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);
        for (int i=0;i<iterations;i++) {
            if (a->reset(s)!=Z_OK) abort();
            if (cell) {
                s->next_in=in; s->avail_in=64; s->next_out=out[slot]; s->avail_out=1024;
                if (a->def(s,Z_FINISH)!=Z_STREAM_END) abort();
            }
        }
        uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);
        getrusage(RUSAGE_THREAD,&rb); throttle tb=stats();
        printf("%s,%d,%d,%d,%d,%d,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%llu,%llu,%lu\n",
               cell?"reuse":"reset",block,pair,order,arm,slot,iterations,
               (unsigned long long)(w1-w0),(unsigned long long)(c1-c0),
               rb.ru_nvcsw-ra.ru_nvcsw,rb.ru_nivcsw-ra.ru_nivcsw,rb.ru_minflt-ra.ru_minflt,rb.ru_majflt-ra.ru_majflt,
               (unsigned long long)(tb.periods-ta.periods),(unsigned long long)(tb.throttled-ta.throttled),
               (unsigned long long)(tb.throttled_us-ta.throttled_us),(unsigned long long)(tb.usage_us-ta.usage_us),s->total_out);
    }
    for (int slot=0;slot<states;slot++) {
        finish(owners[slot],&streams[slot],in,out[slot]);
        uLong n=64;
        if (uncompress(decoded,&n,out[slot],streams[slot].total_out)!=Z_OK||n!=64||memcmp(in,decoded,64)) abort();
        if (owners[slot]->end(&streams[slot])!=Z_OK) abort();
    }
    return 0;
}
int main(int argc,char **argv) {
    if (argc!=2) return 1;
    const char *modes[]={"shared-stream","two-states","separate-libraries"};
    for (int mode=0;mode<3;mode++) {
        printf("CONTROL_DATA_BEGIN %s\n",modes[mode]);
        fprintf(stderr,"CONTROL_ADDRESS_BEGIN %s\n",modes[mode]);
        if (measure_mode(argv[1],modes[mode])) return 1;
        printf("CONTROL_DATA_END %s\n",modes[mode]);
        fprintf(stderr,"CONTROL_ADDRESS_END %s\n",modes[mode]);
    }
    return 0;
}
