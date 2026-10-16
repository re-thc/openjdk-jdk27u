"""Synthetic collector/protocol tests. Never launches or reads native counters."""
from pathlib import Path
import csv,json,tempfile,unittest,zlib
from unittest.mock import patch
import assignment as A
import timing_model as M

def write_csv(path,rows):
    with Path(path).open('w',newline='') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows)

def fixture(out):
    out=Path(out);A.write_plan(out);A.dump(out/'origin.json',dict(record_origin='SYNTHETIC_UNIT_TEST'))
    A.dump(out/'execution.json',dict(timeout=False,returncode=0,retries=0,last_stage='finish',protocol_error=None))
    (out/'native-stdout.log').write_bytes(b'MEASUREMENT_START\nMEASUREMENT_END\n')
    meta=dict(stream=[4096,4224],state=[8192,16384],output=32768,def_entry=65536,reset_entry=65600,cpu=3)
    A.dump(out/'native-metadata.json',meta);A.dump(out/'preflight.json',dict(status='AVAILABLE_GENERIC_EVENTS',event_ids=[100,101,102],user_only=True,exclude_hv=True,probe_enabled_ns=1000,probe_running_ns=1000,reference_event='PERF_COUNT_HW_REF_CPU_CYCLES',host_reference_semantics_verified=False))
    inputs,banks=A.corpus();refs=[]
    for i,b in enumerate(banks):
        compressed=zlib.compress(b);(out/f'compressed-{i}.bin').write_bytes(compressed);refs.append(len(compressed))
    raw=[];counters=[];origin=10**12;previous=origin;anchor=origin;enabled=0;counts=[0,0,0]
    def interval(row,kind,w0,w1):
        nonlocal enabled,counts
        fields=dict(row=row,kind=kind,read0=w0-30,read1=w0-28,enable0=w0-26,enable1=w0-24,
            c0=w0-origin,w0=w0,w1=w1,c1=w1-origin,disable0=w1+2,disable1=w1+4,read2=w1+6,read3=w1+8)
        delta=w1-w0+30;fields.update(enabled_before=enabled,enabled_after=enabled+delta,running_before=enabled,running_after=enabled+delta);enabled+=delta
        for k,mul,j in [('cycles',3,0),('instructions',2,1),('reference',2,2)]:
            fields[k+'_before']=counts[j];counts[j]+=delta*mul;fields[k+'_after']=counts[j]
        counters.append(fields);return fields
    for p in A.plan_rows():
        if p['position']==0:anchor=previous+100_000;previous=anchor
        target=previous+p['gap_ns'];warm=interval(p['row'],'warm',previous+1_000,previous+10_001_000)
        prep=interval(p['row'],'prep',warm['read3']+100,warm['read3']+200_100);fixed=prep['read3']+10
        pad=interval(p['row'],'padding',fixed+100,target-20_000)
        timed=interval(p['row'],'timed',target,target+64_000)
        raw.append(dict(p,anchor_ns=anchor,target_start_ns=target,fixed_work_end_ns=fixed,
            warm_operations=3328,prep_operations=8,operations=64,
            begin_ns=timed['w0'],end_ns=timed['w1'],cpu_begin_ns=timed['c0'],cpu_end_ns=timed['c1'],
            warm_sum=13*sum(refs[i] for i in inputs['warm_ring']),prep_sum=sum(refs[132:]),timed_sum=8*sum(refs[132:]),last_input=139,output_bytes=refs[139],
            stream=meta['stream'][p['slot']],state=meta['state'][p['slot']],output=meta['output'],def_entry=meta['def_entry'],reset_entry=meta['reset_entry'],cpu_before=3,cpu_after=3,voluntary=0,involuntary=0,minor=0,major=0))
        previous=timed['w1']
    A.dump(out/'measurement-window.json',dict(start_ns=origin,deadline_ns=origin+900000000000))
    A.dump(out/'correctness.json',dict(before=280,after=280,final_row_inflates=192,bytes_equal=True,measurement_end_ns=previous+10000))
    A.dump(out/'native-status.json',dict(status='COMPLETE',rows=192,measurement_start_ns=origin,end_ns=previous+20000))
    write_csv(out/'rows.csv',raw);write_csv(out/'counters.csv',counters);return raw,counters

class AssignmentTests(unittest.TestCase):
    def test_native_window_inclusive_endpoint_equalities(self):
        for right_edge in ['counter_end','deadline']:
            with self.subTest(right_edge=right_edge),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';rows,counters=fixture(p);window=A.read(p/'measurement-window.json');correct=A.read(p/'correctness.json');native=A.read(p/'native-status.json')
                counters[0]['read0']=window['start_ns']
                correct['measurement_end_ns']=counters[-1]['read3'] if right_edge=='counter_end' else window['deadline_ns']
                native['end_ns']=correct['measurement_end_ns']
                write_csv(p/'counters.csv',counters);A.dump(p/'correctness.json',correct);A.dump(p/'native-status.json',native)
                A.audit(p);r=A.read(p/'result.json');self.assertTrue(r['telemetry_valid'] and r['delivery_valid'])

    def test_native_window_fields_are_mandatory(self):
        for filename,field in [('native-status.json','measurement_start_ns'),('native-status.json','end_ns'),('measurement-window.json','start_ns'),('measurement-window.json','deadline_ns'),('correctness.json','measurement_end_ns')]:
            with self.subTest(filename=filename,field=field),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';fixture(p);v=A.read(p/filename);del v[field];A.dump(p/filename,v)
                with self.assertRaises((ValueError,KeyError)):A.audit(p)
                r=A.read(p/'result.json');self.assertEqual(r['labels'],['INDETERMINATE'])
                self.assertFalse(r['assignment_response'] or r['bounded_response'])

    def test_native_window_endpoint_negatives(self):
        for boundary in ['native_start_mismatch','first_read_before_start','last_read_after_measurement_end','measurement_end_after_deadline','measurement_end_after_native_completion','native_start_noninteger','native_completion_noninteger']:
            with self.subTest(boundary=boundary),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';rows,counters=fixture(p);native=A.read(p/'native-status.json');window=A.read(p/'measurement-window.json');correct=A.read(p/'correctness.json')
                if boundary=='native_start_mismatch':native['measurement_start_ns']+=1
                elif boundary=='first_read_before_start':counters[0]['read0']=window['start_ns']-1
                elif boundary=='last_read_after_measurement_end':correct['measurement_end_ns']=counters[-1]['read3']-1
                elif boundary=='measurement_end_after_deadline':correct['measurement_end_ns']=window['deadline_ns']+1;native['end_ns']=window['deadline_ns']+2
                elif boundary=='measurement_end_after_native_completion':native['end_ns']=correct['measurement_end_ns']-1
                elif boundary=='native_start_noninteger':native['measurement_start_ns']=float(native['measurement_start_ns'])
                else:native['end_ns']=None
                A.dump(p/'native-status.json',native);A.dump(p/'correctness.json',correct);write_csv(p/'counters.csv',counters)
                with self.assertRaises(ValueError):A.audit(p)
                r=A.read(p/'result.json');self.assertFalse(r['assignment_response'] or r['bounded_response']);self.assertTrue(r['indeterminate'])

    def test_saved_terminal_protocol_mismatch_rejected(self):
        for body in [b'MEASUREMENT_START\n',b'MEASUREMENT_START\nMEASUREMENT_END\npartial']:
            with self.subTest(body=body),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';fixture(p);(p/'native-stdout.log').write_bytes(body);A.audit(p)
                self.assertEqual(A.read(p/'result.json')['labels'],['INDETERMINATE'])

    def test_saved_protocol_error_terminal_stage_and_retries_cannot_complete(self):
        for change in [dict(protocol_error='unexpected native line'),dict(last_stage='measurement'),dict(retries=1)]:
            with self.subTest(change=change),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';fixture(p);receipt=dict(A.read(p/'execution.json'),**change);A.dump(p/'execution.json',receipt)
                before=(p/'execution.json').read_bytes();A.audit(p);r=A.read(p/'result.json')
                self.assertEqual(r['status'],'INCOMPLETE_OR_INVALID');self.assertEqual(r['labels'],['INDETERMINATE'])
                self.assertFalse(r['assignment_response'] or r['bounded_response']);self.assertEqual(before,(p/'execution.json').read_bytes())

    def test_saved_failure_survives_repaired_receipt_and_reaudit(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';fixture(p);A.audit(p);positive=(p/'result.json').read_bytes()
            A.dump(p/'execution.json',dict(A.read(p/'execution.json'),protocol_error='saved failure'));A.audit(p)
            failed=(p/'result.json').read_bytes()
            self.assertEqual((p/'result-before-rejection.json').read_bytes(),positive)
            A.dump(p/'execution.json',dict(A.read(p/'execution.json'),protocol_error=None));A.audit(p)
            self.assertFalse(A.read(p/'result.json')['bounded_response'])
            self.assertIn('saved_failed_result_cannot_be_promoted',A.read(p/'result.json')['reasons'])
            history=[json.loads(line) for line in (p/'audit-rejections.jsonl').read_text().splitlines()]
            self.assertEqual(len(history),2)
            import base64
            self.assertEqual(base64.b64decode(history[1]['previous_result_base64']),failed)

    def test_saved_collector_error_and_missing_terminal_fields_rejected(self):
        for field in ['protocol_error','last_stage','retries','driver-error']:
            with self.subTest(field=field),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';fixture(p)
                if field=='driver-error':A.dump(p/'driver-error.json',dict(error='recorded collector failure'))
                else:
                    e=A.read(p/'execution.json');del e[field];A.dump(p/'execution.json',e)
                A.audit(p);self.assertEqual(A.read(p/'result.json')['status'],'INCOMPLETE_OR_INVALID')

    def test_disabled_snapshot_jump_in_each_counter_is_invalid(self):
        for key in ['enabled','running','cycles','instructions','reference']:
            with self.subTest(key=key),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';_,c=fixture(p)
                # Shift this and EVERY subsequent snapshot equally, preserving
                # all per-bracket deltas and monotonicity; only continuity fails.
                for v in c[7:]:v[key+'_before']+=1000000;v[key+'_after']+=1000000
                write_csv(p/'counters.csv',c);A.audit(p);r=A.read(p/'result.json')
                self.assertFalse(r['telemetry_valid'] or r['assignment_response'] or r['bounded_response'])
                self.assertTrue(any(x.get('reason')=='disabled_counter_discontinuity' for x in r['counter_invalid']))
                self.assertEqual(len(A.table(p/'counters.csv')),768)

    def test_complete_bracket_overlap_after_inner_interval_is_invalid(self):
        for index in [0,3]:
            with self.subTest(boundary=index),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';_,c=fixture(p)
                # Both within-row and across-row: the inner w1 is earlier,
                # but the complete read-after bracket extends into next read0.
                c[index]['read3']=c[index+1]['read0']+1;write_csv(p/'counters.csv',c);A.audit(p);r=A.read(p/'result.json')
                self.assertFalse(r['telemetry_valid'] or r['assignment_response'] or r['bounded_response'])
                self.assertTrue(any(x.get('reason')=='overlapping_complete_counter_brackets' for x in r['counter_invalid']))

    def test_generic_reference_event_does_not_claim_frequency_semantics(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';fixture(p);A.audit(p);r=A.read(p/'result.json')
            self.assertFalse(r['host_reference_semantics_verified'] or r['frequency_inference_supported'])
            self.assertTrue(all('cycles_reference_ratio' not in x and not x['frequency_semantics_verified'] for x in r['hardware_brackets']))

    def test_preflight_refusal_ids_scope_and_multiplexing(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';fixture(p);good=A.read(p/'preflight.json');self.assertTrue(A.preflight_available(good))
            for change in [dict(status='PREFLIGHT_UNAVAILABLE',errno=13),dict(event_ids=[100,100,102]),dict(user_only=False),dict(probe_running_ns=999),dict(probe_enabled_ns=0)]:
                self.assertFalse(A.preflight_available(dict(good,**change)))

    def test_default_plan_has_no_subprocess_or_native_execution(self):
        with tempfile.TemporaryDirectory() as d,patch.object(A.subprocess,'run',side_effect=AssertionError('native')),patch.object(A.subprocess,'Popen',side_effect=AssertionError('native')):
            out=A.write_plan(Path(d)/'plan');self.assertEqual((out/'plan.tsv').read_bytes(),A.plan_bytes())
            with self.assertRaises(FileExistsError):A.write_plan(out)

    def test_complete_synthetic_pipeline(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';fixture(p);before=(p/'rows.csv').read_bytes();A.audit(p);r=A.read(p/'result.json')
            self.assertEqual((r['rows'],r['counter_records']),(192,768));self.assertEqual(r['record_origin'],'SYNTHETIC_UNIT_TEST')
            self.assertTrue(r['delivery_valid'] and r['telemetry_valid']);self.assertTrue(r['bounded_response']);self.assertFalse(r['qualification'])
            self.assertEqual(before,(p/'rows.csv').read_bytes())

    def test_no_expansion_duplicates_or_reordering(self):
        for mutation in ['append','duplicate','reorder']:
            with self.subTest(mutation=mutation),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';rows,_=fixture(p)
                if mutation=='append':rows.append(dict(rows[-1]))
                elif mutation=='duplicate':rows[1]=dict(rows[0])
                else:rows[0],rows[1]=rows[1],rows[0]
                write_csv(p/'rows.csv',rows)
                if mutation=='append':A.audit(p);self.assertEqual(A.read(p/'result.json')['status'],'INCOMPLETE_OR_INVALID')
                else:
                    with self.assertRaises(ValueError):A.audit(p)

    def test_multiplex_or_zero_counter_retained_and_indeterminate(self):
        for field in ['running_after','instructions_after']:
            with self.subTest(field=field),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';_,v=fixture(p);v[2][field]=v[2][field.replace('after','before')];write_csv(p/'counters.csv',v)
                A.audit(p);r=A.read(p/'result.json');self.assertFalse(r['telemetry_valid']);self.assertTrue(r['indeterminate'])
                self.assertEqual(len(A.table(p/'counters.csv')),768)

    def test_delivery_rejects_wrong_programmed_target_not_duration(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';rows,_=fixture(p);rows[0]['target_start_ns']+=1;write_csv(p/'rows.csv',rows)
            A.audit(p);self.assertFalse(A.read(p/'result.json')['delivery_valid'])

    def test_actual_rate_uses_duration_not_supplied_y(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';rows,v=fixture(p);i=191;delta=400000
            rows[i]['end_ns']+=delta;rows[i]['cpu_end_ns']+=delta
            timed=v[4*i+3]
            for key in ['w1','c1','disable0','disable1','read2','read3']:timed[key]+=delta
            for key,mul in [('enabled_after',1),('running_after',1),('cycles_after',3),('instructions_after',2),('reference_after',2)]:timed[key]+=delta*mul
            correct=A.read(p/'correctness.json');correct['measurement_end_ns']+=delta;A.dump(p/'correctness.json',correct)
            native=A.read(p/'native-status.json');native['end_ns']+=delta;A.dump(p/'native-status.json',native)
            write_csv(p/'rows.csv',rows);write_csv(p/'counters.csv',v);A.audit(p)
            r=A.read(p/'result.json');self.assertTrue(r['delivery_valid'])
            self.assertNotEqual(r['blocks'][7]['raw_ns_per_op'][M.CONDITIONS[rows[i]['condition']]],0)

    def test_wrong_work_sum_entry_or_overlap_rejected(self):
        for field in ['warm_sum','operations','state','cpu_after','begin_ns']:
            with self.subTest(field=field),tempfile.TemporaryDirectory() as d:
                p=Path(d)/'data';rows,_=fixture(p);rows[4][field]+=1;write_csv(p/'rows.csv',rows)
                with self.assertRaises(ValueError):A.audit(p)

    def test_partial_timeout_preserved_not_qualified(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'data';rows,v=fixture(p);write_csv(p/'rows.csv',rows[:4]);write_csv(p/'counters.csv',v[:16])
            A.dump(p/'execution.json',dict(timeout=True,returncode=-9,retries=0));A.audit(p);r=A.read(p/'result.json')
            self.assertEqual((r['status'],r['rows']),('INCOMPLETE_OR_INVALID',4));self.assertFalse(r['qualification'])

    def test_gate_rejects_local_dispatch_repeat_and_forced_event(self):
        e=dict(repository=dict(full_name='re-thc/openjdk-jdk27u'),ref='refs/tags/'+A.TAG,created=True,deleted=False,forced=False,before='0'*40,after='a'*40)
        env=dict(GITHUB_ACTIONS='true',GITHUB_EVENT_NAME='push',GITHUB_REPOSITORY='re-thc/openjdk-jdk27u',GITHUB_REF_TYPE='tag',GITHUB_REF=e['ref'],GITHUB_RUN_ATTEMPT='1',GITHUB_SHA='a'*40)
        self.assertEqual(A.authorize(env,e)['attempt'],1)
        for key,value in [('GITHUB_ACTIONS','false'),('GITHUB_EVENT_NAME','workflow_dispatch'),('GITHUB_RUN_ATTEMPT','2')]:
            with self.assertRaises(ValueError):A.authorize(dict(env,**{key:value}),e)
        with self.assertRaises(ValueError):A.authorize(env,dict(e,forced=True))

if __name__=='__main__':unittest.main(verbosity=2)
