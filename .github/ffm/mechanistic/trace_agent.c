#define _GNU_SOURCE
#include <jni.h>
#include <jvmti.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/perf_event.h>
#include <pthread.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

/* Observational diagnostic only. No VM patch, bytecode transform, forced
 * compilation, code pinning, signals, privilege changes or timed-path I/O. */
#define EVENT_CAP 8192
#define CODE_CAP (4 * 1024 * 1024)
#define MAP_CAP 32768
#define PC_CAP 65536
#define CONTROL_CAP 4096
enum { AGENT=1, VM_INIT, VM_DEATH, LOAD, UNLOAD, DYNAMIC, MARK, SAMPLE, FEATURES };
typedef struct {
    uint64_t seq, mono0, mono1, tid, gen, addr, size, method, code_offset, code_size, map_offset, map_size;
    int kind, phase, index, edge, cpu, error, timed;
    int64_t cpu_ns, user_us, system_us, voluntary, involuntary;
    int64_t java0, uptime_ms, java1, wall0, wall1, cpu0, cpu1, checksum;
    uint64_t counts[6];
    char klass[512], name[256], signature[1024];
} Event;
typedef struct { uint64_t address; int64_t bci; } Location;
typedef struct { uint64_t ip, time, seq, stream_seq; uint32_t pid, tid, cpu; } PC;
typedef struct { uint64_t time, id, stream_id, seq, stream_seq; uint32_t type; } PerfControl;
static Event events[EVENT_CAP];
static unsigned char code_bytes[CODE_CAP];
static Location locations[MAP_CAP];
static PC pcs[PC_CAP];
static PerfControl controls[CONTROL_CAP];
static size_t event_count, code_count, location_count, pc_count, control_count;
static uint64_t perf_count;
static uint64_t generation;
static unsigned event_loss, code_loss, map_loss, pc_loss, control_loss, malformed, metadata_errors;
static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
static jvmtiEnv *ti;
static char output_path[4096];
static int closed, configured, begun, want_pc, want_pmu, snapshot;
static int pmu[3] = {-1,-1,-1}, pc_fd = -1;
static void *pc_mapping;
static size_t pc_mapping_size;
static char maps_begin[262144], maps_end[262144];
static size_t maps_begin_size, maps_end_size;
static int maps_error;

static void save_maps(char *buffer, size_t cap, size_t *length) {
    int fd=open("/proc/self/maps",O_RDONLY|O_CLOEXEC);
    if(fd<0){maps_error=errno;return;}
    *length=0;
    while(*length<cap){
        ssize_t n=read(fd,buffer+*length,cap-*length);
        if(n<0){if(errno==EINTR)continue;maps_error=errno;break;}
        if(!n)break;
        *length+=(size_t)n;
    }
    if(*length==cap)maps_error=EOVERFLOW;
    if(close(fd))maps_error=errno;
}

static uint64_t monotonic(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t)) abort();
    return (uint64_t)t.tv_sec * 1000000000ULL + (uint64_t)t.tv_nsec;
}
static int64_t thread_cpu(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_THREAD_CPUTIME_ID, &t)) return -1;
    return (int64_t)t.tv_sec * 1000000000LL + t.tv_nsec;
}
static Event *record(int kind) {
    if (closed) return NULL;
    if (event_count == EVENT_CAP) { event_loss++; return NULL; }
    Event *e = &events[event_count++];
    e->seq = event_count; e->kind = kind; e->mono0 = monotonic();
    e->tid = (uint64_t)syscall(SYS_gettid); e->gen = generation;
    return e;
}
static void text_copy(char *to, size_t cap, const char *from) {
    if (!from) from = "";
    if (strlen(from) >= cap) metadata_errors++;
    snprintf(to, cap, "%s", from);
}
static int selected(const Event *e) {
    return (!strcmp(e->klass,"LSteady;") && !strcmp(e->name,"callsUnbound")) ||
           (!strncmp(e->klass,"Ljava/lang/invoke/LambdaForm$",sizeof("Ljava/lang/invoke/LambdaForm$")-1) &&
            (!strcmp(e->name,"invoke") || !strcmp(e->name,"invokeExact_MT"))) ||
           (!strcmp(e->klass,"Ljdk/internal/foreign/abi/SharedUtils;") && !strcmp(e->name,"checkNative")) ||
           (!strcmp(e->klass,"Ljdk/internal/foreign/AbstractMemorySegmentImpl;") && !strcmp(e->name,"equals"));
}
static void save_code(Event *e, const void *address, size_t size) {
    if (size > CODE_CAP - code_count) { code_loss++; return; }
    e->code_offset = code_count; e->code_size = size;
    memcpy(code_bytes + code_count, address, size); code_count += size;
}
static void JNICALL loaded(jvmtiEnv *env, jmethodID method, jint size, const void *address,
                           jint nmap, const jvmtiAddrLocationMap *map, const void *info) {
    (void)info;
    pthread_mutex_lock(&lock);
    generation++;
    Event *e = record(LOAD);
    if (e) {
        e->addr=(uintptr_t)address; e->size=(uint64_t)size; e->method=(uintptr_t)method;e->phase=snapshot;
        char *name=NULL,*sig=NULL,*klass_name=NULL; jclass klass;
        jvmtiError err=(*env)->GetMethodName(env,method,&name,&sig,NULL);
        if (!err) err=(*env)->GetMethodDeclaringClass(env,method,&klass);
        if (!err) err=(*env)->GetClassSignature(env,klass,&klass_name,NULL);
        if (err) { e->error=err; metadata_errors++; }
        text_copy(e->klass,sizeof(e->klass),klass_name); text_copy(e->name,sizeof(e->name),name);
        text_copy(e->signature,sizeof(e->signature),sig);
        if (selected(e)) {
            if (size > 0) save_code(e,address,(size_t)size);
            if (nmap > 0 && map) {
                if ((size_t)nmap <= MAP_CAP-location_count) {
                    e->map_offset=location_count; e->map_size=(uint64_t)nmap;
                    for (int i=0;i<nmap;i++) locations[location_count++]=(Location){(uintptr_t)map[i].start_address,map[i].location};
                } else map_loss++;
            }
        }
        if(name)(*env)->Deallocate(env,(unsigned char*)name);
        if(sig)(*env)->Deallocate(env,(unsigned char*)sig);
        if(klass_name)(*env)->Deallocate(env,(unsigned char*)klass_name);
        e->mono1=monotonic();
    }
    pthread_mutex_unlock(&lock);
}
static void JNICALL unloaded(jvmtiEnv *env,jmethodID method,const void *address) {
    (void)env;
    pthread_mutex_lock(&lock); generation++;
    Event *e=record(UNLOAD);
    if(e){e->method=(uintptr_t)method;e->addr=(uintptr_t)address;e->mono1=monotonic();}
    pthread_mutex_unlock(&lock);
}
static void JNICALL dynamic(jvmtiEnv *env,const char *name,const void *address,jint size) {
    (void)env;
    pthread_mutex_lock(&lock);
    Event *e=record(DYNAMIC);
    if(e){e->addr=(uintptr_t)address;e->size=(uint64_t)size;e->phase=snapshot;text_copy(e->name,sizeof(e->name),name);
        if(!strcmp(name,"nep_invoker_blob")&&size>0)save_code(e,address,(size_t)size);
        e->mono1=monotonic();}
    pthread_mutex_unlock(&lock);
}
static void JNICALL vm_init(jvmtiEnv *env,JNIEnv *jni,jthread thread) {
    (void)env;(void)jni;(void)thread;
    pthread_mutex_lock(&lock);Event *e=record(VM_INIT);if(e)e->mono1=monotonic();pthread_mutex_unlock(&lock);
}
static int perf_open(struct perf_event_attr *attr,int group) {
    return (int)syscall(SYS_perf_event_open,attr,0,-1,group,PERF_FLAG_FD_CLOEXEC);
}
static struct perf_event_attr attr_for(uint32_t type,uint64_t config) {
    struct perf_event_attr a;memset(&a,0,sizeof(a));a.size=sizeof(a);a.type=type;a.config=config;
    a.disabled=1;a.exclude_kernel=1;a.exclude_hv=1;return a;
}
static int open_pmu(void) {
    uint64_t configs[]={PERF_COUNT_HW_CPU_CYCLES,PERF_COUNT_HW_INSTRUCTIONS,PERF_COUNT_HW_REF_CPU_CYCLES};
    for(int i=0;i<3;i++){
        struct perf_event_attr a=attr_for(PERF_TYPE_HARDWARE,configs[i]);
        a.pinned=i==0;a.read_format=PERF_FORMAT_GROUP|PERF_FORMAT_TOTAL_TIME_ENABLED|PERF_FORMAT_TOTAL_TIME_RUNNING;
        pmu[i]=perf_open(&a,i?pmu[0]:-1);if(pmu[i]<0)return errno;
    }return 0;
}
static int open_pc(void) {
    struct perf_event_attr a=attr_for(PERF_TYPE_SOFTWARE,PERF_COUNT_SW_CPU_CLOCK);
    a.sample_period=1000000;a.sample_type=PERF_SAMPLE_IP|PERF_SAMPLE_TID|PERF_SAMPLE_TIME|PERF_SAMPLE_CPU;
    a.use_clockid=1;a.clockid=CLOCK_MONOTONIC;a.wakeup_events=1;
    pc_fd=perf_open(&a,-1);if(pc_fd<0)return errno;
    pc_mapping_size=(size_t)sysconf(_SC_PAGESIZE)*9;
    pc_mapping=mmap(NULL,pc_mapping_size,PROT_READ|PROT_WRITE,MAP_SHARED,pc_fd,0);
    if(pc_mapping==MAP_FAILED){pc_mapping=NULL;return errno;}return 0;
}
static void drain_pc(void) {
    if(!pc_mapping)return;
    struct perf_event_mmap_page *m=pc_mapping;
    uint64_t head=__atomic_load_n(&m->data_head,__ATOMIC_ACQUIRE),tail=m->data_tail;
    uint64_t size=m->data_size,offset=m->data_offset;
    if(!size||offset+size>pc_mapping_size||head<tail||head-tail>size){
        malformed++;__atomic_store_n(&m->data_tail,head,__ATOMIC_RELEASE);return;
    }
    unsigned char *data=(unsigned char*)m+offset;
    while(tail<head){
        struct perf_event_header h;unsigned char *b=(unsigned char*)&h;
        for(size_t i=0;i<sizeof(h);i++)b[i]=data[(tail+i)%size];
        if(h.size<sizeof(h)||tail+h.size>head){malformed++;break;}
        if(h.type==PERF_RECORD_SAMPLE){
            uint64_t v[4]={0,0,0,0};b=(unsigned char*)v;
            if(h.size<sizeof(h)+sizeof(v)){malformed++;break;}
            for(size_t i=0;i<sizeof(v);i++)b[i]=data[(tail+sizeof(h)+i)%size];
            perf_count++;
            if(pc_count<PC_CAP){
                size_t index=pc_count++;
                pcs[index]=(PC){v[0],v[2],index+1,perf_count,(uint32_t)v[1],(uint32_t)(v[1]>>32),(uint32_t)v[3]};
            }
            else pc_loss++;
        }else if(h.type==PERF_RECORD_THROTTLE||h.type==PERF_RECORD_UNTHROTTLE){
            /* sample_id_all is disabled: time, id and stream_id are the entire
             * payload. Keep kernel order alongside SAMPLE records. */
            uint64_t v[3];b=(unsigned char*)v;
            if(h.size!=sizeof(h)+sizeof(v)){malformed++;break;}
            for(size_t i=0;i<sizeof(v);i++)b[i]=data[(tail+sizeof(h)+i)%size];
            perf_count++;
            if(control_count<CONTROL_CAP){
                size_t index=control_count++;
                controls[index]=(PerfControl){v[0],v[1],v[2],index+1,perf_count,h.type};
            }else control_loss++;
        }else if(h.type==PERF_RECORD_LOST)pc_loss++;
        tail+=h.size;
    }
    __atomic_store_n(&m->data_tail,tail<head?head:tail,__ATOMIC_RELEASE);
}
static void passive(Event *e) {
    struct rusage r;e->cpu_ns=thread_cpu();e->cpu=sched_getcpu();
    if(e->cpu_ns<0||e->cpu<0){e->error=errno?errno:EIO;return;}
    if(getrusage(RUSAGE_THREAD,&r)){e->error=errno;return;}
    e->user_us=(int64_t)r.ru_utime.tv_sec*1000000+r.ru_utime.tv_usec;
    e->system_us=(int64_t)r.ru_stime.tv_sec*1000000+r.ru_stime.tv_usec;
    e->voluntary=r.ru_nvcsw;e->involuntary=r.ru_nivcsw;
    if(begun&&want_pmu){
        ssize_t n=read(pmu[0],e->counts,sizeof(e->counts));
        if(n!=(ssize_t)sizeof(e->counts))e->error=n<0?errno:EIO;
    }
}
static void fail(JNIEnv *env,const char *message) {
    jclass c=(*env)->FindClass(env,"java/lang/AssertionError");if(c)(*env)->ThrowNew(env,c,message);
}
JNIEXPORT void JNICALL Java_Trace_mark0(JNIEnv *env,jclass cls,jint phase,jint index,jint edge,jlong j0,jlong uptime,jlong j1) {
    (void)cls;
    pthread_mutex_lock(&lock);drain_pc();Event *e=record(MARK);
    if(e){e->phase=phase;e->index=index;e->edge=edge;e->java0=j0;e->uptime_ms=uptime;e->java1=j1;passive(e);e->mono1=monotonic();}
    int bad=!e||(e&&e->error);pthread_mutex_unlock(&lock);
    if(bad)fail(env,"Trace boundary failed; preserve evidence, no retry");
}
JNIEXPORT void JNICALL Java_Trace_sample(JNIEnv *env,jclass cls,jint index,jboolean timed,jlong w0,jlong w1,jlong c0,jlong c1,jlong sum) {
    (void)cls;pthread_mutex_lock(&lock);Event *e=record(SAMPLE);
    if(e){e->index=index;e->timed=timed;e->wall0=w0;e->wall1=w1;e->cpu0=c0;e->cpu1=c1;e->checksum=sum;e->mono1=monotonic();}
    pthread_mutex_unlock(&lock);if(!e)fail(env,"Trace sample buffer exhausted");
}
JNIEXPORT void JNICALL Java_Trace_begin(JNIEnv *env,jclass cls) {
    (void)cls;
    save_maps(maps_begin,sizeof(maps_begin),&maps_begin_size);
    int error=configured?EINVAL:maps_error;
    if(!error){configured=1;if(want_pmu)error=open_pmu();if(!error&&want_pc)error=open_pc();}
    pthread_mutex_lock(&lock);Event *e=record(FEATURES);if(e){e->error=error;e->phase=want_pc;e->edge=want_pmu;e->mono1=monotonic();}pthread_mutex_unlock(&lock);
    if(error){fail(env,"Chosen capability mode unavailable in JVM; no fallback/retry");return;}
    pthread_mutex_lock(&lock);snapshot=1;pthread_mutex_unlock(&lock);
    jvmtiError jerr=(*ti)->GenerateEvents(ti,JVMTI_EVENT_DYNAMIC_CODE_GENERATED);
    pthread_mutex_lock(&lock);snapshot=0;pthread_mutex_unlock(&lock);
    if(jerr){fail(env,"Runtime code mapping capture failed");return;}
    if(want_pmu&&(ioctl(pmu[0],PERF_EVENT_IOC_RESET,PERF_IOC_FLAG_GROUP)||ioctl(pmu[0],PERF_EVENT_IOC_ENABLE,PERF_IOC_FLAG_GROUP)))error=errno;
    if(!error&&want_pc&&ioctl(pc_fd,PERF_EVENT_IOC_ENABLE,0))error=errno;
    if(error){fail(env,"Chosen capability enable failed");return;}begun=1;
}
JNIEXPORT void JNICALL Java_Trace_capture(JNIEnv *env,jclass cls) {
    (void)cls;
    int error=0;
    if(want_pc&&pc_fd>=0&&ioctl(pc_fd,PERF_EVENT_IOC_DISABLE,0))error=errno;
    if(want_pmu&&pmu[0]>=0&&ioctl(pmu[0],PERF_EVENT_IOC_DISABLE,PERF_IOC_FLAG_GROUP))error=errno;
    pthread_mutex_lock(&lock);drain_pc();begun=0;pthread_mutex_unlock(&lock);
    if(error){fail(env,"Chosen capability disable failed; preserve evidence");return;}
    pthread_mutex_lock(&lock);snapshot=1;pthread_mutex_unlock(&lock);
    if((*ti)->GenerateEvents(ti,JVMTI_EVENT_DYNAMIC_CODE_GENERATED))fail(env,"Post runtime mapping capture failed");
    if((*ti)->GenerateEvents(ti,JVMTI_EVENT_COMPILED_METHOD_LOAD))fail(env,"Post code snapshot failed");
    pthread_mutex_lock(&lock);snapshot=0;pthread_mutex_unlock(&lock);
    save_maps(maps_end,sizeof(maps_end),&maps_end_size);
    if(maps_error)fail(env,"Process map snapshot failed");
}
static void quoted(FILE *f,const char *s) {
    fputc('"',f);for(const unsigned char *p=(const unsigned char*)s;*p;p++){
        if(*p=='"'||*p=='\\')fprintf(f,"\\%c",*p);
        else if(*p<32||*p>=127)fprintf(f,"\\u%04x",*p);
        else fputc(*p,f);
    }fputc('"',f);
}
static int write_output(void) {
    char path[4200];snprintf(path,sizeof(path),"%s.code.bin",output_path);
    FILE *code=fopen(path,"wb");if(!code)return errno;
    int err=fwrite(code_bytes,1,code_count,code)!=code_count?EIO:0;if(fclose(code)&&!err)err=errno;
    for(int i=0;i<2;i++){
        snprintf(path,sizeof(path),"%s.maps.%s",output_path,i?"end":"begin");
        FILE *maps=fopen(path,"w");
        if(!maps){err=errno;continue;}
        size_t length=i?maps_end_size:maps_begin_size;
        if(fwrite(i?maps_end:maps_begin,1,length,maps)!=length)err=EIO;
        if(fclose(maps))err=errno;
    }
    if(maps_error)err=maps_error;
    FILE *f=fopen(output_path,"w");if(!f)return errno;
    fprintf(f,"{\"record\":\"header\",\"version\":2,\"throttle_records_preserved\":true,\"pc_selected\":%s,\"pmu_selected\":%s,\"event_loss\":%u,\"code_loss\":%u,\"map_loss\":%u,\"pc_loss\":%u,\"control_loss\":%u,\"malformed\":%u,\"metadata_errors\":%u}\n",want_pc?"true":"false",want_pmu?"true":"false",event_loss,code_loss,map_loss,pc_loss,control_loss,malformed,metadata_errors);
    for(size_t i=0;i<event_count;i++){
        Event *e=&events[i];
        fprintf(f,"{\"record\":\"event\",\"kind\":%d,\"seq\":%llu,\"mono0\":%llu,\"mono1\":%llu,\"tid\":%llu,\"gen\":%llu,\"phase\":%d,\"index\":%d,\"edge\":%d,\"cpu\":%d,\"cpu_ns\":%lld,\"user_us\":%lld,\"system_us\":%lld,\"nvcsw\":%lld,\"nivcsw\":%lld,\"error\":%d,\"java0\":%lld,\"uptime_ms\":%lld,\"java1\":%lld,\"timed\":%s,\"wall0\":%lld,\"wall1\":%lld,\"cpu0\":%lld,\"cpu1\":%lld,\"checksum\":%lld,\"addr\":\"0x%llx\",\"size\":%llu,\"method\":\"0x%llx\",\"code_offset\":%llu,\"code_size\":%llu,\"counts\":[%llu,%llu,%llu,%llu,%llu,%llu],\"class\":",
            e->kind,(unsigned long long)e->seq,(unsigned long long)e->mono0,(unsigned long long)e->mono1,(unsigned long long)e->tid,(unsigned long long)e->gen,e->phase,e->index,e->edge,e->cpu,(long long)e->cpu_ns,(long long)e->user_us,(long long)e->system_us,(long long)e->voluntary,(long long)e->involuntary,e->error,(long long)e->java0,(long long)e->uptime_ms,(long long)e->java1,e->timed?"true":"false",(long long)e->wall0,(long long)e->wall1,(long long)e->cpu0,(long long)e->cpu1,(long long)e->checksum,(unsigned long long)e->addr,(unsigned long long)e->size,(unsigned long long)e->method,(unsigned long long)e->code_offset,(unsigned long long)e->code_size,(unsigned long long)e->counts[0],(unsigned long long)e->counts[1],(unsigned long long)e->counts[2],(unsigned long long)e->counts[3],(unsigned long long)e->counts[4],(unsigned long long)e->counts[5]);
        quoted(f,e->klass);fputs(",\"name\":",f);quoted(f,e->name);fputs(",\"signature\":",f);quoted(f,e->signature);
        fputs(",\"locations\":[",f);for(uint64_t j=0;j<e->map_size;j++){Location *m=&locations[e->map_offset+j];fprintf(f,"%s[\"0x%llx\",%lld]",j?",":"",(unsigned long long)m->address,(long long)m->bci);}fputs("]}\n",f);
    }
    for(size_t i=0;i<pc_count;i++){PC *p=&pcs[i];fprintf(f,"{\"record\":\"pc\",\"seq\":%llu,\"stream_seq\":%llu,\"ip\":\"0x%llx\",\"time\":%llu,\"pid\":%u,\"tid\":%u,\"cpu\":%u}\n",(unsigned long long)p->seq,(unsigned long long)p->stream_seq,(unsigned long long)p->ip,(unsigned long long)p->time,p->pid,p->tid,p->cpu);}
    for(size_t i=0;i<control_count;i++){PerfControl *p=&controls[i];fprintf(f,"{\"record\":\"perf_control\",\"seq\":%llu,\"stream_seq\":%llu,\"type\":%u,\"time\":%llu,\"id\":\"0x%llx\",\"stream_id\":\"0x%llx\"}\n",(unsigned long long)p->seq,(unsigned long long)p->stream_seq,p->type,(unsigned long long)p->time,(unsigned long long)p->id,(unsigned long long)p->stream_id);}
    fprintf(f,"{\"record\":\"end\",\"events\":%zu,\"pcs\":%zu,\"controls\":%zu,\"perf_records\":%llu,\"code_bytes\":%zu,\"write_errno\":%d}\n",event_count,pc_count,control_count,(unsigned long long)perf_count,code_count,err);
    if(fclose(f)&&!err)err=errno;
    return err;
}
static void JNICALL vm_death(jvmtiEnv *env,JNIEnv *jni) {
    (void)env;(void)jni;
    pthread_mutex_lock(&lock);drain_pc();Event *e=record(VM_DEATH);if(e)e->mono1=monotonic();closed=1;
    int err=write_output();pthread_mutex_unlock(&lock);
    if(err)fprintf(stderr,"trace_agent write failed errno=%d\n",err);
}
JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM *vm,char *options,void *reserved) {
    (void)reserved;
    if(!options||strlen(options)>=sizeof(output_path))return JNI_ERR;
    char settings[4096];snprintf(settings,sizeof(settings),"%s",options);
    for(char *s=strtok(settings,",");s;s=strtok(NULL,",")){
        if(!strncmp(s,"out=",4))snprintf(output_path,sizeof(output_path),"%s",s+4);
        else if(!strcmp(s,"pc=1"))want_pc=1;else if(!strcmp(s,"pmu=1"))want_pmu=1;
        else if(strcmp(s,"pc=0")&&strcmp(s,"pmu=0"))return JNI_ERR;
    }
    if(!output_path[0]||(*vm)->GetEnv(vm,(void**)&ti,JVMTI_VERSION_1_2)!=JNI_OK)return JNI_ERR;
    jvmtiCapabilities caps;memset(&caps,0,sizeof(caps));caps.can_generate_compiled_method_load_events=1;
    if((*ti)->AddCapabilities(ti,&caps))return JNI_ERR;
    jvmtiEventCallbacks callbacks;memset(&callbacks,0,sizeof(callbacks));
    callbacks.CompiledMethodLoad=loaded;callbacks.CompiledMethodUnload=unloaded;callbacks.DynamicCodeGenerated=dynamic;callbacks.VMInit=vm_init;callbacks.VMDeath=vm_death;
    if((*ti)->SetEventCallbacks(ti,&callbacks,sizeof(callbacks)))return JNI_ERR;
    jvmtiEvent ids[]={JVMTI_EVENT_COMPILED_METHOD_LOAD,JVMTI_EVENT_COMPILED_METHOD_UNLOAD,JVMTI_EVENT_DYNAMIC_CODE_GENERATED,JVMTI_EVENT_VM_INIT,JVMTI_EVENT_VM_DEATH};
    for(size_t i=0;i<sizeof(ids)/sizeof(ids[0]);i++)if((*ti)->SetEventNotificationMode(ti,JVMTI_ENABLE,ids[i],NULL))return JNI_ERR;
    pthread_mutex_lock(&lock);Event *e=record(AGENT);if(e)e->mono1=monotonic();pthread_mutex_unlock(&lock);
    return JNI_OK;
}
