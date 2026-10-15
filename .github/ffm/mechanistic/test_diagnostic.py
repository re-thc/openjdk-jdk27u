"""Untimed fixtures. These do not launch a JVM or manufacture benchmark results."""
import copy
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

from collect import fixed_plan, gates, one_fork, execute
from prepare import choose_modes
from verify import Invalid, clock_origin, xml_bounds, phase_pairs, code_ranges, classify_pc, pmu_delta, verify_sample_windows, perf_stream, pc_window, sample_pc_windows

def mark(t=2_000_000_000,uptime=1000,phase=6,index=0,edge=0):
    return dict(java0=t,java1=t+100,uptime_ms=uptime,mono0=t+200,mono1=t+300,
                phase=phase,index=index,edge=edge,tid=77,cpu_ns=t,user_us=t//1000,
                system_us=0,nvcsw=1,nivcsw=0,cpu=0,counts=[3,10,10,10,10,10])

def mapping(t=10,addr='0x1000',method='0x1',kind=4,phase=0,seq=1):
    return dict(kind=kind,phase=phase,addr=addr,size=16,method=method,name='root',
                **{'class':'LFixture;'},mono0=t,mono1=t+1,seq=seq)

class Fixtures(unittest.TestCase):
    def pc(self,time,seq=1):
        return dict(record='pc',ip='0x1001',time=time,seq=seq,stream_seq=seq)

    def control(self,time,kind,seq=1):
        return dict(record='perf_control',time=time,type=kind,seq=seq,stream_seq=seq,id='0x1',stream_id='0x1')

    def test_exact_roi_excludes_outer_only_and_end_sample(self):
        sample,pairs=self.sample_fixture()
        pcs=[self.pc(t,i+1) for i,t in enumerate((112,115,120,125,129))]
        w=sample_pc_windows([sample],pairs,pcs,[],code_ranges([mapping()]),True,True)[0]
        self.assertEqual(w['outer']['samples'],5)
        self.assertEqual(w['roi']['samples'],2)
        self.assertEqual(w['roi']['first_sample_ns'],115)
        self.assertEqual(w['roi']['last_sample_ns'],120)
        self.assertFalse(w['roi']['uninterrupted_sampler_usability_proven'])
        self.assertFalse(w['roi']['continuous_executed_bytes_proven'])

    def test_zero_roi_samples_uncertain_despite_lifetime_pcs(self):
        sample,pairs=self.sample_fixture()
        w=sample_pc_windows([sample],pairs,[self.pc(112)],[],[],True,True)[0]
        self.assertEqual(w['outer']['samples'],1)
        self.assertEqual(w['roi']['availability'],'zero_samples_uncertain')
        self.assertEqual(w['roi']['max_sample_free_span_ns'],10)
        self.assertIsNone(w['roi']['max_inter_sample_gap_ns'])

    def test_gap_summary_includes_boundaries(self):
        w=pc_window(0,8_000_000,[self.pc(1_000_000),self.pc(3_000_000,2)],[],[],True,True)
        self.assertEqual(w['leading_gap_ns'],1_000_000)
        self.assertEqual(w['trailing_gap_ns'],5_000_000)
        self.assertEqual(w['max_inter_sample_gap_ns'],2_000_000)
        self.assertEqual(w['max_sample_free_span_ns'],5_000_000)
        self.assertEqual(w['spans_over_nominal_period'],2)

    def test_single_pc_gap_has_no_inter_sample_interval(self):
        w=pc_window(10,30,[self.pc(20)],[],[],True,True)
        self.assertEqual(w['max_sample_free_span_ns'],10)
        self.assertIsNone(w['max_inter_sample_gap_ns'])

    def test_untimed_does_not_invent_roi(self):
        sample,pairs=self.sample_fixture();sample.update(timed=False,wall0=0,wall1=0,cpu0=0,cpu1=0)
        w=sample_pc_windows([sample],pairs,[],[],[],True,False)[0]
        self.assertIsNone(w['roi']);self.assertEqual(w['roi_status'],'not_recorded_untimed')

    def test_throttle_spanning_roi_from_before_window(self):
        w=pc_window(110,130,[],[self.control(100,5),self.control(120,6,2)],[],True,True)
        t=w['throttling']
        self.assertEqual(t['state_at_start'],'reported_throttled')
        self.assertEqual(t['reported_throttled_spans'],[[110,120]])
        self.assertEqual(t['reported_throttled_ns'],10)
        self.assertEqual(len(t['transitions']),1)

    def test_open_throttle_clipped_to_window_end(self):
        w=pc_window(110,130,[],[self.control(120,5)],[],True,True)
        self.assertEqual(w['throttling']['reported_throttled_spans'],[[120,130]])
        self.assertTrue(w['throttling']['open_throttle_at_end'])

    def test_legacy_discarded_controls_are_unknown(self):
        w=pc_window(110,130,[self.pc(120)],[],[],True,False)
        self.assertEqual(w['throttling']['status'],'not_preserved_in_legacy_stream')
        self.assertIsNone(w['throttling']['reported_throttled_ns'])

    def test_no_reported_throttle_never_proves_continuity(self):
        w=pc_window(110,130,[self.pc(120)],[],[],True,True)
        self.assertEqual(w['throttling']['reported_throttled_ns'],0)
        self.assertFalse(w['uninterrupted_sampler_usability_proven'])

    def test_unmatched_unthrottle_retains_uncertainty(self):
        w=pc_window(110,130,[],[self.control(120,6)],[],True,True)
        self.assertEqual(w['throttling']['state_at_start'],'unknown_prefix')
        self.assertEqual(w['throttling']['sequence_anomalies'],['unmatched_unthrottle'])

    def test_v2_perf_sequence_interleaves_controls_and_pcs(self):
        pc=self.pc(120);pc['stream_seq']=2
        a,b=self.control(100,5),self.control(140,6,2);b['stream_seq']=3
        self.assertTrue(perf_stream(dict(version=2,throttle_records_preserved=True,control_loss=0),dict(controls=2,perf_records=3),[pc],[a,b]))

    def test_throttle_loss_rejected(self):
        with self.assertRaises(Invalid):perf_stream(dict(version=2,throttle_records_preserved=True,control_loss=1),dict(controls=0,perf_records=0),[],[])

    def test_throttle_ring_sequence_missing_rejected(self):
        with self.assertRaises(Invalid):perf_stream(dict(version=2,throttle_records_preserved=True,control_loss=0),dict(controls=1,perf_records=2),[],[self.control(100,5)])

    def sample_fixture(self):
        return dict(index=0,timed=True,checksum=45,wall0=115,wall1=125,cpu0=10,cpu1=20), {(7,0):(dict(mono1=110),dict(java0=130,mono0=135))}

    def test_saved_endpoints_synthetic(self):
        sample,pairs=self.sample_fixture();verify_sample_windows([sample],pairs,1,45,True)

    def test_saved_endpoints_outside_boundary_rejected(self):
        sample,pairs=self.sample_fixture();sample['wall0']=109
        with self.assertRaises(Invalid):verify_sample_windows([sample],pairs,1,45,True)

    def test_saved_cpu_endpoints_rejected(self):
        sample,pairs=self.sample_fixture();sample['cpu1']=9
        with self.assertRaises(Invalid):verify_sample_windows([sample],pairs,1,45,True)

    def test_untimed_nonzero_endpoints_rejected(self):
        sample,pairs=self.sample_fixture();sample['timed']=False
        with self.assertRaises(Invalid):verify_sample_windows([sample],pairs,1,45,False)

    def test_saved_endpoint_checksum_rejected(self):
        sample,pairs=self.sample_fixture();sample['checksum']=0
        with self.assertRaises(Invalid):verify_sample_windows([sample],pairs,1,45,True)

    def test_plan_exact_24(self):
        actual=fixed_plan()
        saved=json.loads(Path(__file__).with_name('protocol.json').read_text())['plan']
        self.assertEqual(actual,saved)
        self.assertEqual([r['index'] for r in actual],list(range(24)))
        for b in range(12):self.assertEqual({r['label'] for r in actual if r['block']==b},{'base','control'})

    def test_gates_unit_controls(self):
        rows=[dict(**r,metrics=dict(wall_ns=[100]*10,cpu_ns=[100]*10)) for r in fixed_plan()]
        self.assertTrue(all(r['pass_gate'] for r in gates(rows)))

    def test_gates_no_exclusion_of_outlier(self):
        rows=[dict(**r,metrics=dict(wall_ns=[100]*10,cpu_ns=[100]*10)) for r in fixed_plan()]
        rows[0]['metrics']=dict(wall_ns=[200]*10,cpu_ns=[200]*10)
        self.assertTrue(all(not r['pass_gate'] for r in gates(rows)))

    def test_gates_incomplete_pair(self):
        with self.assertRaises(ValueError):gates([])

    def test_anchor_bounds(self):
        self.assertEqual(clock_origin([mark()]),[999_000_000,1_000_000_100])

    def test_anchor_intersection(self):
        a=mark();b=mark(t=2_500_000_000,uptime=1500)
        self.assertEqual(clock_origin([a,b]),clock_origin([a]))

    def test_anchor_clock_mismatch(self):
        a=mark();a['java1']=a['mono0']+1
        with self.assertRaisesRegex(Invalid,'mismatch'):clock_origin([a])

    def test_anchor_disjoint(self):
        with self.assertRaisesRegex(Invalid,'disjoint'):clock_origin([mark(),mark(t=3_000_000_000)])

    def test_anchor_missing(self):
        with self.assertRaises(Invalid):clock_origin([mark(uptime=-1)])

    def test_xml_rounded_uncertainty(self):
        self.assertEqual(xml_bounds('0.123',[1_000_000_000,1_000_000_100]),[1_122_500_000,1_123_500_100])

    def test_phase_missing_end(self):
        with self.assertRaises(Invalid):phase_pairs([mark()])

    def test_phase_duplicate_start(self):
        with self.assertRaises(Invalid):phase_pairs([mark(),mark()])

    def test_phase_counter_regression(self):
        a=mark();b=mark(t=a['mono0']+1000,edge=1);b['nivcsw']=-1
        with self.assertRaises(Invalid):phase_pairs([a,b])

    def test_phase_thread_changed(self):
        a=mark();b=mark(t=a['mono0']+1000,edge=1);b['tid']=88
        with self.assertRaises(Invalid):phase_pairs([a,b])

    def test_pc_before_callback_unknown(self):
        status,_=classify_pc(dict(ip='0x1001',time=10),code_ranges([mapping()]))
        self.assertEqual(status,'unknown_or_overlapping')

    def test_pc_unique_delivered_mapping_candidate_only(self):
        status,name=classify_pc(dict(ip='0x1001',time=12),code_ranges([mapping()]))
        self.assertEqual(status,'delivered_mapping_candidate');self.assertEqual(name,'LFixture;.root')

    def test_pc_reused_range_ambiguous_without_unload(self):
        r=code_ranges([mapping(),mapping(t=12,method='0x2',seq=2)])
        self.assertEqual(classify_pc(dict(ip='0x1001',time=20),r)[0],'unknown_or_overlapping')

    def test_pc_unload_then_reuse_preserved(self):
        a=mapping();u=mapping(t=15,kind=5,seq=2);b=mapping(t=20,method='0x2',seq=3)
        r=code_ranges([a,u,b])
        self.assertEqual(len(r),2)
        self.assertEqual(classify_pc(dict(ip='0x1001',time=18),r)[0],'unknown_or_overlapping')
        self.assertEqual(classify_pc(dict(ip='0x1001',time=22),r)[0],'delivered_mapping_candidate')

    def test_snapshot_observation_not_new_activation(self):
        r=code_ranges([mapping(),mapping(t=30,phase=1,seq=2)])
        self.assertEqual(len(r),1);self.assertEqual(r[0]['start_delivery'],11);self.assertEqual(r[0]['observations'],[1,2])

    def test_optional_independent(self):
        events=[dict(name='software_cpu_clock_ip_samples',usable_requested_mode=True,nonzero_ip_samples=1,
                     first_monotonic_time=10,last_monotonic_time=11,lost_records=0,malformed=0),
                dict(name='pinned_cycles_instructions_ref_cycles_group',usable_unmultiplexed=False)]
        m=choose_modes(dict(events=events));self.assertTrue(m['pc']);self.assertFalse(m['pmu']);self.assertFalse(m['perf_scheduling'])
        events[0]['lost_records']=1;self.assertFalse(choose_modes(dict(events=events))['pc'])

    def test_pmu_valid_unmultiplexed_fixture(self):
        a=mark();b=mark();b['counts']=[3,20,20,30,40,50]
        self.assertEqual(pmu_delta(a,b)['cycles'],20)

    def test_pmu_multiplexed_fixture_rejected(self):
        a=mark();b=mark();b['counts']=[3,20,19,30,40,50]
        with self.assertRaises(Invalid):pmu_delta(a,b)

    def test_pmu_zero_fixture_rejected(self):
        with self.assertRaises(Invalid):pmu_delta(mark(),mark())

    def test_nonzero_exit_preserved_no_retry(self):
        with tempfile.TemporaryDirectory() as t:
            calls=[]
            def failed(argv,**kwargs):calls.append(argv);return subprocess.CompletedProcess(argv,3)
            with self.assertRaises(RuntimeError):one_fork(['fixture'],Path(t),failed)
            self.assertEqual(len(calls),1)
            self.assertEqual(json.loads((Path(t)/'process.json').read_text())['returncode'],3)

    def test_timeout_preserved_no_retry(self):
        with tempfile.TemporaryDirectory() as t:
            calls=[]
            def failed(argv,**kwargs):calls.append(argv);raise subprocess.TimeoutExpired(argv,180)
            with self.assertRaises(RuntimeError):one_fork(['fixture'],Path(t),failed)
            self.assertEqual(len(calls),1)
            self.assertTrue(json.loads((Path(t)/'process.json').read_text())['timeout'])

    def test_fixed_cohort_stops_on_first_failure(self):
        with tempfile.TemporaryDirectory() as t:
            out=Path(t);(out/'images/base/lib').mkdir(parents=True);(out/'classes').mkdir()
            for name in ('libprobe.so','libtrace_agent.so','images/base/lib/modules'):(out/name).write_bytes(b'fixture')
            (out/'native-symbols.log').write_text('00000010 00000004 T id_i\n')
            (out/'protocol.json').write_text(json.dumps(dict(plan=fixed_plan())))
            image=dict(native_hashes={},modules_sha256=__import__('hashlib').sha256(b'fixture').hexdigest())
            (out/'image.json').write_text(json.dumps(image))
            with patch('collect.check_context',return_value=dict(pc=False,pmu=False)),patch('collect.native_hashes',return_value={}),patch('collect.one_fork',side_effect=RuntimeError('fixture failure')) as one:
                with self.assertRaises(RuntimeError):execute(out)
            self.assertEqual(one.call_count,1)
            status=json.loads((out/'cohort/status.json').read_text())
            self.assertEqual(status['completed'],0);self.assertEqual(status['status'],'STOPPED_FORK_OR_EVIDENCE_FAILURE')

if __name__=='__main__':unittest.main(verbosity=2)
