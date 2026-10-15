#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>
#define C(x) do{if(!(x)){fprintf(stderr,"RESET_PROOF line=%d %s\n",__LINE__,#x);abort();}}while(0)
typedef struct {int(*init)(z_streamp,int,int,int,int,int,const char*,int);int(*def)(z_streamp,int);int(*reset)(z_streamp);int(*end)(z_streamp);unsigned long *fast,*full;unsigned long(*head)(z_streamp),(*prev)(z_streamp);}Api;
static Api a[3];static z_stream z[3];static unsigned char output[3][2048];
static void load(int i,const char*path){void*h=dlopen(path,RTLD_NOW|RTLD_LOCAL);C(h);
#define G(field,name) a[i].field=dlsym(h,"jdk_ng_" name);C(a[i].field)
G(init,"deflateInit2_");G(def,"deflate");G(reset,"deflateReset");G(end,"deflateEnd");
if(i==2){G(fast,"test_sparse_resets");G(full,"test_full_resets");G(head,"test_head_nonzero");G(prev,"test_prev_nonzero");}else C(!dlsym(h,"jdk_ng_test_sparse_resets")&&!dlsym(h,"jdk_ng_test_full_resets"));
#undef G
}
int main(int argc,char**argv){C(argc==5);for(int i=0;i<3;i++){load(i,argv[1+i]);C(a[i].init(&z[i],6,8,15,8,0,ZLIB_VERSION,sizeof(z_stream))==Z_OK);}C(a[2].prev(&z[2])==0&&a[2].head(&z[2])==0);unsigned long passed=0;
for(int n=0;n<=65;n++){unsigned char in[66];for(int j=0;j<66;j++)in[j]=(unsigned char)(j*29+n);for(int i=0;i<3;i++){z[i].next_in=in;z[i].avail_in=n;z[i].next_out=output[i];z[i].avail_out=sizeof(output[i]);C(a[i].def(&z[i],Z_FINISH)==Z_STREAM_END);C(!z[i].avail_in);}C(z[0].total_out==z[1].total_out&&z[0].total_out==z[2].total_out);C(!memcmp(output[0],output[1],z[0].total_out)&&!memcmp(output[0],output[2],z[0].total_out));
unsigned long fast=*a[2].fast,full=*a[2].full;for(int i=0;i<3;i++)C(a[i].reset(&z[i])==Z_OK);C(*a[2].fast-fast==(unsigned long)(n<=64));C(*a[2].full-full==(unsigned long)(n>64));C(!a[2].head(&z[2]));fast=*a[2].fast;full=*a[2].full;
for(int i=0;i<3;i++)C(a[i].reset(&z[i])==Z_OK);C(*a[2].fast==fast&&*a[2].full==full+1&&!a[2].head(&z[2]));passed++;}
for(int i=0;i<3;i++)C(a[i].end(&z[i])==Z_OK);FILE*f=fopen(argv[4],"wx");C(f);C(fprintf(f,"{\"cases\":%lu,\"first_sparse_0_through_64\":true,\"65_full_fallback\":true,\"second_public_reset_full_every_case\":true,\"head_empty_every_reset\":true,\"prev_initialized_on_create\":true,\"public_N_S_verifier_bytes_equal\":true,\"public_libraries_no_test_counters\":true,\"timing\":false}\n",passed)>0&&!fclose(f));puts("SECOND_PUBLIC_RESET_FULL_PASS cases=66 no_timing");return 0;}
