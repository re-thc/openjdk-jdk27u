#define _GNU_SOURCE 1
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <time.h>
#include <zlib.h>

#define CHECK(x) do { if (!(x)) { fprintf(stderr,"CHECK line=%d: %s\n",__LINE__,#x); abort(); } } while (0)
#define NF 8
#define NB 32
#define CAP 512
#define ITERATIONS 128
typedef struct {
    int (*init)(z_streamp,int,int,int,int,int,const char*,int);
    int (*reset)(z_streamp);
    int (*params)(z_streamp,int,int);
    int (*def)(z_streamp,int);
    int (*end)(z_streamp);
} api;
static api ng;
static z_stream stream;
static void *persistent;
static int current_level,worker,banks[NF];
static unsigned char input[NF][NB][64],output[CAP],reference[NF][NB][2][CAP];
static size_t expected[NF][NB][2];
static const char *root;

static uint64_t clock_ns(clockid_t id) {
    struct timespec t; CHECK(!clock_gettime(id,&t));
    return (uint64_t)t.tv_sec*1000000000+(uint64_t)t.tv_nsec;
}
static void throttle(uint64_t *periods,uint64_t *usec) {
    *periods=*usec=0;
    FILE *f=fopen("/sys/fs/cgroup/cpu.stat","r");
    if (!f) return;
    char key[80]; unsigned long long value;
    while (fscanf(f,"%79s %llu",key,&value)==2) {
        if (!strcmp(key,"nr_throttled")) *periods=value;
        if (!strcmp(key,"throttled_usec")) *usec=value;
    }
    fclose(f);
}
static void *symbol(void *handle,const char *name) {
    char key[100]; CHECK(snprintf(key,sizeof(key),"jdk_ng_%s",name)>0);
    void *p=dlsym(handle,key); CHECK(p); return p;
}
static size_t finish(z_stream *s,unsigned char *out,int family,int bank) {
    s->next_in=input[family][bank]; s->avail_in=64;
    s->next_out=out; s->avail_out=CAP;
    int rc,loops=0;
    do {
        CHECK(++loops<=4 && s->avail_out>0);
        rc=ng.def(s,Z_FINISH); CHECK(rc==Z_OK || rc==Z_STREAM_END);
    } while (rc!=Z_STREAM_END);
    CHECK(s->avail_in==0 && s->total_out<CAP);
    return (size_t)s->total_out;
}
static void inflate_check(const unsigned char *data,size_t n,int family,int bank) {
    z_stream z={0}; unsigned char bytes[128];
    CHECK(inflateInit2(&z,15)==Z_OK);
    z.next_in=(Bytef *)data; z.avail_in=(uInt)n;
    z.next_out=bytes; z.avail_out=sizeof(bytes);
    CHECK(inflate(&z,Z_FINISH)==Z_STREAM_END);
    CHECK(z.total_in==n && z.total_out==64 && !memcmp(bytes,input[family][bank],64));
    CHECK(inflateEnd(&z)==Z_OK);
}
static void choose(int target) {
    CHECK(target==1 || target==6);
    CHECK(stream.state==persistent && ng.reset(&stream)==Z_OK);
    stream.next_in=NULL; stream.avail_in=0;
    stream.next_out=output; stream.avail_out=CAP;
    CHECK(ng.params(&stream,target,Z_DEFAULT_STRATEGY)==Z_OK);
    CHECK(stream.state==persistent && stream.total_in==0 && stream.total_out==0);
    CHECK(stream.avail_in==0 && stream.avail_out==CAP);
    current_level=target;
}
static size_t operation(int family,int bank) {
    CHECK(stream.state==persistent && ng.reset(&stream)==Z_OK);
    size_t n=finish(&stream,output,family,bank);
    CHECK(stream.state==persistent);
    return n;
}
static void correctness(const char *phase) {
    char path[5000];
    CHECK(snprintf(path,sizeof(path),"%s/sizes-w%d-%s.csv",root,worker,phase)>0);
    FILE *csv=fopen(path,"wx"); CHECK(csv);
    fputs("worker,phase,family,bank,level,bytes,path\n",csv);
    unsigned checks=0;
    for (int family=0;family<NF;family++) for (int bank=0;bank<banks[family];bank++) {
        for (int li=0;li<2;li++) {
            int level=li?6:1;
            choose(level);
            size_t n=operation(family,bank);
            inflate_check(output,n,family,bank);
            z_stream fresh={0}; unsigned char fresh_out[CAP];
            CHECK(ng.init(&fresh,level,Z_DEFLATED,15,8,Z_DEFAULT_STRATEGY,ZLIB_VERSION,sizeof(fresh))==Z_OK);
            size_t fresh_n=finish(&fresh,fresh_out,family,bank);
            inflate_check(fresh_out,fresh_n,family,bank);
            CHECK(ng.end(&fresh)==Z_OK);
            CHECK(n==fresh_n && !memcmp(output,fresh_out,n));
            if (!strcmp(phase,"before")) {
                expected[family][bank][li]=n; memcpy(reference[family][bank][li],output,n);
            } else {
                CHECK(n==expected[family][bank][li] && !memcmp(output,reference[family][bank][li],n));
            }
            CHECK(snprintf(path,sizeof(path),"%s/compressed/w%d-%s-%d-%d-%d.bin",root,worker,phase,family,bank,level)>0);
            FILE *f=fopen(path,"wx"); CHECK(f && fwrite(output,1,n,f)==n); fclose(f);
            fprintf(csv,"%d,%s,%d,%d,%d,%zu,%s\n",worker,phase,family,bank,level,n,path);
            checks+=2;
        }
    }
    fclose(csv);
    fprintf(stderr,"CORRECTNESS worker=%d phase=%s inflate_checks=%u persistent=%p\n",worker,phase,checks,persistent);
}
static void sample(FILE *csv,const int *v) {
    int family=v[4],target=v[9],offset=v[10],li=target==6;
    int previous=current_level;
    uint64_t prep_start=clock_ns(CLOCK_MONOTONIC);
    choose(target);
    for (int j=0;j<8;j++) {
        int bank=(offset-8+j+NB*2)%banks[family];
        CHECK(bank==v[11+j]);
        CHECK(operation(family,bank)==expected[family][bank][li]);
    }
    uint64_t prep_ns=clock_ns(CLOCK_MONOTONIC)-prep_start;
    uint64_t want=0,sum=0;
    for (int k=0;k<ITERATIONS;k++) want+=expected[family][(offset+k)%banks[family]][li];
    struct rusage before,after; uint64_t pa,ua,pb,ub;
    throttle(&pa,&ua); CHECK(!getrusage(RUSAGE_THREAD,&before));
    uint64_t w0=clock_ns(CLOCK_MONOTONIC),c0=clock_ns(CLOCK_THREAD_CPUTIME_ID);
    size_t length=0;
    for (int k=0;k<ITERATIONS;k++) {
        length=operation(family,(offset+k)%banks[family]); sum+=length;
    }
    uint64_t c1=clock_ns(CLOCK_THREAD_CPUTIME_ID),w1=clock_ns(CLOCK_MONOTONIC);
    CHECK(!getrusage(RUSAGE_THREAD,&after)); throttle(&pb,&ub);
    int last=(offset+ITERATIONS-1)%banks[family];
    CHECK(sum==want && length==expected[family][last][li]);
    CHECK(!memcmp(output,reference[family][last][li],length));
    for (int j=0;j<19;j++) fprintf(csv,"%s%d",j?",":"",v[j]);
    fprintf(csv,",%d,%d,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%zu,%d,%ld,%ld,%ld,%ld,%llu,%llu\n",
        previous,previous!=target,
        (unsigned long long)(uintptr_t)persistent,(unsigned long long)(uintptr_t)&stream,
        (unsigned long long)(uintptr_t)output,(unsigned long long)(uintptr_t)input[family][offset],
        (unsigned long long)w0,(unsigned long long)w1,(unsigned long long)(w1-w0),
        (unsigned long long)(c1-c0),(unsigned long long)prep_ns,(unsigned long long)sum,length,last,
        after.ru_nvcsw-before.ru_nvcsw,after.ru_nivcsw-before.ru_nivcsw,
        after.ru_minflt-before.ru_minflt,after.ru_majflt-before.ru_majflt,
        (unsigned long long)(pb-pa),(unsigned long long)(ub-ua));
    /* Only the fourth batch's final output is inflated after each quartet. */
    if (v[7]==3) inflate_check(output,length,family,last);
}
static void phase(FILE *schedule,FILE *csv,int wanted) {
    rewind(schedule); char line[5000]; CHECK(fgets(line,sizeof(line),schedule));
    while (fgets(line,sizeof(line),schedule)) {
        int v[19]; char *p=line,*end=NULL;
        for (int i=0;i<19;i++) {
            long value=strtol(p,&end,10); CHECK(end!=p && value>=0 && value<1000000);
            v[i]=(int)value;
            CHECK(i==18?(*end=='\n' || *end==0):*end=='\t');
            p=end+(*end!=0);
        }
        CHECK(*p==0);
        if (v[1]==worker && v[2]==wanted) sample(csv,v);
    }
    CHECK(!fflush(csv)); fflush(stderr);
}
int main(int argc,char **argv) {
    CHECK(argc==6 || argc==7);
    worker=atoi(argv[5]); CHECK(worker==0 || worker==1); root=argv[4];
    void *handle=dlopen(argv[1],RTLD_NOW|RTLD_LOCAL); CHECK(handle);
    ng.init=symbol(handle,"deflateInit2_"); ng.reset=symbol(handle,"deflateReset");
    ng.params=symbol(handle,"deflateParams"); ng.def=symbol(handle,"deflate"); ng.end=symbol(handle,"deflateEnd");
    Dl_info info; struct stat st; CHECK(dladdr((void *)ng.def,&info) && !stat(argv[1],&st));
    fprintf(stderr,"IMAGE worker=%d base=%p init=%p reset=%p params=%p deflate=%p end=%p dev=%llu inode=%llu file=%s\n",worker,info.dli_fbase,(void *)ng.init,(void *)ng.reset,(void *)ng.params,(void *)ng.def,(void *)ng.end,(unsigned long long)st.st_dev,(unsigned long long)st.st_ino,argv[1]);
    FILE *maps=fopen("/proc/self/maps","r"); CHECK(maps); char line[5000];
    fputs("MAPS_BEGIN\n",stderr); while (fgets(line,sizeof(line),maps)) fputs(line,stderr); fclose(maps); fputs("MAPS_END\n",stderr);
    FILE *in=fopen(argv[2],"r"); CHECK(in);
    while (fgets(line,sizeof(line),in)) {
        int family,bank; char path[4000];
        CHECK(sscanf(line,"%d%d%3999s",&family,&bank,path)==3);
        CHECK(family>=0 && family<NF && bank==banks[family] && bank<NB);
        FILE *f=fopen(path,"rb"); CHECK(f && fread(input[family][bank],1,64,f)==64 && fgetc(f)==EOF); fclose(f);
        banks[family]++;
    }
    fclose(in);
    for (int family=0;family<NF;family++) CHECK(banks[family]==(family<4?1:32));
    current_level=worker?1:6;
    CHECK(ng.init(&stream,current_level,Z_DEFLATED,15,8,Z_DEFAULT_STRATEGY,ZLIB_VERSION,sizeof(stream))==Z_OK);
    persistent=stream.state; CHECK(persistent);
    fprintf(stderr,"PERSISTENT worker=%d stream=%p state=%p output=%p initial_level=%d\n",worker,(void *)&stream,persistent,(void *)output,current_level);
    correctness("before"); choose(worker?1:6);
    if (argc==7) {
        CHECK(!strcmp(argv[6],"--untimed-only")); correctness("after");
        CHECK(ng.end(&stream)==Z_OK); CHECK(!dlclose(handle)); return 0;
    }
    FILE *schedule=fopen(argv[3],"r"); CHECK(schedule && fgets(line,sizeof(line),schedule));
    char *newline=strchr(line,'\n'); CHECK(newline); *newline=0;
    for (char *p=line;*p;p++) if (*p=='\t') *p=',';
    char path[5000]; CHECK(snprintf(path,sizeof(path),"%s/worker-%d.csv",root,worker)>0);
    FILE *csv=fopen(path,"wx"); CHECK(csv);
    fprintf(csv,"%s,previous,switched,state,stream,output,input_first,wall_start_ns,wall_end_ns,wall_ns,cpu_ns,prep_ns,total_bytes,output_bytes,last_bank,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttled_periods,throttled_us\n",line);
    fflush(csv); printf("READY %d\n",worker); fflush(stdout);
    int stage=0,command;
    while ((command=getchar())!=EOF) {
        if (command=='\n') continue;
        if (command=='Q') break;
        int wanted=command=='P'?1:command=='C'?2:command=='B'?3:0;
        CHECK(wanted && wanted==stage+1);
        phase(schedule,csv,wanted); stage=wanted;
        if (wanted==3) correctness("after");
        printf("DONE %d %d\n",worker,wanted); fflush(stdout);
    }
    CHECK(command=='Q'); fclose(schedule); CHECK(!fclose(csv));
    CHECK(ng.end(&stream)==Z_OK); CHECK(!dlclose(handle)); return 0;
}
