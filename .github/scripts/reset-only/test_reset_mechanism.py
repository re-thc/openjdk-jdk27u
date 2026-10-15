"""SYNTHETIC_UNIT_TEST only: no native build, library load or timing campaign."""
from pathlib import Path
import collections,copy,csv,hashlib,importlib.util,json,math,os,shutil,tempfile,unittest
from unittest import mock
import reset_protocol as P
HERE=Path(__file__).resolve().parent
def module(name,file):
    spec=importlib.util.spec_from_file_location(name,HERE/file)
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
S=module('score','reset-score.py');C=module('coordinator','reset-study.py')

def fixture(gain=700,pre_bias=0,post_bias=0,order_bias=0,linear=0,preemption=0,asymmetric=False,treatment_reversal=False,physical_factors=True,slot_parity_effect=0):
    pins=json.loads((HERE/'source-pins.json').read_text());groups=[];n=0
    for f in pins['tiny_families']:
        groups.append(list(range(n,n+len(f['banks']))));n+=len(f['banks'])
    works=P.workloads(groups)
    definitions,data,_=P.pinned_inputs()
    m=dict(protocol=P.spec(),protocol_fingerprint=P.fingerprint(),record_origin='SYNTHETIC_UNIT_TEST',workloads=works,
        inputs=[dict(d,path=f"/SYNTHETIC_UNIT_TEST/inputs/{d['id']}.bin") for d in definitions])
    meta={};checks={};refs={}
    for w in P.WORKERS:
        a=1000000+w*10000000
        # All persistent addresses are synthetic and aligned, with independent image identities.
        a=(a+63)//64*64
        meta[w]=dict(protocol=P.VERSION,**P.factors(w),load_order=[1,0] if (w>>1)&1 else [0,1],init_order=[1,0] if w&1 else [0,1],
            allocator_trace_before_init=False,timer_layout='CPU0,MONO0,operations,MONO1,CPU1',
            mono_resolution_ns=1,cpu_resolution_ns=1,sizeof_stream=112,slot_stride=128,before_checks=3184,
            N_stream=a,S_stream=a+128,N_state=a+1024,S_state=a+2048,output=a+4096,
            N_def=a+5000,S_def=a+6000,N_reset=a+7000,S_reset=a+8000,control=a+9000)
        checks[w]=dict(worker=w,before_checks=3184,after_checks=3184,all_outputs_equal=True,batches=1536,clock_commands=12)
        for wi in [0,1]:
            for i in set(works[wi]['banks']):refs[w,wi,i]=20+i%43
    rows=[];clocks=[];observed=set();now=1000000;previous={w:-1 for w in P.WORKERS};cpu={w:10000 for w in P.WORKERS}
    plans=P.schedule();positions={}
    for phase in [1,2,3]:
        for b in range(12):
            order=list(dict.fromkeys(r['worker'] for r in plans if r['phase']==phase and r['block']==b))
            for slot,w in enumerate(order):positions[phase,b,w]=slot
    for p in plans:
        w=p['worker'];b=p['block'];wi=p['work'];kind=p['kind'];label=p['label'];q=p['quartet']
        key=w,b
        if p['phase']==1 and key not in observed:
            for name in ['mono_pair','legacy_nested','empty_batch']:
                now+=10
                clocks.append(dict(worker=w,block=b,kind=name,operations=512 if name=='empty_batch' else 128,
                    wall_ns=500,cpu_ns=900,outer_wall_ns=1000,begin_ns=now,end_ns=now+1000));now+=1000
            observed.add(key)
        f=P.factors(w);L=2*f['load_reverse']-1;A=2*f['init_reverse']-1
        full=3500+(100*L+80*A+30*L*A if physical_factors else 0)+(10 if f['replicate'] else -10)
        g=400 if asymmetric and w==7 and wi==1 else gain
        order='ABBA' if (b+w+q)%2==0 else 'BAAB'
        if treatment_reversal:g=1500 if order=='ABBA' else -100
        cost=3000 if p['arm']==0 else full if p['arm']==2 else full-g
        if p['phase']==2 and p['arm']==0:cost+=slot_parity_effect*(positions[2,b,w]%2)
        cost+=linear*p['position']
        if p['phase']!=2:
            cost+=(pre_bias if p['phase']==1 else post_bias) if label==0 else 0
            cost+=order_bias*([1,-1,-1,1][p['position']])
        cpu_ns=round(cost*512)+40;delay=preemption if p['seq']==0 else 0;wall=round(cost*512)+delay
        now+=100;begin=now;now+=wall
        image='N' if p['arm']==0 else 'S';mm=meta[w];work=works[wi]
        ids=[work['banks'][(p['offset']+k)%256] for k in range(512)]
        rows.append(dict(p,wall_ns=wall,cpu_ns=cpu_ns,window_ns=wall,prep_ns=100,begin_ns=begin,end_ns=now,
            cpu_begin_ns=cpu[w],cpu_end_ns=cpu[w]+cpu_ns,output_bytes=refs[w,wi,ids[-1]],last_input=ids[-1],previous_work=previous[w],
            output_sum=sum(refs[w,wi,i] for i in ids),stream=mm[image+'_stream'],state=mm[image+'_state'],output=mm['output'],
            def_entry=mm[image+'_def'],reset_entry=mm['N_reset'] if p['arm']==0 else mm['control'],force_full=int(p['arm']==2),
            voluntary=0,involuntary=int(bool(delay)),minor=0,major=0,throttled_periods=0,throttled_us=0))
        cpu[w]+=cpu_ns+100;previous[w]=wi
    return m,rows,clocks,meta,checks,refs

def calculate(fx,phases=None,finalized=True):
    m,rows,clocks,meta,checks,refs=fx;phases=phases or [1,2,3]
    return S.score_records(m,[r for r in rows if r['phase'] in phases],clocks,meta,checks if finalized else {},refs,phases,finalized)

class ScorerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):cls.base=fixture();cls.result=calculate(cls.base)
    def test_complete_positive_is_synthetic_not_native_or_public_qualification(self):
        r=self.result
        self.assertEqual((r['rows'],r['controls'],len(r['treatments'])),(12288,96,32))
        self.assertTrue(r['decision']['statistical_criteria_passed'])
        self.assertFalse(r['decision']['native_mechanism_qualified']);self.assertFalse(r['public_api_qualified'])
        self.assertFalse(r['decision']['reference_equivalence_passed'])
        self.assertFalse(r['fresh_long_Java_qualified']);self.assertTrue(r['all_rows_retained'])
    def test_exact_500ns_boundary(self):
        self.assertTrue(calculate(fixture(gain=500))['decision']['benefit_passed'])
        self.assertFalse(calculate(fixture(gain=499))['decision']['benefit_passed'])
    def test_single_worker_size_asymmetry_vetoes(self):
        r=calculate(fixture(asymmetric=True));self.assertFalse(r['decision']['statistical_criteria_passed'])
        failed=[(x['worker'],x['work']) for x in r['treatments'] if x['kind']==4 and x['wall']['ci'][0]<500]
        self.assertEqual(failed,[(7,1)])
    def test_pre_and_post_null_bias_fail(self):
        pre=calculate(fixture(pre_bias=200),[1],False)
        self.assertEqual(pre['failed_controls'],48)
        r=calculate(fixture(post_bias=200));self.assertEqual(r['failed_controls'],48)
        self.assertFalse(r['decision']['statistical_criteria_passed'])
    def test_linear_position_drift_cancels_but_quadratic_order_veto_catches(self):
        self.assertTrue(calculate(fixture(linear=20))['decision']['statistical_criteria_passed'])
        r=calculate(fixture(order_bias=200))
        self.assertEqual(r['pooled_failed_controls'],0)
        self.assertEqual(r['order_veto_failed_controls'],96)
        self.assertFalse(r['decision']['statistical_criteria_passed'])
    def test_treatment_order_reversal_veto(self):
        r=calculate(fixture(treatment_reversal=True))
        fu=[x for x in r['treatments'] if x['kind']==4]
        self.assertTrue(all(x['wall']['mean']==700 for x in fu))
        self.assertFalse(r['decision']['order_passed']);self.assertFalse(r['decision']['statistical_criteria_passed'])
    def test_preemption_is_retained_and_cpu_does_not_rescue_wall(self):
        r=calculate(fixture(preemption=1000000),[1],False)
        self.assertEqual((r['rows'],r['resources']['involuntary']),(4608,1))
        self.assertGreater(r['failed_controls'],0)
        bad=[x for x in r['control_results'] if not x['passed']]
        self.assertTrue(all(x['cpu']['absolute_bound']==0 for x in bad))
        self.assertTrue(r['all_rows_retained'])
    def test_all_four_equivalence_classifications(self):
        for xs,want in [([0]*12,'equivalent_within_100ns'),([120]*12,'interval_entirely_outside_100ns'),
            ([10,210]*6,'point_outside_100ns_with_uncertainty'),([-200,200]*6,'uncertainty_crosses_100ns')]:
            self.assertEqual(S.classification(S.interval(xs)),want)
    def test_student_critical_values(self):
        self.assertAlmostEqual(S.quantile(.975,11),2.200985160082949,places=10)
        self.assertAlmostEqual(S.quantile(.975,4),2.7764451051977987,places=10)
        self.assertAlmostEqual(S.quantile(1-.05/64,11),4.170082646858086,places=8)
    def test_factorial_units_coefficients_and_df(self):
        for x in self.result['factorial']:
            self.assertEqual((x['independent_units'],x['residual_df']),(8,4))
            # N/F response is negative of the F cost factors.
            self.assertEqual(x['effects']['load_high_minus_low']['mean'],-200)
            self.assertEqual(x['effects']['init_high_minus_low']['mean'],-160)
            self.assertEqual(x['effects']['interaction_difference_of_differences']['mean'],-120)
            self.assertTrue(all(abs(v)==10 for v in x['residuals']))
    def test_reviewer_odd_slot_1000ns_counterexample_has_no_spurious_factor(self):
        r=calculate(fixture(physical_factors=False,slot_parity_effect=1000))
        self.assertEqual(r['failed_controls'],0)
        self.assertTrue(r['decision']['statistical_criteria_passed'])
        for model in r['factorial']:
            for effect in model['effects'].values():
                self.assertAlmostEqual(effect['mean'],0)
                self.assertLessEqual(effect['ci'][0],0);self.assertGreaterEqual(effect['ci'][1],0)
        # Recreate the rejected schedule's exact slot-parity alias in the same model.
        nf=[]
        for wi in [0,1]:
            for w in P.WORKERS:
                ys=[]
                for b in range(12):
                    order=P.WORKERS[b%8:]+P.WORKERS[:b%8]
                    if b%2:order.reverse()
                    ys.append(-500+(10 if w<4 else -10)+1000*(order.index(w)%2))
                nf.append(dict(worker=w,work=wi,wall=dict(mean=sum(ys)/12)))
        for model in S.factorial(nf):
            effect=model['effects']['init_high_minus_low']
            self.assertEqual(effect['mean'],1000)
            self.assertEqual(f"{effect['ci'][0]:.2f}",'951.49')
            self.assertEqual(f"{effect['ci'][1]:.2f}",'1048.51')
    def assert_invalid(self,mutation,message):
        fx=copy.deepcopy(self.base);mutation(fx)
        with self.assertRaisesRegex(P.InvalidData,message):calculate(fx)
    def test_missing_duplicate_reordered_and_wrong_arm_rows(self):
        self.assert_invalid(lambda f:f[1].pop(),'missing or extra')
        self.assert_invalid(lambda f:f[1].append(dict(f[1][0])),'missing or extra')
        self.assert_invalid(lambda f:f[1].__setitem__(slice(0,2),f[1][1::-1]),'schedule/order/arm')
        self.assert_invalid(lambda f:f[1][0].update(arm=4),'schedule/order/arm')
    def test_identity_argument_factor_and_allocator_guards(self):
        for field in ['state','stream','def_entry','reset_entry','force_full']:
            self.assert_invalid(lambda f,k=field:f[1][0].update({k:0}),'identity|image|argument')
        self.assert_invalid(lambda f:f[3][0].update(init_reverse=1),'factor mismatch')
        self.assert_invalid(lambda f:f[3][0].update(load_order=[1,0]),'load order')
        self.assert_invalid(lambda f:f[3][0].update(allocator_trace_before_init=True),'allocator trace')
        self.assert_invalid(lambda f:f[3][0].update(S_stream=f[3][0]['N_stream']+112),'misaligned|stride')
    def test_timestamp_and_output_and_finalization_guards(self):
        self.assert_invalid(lambda f:f[1][0].update(wall_ns=1),'wall interval')
        self.assert_invalid(lambda f:f[1][0].update(cpu_end_ns=1),'CPU enclosing')
        self.assert_invalid(lambda f:f[1][0].update(output_sum=0),'length accounting')
        self.assert_invalid(lambda f:f[4].pop(7),'finalization proof')
        self.assert_invalid(lambda f:f[4][0].update(after_checks=0),'after proof')
        self.assert_invalid(lambda f:f[3][0].update(timer_layout='MONO0,CPU0,operations,CPU1,MONO1'),'timestamp scope')
    def test_clock_diagnostics_missing_duplicate_late_and_overlap(self):
        self.assert_invalid(lambda f:f[2].pop(),'clock observations')
        self.assert_invalid(lambda f:f[2].__setitem__(0,dict(f[2][1])),'clock observations')
        def late(f):
            x=f[2][0];x.update(begin_ns=f[1][0]['end_ns'],end_ns=f[1][0]['end_ns']+1000)
        self.assert_invalid(late,'after calibration')
        self.assert_invalid(lambda f:f[2][1].update(begin_ns=f[2][0]['begin_ns'],end_ns=f[2][0]['end_ns']),'overlapping clock')
    def test_manifest_protocol_and_phase_guards(self):
        self.assert_invalid(lambda f:f[0]['protocol'].update(gate_ns=101),'protocol changed')
        self.assert_invalid(lambda f:f[0]['workloads'][0].update(iterations=128),'timed workload')
        with self.assertRaisesRegex(P.InvalidData,'complete pre'):calculate(self.base,[1,2])
    def test_canonical_input_and_untimed_coverage_definitions_are_enforced(self):
        for name,value in [('bytes',65),('sha256','0'*64),('name','substituted-bank')]:
            self.assert_invalid(lambda f,k=name,v=value:f[0]['inputs'][0].update({k:v}),'canonical input definition')
        self.assert_invalid(lambda f:f[0]['inputs'].pop(),'input coverage')
        for wi in range(2,10):
            self.assert_invalid(lambda f,i=wi:f[0]['workloads'][i].update(banks=[0]),'untimed coverage')
        self.assert_invalid(lambda f:f[0].update(record_origin='NATIVE_MEASUREMENT'),'provenance')

class PlanningTests(unittest.TestCase):
    def test_schedule_exact_shape_factor_grid_and_multisets(self):
        rows=P.schedule();P.validate_schedule(rows)
        self.assertEqual(hashlib.sha256(P.schedule_bytes()).hexdigest(),P.SCHEDULE_SHA)
        self.assertEqual(collections.Counter(r['phase'] for r in rows),P.PHASE_ROWS)
        self.assertEqual(collections.Counter((P.factors(w)['load_reverse'],P.factors(w)['init_reverse']) for w in P.WORKERS),{(0,0):2,(0,1):2,(1,0):2,(1,1):2})
        # Orthogonal columns prove rank4 without a numpy dependency.
        cols=[[1 for w in P.WORKERS],[2*P.factors(w)['load_reverse']-1 for w in P.WORKERS],[2*P.factors(w)['init_reverse']-1 for w in P.WORKERS]]
        cols.append([a*b for a,b in zip(cols[1],cols[2])])
        for i in range(4):
            for j in range(4):self.assertEqual(sum(a*b for a,b in zip(cols[i],cols[j])),8 if i==j else 0)
        self.assertEqual(P.ARMS,{0:[0,0],1:[2,2],2:[3,3],3:[0,2],4:[2,3]})
    def test_exact_cell_slot_factor_and_worker_parity_balance_each_phase(self):
        audit=P.position_balance(P.schedule(),[1,2,3])
        for phase in audit:
            self.assertTrue(all(v==[3]*8 for v in phase['cell_slot_counts'].values()))
            self.assertTrue(all(v==[6]*8 for v in phase['factor_slot_counts'].values()))
            self.assertTrue(all(v==[6,6] for v in phase['worker_parity_counts'].values()))
            self.assertTrue(all(sorted(v)==[1]*4+[2]*4 for v in phase['worker_slot_counts'].values()))
        # Reject exactly the old block-parity reversal, even if row counts remain fixed.
        old=[]
        for phase in [1,2,3]:
            for b in range(12):
                order=P.WORKERS[b%8:]+P.WORKERS[:b%8]
                if (b+(phase==3))%2:order.reverse()
                old.extend(dict(phase=phase,block=b,worker=w) for w in order)
        with self.assertRaisesRegex(P.InvalidData,'cell-by-slot imbalance'):P.position_balance(old,[2])
    def test_once_marker_and_workflow_attempt_guard(self):
        with tempfile.TemporaryDirectory() as td:
            out=Path(td)/'run'
            with self.assertRaisesRegex(P.InvalidData,'retries'):C.claim_once(out,{'GITHUB_RUN_ATTEMPT':'2'})
            self.assertFalse(out.exists());C.claim_once(out,{'GITHUB_RUN_ATTEMPT':'1'})
            with self.assertRaisesRegex(P.InvalidData,'no overwrite'):C.claim_once(out,{})
            self.assertEqual([p.name for p in out.iterdir()],['STARTED'])
    def test_native_source_timestamp_scopes_and_untimed_control_identity(self):
        s=(HERE/'reset-study.c').read_text()
        self.assertIn('cpu0=ns(CLOCK_THREAD_CPUTIME_ID),begin=ns(CLOCK_MONOTONIC)',s)
        self.assertIn('end=ns(CLOCK_MONOTONIC),cpu1=ns(CLOCK_THREAD_CPUTIME_ID)',s)
        self.assertIn('if(argc==10)trace_allocator(i)',s)
        self.assertIn('s->state->small_reset_safe &= !force_full;',s)
        self.assertEqual(P.sha(HERE/'backend-reset.patch'),P.PATCH)
        self.assertEqual(P.sha(HERE/'source-pins.json'),P.PINS)

class PublicationGuardTests(unittest.TestCase):
    def approved(self):
        commit='a'*40;ref='refs/tags/'+C.ONCE_TAG
        env=dict(GITHUB_ACTIONS='true',GITHUB_EVENT_NAME='push',GITHUB_REPOSITORY='re-thc/openjdk-jdk27u',GITHUB_RUN_ATTEMPT='1',GITHUB_REF=ref,GITHUB_REF_TYPE='tag',GITHUB_SHA=commit,GITHUB_RUN_ID='12345')
        event=dict(repository=dict(full_name='re-thc/openjdk-jdk27u'),ref=ref,created=True,deleted=False,forced=False,before='0'*40,after=commit)
        return env,event,commit
    def test_exact_first_tag_pins_event_commit_without_secret(self):
        env,event,head=self.approved();receipt=C.authorize_publication(env,event,head)
        self.assertEqual(receipt['approved_commit'],head);self.assertEqual(receipt['attempt'],1)
        self.assertIn('Deletion/recreation is separately unauthorized',receipt['external_requirement'])
    def test_branch_push_tag_move_retry_and_mismatched_commit_fail(self):
        cases=[('GITHUB_REF','refs/heads/diagnostic/tiny-zlib-mechanism-20261015'),('GITHUB_REF_TYPE','branch'),('GITHUB_RUN_ATTEMPT','2'),('GITHUB_SHA',''),('GITHUB_SHA','b'*40),('GITHUB_REPOSITORY','other/repo'),('GITHUB_EVENT_NAME','workflow_dispatch')]
        for key,value in cases:
            env,event,head=self.approved();env[key]=value
            with self.assertRaises(P.InvalidData):C.authorize_publication(env,event,head)
        for key,value in [('created',False),('forced',True),('deleted',True),('before','b'*40),('after','b'*40)]:
            env,event,head=self.approved();event[key]=value
            with self.assertRaises(P.InvalidData):C.authorize_publication(env,event,head)
        env,event,head=self.approved()
        with self.assertRaises(P.InvalidData):C.authorize_publication(env,event,'c'*40)
    def test_workflow_has_only_fixed_tag_trigger_and_pinned_checkout(self):
        workflow=(HERE.parents[1]/'workflows/tiny-zlib-mechanism.yml').read_text()
        self.assertIn('tags: ['+C.ONCE_TAG+']',workflow)
        self.assertNotIn('branches:',workflow);self.assertNotIn('workflow_dispatch:',workflow)
        self.assertIn('ref: ${{ github.sha }}',workflow)
        self.assertNotIn('environment:',workflow);self.assertNotIn('secrets.',workflow)
    def test_absence_reader_rejects_existing_tag_network_errors_and_ambiguous_output(self):
        self.assertTrue(C.verify_tag_absence(2,'')['absent'])
        for code,stdout in [(0,'a'*40+'\trefs/tags/'+C.ONCE_TAG+'\n'),(0,''),(128,''),(1,''),(2,'unexpected output')]:
            with self.assertRaises(P.InvalidData):C.verify_tag_absence(code,stdout)
    def test_absence_preflight_uses_only_read_only_git_query(self):
        with mock.patch.object(C.subprocess,'run',return_value=mock.Mock(returncode=2,stdout='')) as run:
            proof=C.check_remote_tag_absent()
        args,kw=run.call_args
        self.assertEqual(args[0],['git','ls-remote','--exit-code','--refs','--tags','https://github.com/re-thc/openjdk-jdk27u.git','refs/tags/'+C.ONCE_TAG])
        self.assertEqual(kw['timeout'],30);self.assertTrue(proof['absent'])

def saved_fixture(out):
    """Synthetic CSV/reference/binary bytes; never compiled or executed."""
    m,rows,clocks,meta,checks,refs=fixture();definitions,data,_=P.pinned_inputs()
    (out/'source').mkdir();(out/'compressed').mkdir();(out/'inputs').mkdir()
    for d,b in zip(definitions,data):(out/'inputs'/f"{d['id']}.bin").write_bytes(b)
    m['inputs']=[dict(d,path=str(out/'inputs'/f"{d['id']}.bin")) for d in definitions]
    (out/'schedule.tsv').write_bytes(P.schedule_bytes());P.dump(out/'manifest.json',m)
    for name in C.RUNTIME_FILES:shutil.copyfile(HERE/name,out/'source'/name)
    shutil.copyfile(HERE.parents[1]/'workflows/tiny-zlib-mechanism.yml',out/'source/tiny-zlib-mechanism.yml')
    frozen=dict(manifest_sha256=P.sha(out/'manifest.json'),schedule_sha256=P.SCHEDULE_SHA,
        frozen_before_measurement=True,files={p.name:P.sha(p) for p in (out/'source').iterdir()})
    P.dump(out/'preregistered.json',frozen)
    for path in S.CRITICAL_BINARIES:
        p=out/path;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(('SYNTHETIC_NOT_EXECUTABLE '+path).encode())
    (out/'inputs.tsv').write_text(''.join(f"{x['id']}\t{x['path']}\n" for x in m['inputs']))
    (out/'workloads.tsv').write_text(''.join('\t'.join(str(w[k]) for k in ['id','section','life','iterations','warm','quartets'])+'\t'+','.join(map(str,w['banks']))+'\n' for w in m['workloads']))
    P.dump(out/'launch.json',dict(basecmd=[str(out/'build/reset-study'),str(out/'build/N/ng.so'),str(out/'build/S/ng.so'),str(out/'inputs.tsv'),str(out/'workloads.tsv'),str(out/'schedule.tsv'),str(out)],
        libraries={name:str(out/f'build/{name}/ng.so') for name in ['N','S','V','NM','VM','NA','VA']}))
    P.dump(out/'identities.json',{str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for top in ['source','inputs','build'] for p in (out/top).rglob('*') if p.is_file()})
    proof=S.verify_artifacts(out);P.dump(out/'provenance-before.json',proof);P.dump(out/'provenance-after.json',proof)
    for w in P.WORKERS:
        P.dump(out/f'worker-{w}-metadata.json',meta[w]);P.dump(out/f'worker-{w}-checks.json',checks[w])
        for name,values in [(f'worker-{w}.csv',[x for x in rows if x['worker']==w]),(f'empty-timer-{w}.csv',[x for x in clocks if x['worker']==w])]:
            with (out/name).open('w') as f:
                writer=csv.DictWriter(f,fieldnames=list(values[0]));writer.writeheader();writer.writerows(values)
        for (ww,wi,i),length in refs.items():
            if ww==w:(out/f'compressed/w{w}-{wi}-{i}.bin').write_bytes(bytes([i%256])*length)
    return m,proof

class FrozenDirectoryTests(unittest.TestCase):
    def test_saved_csv_reference_source_and_manifest_validation(self):
        # Exercise the same disk reader that the coordinator uses, without native output.
        with tempfile.TemporaryDirectory() as td:
            out=Path(td);m,proof=saved_fixture(out)
            r=S.score(out,[1,2,3],True)
            self.assertTrue(r['decision']['statistical_criteria_passed']);self.assertFalse(r['decision']['native_mechanism_qualified'])
            source=out/'source/reset-study.c';original=source.read_bytes();source.write_bytes(original+b'/* changed */')
            with self.assertRaisesRegex(P.InvalidData,'frozen source changed'):S.score(out,[1,2,3],True)
            source.write_bytes(original)
            (out/'manifest.json').write_text((out/'manifest.json').read_text()+' ')
            with self.assertRaisesRegex(P.InvalidData,'manifest changed'):S.score(out,[1,2,3],True)
            P.dump(out/'manifest.json',m)
            bad=out/'compressed/w7-0-0.bin';bad.write_bytes(b'changed')
            with self.assertRaisesRegex(P.InvalidData,'output mismatch'):S.score(out,[1,2,3],True)
    def test_actual_pinned_bytes_binary_hashes_and_missing_after_proof_are_rejected(self):
        with tempfile.TemporaryDirectory() as td:
            out=Path(td);m,proof=saved_fixture(out)
            bank=out/'inputs/0.bin';data=bank.read_bytes();bank.write_bytes(b'x'*len(data))
            with self.assertRaisesRegex(P.InvalidData,'input bytes'):S.verify_artifacts(out)
            bank.write_bytes(data)
            binary=out/'build/S/ng.so';data=binary.read_bytes();binary.write_bytes(b'x'*len(data))
            with self.assertRaisesRegex(P.InvalidData,'binary identity changed'):S.verify_artifacts(out)
            identities=json.loads((out/'identities.json').read_text());identities['build/S/ng.so']=dict(bytes=binary.stat().st_size,sha256=P.sha(binary));P.dump(out/'identities.json',identities)
            with self.assertRaisesRegex(P.InvalidData,'before-measurement provenance mismatch'):S.checked_provenance(out,True)
            binary.write_bytes(data);identities['build/S/ng.so']=dict(bytes=binary.stat().st_size,sha256=P.sha(binary));P.dump(out/'identities.json',identities)
            (out/'provenance-after.json').unlink()
            with self.assertRaises(FileNotFoundError):S.checked_provenance(out,True)
    def test_rehashed_manifest_cannot_substitute_inputs_or_omit_untimed_coverage(self):
        with tempfile.TemporaryDirectory() as td:
            out=Path(td);m,proof=saved_fixture(out)
            def freeze_changed_manifest():
                P.dump(out/'manifest.json',m);frozen=json.loads((out/'preregistered.json').read_text());frozen['manifest_sha256']=P.sha(out/'manifest.json');P.dump(out/'preregistered.json',frozen)
            for field,value in [('bytes',999),('sha256','1'*64)]:
                original=m['inputs'][0][field];m['inputs'][0][field]=value;freeze_changed_manifest()
                with self.assertRaisesRegex(P.InvalidData,'canonical input definition'):S.verify_artifacts(out)
                m['inputs'][0][field]=original
            m['workloads'][7].update(banks=[264],life=0);freeze_changed_manifest()
            with self.assertRaisesRegex(P.InvalidData,'untimed coverage'):S.verify_artifacts(out)

class PipeUnitTests(unittest.TestCase):
    def peer(self):
        peer=C.PipePeer.__new__(C.PipePeer);peer.clock=lambda:0.;peer.buffer=bytearray()
        peer.process=mock.Mock();peer.process.stdout.fileno.return_value=99;peer._ready=mock.Mock()
        return peer
    def test_partial_line_is_accumulated_with_deadline_checks(self):
        p=self.peer()
        with mock.patch.object(C.os,'read',side_effect=[b'DO',b'NE ',b'7\n']):p.expect('DONE 7',10)
        self.assertEqual(p._ready.call_count,3)
    def test_unexpected_nonascii_oversize_and_eof_are_rejected(self):
        for chunks,message in [([b'WRONG\n'],'unexpected'),([b'\xff\n'],'non-ASCII'),([b'x'*4097],'oversize'),([b''],'EOF')]:
            p=self.peer()
            with mock.patch.object(C.os,'read',side_effect=chunks):
                with self.assertRaisesRegex(C.ProtocolFailure,message):p.expect('DONE 7',10)
    def test_partial_response_does_not_hide_timeout(self):
        p=self.peer();clock=FakeTime();p.clock=clock
        def ready(*args):
            if clock.now:raise C.DeadlineExpired('Fixed deadline')
            clock.now=1
        p._ready=ready
        with mock.patch.object(C.os,'read',return_value=b'PARTIAL'):
            with self.assertRaises(C.DeadlineExpired):p.expect('DONE 7',10)

class FakeTime:
    def __init__(self):self.now=0.
    def __call__(self):return self.now
class FakePeer:
    def __init__(self,w,clock,commands,fault=None):self.w=w;self.clock=clock;self.commands=commands;self.fault=fault;self.last='';self.closed=False
    def send(self,line,deadline):
        self.last=line.strip();self.commands.append((self.w,self.last));self.clock.now+=.0001
    def expect(self,want,deadline):
        if self.fault=='startup_timeout' and want.startswith('READY'):self.clock.now=deadline
        if self.fault=='timeout' and want=='DONE 5':self.clock.now=deadline
        C.remaining(deadline,self.clock)
        if self.fault in ['bad_ack','eof'] and want=='DONE 5':raise C.ProtocolFailure(self.fault)
        self.clock.now+=.0001
    def finish(self,deadline):
        if self.fault=='finish_timeout':self.clock.now=deadline
        C.remaining(deadline,self.clock)
        if self.fault=='bad_exit':raise C.ProtocolFailure('worker exit=1')
    def close(self):self.closed=True
class FakeScorer:
    def __init__(self,clock,pre=True,post=True,criteria=True,fault=None):self.clock=clock;self.pre=pre;self.post=post;self.criteria=criteria;self.fault=fault;self.calls=[];self.verifications=0
    def verify_artifacts(self,out):
        self.verifications+=1
        return dict(synthetic_identity='changed' if self.fault=='binary_changed_after' and self.verifications==2 else 'unchanged')
    def score(self,out,phases,finalized):
        self.calls.append((list(phases),finalized))
        if self.fault=='missing_rows':raise P.InvalidData('missing or extra measurement rows')
        if self.fault=='missing_checks' and finalized:raise FileNotFoundError('checks')
        if self.fault=='score_timeout' and not finalized:self.clock.now+=901
        passed=self.pre if phases==[1] else self.post
        return dict(calibration_passed=passed,failed_controls=0 if passed else 1,record_origin='SYNTHETIC_UNIT_TEST',
            decision=dict(statistical_criteria_passed=passed and self.criteria,native_mechanism_qualified=False))
    def report(self,out,result):pass

class CoordinatorTests(unittest.TestCase):
    def run_fake(self,fault=None,pre=True,post=True,criteria=True):
        t=FakeTime();commands=[];peers={};scorer=FakeScorer(t,pre,post,criteria,fault)
        def factory(w):peers[w]=FakePeer(w,t,commands,fault);return peers[w]
        with tempfile.TemporaryDirectory() as td:
            result=C.coordinate(Path(td),factory,scorer,t)
            journal=[json.loads(x) for x in (Path(td)/'coordination.jsonl').read_text().splitlines()]
            self.assertEqual(json.loads((Path(td)/'status.json').read_text()),result)
        self.assertTrue(all(p.closed for p in peers.values()))
        self.assertEqual(list(peers),P.LAUNCH_ORDER)
        return result,commands,scorer.calls,journal
    def test_fixed_success_all_commands_once(self):
        r,commands,calls,journal=self.run_fake()
        self.assertEqual(r['status'],'MECHANISM_CRITERIA_PASSED');self.assertFalse(r['native_mechanism_qualified'])
        ms=[(w,int(c.split()[1])) for w,c in commands if c.startswith('M ')]
        self.assertEqual(ms,[(p['worker'],p['seq']) for p in P.schedule()])
        self.assertEqual(len([c for w,c in commands if c.startswith('E ')]),96)
        self.assertEqual(len([c for w,c in commands if c=='Q']),8)
        self.assertEqual(calls,[([1],False),([1,2,3],True)])
        self.assertEqual(r['retries'],0)
    def test_failed_pre_skips_every_comparison_and_post_row(self):
        r,commands,calls,_=self.run_fake(pre=False)
        self.assertEqual(r['status'],'PRE_GATE_FAILED_COMPARISON_SKIPPED')
        self.assertEqual([int(c.split()[1]) for w,c in commands if c.startswith('M ')],list(range(4608)))
        self.assertEqual(calls,[([1],False),([1],True)])
    def test_post_failure_invalidates_and_benefit_failure_classifies(self):
        self.assertEqual(self.run_fake(post=False)[0]['status'],'POST_GATE_FAILED_UNQUALIFIED')
        self.assertEqual(self.run_fake(criteria=False)[0]['status'],'MECHANISM_CRITERIA_NOT_MET')
    def test_timeouts_abort_without_retry_and_preserve_partial_commands(self):
        for fault in ['startup_timeout','timeout','score_timeout','finish_timeout']:
            r,commands,_,_=self.run_fake(fault=fault)
            self.assertEqual(r['status'],'INCOMPLETE_TIMEOUT',fault);self.assertEqual(r['retries'],0)
            ms=[c for w,c in commands if c.startswith('M ')]
            self.assertEqual(len(ms),len(set(ms)))
            if fault=='score_timeout':self.assertEqual(len(ms),4608)
            if fault=='startup_timeout':self.assertEqual(len(ms),0)
    def test_missing_rows_bad_ack_eof_bad_exit_and_missing_checks(self):
        for fault in ['missing_rows','bad_ack','eof','bad_exit','missing_checks','binary_changed_after']:
            r,commands,_,_=self.run_fake(fault=fault)
            self.assertEqual(r['status'],'INVALID_DATA_OR_PROTOCOL',fault)
            self.assertEqual(r['retries'],0)
            if fault=='missing_rows':self.assertEqual(len([c for w,c in commands if c.startswith('M ')]),4608)
    def test_clock_commands_precede_exact_first_pre_batch(self):
        _,commands,_,_=self.run_fake();seen=set();pending={};plan=P.schedule()
        for w,c in commands:
            if c.startswith('E '):pending[w]=int(c.split()[1]);continue
            if not c.startswith('M '):continue
            r=plan[int(c.split()[1])];key=w,r['block']
            if r['phase']==1 and key not in seen:
                self.assertEqual(pending.pop(w),r['block']);seen.add(key)
        self.assertEqual(len(seen),96);self.assertFalse(pending)

if __name__=='__main__':
    unittest.main(verbosity=2)
