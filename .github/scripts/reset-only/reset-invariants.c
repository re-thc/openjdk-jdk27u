#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>
#define CHECK(x) do { if (!(x)) { fprintf(stderr,"CHECK line=%d case=%s call=%lu: %s\n",__LINE__,tag,calls,#x); abort(); } } while (0)
typedef struct {
    int (*init)(z_streamp,int,int,int,int,int,const char*,int);
    int (*def)(z_streamp,int); int (*reset)(z_streamp); int (*keep)(z_streamp);
    int (*params)(z_streamp,int,int); int (*dict)(z_streamp,const Bytef*,uInt);
    int (*getdict)(z_streamp,Bytef*,uInt*); int (*copy)(z_streamp,z_streamp);
    int (*end)(z_streamp); int (*safe)(z_streamp); unsigned long (*head)(z_streamp); unsigned long *count;
} Api;
typedef struct { unsigned char *data;size_t n,capacity; } Bytes;
typedef struct { z_stream s[2];Bytes bytes[2];int level,strategy,window,mem; } Pair;
static Api api[2];static const char *tag="startup";static unsigned long calls,records,fast_expected,full_expected;
static unsigned long allocations[2],frees_[2],requested[2],last_request[2];static FILE *csv,*blob;
static void *alloc_(void *opaque,unsigned a,unsigned b) {size_t i=(size_t)opaque;allocations[i]++;last_request[i]=(unsigned long)a*b;requested[i]+=last_request[i];return malloc((size_t)a*b);}
static void free_(void *opaque,void *p) {frees_[(size_t)opaque]++;free(p);}
static void append(Bytes *b,const void *src,size_t n) {if(b->n+n>b->capacity){b->capacity=2*(b->n+n)+256;b->data=realloc(b->data,b->capacity);CHECK(b->data);}if(n)memcpy(b->data+b->n,src,n);b->n+=n;}
static void load(Api *a,const char *path,int probe) {
    void *h=dlopen(path,RTLD_NOW|RTLD_LOCAL);if(!h){fprintf(stderr,"dlopen: %s\n",dlerror());abort();}
#define GET(field,name) do {a->field=dlsym(h,"jdk_ng_" name);CHECK(a->field);}while(0)
    GET(init,"deflateInit2_");GET(def,"deflate");GET(reset,"deflateReset");GET(keep,"deflateResetKeep");GET(params,"deflateParams");GET(dict,"deflateSetDictionary");GET(getdict,"deflateGetDictionary");GET(copy,"deflateCopy");GET(end,"deflateEnd");
    if(probe){GET(safe,"test_reset_safe");GET(count,"test_sparse_resets");GET(head,"test_head_nonzero");}
#undef GET
}
static void equal(Pair *p,int a,int b) {
    calls++;CHECK(a==b);z_stream *x=&p->s[0],*y=&p->s[1];
    CHECK(x->avail_in==y->avail_in&&x->avail_out==y->avail_out&&x->total_in==y->total_in&&x->total_out==y->total_out&&x->adler==y->adler&&x->data_type==y->data_type);
    CHECK((x->msg==NULL)==(y->msg==NULL));if(x->msg)CHECK(!strcmp(x->msg,y->msg));
    CHECK(allocations[0]==allocations[1]&&frees_[0]==frees_[1]&&requested[0]==requested[1]);
}
static void init_pair(Pair *p,int level,int strategy,int window,int mem) {
    memset(p,0,sizeof(*p));p->level=level;p->strategy=strategy;p->window=window;p->mem=mem;int rc[2];
    for(int i=0;i<2;i++){memset(&p->s[i],0xa5,sizeof(z_stream));p->s[i].zalloc=alloc_;p->s[i].zfree=free_;p->s[i].opaque=(void*)(size_t)i;rc[i]=api[i].init(&p->s[i],level,Z_DEFLATED,window,mem,strategy,ZLIB_VERSION,sizeof(z_stream));}
    equal(p,rc[0],rc[1]);CHECK(rc[0]==Z_OK&&last_request[0]==last_request[1]);
    if((window==15||window==-15)&&mem==8)CHECK(last_request[0]==333312);
}
static void feed(Pair *p,const unsigned char *in,unsigned n) {for(int i=0;i<2;i++){p->s[i].next_in=(Bytef*)in;p->s[i].avail_in=n;}}
static int step(Pair *p,int flush,unsigned cap) {
    CHECK(cap<=4096);unsigned char out[2][4096];int rc[2];unsigned used[2];
    for(int i=0;i<2;i++){p->s[i].next_out=out[i];p->s[i].avail_out=cap;rc[i]=api[i].def(&p->s[i],flush);used[i]=cap-p->s[i].avail_out;append(&p->bytes[i],out[i],used[i]);}
    equal(p,rc[0],rc[1]);CHECK(used[0]==used[1]&&!memcmp(out[0],out[1],used[0]));return rc[0];
}
static void finish(Pair *p,unsigned cap) {int rc;unsigned guard=0;do{rc=step(p,Z_FINISH,cap);CHECK(rc==Z_OK||rc==Z_STREAM_END);CHECK(++guard<3000000);}while(rc!=Z_STREAM_END);}
static void pump(Pair *p,int flush,unsigned cap) {unsigned guard=0;int rc;do{rc=step(p,flush,cap);CHECK(rc==Z_OK||rc==Z_BUF_ERROR);CHECK(++guard<3000000);}while(p->s[0].avail_in||p->s[0].avail_out==0);}
static void parameters(Pair *p,int level,int strategy) {
    unsigned guard=0;int rc[2];do {unsigned char out[2][4096];unsigned n[2];
        for(int i=0;i<2;i++){p->s[i].next_out=out[i];p->s[i].avail_out=sizeof(out[i]);rc[i]=api[i].params(&p->s[i],level,strategy);n[i]=sizeof(out[i])-p->s[i].avail_out;append(&p->bytes[i],out[i],n[i]);}
        equal(p,rc[0],rc[1]);CHECK(n[0]==n[1]&&!memcmp(out[0],out[1],n[0]));CHECK(++guard<1000);
    }while(rc[0]==Z_BUF_ERROR);
    CHECK(rc[0]==Z_OK);p->level=level==-1?6:level;p->strategy=strategy;CHECK(api[1].safe(&p->s[1])==0);
}
static void dictionary(Pair *p,const unsigned char *d,unsigned n) {int a=api[0].dict(&p->s[0],d,n),b=api[1].dict(&p->s[1],d,n);equal(p,a,b);CHECK(a==Z_OK&&api[1].safe(&p->s[1])==0);}
static void reset_pair(Pair *p,int expected) {
    unsigned long before=*api[1].count;int a=api[0].reset(&p->s[0]),b=api[1].reset(&p->s[1]);equal(p,a,b);CHECK(a==Z_OK);CHECK(*api[1].count-before==(unsigned long)expected);
    if((p->level==6||p->level==-1)&&p->strategy==0)CHECK(api[1].head(&p->s[1])==0);
    if(expected)fast_expected++;else full_expected++;p->bytes[0].n=p->bytes[1].n=0;
}
static void keep_pair(Pair *p) {unsigned long before=*api[1].count;int a=api[0].keep(&p->s[0]),b=api[1].keep(&p->s[1]);equal(p,a,b);CHECK(a==Z_OK&&api[1].safe(&p->s[1])==0&&*api[1].count==before);p->bytes[0].n=p->bytes[1].n=0;}
static void check_plain(Pair *p,const unsigned char *plain,unsigned n,const unsigned char *dict,unsigned dn) {
    CHECK(p->bytes[0].n==p->bytes[1].n&&!memcmp(p->bytes[0].data,p->bytes[1].data,p->bytes[0].n));
    z_stream z={0};unsigned char *decoded=malloc((size_t)n+1);CHECK(decoded);CHECK(inflateInit2(&z,p->window==8?9:p->window)==Z_OK);
    if(p->window<0&&dn)CHECK(inflateSetDictionary(&z,dict,dn)==Z_OK);
    z.next_in=p->bytes[0].data;z.avail_in=(uInt)p->bytes[0].n;z.next_out=decoded;z.avail_out=n+1;int rc=inflate(&z,Z_FINISH);
    if(rc==Z_NEED_DICT&&dn){CHECK(inflateSetDictionary(&z,dict,dn)==Z_OK);rc=inflate(&z,Z_FINISH);}
    CHECK(rc==Z_STREAM_END&&z.total_out==n&&z.avail_in==0&&(n==0||!memcmp(decoded,plain,n)));CHECK(inflateEnd(&z)==Z_OK);free(decoded);
    long offset=ftell(blob);CHECK(offset>=0);CHECK((n==0||fwrite(plain,1,n,blob)==n)&&(dn==0||fwrite(dict,1,dn,blob)==dn)&&fwrite(p->bytes[0].data,1,p->bytes[0].n,blob)==p->bytes[0].n);
    fprintf(csv,"%lu,%s,%d,%u,%u,%zu,%ld,%lu,%d\n",records++,tag,p->window,n,dn,p->bytes[0].n,offset,*api[1].count,api[1].safe(&p->s[1]));
}
static void close_pair(Pair *p) {int a=api[0].end(&p->s[0]),b=api[1].end(&p->s[1]);calls++;CHECK(a==b&&(a==Z_OK||a==Z_DATA_ERROR));CHECK(allocations[0]==allocations[1]&&frees_[0]==frees_[1]);free(p->bytes[0].data);free(p->bytes[1].data);}
static int normal_fast(Pair *p,unsigned n) {return (p->level==6||p->level==-1)&&p->strategy==0&&(p->window==15||p->window==-15)&&p->mem==8&&n<=64;}
static void scenario(const unsigned char *in,unsigned n,int scene,int raw) {
    Pair p;init_pair(&p,6,0,raw?-15:15,8);static const unsigned char dict[]="abcdef";
    unsigned cap=scene==2?(n<=1024?1:31):4096;int eligible=normal_fast(&p,n);
    for(int rep=0;rep<2;rep++){
        if(scene==4){dictionary(&p,dict,6);eligible=0;}
        if(scene==5){feed(&p,NULL,0);parameters(&p,9,0);parameters(&p,6,0);eligible=0;}
        if(scene==6){feed(&p,NULL,0);parameters(&p,6,Z_HUFFMAN_ONLY);parameters(&p,6,0);eligible=0;}
        if(scene==3||scene==7||scene==8){unsigned first=n<64?n:64;feed(&p,in,first);pump(&p,scene==7?Z_FULL_FLUSH:scene==8?Z_SYNC_FLUSH:Z_NO_FLUSH,31);eligible=0;
            unsigned off=first;while(off<n){unsigned take=n<=1024?1:4096;if(take>n-off)take=n-off;feed(&p,in+off,take);pump(&p,Z_NO_FLUSH,4096);off+=take;}feed(&p,NULL,0);
        }else feed(&p,in,n);
        if(scene==1)CHECK(step(&p,Z_FINISH,0)==Z_BUF_ERROR);
        if(scene==9){int rc=step(&p,Z_FINISH,1);CHECK(rc==Z_OK);reset_pair(&p,0);feed(&p,in,n);}
        finish(&p,cap);check_plain(&p,in,n,scene==4?dict:NULL,scene==4?6:0);reset_pair(&p,eligible);
    }
    close_pair(&p);
}
static void histories(const unsigned char *in) {
    Pair p;unsigned char hist[2][32768];unsigned hn[2];
    for(unsigned cap=0;cap<=8;cap=cap==0?1:8){
        tag=cap==0?"abort-zero-output":cap==1?"abort-header-finish":"abort-pending-finish";init_pair(&p,6,0,15,8);feed(&p,in,64);int rc=step(&p,Z_FINISH,cap);CHECK(rc==Z_OK||rc==Z_BUF_ERROR);reset_pair(&p,0);feed(&p,in,64);finish(&p,1);check_plain(&p,in,64,NULL,0);reset_pair(&p,1);close_pair(&p);if(cap==8)break;
    }
    tag="dictionary-tail-counterexample";init_pair(&p,6,0,15,8);dictionary(&p,(const unsigned char*)"abcdef",6);feed(&p,(const unsigned char*)"Z",1);finish(&p,256);check_plain(&p,(const unsigned char*)"Z",1,(const unsigned char*)"abcdef",6);reset_pair(&p,0);feed(&p,in,64);finish(&p,256);check_plain(&p,in,64,NULL,0);reset_pair(&p,1);close_pair(&p);
    tag="resetkeep-finished-raw";init_pair(&p,6,0,-15,8);feed(&p,in,64);finish(&p,256);check_plain(&p,in,64,NULL,0);
    for(int i=0;i<2;i++)CHECK(api[i].getdict(&p.s[i],hist[i],&hn[i])==Z_OK);CHECK(hn[0]==hn[1]&&!memcmp(hist[0],hist[1],hn[0]));
    keep_pair(&p);feed(&p,in,64);finish(&p,7);check_plain(&p,in,64,hist[0],hn[0]);reset_pair(&p,0);close_pair(&p);
    tag="resetkeep-lookahead-raw";init_pair(&p,6,0,-15,8);feed(&p,in,64);pump(&p,Z_NO_FLUSH,256);CHECK(p.bytes[0].n==0);keep_pair(&p);feed(&p,in,64);finish(&p,31);unsigned char twice[128];memcpy(twice,in,64);memcpy(twice+64,in,64);check_plain(&p,twice,128,NULL,0);reset_pair(&p,0);close_pair(&p);
    tag="resetkeep-empty-wrapped";init_pair(&p,6,0,15,8);feed(&p,NULL,0);finish(&p,256);check_plain(&p,NULL,0,NULL,0);keep_pair(&p);feed(&p,in,64);finish(&p,256);check_plain(&p,in,64,NULL,0);reset_pair(&p,0);close_pair(&p);
    for(int target=0;target<=9;target++){
        tag="cold-parameter-roundtrip";init_pair(&p,6,0,15,8);feed(&p,NULL,0);parameters(&p,target,0);parameters(&p,6,0);feed(&p,in,64);finish(&p,256);check_plain(&p,in,64,NULL,0);reset_pair(&p,0);close_pair(&p);
    }
    for(int strategy=0;strategy<=4;strategy++){
        tag="midstream-strategy-roundtrip";init_pair(&p,6,0,15,8);feed(&p,in,32);pump(&p,Z_NO_FLUSH,31);parameters(&p,6,strategy);parameters(&p,6,0);feed(&p,in+32,32);finish(&p,7);check_plain(&p,in,64,NULL,0);reset_pair(&p,0);close_pair(&p);
    }
    for(int flush=Z_PARTIAL_FLUSH;flush<=Z_BLOCK;flush++)if(flush!=Z_FINISH){
        tag="special-flush";init_pair(&p,6,0,15,8);feed(&p,in,32);pump(&p,flush,31);feed(&p,in+32,32);finish(&p,7);check_plain(&p,in,64,NULL,0);reset_pair(&p,0);close_pair(&p);
    }
    tag="repeated-tiny-long-tiny";init_pair(&p,6,0,15,8);unsigned char *large=malloc(1048576);CHECK(large);for(unsigned j=0;j<1048576;j++)large[j]=(unsigned char)(j*29+(j>>5));
    for(int k=0;k<12;k++){const unsigned char *data=k%3==1?large:in;unsigned n=k%3==1?1048576:64;feed(&p,data,n);finish(&p,4096);check_plain(&p,data,n,NULL,0);reset_pair(&p,n<=64);}free(large);close_pair(&p);
    tag="zero-output-NO_FLUSH";init_pair(&p,6,0,15,8);feed(&p,in,64);CHECK(step(&p,Z_NO_FLUSH,0)==Z_BUF_ERROR);CHECK(api[1].safe(&p.s[1])==0);finish(&p,256);check_plain(&p,in,64,NULL,0);reset_pair(&p,0);close_pair(&p);
    for(unsigned n=0;n<=65;n++){tag="all-short-boundaries";unsigned char shortdata[66];for(unsigned j=0;j<66;j++)shortdata[j]=(unsigned char)(j*29+j/7);init_pair(&p,6,0,15,8);feed(&p,shortdata,n);finish(&p,1);check_plain(&p,shortdata,n,NULL,0);reset_pair(&p,n<=64);close_pair(&p);}
    for(int w=0;w<6;w++)for(int m=0;m<3;m++){tag="window-mem-format-guards";int windows[]={15,-15,31,14,-14,8},mems[]={1,8,9};init_pair(&p,6,0,windows[w],mems[m]);feed(&p,in,64);finish(&p,7);check_plain(&p,in,64,NULL,0);reset_pair(&p,normal_fast(&p,64));close_pair(&p);}
    for(int level=0;level<=9;level++){tag="midstream-level-roundtrip";unsigned char input[1088];for(unsigned j=0;j<sizeof(input);j++)input[j]=(unsigned char)(j*29+j/7);init_pair(&p,level,0,15,8);feed(&p,input,1024);pump(&p,Z_NO_FLUSH,31);parameters(&p,6,0);feed(&p,input+1024,64);finish(&p,7);check_plain(&p,input,sizeof(input),NULL,0);reset_pair(&p,0);close_pair(&p);}
    tag="deflatecopy-clean-and-dictionary";
    for(int dirty=0;dirty<2;dirty++){init_pair(&p,6,0,15,8);if(dirty)dictionary(&p,(const unsigned char*)"abcdef",6);Pair q;memset(&q,0,sizeof(q));q.level=6;q.strategy=0;q.window=15;q.mem=8;int a=api[0].copy(&q.s[0],&p.s[0]),b=api[1].copy(&q.s[1],&p.s[1]);equal(&q,a,b);CHECK(a==Z_OK&&api[1].safe(&q.s[1])==!dirty);feed(&q,in,64);finish(&q,7);check_plain(&q,in,64,dirty?(const unsigned char*)"abcdef":NULL,dirty?6:0);reset_pair(&q,!dirty);close_pair(&q);close_pair(&p);}
}
static void corpus(const char *path,int limited) {
    FILE *f=fopen(path,"r");CHECK(f);char line[5000],name[200],file[4000];unsigned id,count=0;
    while(fgets(line,sizeof(line),f)){CHECK(sscanf(line,"%u %199s %3999s",&id,name,file)==3);FILE *in=fopen(file,"rb");CHECK(in&&!fseek(in,0,SEEK_END));long length=ftell(in);CHECK(length>=0&&!fseek(in,0,SEEK_SET));unsigned char *data=malloc((size_t)length+1);CHECK(data&&fread(data,1,(size_t)length,in)==(size_t)length);fclose(in);
        tag=name;if(limited&&length>4096){free(data);continue;}
        scenario(data,(unsigned)length,0,0);scenario(data,(unsigned)length,0,1);
        if(strstr(name,"-0")||strncmp(name,"size-",5)==0||strncmp(name,"long-",5)==0){for(int scene=1;scene<=9;scene++){tag=name;scenario(data,(unsigned)length,scene,0);}scenario(data,(unsigned)length,4,1);}
        if(length==64){
            for(int level=0;level<=9;level++)for(int strategy=0;strategy<=4;strategy++)for(int raw=0;raw<2;raw++){
                Pair p;tag=name;init_pair(&p,level,strategy,raw?-15:15,8);feed(&p,data,64);finish(&p,256);check_plain(&p,data,64,NULL,0);reset_pair(&p,normal_fast(&p,64));close_pair(&p);
            }
        }
        if(count==0)histories(data);count++;free(data);
    }fclose(f);CHECK(count>0);
}
static void quality(const char *csvpath,const char *datapath,unsigned limit) {
    FILE *f=fopen(csvpath,"r"),*data=fopen(datapath,"rb");CHECK(f&&data);char line[1024];CHECK(fgets(line,sizeof(line),f));unsigned count=0;
    while(count<limit&&fgets(line,sizeof(line),f)){unsigned id,family,n;long off;CHECK(sscanf(line,"%u,%u,%u,%ld",&id,&family,&n,&off)==4&&n<=64);unsigned char input[64];CHECK(!fseek(data,off,SEEK_SET)&&fread(input,1,n,data)==n);tag="quality";Pair p;init_pair(&p,6,0,15,8);
        for(int rep=0;rep<2;rep++){feed(&p,input,n);finish(&p,rep?1:256);check_plain(&p,input,n,NULL,0);reset_pair(&p,1);}close_pair(&p);count++;
    }CHECK(count==limit);fclose(f);fclose(data);
}
int main(int argc,char **argv) {
    CHECK(argc==9);load(&api[0],argv[1],0);load(&api[1],argv[2],1);csv=fopen(argv[3],"wx");blob=fopen(argv[4],"wbx");CHECK(csv&&blob);fputs("seq,case,window,plain_bytes,dict_bytes,compressed_bytes,offset,sparse_count,history_safe\n",csv);
    corpus(argv[5],atoi(argv[8]));quality(argv[6],argv[7],atoi(argv[8])?128:16385);CHECK(allocations[0]==frees_[0]&&allocations[1]==frees_[1]&&fast_expected==*api[1].count);fclose(csv);fclose(blob);
    printf("BACKEND_RESET_PASS records=%lu compared_api_calls=%lu fast_resets=%lu full_resets=%lu allocations_per_backend=%lu requested_bytes_per_backend=%lu stock_inflate_checks=%lu no_timing\n",records,calls,fast_expected,full_expected,allocations[0],requested[0],records);
}
