#ifdef RESET_CONTROL_OBJECT
#include "zbuild.h"
#include "deflate.h"
/* Diagnostic-only object; the reviewed library archive is unchanged. Both
 * same-build arms call this exact function. It can disable, never enable,
 * sparse eligibility. The driver supplies only valid initialized streams. */
int Z_EXPORT diag_reset_control(PREFIX3(stream) *s, int force_full) {
    s->state->small_reset_safe &= !force_full;
    return PREFIX(deflateReset)(s);
}
#else
#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <time.h>
#include <unistd.h>
#include <zlib.h>
#define CHECK(x) do {if(!(x)){fprintf(stderr,"CHECK line=%d worker=%d: %s\n",__LINE__,worker,#x);abort();}}while(0)
#define NP 268
#define NW 10
#define NR 12480
#define CAP (1048576+1048576/8+1024)
typedef struct {int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);int(*control)(z_streamp,int);} Api;
typedef struct {unsigned char *data;unsigned n;} Input;
typedef struct {int id,section,life,iterations,warm,quartets,count,banks[256];} Work;
typedef struct {int seq,worker,phase,block,work,kind,quartet,position,label,arm,offset;} Row;
typedef struct {unsigned n;unsigned char *data;} Ref;
static Api api[2];static z_stream stream[2];static void *state[2];
static Input input[NP];static Work work[NW];static Row plan[NR];static Ref reference[NW][NP];
static unsigned char output[CAP],plain[1048577];static int worker;static const char *root;
static uintptr_t last_stream,last_state;static unsigned last_input;static int predecessor=-1;
#ifdef RESET_CHECK_ONLY
static unsigned long *sparse_count;
#endif
static uint64_t ns(clockid_t id){struct timespec t;CHECK(!clock_gettime(id,&t));return(uint64_t)t.tv_sec*1000000000+(uint64_t)t.tv_nsec;}
static void load(Api *a,const char *path,int candidate){void *h=dlopen(path,RTLD_NOW|RTLD_LOCAL);if(!h){fprintf(stderr,"%s\n",dlerror());abort();}
#define GET(field,name) do{a->field=dlsym(h,"jdk_ng_" name);CHECK(a->field);}while(0)
GET(init,"deflateInit2_");GET(def,"deflate");GET(reset,"deflateReset");GET(end,"deflateEnd");
#undef GET
if(candidate){a->control=dlsym(h,"diag_reset_control");CHECK(a->control);
#ifdef RESET_CHECK_ONLY
 sparse_count=dlsym(h,"jdk_ng_test_sparse_resets");CHECK(sparse_count);
#endif
}}
static unsigned finish(Api *a,z_stream *s,const Input *in,int chunked){
    s->next_out=output;s->avail_out=CAP;s->next_in=in->data;s->avail_in=in->n;
    if(chunked){CHECK(in->n>64);s->avail_in=64;CHECK(a->def(s,Z_NO_FLUSH)==Z_OK&&s->avail_in==0);s->next_in=in->data+64;s->avail_in=in->n-64;}
    int rc,guard=0;do{rc=a->def(s,Z_FINISH);CHECK((rc==Z_OK||rc==Z_STREAM_END)&&++guard<10&&s->avail_out>0);}while(rc!=Z_STREAM_END);
    CHECK(s->avail_in==0&&s->total_out<CAP);return(unsigned)s->total_out;
}
static void reset(int arm,z_stream *s){int i=arm!=0;CHECK(s->state==state[i]);CHECK((arm>=2?api[1].control(s,arm==2):api[i].reset(s))==Z_OK);CHECK(s->state==state[i]);}
static unsigned operation(int arm,const Work *w,unsigned id){
    int i=arm!=0;Api *a=&api[i];unsigned n;
#ifdef RESET_CHECK_ONLY
    unsigned long prior=*sparse_count;
#endif
    if(w->life==1){z_stream fresh={0};CHECK(a->init(&fresh,6,8,15,8,0,ZLIB_VERSION,sizeof(fresh))==Z_OK);n=finish(a,&fresh,&input[id],0);last_stream=(uintptr_t)&fresh;last_state=(uintptr_t)fresh.state;CHECK(a->end(&fresh)==Z_OK);}
    else {CHECK(stream[i].state==state[i]);n=finish(a,&stream[i],&input[id],w->life==2);last_stream=(uintptr_t)&stream[i];last_state=(uintptr_t)state[i];reset(arm,&stream[i]);}
#ifdef RESET_CHECK_ONLY
    CHECK(*sparse_count-prior==(unsigned long)((arm==1||arm==3)&&w->life==0&&input[id].n<=64));
#endif
    last_input=id;return n;
}
static void inflate_check(unsigned id,unsigned n){z_stream z={0};CHECK(inflateInit(&z)==Z_OK);z.next_in=output;z.avail_in=n;z.next_out=plain;z.avail_out=sizeof(plain);CHECK(inflate(&z,Z_FINISH)==Z_STREAM_END&&z.total_in==n&&z.total_out==input[id].n&&!memcmp(plain,input[id].data,input[id].n));CHECK(inflateEnd(&z)==Z_OK);}
static void correctness(int after){unsigned checks=0;char name[5000];
    for(int wi=0;wi<NW;wi++){int seen[NP]={0};for(int b=0;b<work[wi].count;b++){unsigned id=(unsigned)work[wi].banks[b];if(seen[id]++)continue;
        for(int order=0;order<4;order++){int arm=order==0?0:(worker?4-order:order);unsigned n=operation(arm,&work[wi],id);inflate_check(id,n);Ref *r=&reference[wi][id];
            if(!r->data){CHECK(!after);r->n=n;r->data=malloc(n);CHECK(r->data);memcpy(r->data,output,n);CHECK(snprintf(name,sizeof(name),"%s/compressed/w%d-%d-%u.bin",root,worker,wi,id)>0);FILE *f=fopen(name,"wx");CHECK(f&&fwrite(output,1,n,f)==n);fclose(f);}
            else CHECK(n==r->n&&!memcmp(output,r->data,n));checks++;
        }
    }}fprintf(stderr,"CORRECTNESS worker=%d after=%d stock_inflates=%u all_outputs_equal=true\n",worker,after,checks);
}
static void throttle(uint64_t *periods,uint64_t *usec){*periods=*usec=0;FILE *f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)return;char key[80];unsigned long long v;while(fscanf(f,"%79s %llu",key,&v)==2){if(!strcmp(key,"nr_throttled"))*periods=v;if(!strcmp(key,"throttled_usec"))*usec=v;}fclose(f);}
static unsigned bank(const Work *w,int pos){int k=pos%w->count;if(k<0)k+=w->count;return(unsigned)w->banks[k];}
static void sample(FILE *f,const Row *r){const Work *w=&work[r->work];int old=predecessor;uint64_t prep0=ns(CLOCK_MONOTONIC);
    for(int j=-w->warm;j<0;j++)CHECK(operation(r->arm,w,bank(w,r->offset+j))==reference[r->work][bank(w,r->offset+j)].n);
    uint64_t prep=ns(CLOCK_MONOTONIC)-prep0,pa,ua,pb,ub;struct rusage a,b;throttle(&pa,&ua);CHECK(!getrusage(RUSAGE_THREAD,&a));
    uint64_t begin=ns(CLOCK_MONOTONIC),wall=0,cpu=0,sum=0,c0=0;unsigned n=0;
    if(!w->section)c0=ns(CLOCK_THREAD_CPUTIME_ID);
    for(int k=0;k<w->iterations;k++){unsigned id=bank(w,r->offset+k);
        if(!w->section)n=operation(r->arm,w,id);
        else {int i=r->arm!=0;n=finish(&api[i],&stream[i],&input[id],0);CHECK(n==reference[r->work][id].n&&!memcmp(output,reference[r->work][id].data,n));
            uint64_t w0=ns(CLOCK_MONOTONIC),t0=ns(CLOCK_THREAD_CPUTIME_ID);reset(r->arm,&stream[i]);uint64_t t1=ns(CLOCK_THREAD_CPUTIME_ID),w1=ns(CLOCK_MONOTONIC);wall+=w1-w0;cpu+=t1-t0;last_stream=(uintptr_t)&stream[i];last_state=(uintptr_t)state[i];last_input=id;
        }sum+=n;
    }
    if(!w->section)cpu=ns(CLOCK_THREAD_CPUTIME_ID)-c0;uint64_t end=ns(CLOCK_MONOTONIC);if(!w->section)wall=end-begin;
    CHECK(!getrusage(RUSAGE_THREAD,&b));throttle(&pb,&ub);uint64_t want=0;for(int k=0;k<w->iterations;k++)want+=reference[r->work][bank(w,r->offset+k)].n;
    CHECK(sum==want&&n==reference[r->work][last_input].n&&!memcmp(output,reference[r->work][last_input].data,n));inflate_check(last_input,n);
    fprintf(f,"%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%llu,%llu,%llu,%llu,%llu,%llu,%u,%u,%d,%llu,%llu,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu\n",r->seq,r->worker,r->phase,r->block,r->work,r->kind,r->quartet,r->position,r->label,r->arm,r->offset,(unsigned long long)wall,(unsigned long long)cpu,(unsigned long long)(end-begin),(unsigned long long)prep,(unsigned long long)begin,(unsigned long long)end,n,last_input,old,(unsigned long long)sum,(unsigned long long)last_stream,(unsigned long long)last_state,(unsigned long long)(uintptr_t)output,b.ru_nvcsw-a.ru_nvcsw,b.ru_nivcsw-a.ru_nivcsw,b.ru_minflt-a.ru_minflt,b.ru_majflt-a.ru_majflt,(unsigned long long)(pb-pa),(unsigned long long)(ub-ua));fflush(f);predecessor=r->work;
}
static void read_inputs(const char *path){FILE *f=fopen(path,"r");CHECK(f);char line[5000],name[4800];int id,count=0;while(fgets(line,sizeof(line),f)){CHECK(sscanf(line,"%d\t%4799s",&id,name)==2&&id==count&&id<NP);FILE *in=fopen(name,"rb");CHECK(in&&!fseek(in,0,SEEK_END));long n=ftell(in);CHECK(n>=0&&n<=1048576&&!fseek(in,0,SEEK_SET));input[id].n=(unsigned)n;input[id].data=malloc((size_t)n+1);CHECK(input[id].data&&fread(input[id].data,1,(size_t)n,in)==(size_t)n);fclose(in);count++;}fclose(f);CHECK(count==NP);}
static void read_work(const char *path){FILE *f=fopen(path,"r");CHECK(f);char line[5000],banks[4096];int count=0;while(fgets(line,sizeof(line),f)){Work *w=&work[count];CHECK(sscanf(line,"%d\t%d\t%d\t%d\t%d\t%d\t%4095s",&w->id,&w->section,&w->life,&w->iterations,&w->warm,&w->quartets,banks)==7&&w->id==count);for(char *p=strtok(banks,",");p;p=strtok(NULL,",")){CHECK(w->count<256);w->banks[w->count++]=atoi(p);}CHECK(w->count==1||w->count==256);count++;}fclose(f);CHECK(count==NW);}
static void read_plan(const char *path){FILE *f=fopen(path,"r");CHECK(f);char line[5000];CHECK(fgets(line,sizeof(line),f));int n=0;while(fgets(line,sizeof(line),f)){Row *r=&plan[n];CHECK(sscanf(line,"%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",&r->seq,&r->worker,&r->phase,&r->block,&r->work,&r->kind,&r->quartet,&r->position,&r->label,&r->arm,&r->offset)==11&&r->seq==n);n++;}fclose(f);CHECK(n==NR);}
typedef struct {unsigned calls,freed;unsigned long bytes;} AllocationTrace;
static voidpf trace_alloc(voidpf opaque,uInt n,uInt size){AllocationTrace *t=opaque;t->calls++;t->bytes+=(unsigned long)n*size;return malloc((size_t)n*size);}
static void trace_free(voidpf opaque,voidpf ptr){((AllocationTrace*)opaque)->freed++;free(ptr);}
static void trace_allocator(int image){AllocationTrace t={0};z_stream s={0};s.zalloc=trace_alloc;s.zfree=trace_free;s.opaque=&t;CHECK(api[image].init(&s,6,8,15,8,0,ZLIB_VERSION,sizeof(s))==Z_OK);CHECK(api[image].end(&s)==Z_OK);CHECK(t.calls==1&&t.freed==1&&t.bytes==333312);fprintf(stderr,"UNTIMED_ALLOC worker=%d image=%d requests=%u frees=%u bytes=%lu sizeof_stream=%zu timed_allocator=default\n",worker,image,t.calls,t.freed,t.bytes,sizeof(s));}
static void maps(void){fprintf(stderr,"ADDRESSES worker=%d N.init=%p N.def=%p N.reset=%p S.init=%p S.def=%p S.reset=%p control=%p N.stream=%p N.state=%p S.stream=%p S.state=%p out=%p\n",worker,(void*)api[0].init,(void*)api[0].def,(void*)api[0].reset,(void*)api[1].init,(void*)api[1].def,(void*)api[1].reset,(void*)api[1].control,(void*)&stream[0],state[0],(void*)&stream[1],state[1],(void*)output);for(int i=0;i<NP;i++)fprintf(stderr,"INPUT worker=%d id=%d address=%p bytes=%u\n",worker,i,(void*)input[i].data,input[i].n);FILE *f=fopen("/proc/self/maps","r");if(f){char line[5000];while(fgets(line,sizeof(line),f))fputs(line,stderr);fclose(f);}}
int main(int argc,char **argv){CHECK(argc==9||argc==10);root=argv[6];worker=atoi(argv[7]);CHECK(worker==0||worker==1);if(worker){load(&api[1],argv[2],1);load(&api[0],argv[1],0);}else{load(&api[0],argv[1],0);load(&api[1],argv[2],1);}CHECK(!strcmp(argv[8],"protocol-v1"));read_inputs(argv[3]);read_work(argv[4]);read_plan(argv[5]);
    for(int j=0;j<2;j++){int i=worker?1-j:j;trace_allocator(i);CHECK(api[i].init(&stream[i],6,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))==Z_OK);state[i]=stream[i].state;}maps();correctness(0);
    if(argc==10){CHECK(!strcmp(argv[9],"--untimed-only"));correctness(1);
#ifdef RESET_CHECK_ONLY
 fprintf(stderr,"CONTROL_PROBE worker=%d sparse_hits=%lu forced_hits=0 expected_by_operation=true\n",worker,*sparse_count);
#endif
for(int i=0;i<2;i++)CHECK(api[i].end(&stream[i])==Z_OK);return 0;}
    char path[5000];CHECK(snprintf(path,sizeof(path),"%s/worker-%d.csv",root,worker)>0);FILE *f=fopen(path,"wx");CHECK(f);fputs("seq,worker,phase,block,work,kind,quartet,position,label,arm,offset,wall_ns,cpu_ns,window_ns,prep_ns,begin_ns,end_ns,output_bytes,last_input,previous_work,output_sum,stream,state,output,voluntary,involuntary,minor,major,throttled_periods,throttled_us\n",f);
    CHECK(snprintf(path,sizeof(path),"%s/empty-timer-%d.csv",root,worker)>0);FILE *empty=fopen(path,"wx");CHECK(empty);fputs("worker,block,operations,wall_ns,cpu_ns\n",empty);
    printf("READY %d\n",worker);fflush(stdout);char cmd[100];int seq;
    while(fgets(cmd,sizeof(cmd),stdin)){if(cmd[0]=='Q')break;
        if(cmd[0]=='E'){CHECK(sscanf(cmd,"E %d",&seq)==1&&seq>=0&&seq<12);uint64_t wall=0,cpu=0;for(int j=0;j<128;j++){uint64_t w0=ns(CLOCK_MONOTONIC),c0=ns(CLOCK_THREAD_CPUTIME_ID),c1=ns(CLOCK_THREAD_CPUTIME_ID),w1=ns(CLOCK_MONOTONIC);wall+=w1-w0;cpu+=c1-c0;}fprintf(empty,"%d,%d,128,%llu,%llu\n",worker,seq,(unsigned long long)wall,(unsigned long long)cpu);fflush(empty);printf("EMPTY %d %d\n",worker,seq);fflush(stdout);continue;}
        CHECK(sscanf(cmd,"M %d",&seq)==1&&seq>=0&&seq<NR&&plan[seq].worker==worker);sample(f,&plan[seq]);printf("DONE %d\n",seq);fflush(stdout);}
    correctness(1);for(int i=0;i<2;i++)CHECK(api[i].end(&stream[i])==Z_OK);fclose(f);fclose(empty);return 0;
}
#endif
