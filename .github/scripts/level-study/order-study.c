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
#define NC 40
#define NB 32
#define CHECK(x) do { if (!(x)) { fprintf(stderr,"CHECK line=%d: %s\n",__LINE__,#x); abort(); } } while (0)
typedef struct { const char *name; void *handle,*base; int load_rank; int (*init)(z_streamp,int,int,int,int,int,const char*,int); int (*def)(z_streamp,int); int (*reset)(z_streamp); int (*end)(z_streamp); } api;
typedef struct { int n,banks; char name[80]; unsigned char *data[NB]; } input;
typedef struct { api *owner; int config,wb,live,last_bank; z_stream z; unsigned char out[10000]; size_t len; uint64_t ordinal; } owned;
static api apis[4]; static input cases[NC]; static size_t expected[NC][NB][2][4]; static int ncase,layout; static uint64_t serial;
static const int levels[4]={6,6,1,2}; static const char *names[4]={"stock-A","stock-B","ng-A","ng-B"};
static uint64_t now(clockid_t clock) { struct timespec t; CHECK(!clock_gettime(clock,&t)); return (uint64_t)t.tv_sec*1000000000+t.tv_nsec; }
static void throttle(uint64_t *periods,uint64_t *us) { *periods=*us=0; FILE *f=fopen("/sys/fs/cgroup/cpu.stat","r"); if (!f) return; char k[80]; unsigned long long v; while(fscanf(f,"%79s %llu",k,&v)==2) { if(!strcmp(k,"nr_throttled"))*periods=v; if(!strcmp(k,"throttled_usec"))*us=v; } fclose(f); }
static void *symbol(void *handle,const char *prefix,const char *name) { char key[128]; snprintf(key,sizeof(key),"%s%s",prefix,name); void *p=dlsym(handle,key); CHECK(p); return p; }
static int image(int config,int copy) { return (config?2:0)+copy; }
static void init(owned *s) { CHECK(!s->live); memset(&s->z,0,sizeof(s->z)); CHECK(s->owner->init(&s->z,levels[s->config],Z_DEFLATED,s->wb,8,Z_DEFAULT_STRATEGY,ZLIB_VERSION,sizeof(s->z))==Z_OK); s->live=1; s->ordinal=serial++; }
static void end(owned *s) { CHECK(s->live); CHECK(s->owner->end(&s->z)==Z_OK); s->live=0; }
static void finish(owned *s,input *in,int bank) { s->z.next_in=in->data[bank]; s->z.avail_in=in->n; s->z.next_out=s->out; s->z.avail_out=sizeof(s->out); CHECK(s->owner->def(&s->z,Z_FINISH)==Z_STREAM_END); CHECK(s->z.avail_in==0); s->len=s->z.total_out; s->last_bank=bank; }
static void verify(owned *s,input *in) { z_stream z={0}; unsigned char bytes[5000]; CHECK(inflateInit2(&z,s->wb)==Z_OK); z.next_in=s->out; z.avail_in=s->len; z.next_out=bytes; z.avail_out=sizeof(bytes); CHECK(inflate(&z,Z_FINISH)==Z_STREAM_END); CHECK(z.total_out==(unsigned)in->n && !memcmp(bytes,in->data[s->last_bank],in->n)); CHECK(inflateEnd(&z)==Z_OK); }
static void untimed(int first,int limit,const char *root) {
    char filename[5000]; FILE *csv=NULL;
    if(layout==0) { snprintf(filename,sizeof(filename),"%s/sizes-%s.csv",root,first?"tiny":"calibration"); csv=fopen(filename,"w"); CHECK(csv); fputs("case,bank,raw,config,bytes,path\n",csv); }
    unsigned long checks=0;
    for(int ci=first;ci<limit;ci++) for(int bank=0;bank<cases[ci].banks;bank++) for(int raw=0;raw<2;raw++) for(int config=0;config<4;config++) {
        owned s[2]; memset(s,0,sizeof(s));
        for(int copy=0;copy<2;copy++) { s[copy].owner=&apis[image(config,copy)]; s[copy].config=config; s[copy].wb=raw?-15:15; init(&s[copy]); finish(&s[copy],&cases[ci],bank); verify(&s[copy],&cases[ci]); end(&s[copy]); checks++; }
        CHECK(s[0].len==s[1].len && !memcmp(s[0].out,s[1].out,s[0].len)); expected[ci][bank][raw][config]=s[0].len;
        if(csv) { snprintf(filename,sizeof(filename),"%s/compressed/%d-%d-%d-%d.bin",root,ci,bank,raw,config); FILE *f=fopen(filename,"wb"); CHECK(f && fwrite(s[0].out,1,s[0].len,f)==s[0].len); fclose(f); fprintf(csv,"%d,%d,%d,%d,%zu,%s\n",ci,bank,raw,config,s[0].len,filename); }
    }
    if(csv) { fclose(csv); }
    fprintf(stderr,"UNTIMED layout=%d first=%d limit=%d inflate_checks=%lu exact_image_pairs=%lu\n",layout,first,limit,checks,checks/2);
}
static void operation(owned *s,input *in,int mode,int bank,uintptr_t *state,uint64_t *ordinal) {
    if(mode==2)init(s); else { CHECK(s->live); CHECK(s->owner->reset(&s->z)==Z_OK); }
    *state=(uintptr_t)s->z.state; *ordinal=s->ordinal;
    if(mode)finish(s,in,bank); else {s->len=0;s->last_bank=bank;}
    if(mode==2)end(s);
}
static void sample(int phase,int id,int ci,int raw,int mode,int ca,int cb,int control,int copy,int blocks,int pairs,int iterations) {
    input *in=&cases[ci]; int load=(layout>>2)&1,swap=(layout>>1)&1,first=layout&1;
    int acopy=copy,bcopy=copy;
    if(control>=0) {acopy=bcopy=load^swap; if(control==2) {acopy=0;bcopy=1;} }
    owned storage[2]; memset(storage,0,sizeof(storage)); int sa=swap,sb=1-swap,shared=control==0;
    storage[sa].owner=&apis[image(ca,acopy)];storage[sa].config=ca;storage[sa].wb=raw?-15:15;
    storage[sb].owner=&apis[image(cb,bcopy)];storage[sb].config=cb;storage[sb].wb=raw?-15:15;
    for(int block=0;block<blocks;block++) {
        int slots[2]={first,1-first}; if(shared)slots[0]=sa;
        int ns=shared?1:2;
        for(int j=0;j<ns;j++) { int slot=slots[j]; init(&storage[slot]); fprintf(stderr,"INIT layout=%d phase=%d cell=%d block=%d slot=%d rank=%d image=%s state=%p ordinal=%llu\n",layout,phase,id,block,slot,j,storage[slot].owner->name,(void*)storage[slot].z.state,(unsigned long long)storage[slot].ordinal); }
        if(mode==2)for(int j=ns-1;j>=0;j--)end(&storage[slots[j]]);
        owned *arms[2]={&storage[sa],shared?&storage[sa]:&storage[sb]};
        if(control==1 && block%2) {owned *tmp=arms[0];arms[0]=arms[1];arms[1]=tmp;}
        /* Priming order is fixed by initial slot order. In create/end it is
           allocator history, not the creation rank of every timed stream. */
        for(int j=0;j<2;j++) {
            int arm=shared?j:((arms[0]-storage)==first?j:1-j); owned *s=arms[arm]; uintptr_t state=0;uint64_t ordinal=0;
            for(int k=0;k<32;k++)operation(s,in,mode==2?2:1,k%in->banks,&state,&ordinal);
            fprintf(stderr,"OWNED layout=%d phase=%d cell=%d block=%d arm=%d slot=%ld image=%s config=%d stream=%p output=%p input0=%p last_warm_state=%llu ordinal=%llu\n",layout,phase,id,block,arm,(long)(s-storage),s->owner->name,s->config,(void*)&s->z,(void*)s->out,(void*)in->data[0],(unsigned long long)state,(unsigned long long)ordinal);
        }
        for(int pair=0;pair<pairs;pair++) for(int order=0;order<2;order++) {
            int arm=(block+pair)%2?1-order:order;owned *s=arms[arm]; uintptr_t fs=0,ls=0;uint64_t fi=0,li=0,sum=0,want=0;
            for(int k=0;k<iterations;k++)if(mode)want+=expected[ci][((block*pairs+pair)*iterations+k)%in->banks][raw][s->config];
            struct rusage a,b;uint64_t pa,ua,pb,ub;throttle(&pa,&ua);getrusage(RUSAGE_THREAD,&a);
            uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);
            for(int k=0;k<iterations;k++) {int bank=((block*pairs+pair)*iterations+k)%in->banks;operation(s,in,mode,bank,&ls,&li);sum+=s->len;if(k==0){fs=ls;fi=li;} }
            uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);getrusage(RUSAGE_THREAD,&b);throttle(&pb,&ub);CHECK(sum==want);
            fprintf(stdout,"%d,%d,%d,%d,%d,%d,%d,%ld,%d,%d,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%llu,%zu,%d,%llu,%llu,%llu,%llu\n",layout,phase,id,block,pair,order,arm,(long)(s-storage),(int)(s->owner-apis),s->config,iterations,(unsigned long long)(w1-w0),(unsigned long long)(c1-c0),b.ru_nvcsw-a.ru_nvcsw,b.ru_nivcsw-a.ru_nivcsw,b.ru_minflt-a.ru_minflt,b.ru_majflt-a.ru_majflt,(unsigned long long)(pb-pa),(unsigned long long)(ub-ua),(unsigned long long)sum,s->len,s->last_bank,(unsigned long long)fs,(unsigned long long)ls,(unsigned long long)fi,(unsigned long long)li);
        }
        for(int j=0;j<ns;j++) {owned *s=&storage[slots[j]]; if(!mode)finish(s,in,0); verify(s,in); if(s->live)end(s);}
    }
}
static void phase(FILE *schedule,int wanted) {
    rewind(schedule);char line[5000];
    while(fgets(line,sizeof(line),schedule)) {int p,id,ci,raw,mode,ca,cb,control,copy,blocks,pairs,iterations;CHECK(sscanf(line,"%d%d%d%d%d%d%d%d%d%d%d%d",&p,&id,&ci,&raw,&mode,&ca,&cb,&control,&copy,&blocks,&pairs,&iterations)==12);if(p==wanted)sample(p,id,ci,raw,mode,ca,cb,control,copy,blocks,pairs,iterations);}
    fflush(stdout);fflush(stderr);
}
int main(int argc,char **argv) {
    CHECK(argc==9 || argc==10);layout=atoi(argv[8]);CHECK(layout>=0 && layout<8);
    int order[4]={0,1,2,3};if((layout>>2)&1)for(int k=0;k<4;k++)order[k]=3-k;
    for(int rank=0;rank<4;rank++) {int i=order[rank];api *a=&apis[i];a->name=names[i];a->load_rank=rank;a->handle=dlopen(argv[1+i],RTLD_NOW|RTLD_LOCAL);CHECK(a->handle);const char *prefix=i<2?"":"jdk_ng_";a->init=symbol(a->handle,prefix,"deflateInit2_");a->def=symbol(a->handle,prefix,"deflate");a->reset=symbol(a->handle,prefix,"deflateReset");a->end=symbol(a->handle,prefix,"deflateEnd");Dl_info info;CHECK(dladdr((void*)a->def,&info));a->base=info.dli_fbase;struct stat st;CHECK(!stat(argv[1+i],&st));fprintf(stderr,"IMAGE layout=%d id=%d name=%s load_rank=%d base=%p init=%p reset=%p deflate=%p end=%p dev=%llu inode=%llu file=%s\n",layout,i,a->name,rank,a->base,(void*)a->init,(void*)a->reset,(void*)a->def,(void*)a->end,(unsigned long long)st.st_dev,(unsigned long long)st.st_ino,argv[1+i]);}
    CHECK(apis[0].base!=apis[1].base && apis[2].base!=apis[3].base);
    FILE *maps=fopen("/proc/self/maps","r");CHECK(maps);char line[10000];fputs("MAPS_BEGIN\n",stderr);while(fgets(line,sizeof(line),maps))fputs(line,stderr);fclose(maps);fputs("MAPS_END\n",stderr);
    FILE *f=fopen(argv[5],"r");CHECK(f);
    while(fgets(line,sizeof(line),f)) {int ci,bank,n;char path[5000],name[80];CHECK(sscanf(line,"%d%d%d%4999s%79s",&ci,&bank,&n,path,name)==5);CHECK(ci>=0 && ci<NC && bank>=0 && bank<NB && n>0 && n<=4096);input *in=&cases[ci];CHECK(bank==in->banks);in->n=n;snprintf(in->name,sizeof(in->name),"%s",name);in->data[bank]=malloc(n);CHECK(in->data[bank]);FILE *g=fopen(path,"rb");CHECK(g && fread(in->data[bank],1,n,g)==(size_t)n && fgetc(g)==EOF);fclose(g);in->banks++;if(ci>=ncase)ncase=ci+1;}fclose(f);
    if(argc==10){CHECK(!strcmp(argv[9],"--untimed-only"));untimed(0,ncase,argv[7]);return 0;}
    untimed(0,2,argv[7]);
    puts("layout,phase,cell,block,pair,order,arm,slot,image,config,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttled_periods,throttled_us,total_bytes,output_bytes,last_bank,first_state,last_state,first_init,last_init");
    FILE *schedule=fopen(argv[6],"r");CHECK(schedule);phase(schedule,1);
    char ready[5000];snprintf(ready,sizeof(ready),"%s/worker-%d.ready",argv[7],layout);f=fopen(ready,"wx");CHECK(f);fputs("calibration done; loaded images stay resident\n",f);fclose(f);
    int choice=getchar();CHECK(choice=='G' || choice=='S');if(choice=='S'){fprintf(stderr,"TINY_SKIPPED layout=%d\n",layout);fclose(schedule);return 0;}
    untimed(2,ncase,argv[7]);phase(schedule,2);phase(schedule,3);fclose(schedule);return 0;
}
