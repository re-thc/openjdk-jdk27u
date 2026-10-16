#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <inttypes.h>
#include <linux/perf_event.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/resource.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>
#include <zlib.h>

enum { ROWS=192, QUARTETS=48, INPUTS=140, RING=256, CAP=8192 };
typedef struct { z_stream z; unsigned char padding[128-sizeof(z_stream)]; } Slot;
_Static_assert(sizeof(Slot)==128,"fixed stream slots");
static _Alignas(64) Slot slots[2];
static int (*ng_init)(z_streamp,int,int,int,int,int,const char*,int);
static int (*ng_def)(z_streamp,int),(*ng_reset)(z_streamp),(*ng_end)(z_streamp);
static void *states[2];
static unsigned char input[INPUTS][4096],output[CAP],plain[8192],ref[INPUTS][CAP];
static unsigned sizes[INPUTS],ref_n[INPUTS],ring[RING],last_id,last_n,completed;
static uint64_t measurement_start;
static const char *directory;
static FILE *rows_file,*counter_file;
static int fds[3]={-1,-1,-1};static uint64_t ids[3];

static uint64_t now(clockid_t clock) {
    struct timespec t;
    if(clock_gettime(clock,&t)) { perror("clock_gettime");exit(2); }
    return (uint64_t)t.tv_sec*1000000000+(uint64_t)t.tv_nsec;
}
static FILE *open_file(const char *name,const char *mode) {
    char path[4096];
    if(snprintf(path,sizeof(path),"%s/%s",directory,name)>=(int)sizeof(path))exit(2);
    return fopen(path,mode);
}
static void status(const char *name,int line) {
    FILE *f=open_file("native-status.json","w");if(!f)return;
    fprintf(f,"{\"status\":\"%s\",\"rows\":%u,\"line\":%d,\"measurement_start_ns\":%"PRIu64",\"end_ns\":%"PRIu64",\"qualification\":false}\n",name,completed,line,measurement_start,now(CLOCK_MONOTONIC));
    fclose(f);
}
static void fail(int line,const char *condition) {
    fprintf(stderr,"ASSIGNMENT_INVALID line=%d condition=%s errno=%d\n",line,condition,errno);
    status("INVALID_RUNTIME",line);if(rows_file)fflush(rows_file);if(counter_file)fflush(counter_file);exit(2);
}
#define REQUIRE(x) do { if(!(x))fail(__LINE__,#x); } while(0)

typedef struct {uint64_t nr,enabled,running;struct {uint64_t value,id;} item[3];} Reading;
typedef struct {
    uint64_t read0,read1,enable0,enable1,c0,w0,w1,c1,disable0,disable1,read2,read3;
    Reading before,after;
} Interval;
static int group_read(Reading *r) {
    if(read(fds[0],r,sizeof(*r))!=(ssize_t)sizeof(*r)||r->nr!=3)return 0;
    for(int i=0;i<3;i++)if(r->item[i].id!=ids[i])return 0;
    return 1;
}
static void begin_interval(Interval *v) {
    memset(v,0,sizeof(*v));v->read0=now(CLOCK_MONOTONIC);REQUIRE(group_read(&v->before));v->read1=now(CLOCK_MONOTONIC);
    v->enable0=now(CLOCK_MONOTONIC);REQUIRE(!ioctl(fds[0],PERF_EVENT_IOC_ENABLE,PERF_IOC_FLAG_GROUP));v->enable1=now(CLOCK_MONOTONIC);
    v->c0=now(CLOCK_THREAD_CPUTIME_ID);v->w0=now(CLOCK_MONOTONIC);
}
static void end_interval(Interval *v) {
    v->w1=now(CLOCK_MONOTONIC);v->c1=now(CLOCK_THREAD_CPUTIME_ID);
    v->disable0=now(CLOCK_MONOTONIC);REQUIRE(!ioctl(fds[0],PERF_EVENT_IOC_DISABLE,PERF_IOC_FLAG_GROUP));v->disable1=now(CLOCK_MONOTONIC);
    v->read2=now(CLOCK_MONOTONIC);REQUIRE(group_read(&v->after));v->read3=now(CLOCK_MONOTONIC);
}
static void counter_row(unsigned row,const char *kind,const Interval *v) {
    fprintf(counter_file,"%u,%s",row,kind);
    const uint64_t x[]={v->read0,v->read1,v->enable0,v->enable1,v->c0,v->w0,v->w1,v->c1,v->disable0,v->disable1,v->read2,v->read3,
        v->before.enabled,v->after.enabled,v->before.running,v->after.running,
        v->before.item[0].value,v->after.item[0].value,v->before.item[1].value,v->after.item[1].value,v->before.item[2].value,v->after.item[2].value};
    for(size_t i=0;i<sizeof(x)/sizeof(*x);i++)fprintf(counter_file,",%"PRIu64,x[i]);
    fputc('\n',counter_file);
}
static int unavailable(const char *stage,int error) {
    FILE *f=open_file("preflight.json","w");if(f){fprintf(f,"{\"status\":\"PREFLIGHT_UNAVAILABLE\",\"stage\":\"%s\",\"errno\":%d,\"measurement_rows\":0}\n",stage,error);fclose(f);}
    for(int i=0;i<3;i++)if(fds[i]>=0)close(fds[i]);return 77;
}
static int perf_preflight(void) {
    const uint64_t configs[]={PERF_COUNT_HW_CPU_CYCLES,PERF_COUNT_HW_INSTRUCTIONS,PERF_COUNT_HW_REF_CPU_CYCLES};
    const char *names[]={"cycles_open","instructions_open","reference_cycles_open"};
    for(int i=0;i<3;i++) {
        struct perf_event_attr a;memset(&a,0,sizeof(a));a.size=sizeof(a);a.type=PERF_TYPE_HARDWARE;a.config=configs[i];
        a.disabled=1;a.pinned=i==0;a.exclude_kernel=1;a.exclude_hv=1;
        a.read_format=PERF_FORMAT_GROUP|PERF_FORMAT_ID|PERF_FORMAT_TOTAL_TIME_ENABLED|PERF_FORMAT_TOTAL_TIME_RUNNING;
        fds[i]=(int)syscall(SYS_perf_event_open,&a,0,-1,i?fds[0]:-1,PERF_FLAG_FD_CLOEXEC);
        if(fds[i]<0)return unavailable(names[i],errno);
        if(ioctl(fds[i],PERF_EVENT_IOC_ID,&ids[i]))return unavailable("event_id",errno);
    }
    Reading a,b;if(!group_read(&a))return unavailable("initial_group_read",errno);
    if(ioctl(fds[0],PERF_EVENT_IOC_ENABLE,PERF_IOC_FLAG_GROUP))return unavailable("group_enable",errno);
    volatile uint64_t x=1;for(unsigned j=0;j<100000;j++)x=x*6364136223846793005ULL+1;
    if(ioctl(fds[0],PERF_EVENT_IOC_DISABLE,PERF_IOC_FLAG_GROUP))return unavailable("group_disable",errno);
    if(!group_read(&b))return unavailable("probe_group_read",errno);
    if(b.enabled<=a.enabled||b.running-a.running!=b.enabled-a.enabled)return unavailable("probe_not_fully_scheduled",0);
    for(int i=0;i<3;i++)if(b.item[i].value<=a.item[i].value)return unavailable("probe_zero_counter",0);
    FILE *f=open_file("preflight.json","wx");REQUIRE(f);
    fprintf(f,"{\"status\":\"AVAILABLE_GENERIC_EVENTS\",\"event_ids\":[%"PRIu64",%"PRIu64",%"PRIu64"],\"user_only\":true,\"exclude_hv\":true,\"probe_enabled_ns\":%"PRIu64",\"probe_running_ns\":%"PRIu64",\"reference_event\":\"PERF_COUNT_HW_REF_CPU_CYCLES\",\"host_reference_semantics_verified\":false}\n",ids[0],ids[1],ids[2],b.enabled-a.enabled,b.running-a.running);
    REQUIRE(!fclose(f));return 0;
}

static unsigned operation(unsigned slot,unsigned id) {
    z_stream *z=&slots[slot].z;REQUIRE(id<INPUTS&&z->state==states[slot]);
    z->next_in=input[id];z->avail_in=sizes[id];z->next_out=output;z->avail_out=CAP;
    REQUIRE(ng_def(z,Z_FINISH)==Z_STREAM_END&&!z->avail_in&&z->avail_out);
    unsigned n=(unsigned)z->total_out;REQUIRE(ng_reset(z)==Z_OK&&z->state==states[slot]);last_id=id;last_n=n;return n;
}
static uint64_t loop(unsigned slot,int warm,unsigned count) {
    uint64_t sum=0;
    for(unsigned i=0;i<count;i++){unsigned id=warm?ring[i%RING]:132+i%8;unsigned n=operation(slot,id);REQUIRE(n==ref_n[id]);sum+=n;}
    return sum;
}
static void check_output(unsigned id) {
    REQUIRE(last_n==ref_n[id]&&!memcmp(output,ref[id],last_n));
    z_stream z={0};REQUIRE(inflateInit(&z)==Z_OK);z.next_in=output;z.avail_in=last_n;z.next_out=plain;z.avail_out=sizeof(plain);
    REQUIRE(inflate(&z,Z_FINISH)==Z_STREAM_END&&z.total_in==last_n&&z.total_out==sizes[id]&&!memcmp(plain,input[id],sizes[id]));REQUIRE(inflateEnd(&z)==Z_OK);
}
static unsigned correctness(int after) {
    unsigned n=0;
    for(unsigned i=0;i<INPUTS;i++)for(unsigned a=0;a<2;a++){
        unsigned len=operation(a,i);
        if(!after&&!a){ref_n[i]=len;memcpy(ref[i],output,len);char name[80];snprintf(name,sizeof(name),"compressed-%u.bin",i);FILE *f=open_file(name,"wx");REQUIRE(f&&fwrite(output,1,len,f)==len&&!fclose(f));}
        check_output(i);n++;
    }
    return n;
}
typedef struct {unsigned row,episode,block,condition,condition_position,swap,order,position,label,slot;uint64_t gap;} Plan;
static void read_inputs(const char *path) {
    FILE *f=fopen(path,"rb");REQUIRE(f);unsigned char magic[8];REQUIRE(fread(magic,1,8,f)==8&&!memcmp(magic,"CASGv1\n\0",8));
    for(unsigned i=0;i<INPUTS;i++){
        unsigned char b[4];REQUIRE(fread(b,1,4,f)==4);sizes[i]=(unsigned)b[0]|(unsigned)b[1]<<8|(unsigned)b[2]<<16|(unsigned)b[3]<<24;
        REQUIRE(sizes[i]==(i<132?64u:4096u)&&fread(input[i],1,sizes[i],f)==sizes[i]);
    }
    for(unsigned i=0;i<RING;i++){unsigned char b[4];REQUIRE(fread(b,1,4,f)==4);ring[i]=(unsigned)b[0]|(unsigned)b[1]<<8|(unsigned)b[2]<<16|(unsigned)b[3]<<24;REQUIRE(ring[i]<132);}
    REQUIRE(fgetc(f)==EOF&&!fclose(f));
}
static void read_plan(const char *path,Plan *p) {
    FILE *f=fopen(path,"r");REQUIRE(f);char line[1024];REQUIRE(fgets(line,sizeof(line),f));
    for(unsigned i=0;i<ROWS;i++){
        REQUIRE(fgets(line,sizeof(line),f));Plan *x=&p[i];
        REQUIRE(sscanf(line,"%u %u %u %u %u %u %u %u %u %u %"SCNu64,&x->row,&x->episode,&x->block,&x->condition,&x->condition_position,&x->swap,&x->order,&x->position,&x->label,&x->slot,&x->gap)==11);
        REQUIRE(x->row==i&&x->episode==i/4&&x->block==i/24&&x->condition<3&&x->condition_position==(i%24)/8&&x->swap==x->block%2&&x->order<2&&x->position==i%4);
        REQUIRE(x->label==((i%4==0||i%4==3)?x->order:1-x->order)&&x->slot==(x->label^x->swap));
        int direction=x->condition==0?0:x->condition==1?1:-1;int sign=x->label? -1:1;
        REQUIRE(x->gap==(uint64_t)(40000000+direction*sign*2200000));
    }
    REQUIRE(!fgets(line,sizeof(line),f)&&!fclose(f));
}
int main(int argc,char **argv) {
    if(argc!=7){fprintf(stderr,"assignment LIB INPUTS PLAN OUT CPU REF_SEMANTICS\n");return 2;}
    directory=argv[4];REQUIRE(!strcmp(argv[6],"linux-ref-cycles-ratio-only"));FILE *claim=open_file("native-started","wx");REQUIRE(claim&&!fclose(claim));
    unsigned cpu=(unsigned)strtoul(argv[5],NULL,10);REQUIRE(cpu<CPU_SETSIZE);cpu_set_t mask;CPU_ZERO(&mask);CPU_SET(cpu,&mask);REQUIRE(!sched_setaffinity(0,sizeof(mask),&mask));
    Plan plan[ROWS];read_inputs(argv[2]);read_plan(argv[3],plan);
    int available=perf_preflight();if(available)return available;
    void *handle=dlopen(argv[1],RTLD_NOW|RTLD_LOCAL);if(!handle)fprintf(stderr,"%s\n",dlerror());REQUIRE(handle);
#define LOAD(field,name) do { void *address=dlsym(handle,"jdk_ng_" name); _Static_assert(sizeof(field)==sizeof(address),"POSIX function-pointer ABI"); memcpy(&field,&address,sizeof(field)); REQUIRE(field); } while(0)
    LOAD(ng_init,"deflateInit2_");LOAD(ng_def,"deflate");LOAD(ng_reset,"deflateReset");LOAD(ng_end,"deflateEnd");
    REQUIRE(!dlsym(handle,"jdk_ng_test_sparse_resets")&&!dlsym(handle,"jdk_ng_test_control"));
    for(int i=0;i<2;i++){REQUIRE(ng_init(&slots[i].z,6,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))==Z_OK);states[i]=slots[i].z.state;}
    unsigned checks_before=correctness(0);
    FILE *metadata=open_file("native-metadata.json","wx");REQUIRE(metadata);
    fprintf(metadata,"{\"cpu\":%u,\"init_order\":[0,1],\"checks_before\":%u,\"stream\":[%"PRIuPTR",%"PRIuPTR"],\"state\":[%"PRIuPTR",%"PRIuPTR"],\"output\":%"PRIuPTR",\"def_entry\":%"PRIuPTR",\"reset_entry\":%"PRIuPTR"}\n",cpu,checks_before,(uintptr_t)&slots[0].z,(uintptr_t)&slots[1].z,(uintptr_t)states[0],(uintptr_t)states[1],(uintptr_t)output,(uintptr_t)ng_def,(uintptr_t)ng_reset);REQUIRE(!fclose(metadata));
    rows_file=open_file("rows.csv","wx");counter_file=open_file("counters.csv","wx");REQUIRE(rows_file&&counter_file);
    fputs("row,episode,block,condition,condition_position,swap,order,position,label,slot,gap_ns,anchor_ns,target_start_ns,fixed_work_end_ns,begin_ns,end_ns,cpu_begin_ns,cpu_end_ns,warm_operations,prep_operations,operations,warm_sum,prep_sum,timed_sum,last_input,output_bytes,stream,state,output,def_entry,reset_entry,cpu_before,cpu_after,voluntary,involuntary,minor,major\n",rows_file);
    fputs("row,kind,read0,read1,enable0,enable1,c0,w0,w1,c1,disable0,disable1,read2,read3,enabled_before,enabled_after,running_before,running_after,cycles_before,cycles_after,instructions_before,instructions_after,reference_before,reference_after\n",counter_file);
    measurement_start=now(CLOCK_MONOTONIC);uint64_t deadline=measurement_start+900000000000ULL,previous=0,anchor=0;
    FILE *window=open_file("measurement-window.json","wx");REQUIRE(window);
    fprintf(window,"{\"start_ns\":%"PRIu64",\"deadline_ns\":%"PRIu64"}\n",measurement_start,deadline);REQUIRE(!fclose(window));
    puts("MEASUREMENT_START");fflush(stdout);
    for(unsigned i=0;i<ROWS;i++){
        if(now(CLOCK_MONOTONIC)>=deadline){status("INCOMPLETE_TIMEOUT",0);return 3;}
        Plan *p=&plan[i];if(p->position==0){for(int a=0;a<2;a++)for(int j=0;j<2;j++)REQUIRE(ng_reset(&slots[a].z)==Z_OK);anchor=now(CLOCK_MONOTONIC);previous=anchor;}
        uint64_t target=previous+p->gap;Interval v[4];struct rusage usage0,usage1;REQUIRE(!getrusage(RUSAGE_THREAD,&usage0));int cpu0=sched_getcpu();
        begin_interval(&v[0]);uint64_t warm=loop(p->slot,1,3328);end_interval(&v[0]);
        begin_interval(&v[1]);uint64_t prep=loop(p->slot,0,8);end_interval(&v[1]);uint64_t fixed=now(CLOCK_MONOTONIC);
        begin_interval(&v[2]);while(now(CLOCK_MONOTONIC)<target){__asm__ __volatile__("":::"memory");}end_interval(&v[2]);
        begin_interval(&v[3]);uint64_t timed=loop(p->slot,0,64);end_interval(&v[3]);previous=v[3].w1;
        int cpu1=sched_getcpu();REQUIRE(!getrusage(RUSAGE_THREAD,&usage1));check_output(last_id);
        const uint64_t fields[]={p->row,p->episode,p->block,p->condition,p->condition_position,p->swap,p->order,p->position,p->label,p->slot,p->gap,anchor,target,fixed,v[3].w0,v[3].w1,v[3].c0,v[3].c1,3328,8,64,warm,prep,timed,last_id,last_n,(uintptr_t)&slots[p->slot].z,(uintptr_t)states[p->slot],(uintptr_t)output,(uintptr_t)ng_def,(uintptr_t)ng_reset,(uint64_t)cpu0,(uint64_t)cpu1,
            (uint64_t)(usage1.ru_nvcsw-usage0.ru_nvcsw),(uint64_t)(usage1.ru_nivcsw-usage0.ru_nivcsw),(uint64_t)(usage1.ru_minflt-usage0.ru_minflt),(uint64_t)(usage1.ru_majflt-usage0.ru_majflt)};
        for(size_t k=0;k<sizeof(fields)/sizeof(*fields);k++)fprintf(rows_file,"%s%"PRIu64,k?",":"",fields[k]);fputc('\n',rows_file);
        const char *names[]={"warm","prep","padding","timed"};for(int j=0;j<4;j++)counter_row(i,names[j],&v[j]);REQUIRE(!fflush(rows_file)&&!fflush(counter_file));completed++;
        if(now(CLOCK_MONOTONIC)>deadline){status("INCOMPLETE_TIMEOUT",0);return 3;}
    }
    uint64_t measurement_end=now(CLOCK_MONOTONIC);puts("MEASUREMENT_END");fflush(stdout);
    unsigned checks_after=correctness(1);FILE *checks=open_file("correctness.json","wx");REQUIRE(checks);
    fprintf(checks,"{\"before\":%u,\"after\":%u,\"final_row_inflates\":192,\"bytes_equal\":true,\"measurement_end_ns\":%"PRIu64"}\n",checks_before,checks_after,measurement_end);REQUIRE(!fclose(checks));
    for(int a=0;a<2;a++)REQUIRE(ng_end(&slots[a].z)==Z_OK);
    status("COMPLETE",0);REQUIRE(!fclose(rows_file)&&!fclose(counter_file));for(int i=0;i<3;i++)REQUIRE(!close(fds[i]));return 0;
}
