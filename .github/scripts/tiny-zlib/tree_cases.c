#include "TREE_SOURCE"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef COUNT_TREE
#include "valgrind/callgrind.h"
#endif
static unsigned state;
static unsigned rnd(void){state^=state<<13;state^=state>>17;state^=state<<5;return state;}
static void one(int kind,int count,int order,int domain,int trial){deflate_state s;memset(&s,0,sizeof(s));zng_tr_init(&s);tree_desc*d=kind==0?&s.l_desc:kind==1?&s.d_desc:&s.bl_desc;int elems=d->stat_desc->elems;ct_data*t=d->dyn_tree;unsigned freq[L_CODES];state=0x9e3779b9u+(unsigned)trial*317+count*11+kind;
for(int i=0;i<elems;i++)t[i].Freq=0;
for(int i=0;i<count;i++){unsigned f;if(order==0)f=i+1;else if(order==1)f=count-i;else if(order==2)f=7;else f=rnd()%count+1;
 if(kind==0){/* Keep full-literal totals below the 16K symbol budget. */if(order<2)f=(f-1)/16+1;if(domain&&i%23==0)f+=256;}
 else if(domain)f+=256;
 freq[i]=f;}
/* Highest node for one leaf exercises forced nodes appended out of node order.
 * Otherwise scan by node index, letting descending frequencies stress insertion. */
for(int i=0;i<count;i++){int node=count==1&&trial%2?elems-1:i;t[node].Freq=freq[i];}
#ifdef COUNT_TREE
CALLGRIND_TOGGLE_COLLECT;
#endif
build_tree(&s,d);
#ifdef COUNT_TREE
CALLGRIND_TOGGLE_COLLECT;
#endif
fwrite(&d->max_code,sizeof(d->max_code),1,stdout);fwrite(&s.opt_len,sizeof(s.opt_len),1,stdout);fwrite(&s.static_len,sizeof(s.static_len),1,stdout);for(int i=0;i<elems;i++){fwrite(&t[i].Len,2,1,stdout);fwrite(&t[i].Code,2,1,stdout);}}
int main(int argc,char**argv){if(argc==5){for(int trial=0;trial<100;trial++)one(atoi(argv[1]),atoi(argv[2]),atoi(argv[3]),atoi(argv[4]),trial);return ferror(stdout)?1:0;}
for(int kind=0;kind<3;kind++){int elems=kind==0?L_CODES:kind==1?D_CODES:BL_CODES;int sizes[]={0,1,2,8,16,17,19,30,elems};for(int si=0;si<9;si++){int n=sizes[si];if(n>elems)continue;int duplicate=0;for(int j=0;j<si;j++)if(sizes[j]==n)duplicate=1;if(duplicate)continue;for(int order=0;order<4;order++)for(int domain=0;domain<2;domain++)for(int trial=0;trial<100;trial++)one(kind,n,order,domain,trial);}}return ferror(stdout)?1:0;}
