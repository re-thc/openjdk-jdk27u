#define _GNU_SOURCE
#include <dlfcn.h>
#include <inttypes.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <time.h>
#include <zlib.h>
#define NI 548
#define NW 12
#define NE 7040
#define NC 42240
#define CAP (1048576+1048576/8+1024)
#define CHECK(x) do {if(!(x)){fprintf(stderr,"CHECK worker=%d line=%d %s\n",worker,__LINE__,#x);abort();}}while(0)
static int worker;
typedef struct {int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);} Api;
typedef struct {z_stream z;unsigned char pad[128-sizeof(z_stream)];} Slot;
_Static_assert(sizeof(Slot)==128,"fixed aligned stream stride");
static _Alignas(64) Slot slots[2],fresh[2];static Api api[2];static void*states[2];
typedef struct {unsigned char*data;unsigned bytes;} Input;
typedef struct {int id,bytes,life,warm_work,prep,iterations,count,banks[256];} Work;
typedef struct {int id,phase,block,worker,companion,worker_slot,profile_slot,case_slot,work,kind,order;} Episode;
typedef struct {int id,worker,opcode,episode,row;} Command;
typedef struct {unsigned n;unsigned char*data;} Ref;
static Input inputs[NI];static Work works[NW];static Episode episodes[NE];static Command commands[NC];static Ref refs[NW][NI];
static unsigned char output[CAP],plain[1048577];static unsigned last_input,last_n;static uintptr_t last_stream,last_state;static uint64_t sums[NW];
static unsigned checks_before,checks_after,batches,resets,prefixes;static const char*root;static FILE*raw,*events,*clocks;
static uint64_t ns(clockid_t id){struct timespec t;CHECK(!clock_gettime(id,&t));return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static void load(Api*a,const char*path){void*h=dlopen(path,RTLD_NOW|RTLD_LOCAL);if(!h)fprintf(stderr,"%s\n",dlerror());CHECK(h);
#define GET(f,n) a->f=dlsym(h,"jdk_ng_" n);CHECK(a->f)
GET(init,"deflateInit2_");GET(def,"deflate");GET(reset,"deflateReset");GET(end,"deflateEnd");
#undef GET
CHECK(!dlsym(h,"jdk_ng_test_sparse_resets")&&!dlsym(h,"jdk_ng_test_control"));}
static unsigned operation(int arm,int work,int id){Work*w=&works[work];z_stream*z=w->life==1?&fresh[arm].z:&slots[arm].z;
if(w->life==1){memset(z,0,sizeof(*z));CHECK(api[arm].init(z,6,8,15,8,0,ZLIB_VERSION,sizeof(*z))==Z_OK);}else CHECK(z->state==states[arm]);
last_stream=(uintptr_t)z;last_state=(uintptr_t)z->state;z->next_out=output;z->avail_out=CAP;z->next_in=inputs[id].data;z->avail_in=inputs[id].bytes;
if(w->life==2){CHECK(inputs[id].bytes==64);z->avail_in=32;CHECK(api[arm].def(z,Z_NO_FLUSH)==Z_OK&&!z->avail_in);z->next_in=inputs[id].data+32;z->avail_in=32;}
int rc,guard=0;do{rc=api[arm].def(z,Z_FINISH);CHECK((rc==Z_OK||rc==Z_STREAM_END)&&++guard<10&&z->avail_out);}while(rc!=Z_STREAM_END);
CHECK(!z->avail_in&&z->total_out<CAP);last_n=(unsigned)z->total_out;last_input=id;
if(w->life==1)CHECK(api[arm].end(z)==Z_OK);else CHECK(api[arm].reset(z)==Z_OK&&z->state==states[arm]);return last_n;}
static void inflate_check(int id,unsigned n){z_stream z={0};CHECK(inflateInit(&z)==Z_OK);z.next_in=output;z.avail_in=n;z.next_out=plain;z.avail_out=sizeof(plain);CHECK(inflate(&z,Z_FINISH)==Z_STREAM_END&&z.total_in==n&&z.total_out==inputs[id].bytes&&!memcmp(plain,inputs[id].data,inputs[id].bytes));CHECK(inflateEnd(&z)==Z_OK);}
static unsigned correctness(int after){unsigned count=0;char path[5000];for(int w=0;w<NW;w++){int seen[NI]={0};for(int k=0;k<works[w].count;k++){int id=works[w].banks[k];if(seen[id]++)continue;
for(int a=0;a<2;a++){unsigned n=operation(a,w,id);inflate_check(id,n);Ref*r=&refs[w][id];if(!after&&a==0){r->n=n;r->data=malloc(n);CHECK(r->data);memcpy(r->data,output,n);snprintf(path,sizeof(path),"%s/compressed/w%d-p%d-i%d.bin",root,worker,w,id);FILE*f=fopen(path,"wx");CHECK(f&&fwrite(output,1,n,f)==n&&!fclose(f));}else CHECK(n==r->n&&!memcmp(output,r->data,n));count++;}}}
fprintf(stderr,"DIRECT_CORRECTNESS worker=%d after=%d stock_inflates=%u all_bytes_equal=true\n",worker,after,count);return count;}
static uint64_t loop(int arm,int work,int count){uint64_t sum=0;for(int i=0;i<count;i++){int id=works[work].banks[i%works[work].count];unsigned n=operation(arm,work,id);CHECK(n==refs[work][id].n);sum+=n;}return sum;}
static FILE*file(const char*name,const char*mode){char path[5000];CHECK(snprintf(path,sizeof(path),"%s/%s",root,name)>0);FILE*f=fopen(path,mode);CHECK(f);return f;}
static void csv(FILE*f,const uint64_t*v,size_t count){for(size_t i=0;i<count;i++)CHECK(fprintf(f,"%s%"PRIu64,i?",":"",v[i])>0);CHECK(fputc('\n',f)!=EOF&&!fflush(f));}
static void throttle(uint64_t*p,uint64_t*u){*p=*u=0;FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)return;char key[80];unsigned long long n;while(fscanf(f,"%79s %llu",key,&n)==2){if(!strcmp(key,"nr_throttled"))*p=n;if(!strcmp(key,"throttled_usec"))*u=n;}fclose(f);}
typedef struct {struct rusage r;uint64_t p,u;} Usage;
static Usage usage(void){Usage x;CHECK(!getrusage(RUSAGE_THREAD,&x.r));throttle(&x.p,&x.u);return x;}
static void resource_delta(uint64_t*out,Usage a,Usage b){int64_t v[]={b.r.ru_nvcsw-a.r.ru_nvcsw,b.r.ru_nivcsw-a.r.ru_nivcsw,b.r.ru_minflt-a.r.ru_minflt,b.r.ru_majflt-a.r.ru_majflt};for(int i=0;i<4;i++){CHECK(v[i]>=0);out[i]=(uint64_t)v[i];}CHECK(b.p>=a.p&&b.u>=a.u);out[4]=b.p-a.p;out[5]=b.u-a.u;}
static void clock_probes(int cmd,int ep){const char*names[]={"mono_pair","legacy_nested","empty_batch"};for(int k=0;k<3;k++){int n=k==2?512:128;uint64_t sw=0,sc=0,c0=ns(CLOCK_THREAD_CPUTIME_ID),w0=ns(CLOCK_MONOTONIC);for(int j=0;j<n;j++){if(k==0){uint64_t a=ns(CLOCK_MONOTONIC),b=ns(CLOCK_MONOTONIC);sw+=b-a;}else if(k==1){uint64_t a=ns(CLOCK_MONOTONIC),b=ns(CLOCK_THREAD_CPUTIME_ID),c=ns(CLOCK_THREAD_CPUTIME_ID),d=ns(CLOCK_MONOTONIC);sw+=d-a;sc+=c-b;}else __asm__ __volatile__("":::"memory");}uint64_t w1=ns(CLOCK_MONOTONIC),c1=ns(CLOCK_THREAD_CPUTIME_ID);if(k==2)sw=w1-w0;if(k!=1)sc=c1-c0;
CHECK(fprintf(clocks,"%d,%d,%d,%s,%d,%"PRIu64",%"PRIu64",%"PRIu64",%"PRIu64",%"PRIu64"\n",cmd,worker,ep,names[k],n,sw,sc,w1-w0,w0,w1)>0);}CHECK(!fflush(clocks));}
static void sample(Command*c,Episode*e){int pos=c->row%4,label=pos==0||pos==3?e->order:1-e->order,arm=e->kind==2?label:e->kind;Work*w=&works[e->work];
Usage a=usage();uint64_t wc0=ns(CLOCK_THREAD_CPUTIME_ID),w0=ns(CLOCK_MONOTONIC);uint64_t warm=loop(arm,w->warm_work,3328),prep=loop(arm,w->id,w->prep);uint64_t w1=ns(CLOCK_MONOTONIC),wc1=ns(CLOCK_THREAD_CPUTIME_ID);Usage b=usage(),d=usage();
uint64_t c0=ns(CLOCK_THREAD_CPUTIME_ID),t0=ns(CLOCK_MONOTONIC);uint64_t sum=loop(arm,w->id,w->iterations);uint64_t t1=ns(CLOCK_MONOTONIC),c1=ns(CLOCK_THREAD_CPUTIME_ID);Usage f=usage();
CHECK(warm==sums[w->warm_work]*(3328/works[w->warm_work].count)&&prep==sums[w->id]*(w->prep/works[w->id].count));CHECK(sum==sums[w->id]*(w->iterations/works[w->id].count));CHECK(!memcmp(output,refs[w->id][last_input].data,last_n));inflate_check(last_input,last_n);
uint64_t v[]={c->row,e->id,e->phase,e->block,worker,e->worker_slot,e->profile_slot,e->case_slot,e->work,e->kind,e->order,pos,label,arm,c->id,w->iterations,3328,w->prep,w->warm_work,0,
t1-t0,c1-c0,t0,t1,c0,c1,w1-w0,wc1-wc0,w0,w1,wc0,wc1,warm,prep,sum,last_input,last_n,last_stream,last_state,(uintptr_t)output,(uintptr_t)api[arm].def,(uintptr_t)api[arm].reset};
resource_delta((uint64_t[6]){0},a,b);for(size_t i=0;i<sizeof(v)/sizeof(*v);i++)CHECK(fprintf(raw,"%s%"PRIu64,i?",":"",v[i])>0);uint64_t counters[12];resource_delta(counters,a,b);resource_delta(counters+6,d,f);for(int i=0;i<12;i++)CHECK(fprintf(raw,",%"PRIu64,counters[i])>0);CHECK(fputc('\n',raw)!=EOF&&!fflush(raw));batches++;}
static void read_inputs(const char*path){FILE*f=fopen(path,"r");CHECK(f);char line[5000],name[4800];int id,n=0;while(fgets(line,sizeof(line),f)){CHECK(sscanf(line,"%d %4799s",&id,name)==2&&id==n&&n<NI);FILE*g=fopen(name,"rb");CHECK(g&&!fseek(g,0,SEEK_END));long size=ftell(g);CHECK(size>=0&&size<=1048576&&!fseek(g,0,SEEK_SET));inputs[n].bytes=(unsigned)size;inputs[n].data=malloc((size_t)size+1);CHECK(inputs[n].data&&fread(inputs[n].data,1,(size_t)size,g)==(size_t)size&&!fclose(g));n++;}CHECK(n==NI&&!fclose(f));}
static void read_profiles(const char*path){FILE*f=fopen(path,"r");CHECK(f);char line[5000],banks[4096];CHECK(fgets(line,sizeof(line),f));int n=0;while(fgets(line,sizeof(line),f)){CHECK(n<NW);Work*w=&works[n];CHECK(sscanf(line,"%d %d %d %d %d %d %4095s",&w->id,&w->bytes,&w->life,&w->warm_work,&w->prep,&w->iterations,banks)==7&&w->id==n&&w->warm_work>=0&&w->warm_work<NW&&w->life>=0&&w->life<=2);for(char*p=strtok(banks,",");p;p=strtok(NULL,",")){CHECK(w->count<256);int id=atoi(p);CHECK(id>=0&&id<NI&&inputs[id].bytes==(unsigned)w->bytes);w->banks[w->count++]=id;}CHECK(w->count&&w->iterations%w->count==0);n++;}CHECK(n==NW&&!fclose(f));}
static void read_plans(const char*ep,const char*cp){FILE*f=fopen(ep,"r");CHECK(f);char line[5000];CHECK(fgets(line,sizeof(line),f));int n=0;while(fgets(line,sizeof(line),f)){CHECK(n<NE);Episode*e=&episodes[n];CHECK(sscanf(line,"%d %d %d %d %d %d %d %d %d %d %d",&e->id,&e->phase,&e->block,&e->worker,&e->companion,&e->worker_slot,&e->profile_slot,&e->case_slot,&e->work,&e->kind,&e->order)==11&&e->id==n&&e->work>=0&&e->work<NW);n++;}CHECK(n==NE&&!fclose(f));f=fopen(cp,"r");CHECK(f&&fgets(line,sizeof(line),f));n=0;while(fgets(line,sizeof(line),f)){CHECK(n<NC);Command*c=&commands[n];CHECK(sscanf(line,"%d %d %d %d %d",&c->id,&c->worker,&c->opcode,&c->episode,&c->row)==5&&c->id==n);n++;}CHECK(n==NC&&!fclose(f));}
static void metadata(void){FILE*f;char name[100];snprintf(name,sizeof(name),"worker-%d-metadata.json",worker);f=file(name,"wx");struct timespec a,b;CHECK(!clock_getres(CLOCK_MONOTONIC,&a)&&!clock_getres(CLOCK_THREAD_CPUTIME_ID,&b));
CHECK(fprintf(f,"{\"protocol\":\"direct-public-ns-v1\",\"worker\":%d,\"cpu_pin\":%d,\"sizeof_stream\":%zu,\"slot_stride\":%zu,\"load_reverse\":%d,\"init_reverse\":%d,\"allocator_trace\":false,\"before_checks\":%u,\"mono_resolution_ns\":%ld,\"cpu_resolution_ns\":%ld,\"output\":%"PRIuPTR",\"N_stream\":%"PRIuPTR",\"S_stream\":%"PRIuPTR",\"N_state\":%"PRIuPTR",\"S_state\":%"PRIuPTR",\"N_fresh_stream\":%"PRIuPTR",\"S_fresh_stream\":%"PRIuPTR",\"N_def\":%"PRIuPTR",\"S_def\":%"PRIuPTR",\"N_reset\":%"PRIuPTR",\"S_reset\":%"PRIuPTR"}\n",worker,sched_getcpu(),sizeof(z_stream),sizeof(Slot),(worker>>1)&1,worker&1,checks_before,a.tv_nsec,b.tv_nsec,(uintptr_t)output,(uintptr_t)&slots[0].z,(uintptr_t)&slots[1].z,(uintptr_t)states[0],(uintptr_t)states[1],(uintptr_t)&fresh[0].z,(uintptr_t)&fresh[1].z,(uintptr_t)api[0].def,(uintptr_t)api[1].def,(uintptr_t)api[0].reset,(uintptr_t)api[1].reset)>0&&!fclose(f));}
static void proofs(void){char name[100];snprintf(name,sizeof(name),"worker-%d-checks.json",worker);FILE*f=file(name,"wx");CHECK(fprintf(f,"{\"worker\":%d,\"before_checks\":%u,\"after_checks\":%u,\"all_bytes_equal\":true,\"batches\":%u,\"resets\":%u,\"prefixes\":%u}\n",worker,checks_before,checks_after,batches,resets,prefixes)>0&&!fclose(f));}
int main(int argc,char**argv){CHECK(argc==10||argc==11);root=argv[7];worker=atoi(argv[8]);CHECK(worker>=0&&worker<8&&!strcmp(argv[9],"direct-public-ns-v1"));int reverse=(worker>>1)&1;for(int j=0;j<2;j++){int a=j^reverse;load(&api[a],argv[1+a]);}read_inputs(argv[3]);read_profiles(argv[4]);read_plans(argv[5],argv[6]);for(int j=0;j<2;j++){int a=j^(worker&1);CHECK(api[a].init(&slots[a].z,6,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))==Z_OK);states[a]=slots[a].z.state;}
checks_before=correctness(0);for(int w=0;w<NW;w++)for(int k=0;k<works[w].count;k++)sums[w]+=refs[w][works[w].banks[k]].n;metadata();
if(argc==11){CHECK(!strcmp(argv[10],"--untimed-only"));checks_after=correctness(1);proofs();for(int a=0;a<2;a++)CHECK(api[a].end(&slots[a].z)==Z_OK);return 0;}
char name[100];snprintf(name,sizeof(name),"worker-%d.csv",worker);raw=file(name,"wx");snprintf(name,sizeof(name),"events-%d.csv",worker);events=file(name,"wx");snprintf(name,sizeof(name),"clocks-%d.csv",worker);clocks=file(name,"wx");
fputs("seq,episode,phase,block,worker,worker_slot,profile_slot,case_slot,work,kind,order,position,label,arm,command,operations,warm_operations,prep_operations,warm_work,bank_phase,wall_ns,cpu_ns,begin_ns,end_ns,cpu_begin_ns,cpu_end_ns,warm_wall_ns,warm_cpu_ns,warm_begin_ns,warm_end_ns,warm_cpu_begin_ns,warm_cpu_end_ns,warm_sum,prep_sum,output_sum,last_input,output_bytes,stream,state,output,def_entry,reset_entry,w_voluntary,w_involuntary,w_minor,w_major,w_throttled_periods,w_throttled_us,voluntary,involuntary,minor,major,throttled_periods,throttled_us\n",raw);
fputs("command,worker,opcode,episode,work,operations,output_sum,begin_ns,end_ns,cpu_begin_ns,cpu_end_ns,cpu_before,cpu_after,reset_calls\n",events);
fputs("command,worker,episode,kind,operations,wall_ns,cpu_ns,outer_wall_ns,begin_ns,end_ns\n",clocks);printf("READY %d\n",worker);fflush(stdout);
int next=0;while(next<NC&&commands[next].worker!=worker)next++;char line[100];int id;
while(fgets(line,sizeof(line),stdin)){if(!strcmp(line,"Q\n"))break;CHECK(sscanf(line,"X %d",&id)==1&&id==next&&id<NC);Command*c=&commands[id];Episode*e=&episodes[c->episode];int work=e->work,ops=0,rcalls=0,cpu0=sched_getcpu();uint64_t c0=ns(CLOCK_THREAD_CPUTIME_ID),t0=ns(CLOCK_MONOTONIC),sum=0;
if(c->opcode==0){CHECK(worker==e->worker);clock_probes(id,e->id);for(int a=0;a<2;a++)for(int j=0;j<2;j++){CHECK(api[a].reset(&slots[a].z)==Z_OK&&slots[a].z.state==states[a]);rcalls++;}resets++;}
else if(c->opcode==1){CHECK(worker==e->companion);work=e->phase==3?1:e->work^1;ops=3072;sum=loop(0,work,ops);CHECK(sum==12*sums[work]);inflate_check(last_input,last_n);prefixes++;}
else{CHECK(c->opcode==2&&worker==e->worker);sample(c,e);ops=works[work].iterations;sum=sums[work]*(ops/works[work].count);}
uint64_t t1=ns(CLOCK_MONOTONIC),c1=ns(CLOCK_THREAD_CPUTIME_ID);uint64_t v[]={id,worker,c->opcode,e->id,work,ops,sum,t0,t1,c0,c1,cpu0,sched_getcpu(),rcalls};csv(events,v,sizeof(v)/sizeof(*v));next++;while(next<NC&&commands[next].worker!=worker)next++;printf("DONE %d\n",id);fflush(stdout);}
CHECK(!feof(stdin)&&next==NC);checks_after=correctness(1);proofs();for(int a=0;a<2;a++)CHECK(api[a].end(&slots[a].z)==Z_OK);CHECK(!fclose(raw)&&!fclose(events)&&!fclose(clocks));printf("QUIT %d\n",worker);fflush(stdout);return 0;}
