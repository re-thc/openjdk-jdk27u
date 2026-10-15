/* Synthetic byte-ring fixture only. No JVM, perf_event_open, or workload run. */
#include "trace_agent.c"
#include <assert.h>

static _Alignas(8) unsigned char fake_ring[8192];
static uint64_t cursor;

static void reset_ring(void) {
    memset(fake_ring,0,sizeof(fake_ring));
    pc_mapping=fake_ring;pc_mapping_size=sizeof(fake_ring);
    struct perf_event_mmap_page *m=pc_mapping;
    m->data_offset=4096;m->data_size=4096;
    /* Exercise a header and payload split across the ring boundary. */
    cursor=4091;m->data_tail=cursor;
    pc_count=control_count=0;perf_count=0;
    pc_loss=control_loss=malformed=0;
}

static void append(uint32_t type,const uint64_t *values,size_t count) {
    struct perf_event_header h={type,0,(uint16_t)(sizeof(h)+count*sizeof(*values))};
    const unsigned char *p=(const unsigned char*)&h;
    for(size_t i=0;i<sizeof(h);i++)fake_ring[4096+cursor++%4096]=p[i];
    p=(const unsigned char*)values;
    for(size_t i=0;i<count*sizeof(*values);i++)fake_ring[4096+cursor++%4096]=p[i];
    ((struct perf_event_mmap_page*)pc_mapping)->data_head=cursor;
}

int main(int argc,char **argv) {
    assert(argc==2);
    uint64_t throttle[]={100,0x1122334455667788ULL,0x8877665544332211ULL};
    uint64_t sample[]={0xbeef,((uint64_t)77<<32)|77,120,0};
    uint64_t unthrottle[]={140,throttle[1],throttle[2]};
    reset_ring();
    append(PERF_RECORD_THROTTLE,throttle,3);
    append(PERF_RECORD_SAMPLE,sample,4);
    append(PERF_RECORD_UNTHROTTLE,unthrottle,3);
    drain_pc();
    assert(control_count==2&&pc_count==1&&perf_count==3&&!malformed&&!control_loss&&!pc_loss);
    assert(controls[0].type==PERF_RECORD_THROTTLE&&controls[0].time==100);
    assert(controls[0].id==throttle[1]&&controls[0].stream_id==throttle[2]);
    assert(controls[0].stream_seq==1&&pcs[0].stream_seq==2&&controls[1].stream_seq==3);
    assert(controls[1].type==PERF_RECORD_UNTHROTTLE&&controls[1].time==140);
    assert(pcs[0].ip==0xbeef&&pcs[0].time==120&&pcs[0].tid==77);
    assert(((struct perf_event_mmap_page*)pc_mapping)->data_tail==cursor);
    want_pc=1;snprintf(output_path,sizeof(output_path),"%s",argv[1]);
    assert(write_output()==0);
    reset_ring();append(PERF_RECORD_THROTTLE,throttle,2);drain_pc();
    assert(malformed==1&&control_count==0&&perf_count==0);
    reset_ring();control_count=CONTROL_CAP;
    append(PERF_RECORD_THROTTLE,throttle,3);drain_pc();
    assert(control_loss==1&&control_count==CONTROL_CAP&&perf_count==1);
    puts("{\"synthetic_fixture\":true,\"cases_passed\":3,\"jvm_runs\":0,\"perf_event_open_calls\":0}");
    return 0;
}
