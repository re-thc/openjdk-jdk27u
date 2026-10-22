/* Isolated Darwin process: real kernel receipts with a signal sent to its owner. */
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>
#include <stdatomic.h>
#include <stdio.h>
#include <string.h>
#include <sys/event.h>
#include <time.h>
#include <unistd.h>
#include "jni.h"

static unsigned long calls, syscall_eintr, receipt_eintr, delete_enoent;
static int observed_kevent(int, const struct kevent *, int, struct kevent *, int,
                           const struct timespec *);
#define kevent(...) observed_kevent(__VA_ARGS__)
#include "KQueue.c"
#undef kevent

#define CHANGES 64
#define PIPES 32
static volatile sig_atomic_t received_signals;
static _Atomic int stop_sender;
static pthread_t owner;
static int thrown;
typedef struct { jsize length; jint data[CHANGES * 3]; } Array;
static jsize length(JNIEnv *e, jarray a) { (void)e; return ((Array *)a)->length; }
static void get(JNIEnv *e, jintArray a, jsize p, jsize n, jint *v) { (void)e; memcpy(v, ((Array *)a)->data+p, n*sizeof(jint)); }
static void put(JNIEnv *e, jintArray a, jsize p, jsize n, const jint *v) { (void)e; memcpy(((Array *)a)->data+p, v, n*sizeof(jint)); }
static jboolean exception(JNIEnv *e) { (void)e; return thrown != 0; }
void JNU_ThrowIllegalArgumentException(JNIEnv *e, const char *s) { (void)e; fprintf(stderr,"argument: %s\n",s); thrown = 1; }
void JNU_ThrowIOException(JNIEnv *e, const char *s) { (void)e; fprintf(stderr,"io: %s\n",s); thrown = 2; }
void JNU_ThrowIOExceptionWithLastError(JNIEnv *e, const char *s) { (void)e; fprintf(stderr,"io: %s: %s\n",s,strerror(errno)); thrown = 2; }
static const struct JNINativeInterface_ funcs = { .GetArrayLength = length,
    .GetIntArrayRegion = get, .SetIntArrayRegion = put, .ExceptionCheck = exception };
static JNIEnv env = &funcs;
static int observed_kevent(int k, const struct kevent *c, int nc, struct kevent *r,
                          int nr, const struct timespec *t) {
    calls++;
    int n = kevent(k,c,nc,r,nr,t);
    if (n < 0 && errno == EINTR) syscall_eintr++;
    if (n > 0 && nc > 0) for (int i=0;i<n;i++)
        if ((r[i].flags & EV_ERROR) && r[i].data == EINTR) receipt_eintr++;
    return n;
}
static void signal_handler(int sig) { (void)sig; received_signals++; }
static void *sender(void *unused) {
    (void)unused;
    const struct timespec pause = {0,100000};
    while (!atomic_load(&stop_sender)) {
        assert(pthread_kill(owner,SIGUSR1)==0);
        nanosleep(&pause,NULL);
    }
    return NULL;
}
static void apply(int k, Array *a, int count, int allow_error) {
    Array errors={.length=count};
    Java_sun_nio_ch_KQueue_registerChanges(&env,NULL,k,(jintArray)a,count,(jintArray)&errors);
    assert(!thrown);
    for(int i=0;i<count;i++) {
        if (i==0 && allow_error) assert(errors.data[i]!=0);
        else if (a->data[i*3+2] == EV_DELETE && errors.data[i] == ENOENT) delete_enoent++;
        else assert(errors.data[i]==0);
    }
}
static void fill(Array *a,int pipes[PIPES][2],int flags) {
    a->length=CHANGES*3;
    for(int i=0;i<PIPES;i++) {
        int j=i*6;
        a->data[j]=pipes[i][0];a->data[j+1]=EVFILT_READ;a->data[j+2]=flags;
        a->data[j+3]=pipes[i][1];a->data[j+4]=EVFILT_WRITE;a->data[j+5]=flags;
    }
}
static int poll_ready(int k,struct kevent *events) {
    const struct timespec zero={0,0}; int n;
    do { n=kevent(k,NULL,0,events,CHANGES,&zero); } while(n<0 && errno==EINTR);
    assert(n>=0); return n;
}
int main(void) {
    int k=kqueue(), pipes[PIPES][2], absent[2];
    assert(k>=0 && pipe(absent)==0);
    for(int i=0;i<PIPES;i++) assert(pipe(pipes[i])==0);
    struct sigaction action; memset(&action,0,sizeof(action));
    action.sa_handler=signal_handler;sigemptyset(&action.sa_mask);
    assert(sigaction(SIGUSR1,&action,NULL)==0);
    owner=pthread_self();pthread_t thread;assert(pthread_create(&thread,NULL,sender,NULL)==0);
    Array a={0};struct kevent events[CHANGES];
    for(int cycle=0;cycle<2000;cycle++) {
        fill(&a,pipes,EV_ADD);apply(k,&a,CHANGES,0);
        for(int i=0;i<PIPES;i++) { char b=42; ssize_t n; do { n=write(pipes[i][1],&b,1); } while(n<0 && errno==EINTR); assert(n==1); }
        unsigned long long seen=0;
        for(int attempt=0;attempt<4 && seen!=~0ULL;attempt++) {
            int n=poll_ready(k,events);
            for(int j=0;j<n;j++) {
                assert(!(events[j].flags&EV_ERROR));
                for(int i=0;i<PIPES;i++) {
                    if(events[j].ident==(uintptr_t)pipes[i][0] && events[j].filter==EVFILT_READ) seen|=1ULL<<(i*2);
                    if(events[j].ident==(uintptr_t)pipes[i][1] && events[j].filter==EVFILT_WRITE) seen|=1ULL<<(i*2+1);
                }
            }
        }
        assert(seen==~0ULL);
        for(int i=0;i<PIPES;i++) { char b=0; ssize_t n; do { n=read(pipes[i][0],&b,1); } while(n<0 && errno==EINTR); assert(n==1 && b==42); }
        fill(&a,pipes,EV_DELETE);apply(k,&a,CHANGES,0);assert(poll_ready(k,events)==0);
    }
    atomic_store(&stop_sender,1);assert(pthread_join(thread,NULL)==0);assert(received_signals>0);
    a=(Array){.length=9,.data={absent[0],EVFILT_READ,EV_DELETE,pipes[0][0],EVFILT_READ,EV_ADD,pipes[0][1],EVFILT_WRITE,EV_ADD}};
    apply(k,&a,3,1);
    // Close while registered, then reuse descriptors and verify fresh receipts.
    for(int i=0;i<PIPES;i++) { assert(close(pipes[i][0])==0);assert(close(pipes[i][1])==0); }
    for(int i=0;i<PIPES;i++) assert(pipe(pipes[i])==0);
    fill(&a,pipes,EV_ADD);apply(k,&a,CHANGES,0);
    int n=poll_ready(k,events);assert(n==PIPES);
    for(int i=0;i<n;i++) assert(events[i].filter==EVFILT_WRITE && !(events[i].flags&EV_EOF));
    fill(&a,pipes,EV_DELETE);apply(k,&a,CHANGES,0);
    for(int i=0;i<PIPES;i++) { assert(close(pipes[i][0])==0);assert(close(pipes[i][1])==0); }
    assert(close(absent[0])==0 && close(absent[1])==0 && close(k)==0);
    printf("{\"cycles\":2000,\"signals\":%d,\"kevent_calls\":%lu,\"syscall_eintr\":%lu,\"receipt_eintr\":%lu,\"delete_enoent\":%lu,\"verified\":true}\n",
           received_signals,calls,syscall_eintr,receipt_eintr,delete_enoent);
    return 0;
}
