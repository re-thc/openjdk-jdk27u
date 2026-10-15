"""Pure SYNTHETIC_UNIT_TEST fixtures. Never compiles, loads or measures native code."""
from pathlib import Path
import collections,copy,csv,hashlib,importlib.util,json,shutil,tempfile,unittest
from unittest import mock
import conditioning_protocol as P
import conditioning_score as S
import conditioning_study as C
HERE=Path(__file__).resolve().parent

def fixture(short=200,long=0,label_bias=0,slot_curve=False,wide_long=False):
    """Temporal cost model only; labels never select a real native API."""
    inputs,works,_=P.canonical('/SYNTHETIC_UNIT_TEST')
    ep,plan,commands=P.plans()
    m=dict(protocol=P.spec(),protocol_fingerprint=P.fingerprint(),record_origin='SYNTHETIC_UNIT_TEST',inputs=inputs,workloads=works,
           plan_hashes={n:hashlib.sha256(P.tsv(v,f)).hexdigest() for n,v,f in [('episodes.tsv',ep,P.EPISODE_FIELDS),('rows.tsv',plan,P.ROW_FIELDS),('commands.tsv',commands,P.COMMAND_FIELDS)]},balance=P.balance(ep),scope=P.SCOPE)
    metadata={};checks={};refs={}
    for w in P.WORKERS:
        a=1048576*(w+1)
        metadata[w]=dict(protocol=P.VERSION,worker=w,image='unchanged-N',sizeof_stream=112,allocator_trace=False,before_checks=264,
            timer_layout='CPU0,MONO0,operations,MONO1,CPU1',mono_resolution_ns=1,cpu_resolution_ns=1,cpu_pin=3,
            stream=a,state=a+4096,output=a+8192,def_entry=a+12288,reset_entry=a+16384)
        checks[w]=dict(worker=w,before_checks=264,after_checks=264,all_outputs_equal=True,batches=2048,resets=512,prefixes=512)
        for i in range(264):refs[w,i]=20+i%31
    rows=[];events=[];clocks=[];now=1000000
    for cmd in commands:
        e=ep[cmd['episode']];w=cmd['worker'];op=cmd['opcode'];work=e['work']^(op==1)
        ops=0 if op==0 else 3072 if op==1 else 512
        ring=sum(refs[w,i] for i in works[work]['banks']);start=now+100;now=start+10
        if op==0:
            for kind in ['mono_pair','legacy_nested','empty_batch']:
                clocks.append(dict(command=cmd['command'],worker=w,episode=e['episode'],kind=kind,operations=512 if kind=='empty_batch' else 128,
                    wall_ns=400,cpu_ns=500,outer_wall_ns=600,begin_ns=now,end_ns=now+600));now+=700
        elif op==1:now+=10000
        else:
            p=plan[cmd['row']];pos=p['position'];condition=p['condition'];block=p['block']
            amplitude=(short if condition==0 else long)+(block%8-3.5)/8
            if slot_curve:amplitude=50*(e['worker_slot']**2+3*e['time_slot'])
            if wide_long and condition==1:amplitude=600*(-1 if block%2 else 1)
            curvature=[1,-1,-1,1][pos]
            # Common temporal nuisance plus a synthetic label-bias failure fixture.
            cost=3000+w*11+work*7+block*3+5*pos+amplitude*curvature/2+label_bias*(p['label']==0)
            wall=round(cost*512);warm_ns=p['warm']*3000;warm0=now;now+=warm_ns;begin=now+100;end=begin+wall;now=end+100
            r=dict(p,command=cmd['command'],wall_ns=wall,cpu_ns=wall+20,begin_ns=begin,end_ns=end,cpu_begin_ns=begin-10,cpu_end_ns=end+10,
                warm_wall_ns=warm_ns,warm_cpu_ns=warm_ns+20,warm_begin_ns=warm0,warm_end_ns=warm0+warm_ns,warm_cpu_begin_ns=warm0-10,warm_cpu_end_ns=warm0+warm_ns+10,
                warm_sum=ring*(p['warm']//256),output_sum=2*ring,output_bytes=refs[w,works[work]['banks'][-1]],last_input=works[work]['banks'][-1],operations=512,bank_phase=0,extra=0,
                **{k:metadata[w][k] for k in ['stream','state','output','def_entry','reset_entry']},
                **{prefix+k:0 for prefix in ['','w_'] for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']})
            rows.append(r)
        now+=100
        events.append(dict(command=cmd['command'],worker=w,opcode=op,episode=e['episode'],work=work,operations=ops,output_sum=ring*(ops//256),
            begin_ns=start,end_ns=now,cpu_begin_ns=start-10,cpu_end_ns=now+10,cpu_before=3,cpu_after=3,
            **{k:metadata[w][k] for k in ['stream','state','output','def_entry','reset_entry']}))
    return m,rows,events,clocks,metadata,checks,refs

def calculate(fx):return S.score_records(*fx)

class PlanTests(unittest.TestCase):
    def test_dimensions_full_crossing_and_linear_time(self):
        ep,rows,commands=P.plans();audit=P.balance(ep)
        self.assertEqual((len(ep),len(rows),len(commands)),(4096,16384,24576))
        self.assertEqual(audit['joint_cells'],4096)
        self.assertTrue(audit['main_and_count_order_factors_linear_block_time_balanced'])
        old=copy.deepcopy(ep);old[0]['condition']^=1
        with self.assertRaisesRegex(P.InvalidData,'plan changed'):P.balance(old)
    def test_full_bank_ring_and_original_history_counterexample(self):
        _,works,_=P.canonical('/SYNTHETIC')
        for w in works:
            for count in [256,3328,512,3072]:
                self.assertEqual(collections.Counter(w['banks'][j%256] for j in range(count)),collections.Counter({i:n*(count//256) for i,n in collections.Counter(w['banks']).items()}))
        old_history=[256+768*i for i in range(8)]
        self.assertEqual(old_history,[256,1024,1792,2560,3328,4096,4864,5632])
        self.assertEqual(old_history[4]-old_history[0],3072)
        ep,rows,commands=P.plans()
        for e in ep:
            cs=commands[e['episode']*6:e['episode']*6+6]
            self.assertEqual([c['opcode'] for c in cs],[0,1,2,2,2,2])
            self.assertEqual([c['worker'] for c in cs],[e['worker'],e['companion']]+[e['worker']]*4)
            self.assertEqual([r['warm'] for r in rows[4*e['episode']:4*e['episode']+4]],[P.WARM[e['condition']]]*4)
    def test_native_source_one_api_no_label_dispatch_and_fixed_bookkeeping(self):
        s=(HERE/'conditioning_driver.c').read_text()
        self.assertEqual(s.count('api.def(&stream,Z_FINISH)'),1)
        self.assertIn('int label=(pos==0||pos==3)?e->order:!e->order;',s)
        self.assertNotIn('if(label',s);self.assertNotIn('Z_NO_FLUSH',s)
        self.assertIn('wc0=ns(CLOCK_THREAD_CPUTIME_ID),w0=ns(CLOCK_MONOTONIC)',s)
        self.assertIn('t1=ns(CLOCK_MONOTONIC),tc1=ns(CLOCK_THREAD_CPUTIME_ID)',s)
        self.assertEqual(P.sha(HERE.parent/'reset-only/backend-reset.patch'),P.PATCH)
        self.assertEqual(P.sha(HERE.parent/'reset-only/source-pins.json'),P.PINS)
    def test_default_is_plan_only(self):
        with tempfile.TemporaryDirectory() as td,mock.patch('sys.argv',['conditioning_study.py','--out',td]),mock.patch.object(C,'prepare',side_effect=AssertionError('native forbidden')):
            self.assertEqual(C.main(),0);self.assertEqual(json.loads((Path(td)/'manifest.json').read_text())['record_origin'],'PLAN_ONLY_NOT_MEASURED')
    def test_reporting_repair_preserves_gate_math_and_distinguishes_failed_order(self):
        legacy=C.module('legacy_report_fixture',HERE.parent/'reset-only/reset-score.py')
        # Reconstruct the retained failed cell's two exact vectors; no measurement.
        abba=[31.0634765625,4.7158203125,54.3388671875,-10.015625,29.9970703125,-1.505859375,20.705078125,4.6044921875,26.681640625,.4423828125,39.0322265625,-11.04296875]
        baab=[-21.751953125,-38.681640625,-.8798828125,-38.1337890625,-30.9853515625,-44.912109375,-4.2265625,-16.2841796875,5.955078125,-19.31640625,-7.373046875,-359.087890625]
        pooled=legacy.interval([(a+b)/2 for a,b in zip(abba,baab)])
        x=dict(wall=pooled,order=dict(ABBA=legacy.interval(abba),BAAB=legacy.interval(baab)),passed=False,pooled_gate_passed=True)
        before=copy.deepcopy(x);description=legacy.describe_control(x)
        self.assertEqual(x,before);self.assertAlmostEqual(pooled['absolute_bound'],51.42753896756892)
        self.assertAlmostEqual(x['order']['BAAB']['absolute_bound'],111.06845706012979)
        self.assertEqual(description['classification'],'order_equivalence_not_established')
        self.assertEqual(description['order_classifications']['BAAB'],'uncertainty_crosses_100ns')
        self.assertEqual(description['gate_classification'],'equivalence_not_established_by_order_bound')

class StatisticalTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):cls.base=fixture();cls.result=calculate(cls.base)
    def test_positive_diagnosis_even_when_legacy_gate_fails(self):
        r=self.result
        self.assertEqual((r['rows'],r['commands'],r['diagnostic_support_count']),(16384,24576,16))
        self.assertGreater(r['failed_legacy_controls'],0)
        self.assertTrue(r['analysis_independent_of_100ns_gate']);self.assertTrue(r['all_rows_retained'])
        self.assertFalse(r['backend_performance_qualified']);self.assertFalse(r['public_api_qualified'])
        self.assertEqual(r['record_origin'],'SYNTHETIC_UNIT_TEST')
    def test_explicit_label_bias_does_not_stop_diagnosis(self):
        r=calculate(fixture(label_bias=150))
        self.assertEqual(r['failed_legacy_controls'],32);self.assertEqual(r['diagnostic_support_count'],16)
    def test_no_conditioning_effect_is_not_called_improvement(self):
        r=calculate(fixture(short=0,long=0))
        self.assertEqual(r['diagnostic_support_count'],0)
        self.assertTrue(all(x['paired_reduction']['mean']==0 for x in r['conditioning_effects']))
    def test_reduction_with_nonzero_residual_is_not_removal(self):
        r=calculate(fixture(long=60))
        self.assertTrue(all(x['reduction_supported'] for x in r['conditioning_effects']))
        self.assertFalse(any(x['residual_equivalent_within_25ns'] for x in r['conditioning_effects']))
    def test_wide_zero_residual_is_not_equivalence(self):
        r=calculate(fixture(wide_long=True))
        self.assertFalse(any(x['residual_equivalent_within_25ns'] for x in r['conditioning_effects']))
    def test_arbitrary_fixed_slot_curve_has_no_spurious_conditioning_effect(self):
        r=calculate(fixture(slot_curve=True))
        self.assertTrue(all(x['paired_reduction']['mean']==0 for x in r['conditioning_effects']))
        self.assertEqual(r['diagnostic_support_count'],0)
    def test_student_values_and_family_size(self):
        self.assertAlmostEqual(S.quantile(.975),1.998340542520741,places=9)
        self.assertAlmostEqual(S.quantile(1-.05/96),3.4386351078513293,places=8)
        self.assertEqual(self.result['simultaneous_family'],48)
    def test_disk_order_is_checked_before_merge_or_sort(self):
        _,rows,events,clocks,*_=self.base
        wr=[r for r in rows if r['worker']==0];we=[r for r in events if r['worker']==0];wc=[r for r in clocks if r['worker']==0]
        S.observed_order(0,wr,we,wc)
        for target,pattern in [(wr,'row order'),(we,'event order'),(wc,'clock order')]:
            target[:2]=target[1::-1]
            with self.assertRaisesRegex(P.InvalidData,pattern):S.observed_order(0,wr,we,wc)
            target[:2]=target[1::-1]
    def invalid(self,mutate,pattern):
        fx=copy.deepcopy(self.base);mutate(fx)
        with self.assertRaisesRegex((P.InvalidData,KeyError),pattern):calculate(fx)
    def test_missing_duplicate_reordered_or_wrong_factor_rows(self):
        self.invalid(lambda f:f[1].pop(),'missing/extra')
        self.invalid(lambda f:f[1].append(f[1][0]),'missing/extra')
        self.invalid(lambda f:f[1].__setitem__(slice(0,2),f[1][1::-1]),'row plan')
        for key in ['label','condition','warm','order']:
            self.invalid(lambda f,k=key:f[1][0].update({k:99}),'row plan')
    def test_bad_predecessor_or_wakeup_recipe(self):
        for key in ['worker','opcode','episode']:
            self.invalid(lambda f,k=key:f[2][0].update({k:99}),'schedule mismatch')
        self.invalid(lambda f:f[2][1].update(operations=256),'predecessor')
        self.invalid(lambda f:f[2][1].update(work=0),'predecessor')
    def test_stream_output_address_and_cpu_affinity_guards(self):
        for key in ['stream','state','output','def_entry','reset_entry']:
            self.invalid(lambda f,k=key:f[1][0].update({k:0}),'row image')
        self.invalid(lambda f:f[2][0].update(cpu_after=4),'affinity')
        self.invalid(lambda f:f[4][0].update(allocator_trace=True),'allocation')
    def test_warm_timed_timestamps_output_and_resource_guards(self):
        self.invalid(lambda f:f[1][0].update(warm_end_ns=f[1][0]['end_ns']),'bookkeeping')
        self.invalid(lambda f:f[1][0].update(cpu_ns=1),'CPU timestamp')
        self.invalid(lambda f:f[1][0].update(warm_sum=0),'output/warm')
        self.invalid(lambda f:f[1][0].update(output_bytes=0),'output/warm')
        self.invalid(lambda f:f[1][0].update(w_major=-1),'negative resource')
        self.invalid(lambda f:f[1][0].update(bank_phase=128),'fixed ring')
    def test_clock_count_order_overlap_and_late_probes(self):
        self.invalid(lambda f:f[3].pop(),'clock observation count')
        self.invalid(lambda f:f[3].__setitem__(0,f[3][1]),'duplicate clock')
        self.invalid(lambda f:f[3].__setitem__(slice(0,2),f[3][1::-1]),'clock type order')
        self.invalid(lambda f:f[3][0].update(end_ns=f[2][1]['end_ns']),'precede fixed companion')
    def test_canonical_inputs_final_checks_and_origin_guards(self):
        self.invalid(lambda f:f[0]['inputs'][0].update(sha256='0'*64),'canonical input')
        self.invalid(lambda f:f[0]['workloads'][0]['banks'].reverse(),'canonical workload')
        self.invalid(lambda f:f[5][0].update(after_checks=0),'final correctness')
        self.invalid(lambda f:f[0].update(record_origin='NATIVE_MEASUREMENT'),'native provenance')
        self.invalid(lambda f:f[0].update(record_origin='PLAN_ONLY_NOT_MEASURED'),'plan is not evidence')

def disk_fixture(root):
    """Fake non-executable bytes; tests file identities only, never native correctness."""
    root=Path(root);m=P.write_plan(root,'SYNTHETIC_UNIT_TEST');(root/'inputs').mkdir()
    _,_,data=P.canonical(root)
    for x,b in zip(m['inputs'],data):(root/'inputs'/f"{x['id']}.bin").write_bytes(b)
    (root/'source').mkdir();(root/'legacy-source').mkdir();(root/'preparation').mkdir()
    for name in [*P.SOURCE_NAMES,'tiny-zlib-conditioning.yml']:
        src=HERE/name if name.endswith(('.py','.c')) else HERE.parents[1]/'workflows'/name
        shutil.copyfile(src,root/'source'/name)
    for name in [*C.L.RUNTIME_FILES,'tiny-zlib-mechanism.yml']:
        src=HERE.parent/'reset-only'/name if name!='tiny-zlib-mechanism.yml' else HERE.parents[1]/'workflows'/name
        shutil.copyfile(src,root/'legacy-source'/name)
    names=['conditioning-driver','conditioning-driver-asan','reset-study','reset-check','reset-invariants','reset-invariants-asan','stock/libz.a','S/reset-control.o','V/reset-control.o']
    names += [v+'/'+n for v in ['N','S','V','NM','VM','NA','VA'] for n in ['ng.so','libz.a']]
    for n in names:
        p=root/'build'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(('SYNTHETIC_NONEXECUTABLE:'+n).encode())
    (root/'inputs.tsv').write_text(''.join(f"{x['id']}\t{x['path']}\n" for x in m['inputs']))
    (root/'workloads.tsv').write_text(''.join(f"{x['id']}\t"+','.join(map(str,x['banks']))+'\n' for x in m['workloads']))
    P.dump(root/'launch.json',dict(basecmd=[str(root/'build/conditioning-driver'),str(root/'build/N/ng.so'),*[str(root/n) for n in ['inputs.tsv','workloads.tsv','episodes.tsv','commands.tsv']],str(root)]))
    P.dump(root/'approved-publication.json',dict(repository='re-thc/openjdk-jdk27u',tag=C.TAG,attempt=1))
    for n in ['environment.json','build-commands.json','conditioning-build-commands.json']:P.dump(root/n,dict(origin='SYNTHETIC_UNIT_TEST'))
    P.dump(root/'preregistered.json',dict(manifest_sha256=P.sha(root/'manifest.json'),sources={str(p.relative_to(root)):P.sha(p) for top in ['source','legacy-source'] for p in (root/top).iterdir()},frozen_before_conditioning_build=True))
    P.dump(root/'preparation/preregistered.json',dict(files={p.name:P.sha(p) for p in (root/'legacy-source').iterdir()},frozen_before_measurement=True))
    P.dump(root/'identities.json',{str(p.relative_to(root)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for top in ['source','legacy-source','inputs','build'] for p in (root/top).rglob('*') if p.is_file()})

class ProvenanceTests(unittest.TestCase):
    def setUp(self):self.t=tempfile.TemporaryDirectory();self.root=Path(self.t.name);disk_fixture(self.root)
    def tearDown(self):self.t.cleanup()
    def test_complete_actual_inventory(self):self.assertTrue(S.inventory(self.root)['all_actual_files_verified'])
    def test_changed_binary_source_input_and_launch_rejected(self):
        for rel in ['build/N/ng.so','source/conditioning_driver.c','inputs/0.bin']:
            p=self.root/rel;old=p.read_bytes();p.write_bytes(old+b'changed')
            with self.assertRaises(P.InvalidData):S.inventory(self.root)
            p.write_bytes(old)
        p=self.root/'launch.json';d=json.loads(p.read_text());d['basecmd'][1]=str(self.root/'build/S/ng.so');P.dump(p,d)
        with self.assertRaisesRegex(P.InvalidData,'only unchanged'):S.inventory(self.root)
    def test_missing_source_preregistration_and_native_product_rejected(self):
        p=self.root/'preregistered.json';d=json.loads(p.read_text());d['sources'].pop('source/test_conditioning.py');P.dump(p,d)
        with self.assertRaisesRegex(P.InvalidData,'source set'):S.inventory(self.root)
    def test_missing_native_product_rejected_even_if_inventory_rewritten(self):
        p=self.root/'identities.json';original=json.loads(p.read_text())
        for name in ['build/VA/ng.so','build/S/reset-control.o','build/V/reset-control.o']:
            product=self.root/name;data=product.read_bytes();product.unlink();d=original.copy();d.pop(name);P.dump(p,d)
            with self.assertRaisesRegex(P.InvalidData,'inventory missing'):S.inventory(self.root)
            product.write_bytes(data);P.dump(p,original)
    def test_missing_before_after_proof_rejected(self):
        proof=S.inventory(self.root);P.dump(self.root/'provenance-before.json',proof);P.dump(self.root/'provenance-after.json',dict(proof,changed=True))
        with self.assertRaisesRegex(P.InvalidData,'before/after'):S.score(self.root)

class FakeClock:
    def __init__(self):self.now=0
    def __call__(self):return self.now
class FakePeer:
    def __init__(self,w,clock,fail=None):self.w=w;self.clock=clock;self.fail=fail;self.sent=[];self.closed=False
    def send(self,text,deadline):self.sent.append(text);self.clock.now+=.0001
    def expect(self,text,deadline):
        if self.fail=='late':self.clock.now+=901
        if self.fail=='bad' and text.startswith('DONE'):raise P.InvalidData('bad ACK')
        if self.fail=='eof' and text.startswith('DONE'):raise C.L.ProtocolFailure('EOF')
        self.clock.now+=.0001;C.remaining(deadline,self.clock)
    def finish(self,deadline):
        if self.fail=='exit':raise P.InvalidData('nonzero exit')
    def close(self):self.closed=True
class FakeScore:
    def __init__(self,changed=False):self.calls=0;self.changed=changed;self.scored=0
    def inventory(self,out):self.calls+=1;return {'fixed':self.calls if self.changed else 1}
    def score(self,out):self.scored+=1;return dict(record_origin='SYNTHETIC_UNIT_TEST',failed_legacy_controls=32,diagnostic_support_count=16)
    def report(self,out,result):pass

class CoordinatorTests(unittest.TestCase):
    def run_fake(self,td,fail=None,changed=False):
        clock=FakeClock();peers={};score=FakeScore(changed)
        def factory(w):peers[w]=FakePeer(w,clock,fail if w==0 else None);return peers[w]
        status=C.coordinate(td,factory,score,clock);self.assertTrue(all(p.closed for p in peers.values()));return status,peers,score
    def test_all_commands_once_despite_failed_gate_no_treatment(self):
        with tempfile.TemporaryDirectory() as td:
            r,peers,s=self.run_fake(td)
            self.assertEqual(r['status'],'NULL_DIAGNOSIS_COMPLETE');self.assertEqual(r['rows'],16384);self.assertEqual(s.scored,1)
            sent=[int(t.split()[1]) for p in peers.values() for t in p.sent if t.startswith('X')]
            self.assertEqual(sorted(sent),list(range(24576)));self.assertTrue(r['no_treatment_phase'])
    def test_timeout_bad_ack_nonzero_exit_and_changed_provenance(self):
        for fail,want in [('late','INCOMPLETE_TIMEOUT'),('bad','INVALID_DATA_OR_PROTOCOL'),('eof','INVALID_DATA_OR_PROTOCOL'),('exit','INVALID_DATA_OR_PROTOCOL')]:
            with tempfile.TemporaryDirectory() as td:
                r,_,s=self.run_fake(td,fail);self.assertEqual(r['status'],want);self.assertEqual(s.scored,0)
        with tempfile.TemporaryDirectory() as td:
            r,_,s=self.run_fake(td,changed=True);self.assertEqual(r['status'],'INVALID_DATA_OR_PROTOCOL');self.assertEqual(s.scored,0)
    def test_claim_once_and_approved_tag_guard(self):
        with tempfile.TemporaryDirectory() as td:
            out=Path(td)/'out';C.L.claim_once(out,{'GITHUB_RUN_ATTEMPT':'1'})
            with self.assertRaisesRegex(P.InvalidData,'no overwrite'):C.L.claim_once(out,{})
        sha='a'*40;ref='refs/tags/'+C.TAG
        env=dict(GITHUB_ACTIONS='true',GITHUB_EVENT_NAME='push',GITHUB_REPOSITORY='re-thc/openjdk-jdk27u',GITHUB_RUN_ATTEMPT='1',GITHUB_REF_TYPE='tag',GITHUB_REF=ref,GITHUB_SHA=sha)
        ev=dict(repository=dict(full_name=env['GITHUB_REPOSITORY']),ref=ref,created=True,deleted=False,forced=False,before='0'*40,after=sha)
        self.assertEqual(C.authorize(env,ev,sha)['attempt'],1)
        for k,v in [('GITHUB_RUN_ATTEMPT','2'),('GITHUB_REF','refs/heads/main'),('GITHUB_SHA','b'*40)]:
            with self.assertRaises(P.InvalidData):C.authorize(dict(env,**{k:v}),ev,sha)
        with self.assertRaises(P.InvalidData):C.authorize(env,dict(ev,created=False),sha)

if __name__=='__main__':unittest.main(verbosity=2)
