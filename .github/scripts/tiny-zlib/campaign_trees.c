/* Test image only. The backend trees.c source remains unchanged. */
#include "TREE_SOURCE"
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
static deflate_state states[100];
static tree_desc *descs[100];
static void (*volatile entry)(deflate_state *, tree_desc *) = build_tree;
static unsigned random_state;
static unsigned rnd(void) { random_state^=random_state<<13;random_state^=random_state>>17;random_state^=random_state<<5;return random_state; }
void campaign_tree_prepare(int kind,int count,int order,int domain) {
    for(int trial=0;trial<100;trial++) {
        deflate_state *s=&states[trial];memset(s,0,sizeof(*s));zng_tr_init(s);
        tree_desc *d=kind==0?&s->l_desc:kind==1?&s->d_desc:&s->bl_desc;descs[trial]=d;
        int elems=d->stat_desc->elems;ct_data *t=d->dyn_tree;unsigned freq[L_CODES];
        if(count>elems)abort();
        random_state=0x9e3779b9u+(unsigned)trial*317+count*11+kind;
        for(int i=0;i<elems;i++)t[i].Freq=0;
        for(int i=0;i<count;i++) {
            unsigned f=order==0?(unsigned)i+1:order==1?(unsigned)(count-i):order==2?7:rnd()%(unsigned)count+1;
            if(kind==0){if(order<2)f=(f-1)/16+1;if(domain&&i%23==0)f+=256;}
            else if(domain)f+=256;
            freq[i]=f;
        }
        for(int i=0;i<count;i++){int node=count==1&&trial%2?elems-1:i;t[node].Freq=freq[i];}
    }
}
void campaign_tree_run(void) {for(int trial=0;trial<100;trial++)entry(&states[trial],descs[trial]);}
uint64_t campaign_tree_digest(void) {
    uint64_t h=1469598103934665603ULL;
    for(int trial=0;trial<100;trial++) {
        deflate_state *s=&states[trial];tree_desc *d=descs[trial];ct_data *t=d->dyn_tree;
        h=(h^(uint64_t)d->max_code)*1099511628211ULL;h=(h^(uint64_t)s->opt_len)*1099511628211ULL;h=(h^(uint64_t)s->static_len)*1099511628211ULL;
        for(int i=0;i<d->stat_desc->elems;i++){h=(h^t[i].Len)*1099511628211ULL;h=(h^t[i].Code)*1099511628211ULL;}
    }return h;
}
void *campaign_tree_code_address(void) {return (void *)entry;}
void *campaign_tree_state_address(void) {return (void *)states;}
