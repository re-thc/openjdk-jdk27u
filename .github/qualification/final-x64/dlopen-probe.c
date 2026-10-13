#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <time.h>
#include <sys/resource.h>
static double now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC,&t);
    return t.tv_sec*1e3+t.tv_nsec/1e6;
}
int main(int argc,char **argv) {
    if(argc!=2)return 1;
    struct rusage before,after; getrusage(RUSAGE_SELF,&before);
    double start=now();
    void *handle=dlopen(argv[1],RTLD_NOW|RTLD_GLOBAL);
    double elapsed=now()-start;
    if(!handle){fprintf(stderr,"%s\n",dlerror());return 2;}
    getrusage(RUSAGE_SELF,&after);
    printf("%.6f minor=%ld major=%ld\n",elapsed,after.ru_minflt-before.ru_minflt,after.ru_majflt-before.ru_majflt);
    return 0;
}
