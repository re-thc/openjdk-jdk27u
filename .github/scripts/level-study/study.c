#define _GNU_SOURCE 1
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/resource.h>
#include <zlib.h>
typedef struct {const char *name;void *handle;int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);} api;
typedef struct {int id,n;char name[64],path[4096];unsigned char *data;} input;
typedef struct {api *owner;z_stream z;int level,wb,live;unsigned char out[10000];size_t len;uint64_t ordinal;} owned;
static api libs[3];static input inputs[100];static int nin;static uint64_t serial;
typedef struct {uint64_t periods,usec;} throttle;
static throttle stats(void){throttle t={0};FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)return t;char k[80];unsigned long long v;while(fscanf(f,"%79s %llu",k,&v)==2){if(!strcmp(k,"nr_throttled"))t.periods=v;else if(!strcmp(k,"throttled_usec"))t.usec=v;}fclose(f);return t;}
static uint64_t now(clockid_t c){struct timespec t;if(clock_gettime(c,&t))abort();return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static void *sym(void*h,const char*p,const char*n){char s[128];snprintf(s,sizeof(s),"%s%s",p,n);void*f=dlsym(h,s);if(!f)abort();return f;}
static void init(owned*s){if(s->live)abort();memset(&s->z,0,sizeof(s->z));if(s->owner->init(&s->z,s->level,8,s->wb,8,0,ZLIB_VERSION,sizeof(s->z))!=Z_OK)abort();s->live=1;s->ordinal=serial++;}
static void end(owned*s){if(!s->live||s->owner->end(&s->z)!=Z_OK)abort();s->live=0;}
static void finish(owned*s,input*in){s->z.next_in=in->data;s->z.avail_in=in->n;s->z.next_out=s->out;s->z.avail_out=sizeof(s->out);if(s->owner->def(&s->z,Z_FINISH)!=Z_STREAM_END)abort();s->len=s->z.total_out;}
static void verify(owned*s,input*in){z_stream z={0};unsigned char out[5000];if(inflateInit2(&z,s->wb)!=Z_OK)abort();z.next_in=s->out;z.avail_in=s->len;z.next_out=out;z.avail_out=sizeof(out);if(inflate(&z,Z_FINISH)!=Z_STREAM_END||z.total_out!=(unsigned)in->n||memcmp(in->data,out,in->n))abort();inflateEnd(&z);}
static void op(owned*s,input*in,int mode,uintptr_t*state,uint64_t*ordinal){if(mode==2)init(s);else if(!s->live||s->owner->reset(&s->z)!=Z_OK)abort();*state=(uintptr_t)s->z.state;*ordinal=s->ordinal;if(mode)finish(s,in);else s->len=0;if(mode==2)end(s);}
static void sizes(const char*folder){
    puts("input,format,library,level,bytes,path");
    for(int i=0;i<nin;i++)for(int raw=0;raw<2;raw++)for(int level=1;level<=6;level++){
        owned s[3];memset(s,0,sizeof(s));
        for(int l=0;l<3;l++){s[l].owner=&libs[l];s[l].level=level;s[l].wb=raw?-15:15;init(&s[l]);finish(&s[l],&inputs[i]);verify(&s[l],&inputs[i]);end(&s[l]);
            if(l<2){char path[5000];snprintf(path,sizeof(path),"%s/%d-%d-%d-%d.bin",folder,i,raw,l,level);FILE*f=fopen(path,"wb");if(!f||fwrite(s[l].out,1,s[l].len,f)!=s[l].len)abort();fclose(f);printf("%d,%s,%s,%d,%zu,%s\n",i,raw?"raw":"wrapped",libs[l].name,level,s[l].len,path);}
        }if(s[1].len!=s[2].len||memcmp(s[1].out,s[2].out,s[1].len))abort();
    }
}
static void sample(int id,int category,int control,input*in,int raw,int mode,int a_lib,int a_level,int b_lib,int b_level,int blocks,int pairs,int iterations){
    owned storage[2];memset(storage,0,sizeof(storage));storage[0].owner=&libs[a_lib];storage[1].owner=&libs[b_lib];
    for(int k=0;k<2;k++){storage[k].level=k?b_level:a_level;storage[k].wb=raw?-15:15;}
    int shared=category&&control==0;
    /* For A/A, persistent physical states survive all blocks; two-state
       logical assignments reverse. Comparative allocation order reverses. */
    if(category){for(int slot=0;slot<(shared?1:2);slot++){init(&storage[slot]);if(mode==2)end(&storage[slot]);}}
    for(int block=0;block<blocks;block++){
        if(!category){for(int order=0;order<2;order++){int slot=block%2?1-order:order;init(&storage[slot]);if(mode==2)end(&storage[slot]);}}
        owned *arms[2]={&storage[0],&storage[1]};
        if(shared)arms[1]=arms[0];else if(category&&control==1&&block%2){arms[0]=&storage[1];arms[1]=&storage[0];}
        for(int arm=0;arm<2;arm++){
            for(int w=0;w<32;w++){uintptr_t p;uint64_t o;op(arms[arm],in,mode==2?2:1,&p,&o);}
            fprintf(stderr,"OWNED category=%d cell=%d block=%d arm=%d slot=%ld library=%s level=%d wb=%d stream=%p state=%p ordinal=%llu\n",category,id,block,arm,(long)(arms[arm]-storage),arms[arm]->owner->name,arms[arm]->level,arms[arm]->wb,(void*)&arms[arm]->z,(void*)arms[arm]->z.state,(unsigned long long)arms[arm]->ordinal);
        }
        for(int pair=0;pair<pairs;pair++)for(int order=0;order<2;order++){
            int arm=(block+pair)%2?1-order:order;owned*s=arms[arm];uintptr_t first=0,last=0;uint64_t fi=0,li=0;struct rusage a,b;throttle ta=stats();getrusage(RUSAGE_THREAD,&a);uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);
            for(int k=0;k<iterations;k++){op(s,in,mode,&last,&li);if(k==0){first=last;fi=li;}}
            uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);getrusage(RUSAGE_THREAD,&b);throttle tb=stats();
            printf("%d,%d,%d,%d,%d,%d,%ld,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%zu,%llu,%llu,%llu,%llu\n",category,id,block,pair,order,arm,(long)(s-storage),iterations,(unsigned long long)(w1-w0),(unsigned long long)(c1-c0),b.ru_nvcsw-a.ru_nvcsw,b.ru_nivcsw-a.ru_nivcsw,b.ru_minflt-a.ru_minflt,b.ru_majflt-a.ru_majflt,(unsigned long long)(tb.periods-ta.periods),(unsigned long long)(tb.usec-ta.usec),s->len,(unsigned long long)first,(unsigned long long)last,(unsigned long long)fi,(unsigned long long)li);
        }
        if(!category){for(int slot=0;slot<2;slot++){owned*s=&storage[slot];if(mode==2)init(s);else if(s->owner->reset(&s->z)!=Z_OK)abort();finish(s,in);verify(s,in);end(s);}}
    }
    if(category){for(int slot=0;slot<(shared?1:2);slot++){owned*s=&storage[slot];if(mode==2)init(s);else if(s->owner->reset(&s->z)!=Z_OK)abort();finish(s,in);verify(s,in);end(s);}}
}
int main(int argc,char**argv){
    if(argc!=8)return 1;
    const char*names[]={"stock","ng","ng-control"};const char*prefixes[]={"","jdk_ng_","cand_"};
    for(int l=0;l<3;l++){api*a=&libs[l];a->name=names[l];a->handle=dlopen(argv[1+l],RTLD_NOW|RTLD_LOCAL);if(!a->handle){fprintf(stderr,"%s\n",dlerror());abort();}a->init=sym(a->handle,prefixes[l],"deflateInit2_");a->def=sym(a->handle,prefixes[l],"deflate");a->reset=sym(a->handle,prefixes[l],"deflateReset");a->end=sym(a->handle,prefixes[l],"deflateEnd");fprintf(stderr,"API library=%s init=%p reset=%p deflate=%p end=%p\n",a->name,(void*)a->init,(void*)a->reset,(void*)a->def,(void*)a->end);}
    FILE*maps=fopen("/proc/self/maps","r");if(maps){char m[5000];fputs("MAPS_BEGIN\n",stderr);while(fgets(m,sizeof(m),maps))fputs(m,stderr);fclose(maps);fputs("MAPS_END\n",stderr);}
    FILE*f=fopen(argv[4],"r");if(!f)abort();char line[5000];while(fgets(line,sizeof(line),f)){input*in=&inputs[nin];if(nin>=100||sscanf(line,"%d %63s %d %4095s",&in->id,in->name,&in->n,in->path)!=4||in->id!=nin||in->n>4096)abort();FILE*g=fopen(in->path,"rb");in->data=malloc(in->n+1);if(!g||!in->data||fread(in->data,1,in->n,g)!=(size_t)in->n)abort();fclose(g);nin++;}fclose(f);
    if(!strcmp(argv[5],"sizes")){sizes(argv[6]);return 0;}
    puts("category,cell,block,pair,order,arm,slot,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttled_periods,throttled_us,output_bytes,first_state,last_state,first_init,last_init");
    f=fopen(argv[6],"r");if(!f)abort();while(fgets(line,sizeof(line),f)){
        int id,category,input_id,raw,mode,al,an,bl,bn,control,blocks,pairs,iterations;
        if(sscanf(line,"%d %d %d %d %d %d %d %d %d %d %d %d %d",&id,&category,&input_id,&raw,&mode,&al,&an,&bl,&bn,&control,&blocks,&pairs,&iterations)!=13)abort();
        if(input_id<0||input_id>=nin||al<0||al>2||bl<0||bl>2)abort();
        sample(id,category,control,&inputs[input_id],raw,mode,al,an,bl,bn,blocks,pairs,iterations);
    }fclose(f);return 0;
}
