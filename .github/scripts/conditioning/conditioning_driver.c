#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sched.h>
#include <sys/resource.h>
#include <time.h>
#include <zlib.h>
#define NP 268
#define NE 4096
#define NC 24576
#define CAP (1048576+1048576/8+1024)
#define CHECK(x) do{if(!(x)){fprintf(stderr,"CHECK worker=%d line=%d %s\n",worker,__LINE__,#x);abort();}}while(0)
typedef struct{int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);}Api;
typedef struct{unsigned char *data;unsigned n;}Input;
typedef struct{int id,block,worker,companion,slot,time_slot,work,condition,warm,order;}Episode;
typedef struct{int id,worker,opcode,episode,row;}Command;
typedef struct{unsigned n;unsigned char *data;}Ref;
static Api api;static _Alignas(64) z_stream stream;static void *state;
static Input input[NP];static Ref reference[NP];static int banks[2][256];static uint64_t ring_sum[2];
static Episode episodes[NE];static Command commands[NC];static unsigned char output[CAP],plain[1048577];
static int worker,last_input;static const char *root;static unsigned before_checks,after_checks,batches,resets,prefixes;
static FILE *raw,*events,*clocks;
static uint64_t ns(clockid_t id){struct timespec t;CHECK(!clock_gettime(id,&t));return(uint64_t)t.tv_sec*1000000000+(uint64_t)t.tv_nsec;}
static void load(const char *path){void*h=dlopen(path,RTLD_NOW|RTLD_LOCAL);CHECK(h);
#define GET(f,n) do{api.f=dlsym(h,"jdk_ng_" n);CHECK(api.f);}while(0)
GET(init,"deflateInit2_");GET(def,"deflate");GET(reset,"deflateReset");GET(end,"deflateEnd");
#undef GET
}
static unsigned operation(int id){CHECK(stream.state==state);stream.next_out=output;stream.avail_out=CAP;stream.next_in=input[id].data;stream.avail_in=input[id].n;
int rc,guard=0;do{rc=api.def(&stream,Z_FINISH);CHECK((rc==Z_OK||rc==Z_STREAM_END)&&++guard<10&&stream.avail_out);}while(rc!=Z_STREAM_END);
CHECK(!stream.avail_in&&stream.total_out<CAP);unsigned n=(unsigned)stream.total_out;CHECK(api.reset(&stream)==Z_OK&&stream.state==state);last_input=id;return n;}
static void inflate_check(int id,unsigned n){z_stream z={0};CHECK(inflateInit(&z)==Z_OK);z.next_in=output;z.avail_in=n;z.next_out=plain;z.avail_out=sizeof(plain);CHECK(inflate(&z,Z_FINISH)==Z_STREAM_END&&z.total_in==n&&z.total_out==input[id].n&&!memcmp(plain,input[id].data,input[id].n));CHECK(inflateEnd(&z)==Z_OK);}
static unsigned correctness(int after){unsigned count=0;char path[5000];for(int id=0;id<264;id++){unsigned n=operation(id);inflate_check(id,n);Ref*r=&reference[id];
if(!after){r->n=n;r->data=malloc(n);CHECK(r->data);memcpy(r->data,output,n);snprintf(path,sizeof(path),"%s/compressed/w%d-%d.bin",root,worker,id);FILE*f=fopen(path,"wx");CHECK(f&&fwrite(output,1,n,f)==n);CHECK(!fclose(f));}
else CHECK(n==r->n&&!memcmp(output,r->data,n));count++;}fprintf(stderr,"CORRECTNESS worker=%d after=%d stock_inflates=%u bytes_equal=true\n",worker,after,count);return count;}
static void throttle(uint64_t *p,uint64_t *u){*p=*u=0;FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)return;char k[80];unsigned long long v;while(fscanf(f,"%79s %llu",k,&v)==2){if(!strcmp(k,"nr_throttled"))*p=v;if(!strcmp(k,"throttled_usec"))*u=v;}fclose(f);}
static void clock_probes(int command,int episode){const char*names[]={"mono_pair","legacy_nested","empty_batch"};for(int kind=0;kind<3;kind++){
int count=kind==2?512:128;uint64_t sw=0,sc=0,c0=ns(CLOCK_THREAD_CPUTIME_ID),w0=ns(CLOCK_MONOTONIC);
for(int j=0;j<count;j++){if(kind==0){uint64_t a=ns(CLOCK_MONOTONIC),b=ns(CLOCK_MONOTONIC);sw+=b-a;}else if(kind==1){uint64_t a=ns(CLOCK_MONOTONIC),b=ns(CLOCK_THREAD_CPUTIME_ID),c=ns(CLOCK_THREAD_CPUTIME_ID),d=ns(CLOCK_MONOTONIC);sw+=d-a;sc+=c-b;}else __asm__ __volatile__("":::"memory");}
uint64_t w1=ns(CLOCK_MONOTONIC),c1=ns(CLOCK_THREAD_CPUTIME_ID);if(kind==2)sw=w1-w0;if(kind!=1)sc=c1-c0;
fprintf(clocks,"%d,%d,%d,%s,%d,%llu,%llu,%llu,%llu,%llu\n",command,worker,episode,names[kind],count,(unsigned long long)sw,(unsigned long long)sc,(unsigned long long)(w1-w0),(unsigned long long)w0,(unsigned long long)w1);
}CHECK(!fflush(clocks));}
static uint64_t loop(int work,int count){uint64_t sum=0;for(int j=0;j<count;j++){int id=banks[work][j%256];unsigned n=operation(id);CHECK(n==reference[id].n);sum+=n;}return sum;}
static uint64_t sample(Command*c,Episode*e){CHECK(e->warm==256||e->warm==3328);int pos=c->row%4;CHECK(c->row/4==e->id);int label=(pos==0||pos==3)?e->order:!e->order;
struct rusage a,b,d,f;uint64_t ap,au,bp,bu,dp,du,fp,fu;throttle(&ap,&au);CHECK(!getrusage(RUSAGE_THREAD,&a));
uint64_t wc0=ns(CLOCK_THREAD_CPUTIME_ID),w0=ns(CLOCK_MONOTONIC);uint64_t warm_sum=loop(e->work,e->warm);uint64_t w1=ns(CLOCK_MONOTONIC),wc1=ns(CLOCK_THREAD_CPUTIME_ID);
CHECK(!getrusage(RUSAGE_THREAD,&b));throttle(&bp,&bu);CHECK(warm_sum==ring_sum[e->work]*(unsigned)(e->warm/256));
throttle(&dp,&du);CHECK(!getrusage(RUSAGE_THREAD,&d));uint64_t tc0=ns(CLOCK_THREAD_CPUTIME_ID),t0=ns(CLOCK_MONOTONIC);uint64_t sum=loop(e->work,512);uint64_t t1=ns(CLOCK_MONOTONIC),tc1=ns(CLOCK_THREAD_CPUTIME_ID);
CHECK(!getrusage(RUSAGE_THREAD,&f));throttle(&fp,&fu);CHECK(sum==2*ring_sum[e->work]);unsigned n=reference[last_input].n;CHECK(!memcmp(output,reference[last_input].data,n));inflate_check(last_input,n);
fprintf(raw,"%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%u,%d,%llu,%llu,%llu,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu\n",
c->row,c->id,e->id,e->block,worker,e->slot,e->time_slot,e->work,e->condition,e->warm,e->order,pos,label,
(unsigned long long)(t1-t0),(unsigned long long)(tc1-tc0),(unsigned long long)t0,(unsigned long long)t1,(unsigned long long)tc0,(unsigned long long)tc1,
(unsigned long long)(w1-w0),(unsigned long long)(wc1-wc0),(unsigned long long)w0,(unsigned long long)w1,(unsigned long long)wc0,(unsigned long long)wc1,
(unsigned long long)warm_sum,(unsigned long long)sum,(unsigned long long)(uintptr_t)&stream,(unsigned long long)(uintptr_t)state,(unsigned long long)(uintptr_t)output,
n,last_input,(unsigned long long)(uintptr_t)api.def,(unsigned long long)(uintptr_t)api.reset,(unsigned long long)512,(unsigned long long)0,(unsigned long long)0,
b.ru_nvcsw-a.ru_nvcsw,b.ru_nivcsw-a.ru_nivcsw,b.ru_minflt-a.ru_minflt,b.ru_majflt-a.ru_majflt,(unsigned long long)(bp-ap),(unsigned long long)(bu-au),
f.ru_nvcsw-d.ru_nvcsw,f.ru_nivcsw-d.ru_nivcsw,f.ru_minflt-d.ru_minflt,f.ru_majflt-d.ru_majflt,(unsigned long long)(fp-dp),(unsigned long long)(fu-du));CHECK(!fflush(raw));batches++;return sum;}
static void read_inputs(const char*path){FILE*f=fopen(path,"r");CHECK(f);char line[5000],name[4800];int id,count=0;while(fgets(line,sizeof(line),f)){CHECK(sscanf(line,"%d\t%4799s",&id,name)==2&&id==count&&id<NP);FILE*g=fopen(name,"rb");CHECK(g&&!fseek(g,0,SEEK_END));long n=ftell(g);CHECK(n>=0&&n<=1048576&&!fseek(g,0,SEEK_SET));input[id].n=(unsigned)n;input[id].data=malloc((size_t)n+1);CHECK(input[id].data&&fread(input[id].data,1,(size_t)n,g)==(size_t)n);fclose(g);count++;}CHECK(count==NP);fclose(f);}
static void read_works(const char*path){FILE*f=fopen(path,"r");CHECK(f);char line[5000],values[4096];int id,count=0;while(fgets(line,sizeof(line),f)){CHECK(sscanf(line,"%d\t%4095s",&id,values)==2&&id==count&&id<2);int n=0;for(char*p=strtok(values,",");p;p=strtok(NULL,",")){CHECK(n<256);int bank=atoi(p);CHECK(bank>=0&&bank<264);banks[id][n++]=bank;}CHECK(n==256);count++;}CHECK(count==2);fclose(f);}
static void read_plans(const char*ep,const char*cmd){FILE*f=fopen(ep,"r");CHECK(f);char line[5000];CHECK(fgets(line,sizeof(line),f));int n=0;while(fgets(line,sizeof(line),f)){CHECK(n<NE);Episode*e=&episodes[n];CHECK(sscanf(line,"%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",&e->id,&e->block,&e->worker,&e->companion,&e->slot,&e->time_slot,&e->work,&e->condition,&e->warm,&e->order)==10&&e->id==n);n++;}CHECK(n==NE);fclose(f);f=fopen(cmd,"r");CHECK(f&&fgets(line,sizeof(line),f));n=0;while(fgets(line,sizeof(line),f)){CHECK(n<NC);Command*c=&commands[n];CHECK(sscanf(line,"%d\t%d\t%d\t%d\t%d",&c->id,&c->worker,&c->opcode,&c->episode,&c->row)==5&&c->id==n);n++;}CHECK(n==NC);fclose(f);}
static FILE*create(const char*name){char path[5000];CHECK(snprintf(path,sizeof(path),"%s/%s-%d.csv",root,name,worker)>0);FILE*f=fopen(path,"wx");CHECK(f);return f;}
static void metadata(void){struct timespec a,b;CHECK(!clock_getres(CLOCK_MONOTONIC,&a)&&!clock_getres(CLOCK_THREAD_CPUTIME_ID,&b));char path[5000];snprintf(path,sizeof(path),"%s/worker-%d-metadata.json",root,worker);FILE*f=fopen(path,"wx");CHECK(f);
fprintf(f,"{\"protocol\":\"conditioning-null-v1\",\"worker\":%d,\"sizeof_stream\":%zu,\"stream\":%llu,\"state\":%llu,\"output\":%llu,\"def_entry\":%llu,\"reset_entry\":%llu,\"before_checks\":%u,\"mono_resolution_ns\":%llu,\"cpu_resolution_ns\":%llu,\"cpu_pin\":%d,\"allocator_trace\":false,\"image\":\"unchanged-N\",\"timer_layout\":\"CPU0,MONO0,operations,MONO1,CPU1\"}\n",worker,sizeof(stream),(unsigned long long)(uintptr_t)&stream,(unsigned long long)(uintptr_t)state,(unsigned long long)(uintptr_t)output,(unsigned long long)(uintptr_t)api.def,(unsigned long long)(uintptr_t)api.reset,before_checks,(unsigned long long)a.tv_sec*1000000000+a.tv_nsec,(unsigned long long)b.tv_sec*1000000000+b.tv_nsec,sched_getcpu());CHECK(!fclose(f));}
static void checks(void){char path[5000];snprintf(path,sizeof(path),"%s/worker-%d-checks.json",root,worker);FILE*f=fopen(path,"wx");CHECK(f);fprintf(f,"{\"worker\":%d,\"before_checks\":%u,\"after_checks\":%u,\"all_outputs_equal\":true,\"batches\":%u,\"resets\":%u,\"prefixes\":%u}\n",worker,before_checks,after_checks,batches,resets,prefixes);CHECK(!fclose(f));}
int main(int argc,char**argv){CHECK(argc==9||argc==10);root=argv[6];worker=atoi(argv[7]);CHECK(worker>=0&&worker<8&&!strcmp(argv[8],"conditioning-null-v1"));load(argv[1]);read_inputs(argv[2]);read_works(argv[3]);read_plans(argv[4],argv[5]);CHECK(api.init(&stream,6,8,15,8,0,ZLIB_VERSION,sizeof(stream))==Z_OK);state=stream.state;
before_checks=correctness(0);for(int w=0;w<2;w++)for(int i=0;i<256;i++)ring_sum[w]+=reference[banks[w][i]].n;metadata();
if(argc==10){CHECK(!strcmp(argv[9],"--untimed-only"));after_checks=correctness(1);checks();CHECK(api.end(&stream)==Z_OK);return 0;}
raw=create("worker");events=create("events");clocks=create("clocks");
fputs("seq,command,episode,block,worker,worker_slot,time_slot,work,condition,warm,order,position,label,wall_ns,cpu_ns,begin_ns,end_ns,cpu_begin_ns,cpu_end_ns,warm_wall_ns,warm_cpu_ns,warm_begin_ns,warm_end_ns,warm_cpu_begin_ns,warm_cpu_end_ns,warm_sum,output_sum,stream,state,output,output_bytes,last_input,def_entry,reset_entry,operations,bank_phase,extra,w_voluntary,w_involuntary,w_minor,w_major,w_throttled_periods,w_throttled_us,voluntary,involuntary,minor,major,throttled_periods,throttled_us\n",raw);
fputs("command,worker,opcode,episode,work,operations,output_sum,begin_ns,end_ns,cpu_begin_ns,cpu_end_ns,stream,state,def_entry,reset_entry,output,cpu_before,cpu_after\n",events);
fputs("command,worker,episode,kind,operations,wall_ns,cpu_ns,outer_wall_ns,begin_ns,end_ns\n",clocks);
printf("READY %d\n",worker);fflush(stdout);int next=0;while(next<NC&&commands[next].worker!=worker)next++;char line[100];int id;
while(fgets(line,sizeof(line),stdin)){if(!strcmp(line,"Q\n"))break;CHECK(sscanf(line,"X %d",&id)==1&&id==next&&id<NC);Command*c=&commands[id];Episode*e=&episodes[c->episode];int work=e->work,ops=0;uint64_t sum=0;int cpu0=sched_getcpu();uint64_t c0=ns(CLOCK_THREAD_CPUTIME_ID),t0=ns(CLOCK_MONOTONIC);
if(c->opcode==0){CHECK(worker==e->worker);clock_probes(c->id,e->id);CHECK(api.reset(&stream)==Z_OK);resets++;}
else if(c->opcode==1){CHECK(worker==e->companion&&worker!=e->worker);work^=1;ops=3072;sum=loop(work,ops);CHECK(sum==12*ring_sum[work]);inflate_check(last_input,reference[last_input].n);prefixes++;}
else{CHECK(c->opcode==2&&worker==e->worker);ops=512;sum=sample(c,e);}
uint64_t t1=ns(CLOCK_MONOTONIC),c1=ns(CLOCK_THREAD_CPUTIME_ID);int cpu1=sched_getcpu();fprintf(events,"%d,%d,%d,%d,%d,%d,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%d,%d\n",id,worker,c->opcode,e->id,work,ops,(unsigned long long)sum,(unsigned long long)t0,(unsigned long long)t1,(unsigned long long)c0,(unsigned long long)c1,(unsigned long long)(uintptr_t)&stream,(unsigned long long)(uintptr_t)state,(unsigned long long)(uintptr_t)api.def,(unsigned long long)(uintptr_t)api.reset,(unsigned long long)(uintptr_t)output,cpu0,cpu1);CHECK(!fflush(events));
next++;while(next<NC&&commands[next].worker!=worker)next++;printf("DONE %d\n",id);fflush(stdout);}
CHECK(!feof(stdin)&&next==NC);after_checks=correctness(1);checks();CHECK(api.end(&stream)==Z_OK);CHECK(!fclose(raw)&&!fclose(events)&&!fclose(clocks));printf("QUIT %d\n",worker);fflush(stdout);return 0;}
