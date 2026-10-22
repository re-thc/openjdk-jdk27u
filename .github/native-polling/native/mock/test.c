
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "jni.h"
#include "KQueue.c"

typedef struct { jsize length; jint data[192]; } Array;
static int thrown, calls, mode, regs[1000][2], scalarRetries, receiptCalls;
static jsize length(JNIEnv *e, jarray a) { (void)e; return ((Array *)a)->length; }
static void get(JNIEnv *e, jintArray a, jsize p, jsize n, jint *v) { (void)e; memcpy(v, ((Array *)a)->data+p, n*sizeof(jint)); }
static void put(JNIEnv *e, jintArray a, jsize p, jsize n, const jint *v) { (void)e; memcpy(((Array *)a)->data+p, v, n*sizeof(jint)); }
static jboolean exception(JNIEnv *e) { (void)e; return thrown != 0; }
void JNU_ThrowIllegalArgumentException(JNIEnv *e, const char *s) { (void)e; (void)s; thrown = 1; }
void JNU_ThrowIOException(JNIEnv *e, const char *s) { (void)e; (void)s; thrown = 2; }
void JNU_ThrowIOExceptionWithLastError(JNIEnv *e, const char *s) { (void)e; (void)s; thrown = 2; }
int kqueue(void) { return 7; }
static int apply(const struct kevent *c) {
    int fd = (int)c->ident;
    assert(fd >= 0 && fd < 1000);
    int *v = &regs[fd][c->filter == EVFILT_READ ? 0 : 1];
    if (c->flags & EV_DELETE) { if (!*v) return ENOENT; *v = 0; }
    else *v = 1;
    return 0;
}
int kevent(int kq, const struct kevent *c, int nc, struct kevent *r, int nr, const struct timespec *t) {
    assert(kq == 7 && nc > 0 && t && t->tv_sec == 0 && t->tv_nsec == 0);
    calls++;
    if (!r) {
        assert(nc == 1 && nr == 0 && !(c[0].flags & EV_RECEIPT));
        assert(mode == 3 && c[0].ident == 101);
        if (scalarRetries++ == 0) { errno = EINTR; return -1; }
        int err = apply(c); if (err) { errno = err; return -1; } return 0;
    }
    receiptCalls++;
    assert(nr >= nc);
    if (mode == 2 && calls == 1) { apply(&c[0]); errno = EINTR; return -1; }
    if (mode == 4) { apply(&c[0]); errno = EFAULT; return -1; }
    if (mode == 6) return 0;
    int n = mode == 1 && calls == 1 && nc > 2 ? 2 : nc;
    for (int i = 0; i < n; i++) {
        assert(c[i].flags & EV_RECEIPT);
        r[i] = c[i]; r[i].flags |= EV_ERROR;
        if (mode == 3 && c[i].ident == 101) r[i].data = EINTR;
        else r[i].data = apply(&c[i]);
        if (mode == 5) r[i].udata = NULL;
    }
    return n;
}
static const struct JNINativeInterface_ funcs = { .GetArrayLength = length, .GetIntArrayRegion = get, .SetIntArrayRegion = put, .ExceptionCheck = exception };
static JNIEnv env = &funcs;
static void reset(int m) { thrown=calls=scalarRetries=receiptCalls=0; mode=m; memset(regs,0,sizeof(regs)); }
static void run(Array *c, int n, Array *e) { Java_sun_nio_ch_KQueue_registerChanges(&env, NULL, 7, (jintArray)c, n, (jintArray)e); }
static Array changes(int n) {
    Array a = {.length = n*3};
    for (int i=0;i<n;i++) { a.data[3*i]=100+i; a.data[3*i+1]=(i&1)?EVFILT_WRITE:EVFILT_READ; a.data[3*i+2]=EV_ADD; }
    return a;
}
int main(void) {
    int cases=0;
    for (int loop=0;loop<100;loop++) for (int n=1;n<=64;n++) {
        Array c=changes(n), e={.length=n}; reset(0); c.data[2]=EV_DELETE;
        run(&c,n,&e); assert(!thrown && calls==1 && e.data[0]==ENOENT);
        for (int i=1;i<n;i++) assert(e.data[i]==0 && regs[100+i][(i&1)?1:0]);
        cases++;
    }
    for (int m=1;m<=6;m++) {
        Array c=changes(6), e={.length=6}; reset(m); run(&c,6,&e);
        if (m==4 || m==5 || m==6) { assert(thrown==2 && calls==1); }
        else {
            assert(!thrown);
            for (int i=0;i<6;i++) assert(e.data[i]==0 && regs[100+i][(i&1)?1:0]);
            if (m==1 || m==2) assert(calls==2);
            if (m==3) assert(calls==3 && scalarRetries==2 && receiptCalls==1);
        }
        cases++;
    }
    {
        Array c=changes(6), e={.length=6}; reset(2);
        c.data[2]=EV_DELETE; regs[100][0]=1;
        run(&c,6,&e); assert(!thrown && calls==2 && e.data[0]==ENOENT && !regs[100][0]);
        for(int i=1;i<6;i++) assert(e.data[i]==0 && regs[100+i][(i&1)?1:0]);
        cases++;
    }
    for (int m=0;m<7;m++) {
        Array c=changes(2), e={.length=2}; reset(0); int n=2;
        if(m==0) c.data[3]=c.data[0],c.data[4]=c.data[1];
        if(m==1) c.data[2]|=EV_ONESHOT;
        if(m==2) c.data[1]=123;
        if(m==3) n=0;
        if(m==4) n=65;
        if(m==5) c.length=2;
        if(m==6) e.length=0;
        run(&c,n,&e); assert(thrown==1 && calls==0); cases++;
    }
    printf("PASS: %d mock cases; actual KQueue.c, receipt errors/continuation, partial prefix, syscall EINTR after application, per-filter EINTR, no retry on global failure, argument checks\n", cases);
}
