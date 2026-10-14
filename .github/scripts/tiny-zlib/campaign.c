#define _GNU_SOURCE 1
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <sys/resource.h>
#include <zlib.h>

typedef struct image {
    char name[32];int role;void *handle,*tree_handle;
    int(*init)(z_streamp,int,int,int,int,int,const char*,int);
    int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);
    void(*prepare)(int,int,int,int);void(*tree_run)(void);uint64_t(*digest)(void);
    void*(*tree_code)(void);void*(*tree_state)(void);
} image;
typedef struct {int id;char category[32],ref[32],cmp[32],payload[4096],mode[16];int level,kind,leaves,order,domain,iterations;} cell;
typedef struct {image *owner;z_stream stream;unsigned char *out;size_t cap,len;uint64_t ordinal;int live;} owned;
typedef struct {uint64_t periods,throttled,throttled_us,usage_us;} throttle;
static image images[10];static int nimages;static uint64_t init_ordinal;
static uint64_t now(clockid_t c){struct timespec t;if(clock_gettime(c,&t))abort();return(uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static throttle stats(void){throttle t={0};FILE*f=fopen("/sys/fs/cgroup/cpu.stat","r");if(!f)abort();char k[80];unsigned long long v;while(fscanf(f,"%79s %llu",k,&v)==2){if(!strcmp(k,"nr_periods"))t.periods=v;else if(!strcmp(k,"nr_throttled"))t.throttled=v;else if(!strcmp(k,"throttled_usec"))t.throttled_us=v;else if(!strcmp(k,"usage_usec"))t.usage_us=v;}fclose(f);return t;}
static void *symbol(void *h,const char *prefix,const char *name){char s[200];if(snprintf(s,sizeof(s),"%s%s",prefix,name)>=(int)sizeof(s))abort();dlerror();void*p=dlsym(h,s);if(!p||dlerror()){fprintf(stderr,"Missing symbol %s\n",s);abort();}return p;}
static image *get_image(const char *name,int role){for(int i=0;i<nimages;i++)if(images[i].role==role&&!strcmp(images[i].name,name))return &images[i];abort();}
static void address(image *a,const char *name,void *p){Dl_info d={0};if(!dladdr(p,&d))abort();fprintf(stderr,"FUNCTION backend=%s role=%d function=%s address=%p base=%p offset=%llu file=%s\n",a->name,a->role,name,p,d.dli_fbase,(unsigned long long)((uintptr_t)p-(uintptr_t)d.dli_fbase),d.dli_fname);}
static void load_images(const char *path){
    FILE*f=fopen(path,"r");if(!f)abort();char line[12000];
    while(fgets(line,sizeof(line),f)){
        char so[4096],prefix[100],tree[4096];image *a=&images[nimages];
        if(nimages>=10||sscanf(line,"%31s %d %4095s %99s %4095s",a->name,&a->role,so,prefix,tree)!=5)abort();
        if(!strcmp(prefix,"-"))prefix[0]=0;
        a->handle=dlopen(so,RTLD_NOW|RTLD_LOCAL);if(!a->handle){fprintf(stderr,"dlopen: %s\n",dlerror());abort();}
        a->init=symbol(a->handle,prefix,"deflateInit2_");a->def=symbol(a->handle,prefix,"deflate");a->reset=symbol(a->handle,prefix,"deflateReset");a->end=symbol(a->handle,prefix,"deflateEnd");
        address(a,"init",(void*)a->init);address(a,"deflate",(void*)a->def);address(a,"reset",(void*)a->reset);address(a,"end",(void*)a->end);
        if(strcmp(tree,"-")){
            a->tree_handle=dlopen(tree,RTLD_NOW|RTLD_LOCAL);if(!a->tree_handle){fprintf(stderr,"tree dlopen: %s\n",dlerror());abort();}
            a->prepare=symbol(a->tree_handle,"","campaign_tree_prepare");a->tree_run=symbol(a->tree_handle,"","campaign_tree_run");a->digest=symbol(a->tree_handle,"","campaign_tree_digest");a->tree_code=symbol(a->tree_handle,"","campaign_tree_code_address");a->tree_state=symbol(a->tree_handle,"","campaign_tree_state_address");
            address(a,"tree-build",a->tree_code());fprintf(stderr,"TREE_STATE backend=%s role=%d state=%p\n",a->name,a->role,a->tree_state());
        }nimages++;
    }fclose(f);if(nimages!=10)abort();
    if(get_image("baseline",0)->def==get_image("baseline",1)->def)abort();
    f=fopen("/proc/self/maps","r");if(!f)abort();fputs("MAPS_BEGIN\n",stderr);while(fgets(line,sizeof(line),f))fputs(line,stderr);fclose(f);fputs("MAPS_END\n",stderr);
}
static void init_owned(owned *s,int level){if(s->live)abort();memset(&s->stream,0,sizeof(s->stream));if(s->owner->init(&s->stream,level,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))!=Z_OK)abort();s->live=1;s->ordinal=init_ordinal++;}
static void end_owned(owned *s){if(!s->live||s->owner->end(&s->stream)!=Z_OK)abort();s->live=0;}
static void finish(owned *s,unsigned char *in,size_t n){s->stream.next_in=in;s->stream.avail_in=n;s->stream.next_out=s->out;s->stream.avail_out=s->cap;if(s->owner->def(&s->stream,Z_FINISH)!=Z_STREAM_END)abort();s->len=s->stream.total_out;}
static void operation(owned *s,unsigned char *in,size_t n,int level,int create,int resetonly,uintptr_t *state,uint64_t *ordinal){
    if(create)init_owned(s,level);else if(!s->live||s->owner->reset(&s->stream)!=Z_OK)abort();
    *state=(uintptr_t)s->stream.state;*ordinal=s->ordinal;
    if(!resetonly)finish(s,in,n);else s->len=0;
    if(create)end_owned(s);
}
static void measure(const cell *c,int layout,const char *phase,int shared,int blocks,int pairs){
    image *a=get_image(layout?c->cmp:c->ref,0),*b=get_image(layout?c->ref:c->cmp,1);
    if(shared)b=a;
    int tree=!strcmp(c->category,"tree"),create=!strcmp(c->mode,"create"),resetonly=!strcmp(c->mode,"reset");
    size_t n=0,cap=0;unsigned char *in=NULL,*decoded=NULL;owned own[2]={{.owner=a},{.owner=b}};owned *arms[2]={&own[0],shared?&own[0]:&own[1]};
    if(!tree){
        FILE*f=fopen(c->payload,"rb");if(!f)abort();if(fseek(f,0,SEEK_END))abort();long size=ftell(f);if(size<0)abort();n=(size_t)size;rewind(f);in=malloc(n+1);decoded=malloc(n+1);if(!in||!decoded||fread(in,1,n,f)!=n)abort();fclose(f);cap=n+n/8+1024;
        for(int slot=0;slot<(shared?1:2);slot++){
            own[slot].cap=cap;own[slot].out=malloc(cap);if(!own[slot].out)abort();init_owned(&own[slot],c->level);
            fprintf(stderr,"OWNED layout=%d phase=%s cell=%d arm=%d backend=%s role=%d init_order=%llu stream=%p state=%p input=%p output=%p\n",layout,phase,c->id,slot,own[slot].owner->name,own[slot].owner->role,(unsigned long long)own[slot].ordinal,(void*)&own[slot].stream,(void*)own[slot].stream.state,(void*)in,(void*)own[slot].out);
            if(create)end_owned(&own[slot]);
        }
        for(int arm=0;arm<2;arm++)for(int w=0;w<64;w++){uintptr_t p;uint64_t o;operation(arms[arm],in,n,c->level,create,0,&p,&o);}
    }else{
        for(int arm=0;arm<2;arm++)for(int w=0;w<64;w++){arms[arm]->owner->prepare(c->kind,c->leaves,c->order,c->domain);arms[arm]->owner->tree_run();}
    }
    for(int block=0;block<blocks;block++)for(int pair=0;pair<pairs;pair++)for(int order=0;order<2;order++){
        int arm=(block+pair)%2?1-order:order;owned *s=arms[arm];uintptr_t first=0,last=0;uint64_t first_init=0,last_init=0,checksum=0;
        if(tree)s->owner->prepare(c->kind,c->leaves,c->order,c->domain);
        struct rusage ra,rb;throttle ta=stats();getrusage(RUSAGE_THREAD,&ra);uint64_t w0=now(CLOCK_MONOTONIC),c0=now(CLOCK_THREAD_CPUTIME_ID);
        if(tree)s->owner->tree_run();else for(int i=0;i<c->iterations;i++){
            operation(s,in,n,c->level,create,resetonly,&last,&last_init);if(i==0){first=last;first_init=last_init;}
        }
        uint64_t c1=now(CLOCK_THREAD_CPUTIME_ID),w1=now(CLOCK_MONOTONIC);getrusage(RUSAGE_THREAD,&rb);throttle tb=stats();
        if(tree)checksum=s->owner->digest();
        printf("%d,%s,%d,%d,%d,%d,%d,%d,%d,%llu,%llu,%ld,%ld,%ld,%ld,%llu,%llu,%llu,%llu,%zu,%llu,%llu,%llu,%llu,%llu\n",layout,phase,c->id,block,pair,order,arm,s->owner->role,c->iterations,(unsigned long long)(w1-w0),(unsigned long long)(c1-c0),rb.ru_nvcsw-ra.ru_nvcsw,rb.ru_nivcsw-ra.ru_nivcsw,rb.ru_minflt-ra.ru_minflt,rb.ru_majflt-ra.ru_majflt,(unsigned long long)(tb.periods-ta.periods),(unsigned long long)(tb.throttled-ta.throttled),(unsigned long long)(tb.throttled_us-ta.throttled_us),(unsigned long long)(tb.usage_us-ta.usage_us),s->len,(unsigned long long)first,(unsigned long long)last,(unsigned long long)first_init,(unsigned long long)last_init,(unsigned long long)checksum);
    }
    if(tree){
        uint64_t digest[2];for(int arm=0;arm<2;arm++){arms[arm]->owner->prepare(c->kind,c->leaves,c->order,c->domain);arms[arm]->owner->tree_run();digest[arm]=arms[arm]->owner->digest();}if(digest[0]!=digest[1])abort();
    }else{
        for(int slot=0;slot<(shared?1:2);slot++){
            owned *s=&own[slot];if(create)init_owned(s,c->level);else if(s->owner->reset(&s->stream)!=Z_OK)abort();finish(s,in,n);
            uLong decoded_n=n;if(uncompress(decoded,&decoded_n,s->out,s->len)!=Z_OK||decoded_n!=n||memcmp(in,decoded,n))abort();end_owned(s);
        }
        if(strcmp(c->ref,"stock")&&strcmp(c->cmp,"stock")&&!shared&&(own[0].len!=own[1].len||memcmp(own[0].out,own[1].out,own[0].len)))abort();
        for(int slot=0;slot<(shared?1:2);slot++){free(own[slot].out);}
        free(in);free(decoded);
    }
}
static void bracket(int layout,const char *when,const char *payload){
    for(int shared=1;shared>=0;shared--)for(int mode=0;mode<3;mode++){
        cell c={.id=mode,.level=6,.iterations=128};strcpy(c.category,"aa");strcpy(c.ref,"baseline");strcpy(c.cmp,"baseline");strcpy(c.payload,payload);strcpy(c.mode,mode==0?"reset":mode==1?"reuse":"create");char phase[60];snprintf(phase,sizeof(phase),"%s_%s",when,shared?"shared":"roles");measure(&c,layout,phase,shared,12,20);
    }
}
int main(int argc,char **argv){
    if(argc!=4&&argc!=5)return 1;
    int validate=argc==5&&!strcmp(argv[4],"--validate-only");if(argc==5&&!validate)return 1;
    load_images(argv[1]);FILE*f=fopen(argv[2],"r");if(!f)abort();cell *cells=calloc(1000,sizeof(cell));if(!cells)abort();int count=0;char line[10000];
    while(fgets(line,sizeof(line),f)){
        if(count>=1000)abort();
        cell*c=&cells[count];if(sscanf(line,"%d %31s %31s %31s %4095s %d %15s %d %d %d %d %d",&c->id,c->category,c->ref,c->cmp,c->payload,&c->level,c->mode,&c->kind,&c->leaves,&c->order,&c->domain,&c->iterations)!=12||c->id!=count)abort();count++;
    }fclose(f);if(count!=674)abort();
    if(validate){
        /* Untimed fixture: loading, ownership, create/end, output and tree checks.
           Zero blocks means no clock reads or performance samples. */
        int chosen[]={0,7,98,110,290};
        for(int layout=0;layout<2;layout++)for(unsigned i=0;i<sizeof(chosen)/sizeof(chosen[0]);i++)measure(&cells[chosen[i]],layout,"fixture",0,0,0);
        for(int mode=0;mode<3;mode++){cell c={.id=mode,.level=6,.iterations=128};strcpy(c.category,"aa");strcpy(c.ref,"baseline");strcpy(c.cmp,"baseline");strcpy(c.payload,argv[3]);strcpy(c.mode,mode==0?"reset":mode==1?"reuse":"create");measure(&c,0,"fixture-shared",1,0,0);}
        free(cells);return 0;
    }
    puts("layout,phase,cell,block,pair,order,arm,role,iterations,wall_ns,cpu_ns,voluntary_ctx,involuntary_ctx,minor_faults,major_faults,throttle_periods,throttled_periods,throttled_us,cgroup_usage_us,output_bytes,first_state,last_state,first_init,last_init,checksum");
    for(int layout=0;layout<2;layout++){
        fprintf(stderr,"LAYOUT_BEGIN %d\n",layout);bracket(layout,"pre",argv[3]);
        for(int index=0;index<count;index++){int id=layout?count-1-index:index;if(index%50==0)fprintf(stderr,"PROGRESS layout=%d index=%d cell=%d\n",layout,index,id);measure(&cells[id],layout,"campaign",0,6,10);}
        bracket(layout,"post",argv[3]);fprintf(stderr,"LAYOUT_END %d\n",layout);
    }free(cells);return 0;
}
