"""Pure synthetic/protocol fixtures; no native build/load/timing."""
from pathlib import Path
import collections,copy,hashlib,json,math,tempfile,unittest
from unittest import mock
import direct_protocol as P
import direct_score as S
HERE=Path(__file__).resolve().parent

def fixture(gain=600,main_bias=0,guard_shift=0,guard_null_bias=0,guard_variable=False,ratio_example=False):
    with tempfile.TemporaryDirectory() as td:m=P.write_plan(td,'SYNTHETIC_UNIT_TEST')
    eps,plan,commands=P.plans();profiles=m['profiles'];meta={};proofs={};refs={}
    for w in range(8):
        a=1048576*(w+1);meta[w]=dict(protocol=P.VERSION,worker=w,cpu_pin=3,sizeof_stream=112,slot_stride=128,load_reverse=(w>>1)&1,init_reverse=w&1,allocator_trace=False,before_checks=1652,mono_resolution_ns=1,cpu_resolution_ns=1,
            N_stream=a,S_stream=a+128,N_state=a+4096,S_state=a+8192,N_fresh_stream=a+16384,S_fresh_stream=a+16512,output=a+32768,N_def=a+40000,S_def=a+50000,N_reset=a+60000,S_reset=a+70000)
        owned=[c for c in commands if c['worker']==w];proofs[w]=dict(worker=w,before_checks=1652,after_checks=1652,all_bytes_equal=True,batches=sum(c['opcode']==2 for c in owned),resets=sum(c['opcode']==0 for c in owned),prefixes=sum(c['opcode']==1 for c in owned))
        for p in profiles:
            for i in set(p['banks']):refs[w,p['id'],i]=20+i%31
    sums={(w,p['id']):sum(refs[w,p['id'],i] for i in p['banks']) for w in range(8) for p in profiles}
    rows=[];events=[];clocks=[];now=1000000
    for c in commands:
        e=eps[c['episode']];w=c['worker'];op=c['opcode'];work=(1 if e['phase']==3 else e['work']^1) if op==1 else e['work'];p=profiles[work];start=now+100;now=start+10
        ops=0 if op==0 else 3072 if op==1 else p['iterations']
        if op==0:
            for kind in ['mono_pair','legacy_nested','empty_batch']:
                clocks.append(dict(command=c['command'],worker=w,episode=e['episode'],kind=kind,operations=512 if kind=='empty_batch' else 128,wall_ns=400,cpu_ns=500,outer_wall_ns=600,begin_ns=now,end_ns=now+600));now+=700
        elif op==1:now+=10000
        else:
            r=plan[c['row']];prefix='N_' if r['arm']==0 else 'S_';background=profiles[p['warm_work']]
            base=3000+work*7 if work<5 or work==11 else p['bytes']*5+10000
            cost=base-(gain if work in [0,1,2] and r['arm']==1 else 0)
            if e['phase'] in [1,4] and r['label']==0:cost+=main_bias
            if e['phase']==3 and e['kind'] in [0,1] and r['label']==0:cost+=guard_null_bias
            if work==3 and e['phase']==3 and e['kind']==2 and r['arm']==1:cost+=guard_shift*(1+e['block'] if guard_variable else 1)
            if ratio_example and work==5:
                base=[100,1000][e['block']%2];cost=base if r['arm']==0 or e['kind']==0 else [101,995][e['block']%2]
                if e['kind']==1:cost=[101,995][e['block']%2]
            cost+=5*r['position'];duration=round(cost*ops);warm_ns=3328000+p['prep']*1000;warm0=now;now+=warm_ns;begin=now+100;end=begin+duration;now=end+100
            last=p['banks'][-1]
            rows.append(dict(r,command=c['command'],operations=ops,warm_operations=3328,prep_operations=p['prep'],warm_work=p['warm_work'],bank_phase=0,
              wall_ns=duration,cpu_ns=duration+20,begin_ns=begin,end_ns=end,cpu_begin_ns=begin-10,cpu_end_ns=end+10,
              warm_wall_ns=warm_ns,warm_cpu_ns=warm_ns+20,warm_begin_ns=warm0,warm_end_ns=warm0+warm_ns,warm_cpu_begin_ns=warm0-10,warm_cpu_end_ns=warm0+warm_ns+10,
              warm_sum=sums[w,background['id']]*(3328//len(background['banks'])),prep_sum=sums[w,work]*(p['prep']//len(p['banks'])),output_sum=sums[w,work]*(ops//len(p['banks'])),last_input=last,output_bytes=refs[w,work,last],
              stream=meta[w][prefix+('fresh_stream' if p['life']==1 else 'stream')],state=meta[w][prefix+'state'],output=meta[w]['output'],def_entry=meta[w][prefix+'def'],reset_entry=meta[w][prefix+'reset'],
              **{pre+k:0 for pre in ['','w_'] for k in ['voluntary','involuntary','minor','major','throttled_periods','throttled_us']}))
        now+=100
        events.append(dict(command=c['command'],worker=w,opcode=op,episode=e['episode'],work=work,operations=ops,output_sum=sums[w,work]*(ops//len(p['banks'])),begin_ns=start,end_ns=now,cpu_begin_ns=start-10,cpu_end_ns=now+10,cpu_before=3,cpu_after=3,reset_calls=4 if op==0 else 0))
    return m,rows,events,clocks,meta,proofs,refs

def calculate(fx):return S.score_records(*fx)

class ClassifierTests(unittest.TestCase):
    def test_zero_is_nonincrease_not_benefit(self):
        x=S.interval([0]*8,1,8);r=S.classify_guard(x,[x]*6,[0]*8,[0,0],100)
        self.assertEqual(r['status'],'CLEAR_NONINCREASE');self.assertNotIn('CLEAR_BENEFIT',r.values())
    def test_imprecision_does_not_hide_consistent_direction(self):
        x=S.interval([1,2,3,4,5,6,7,10000],7.2,8);zero=S.interval([0]*8,1,8)
        r=S.classify_guard(x,[zero]*6,x['blocks'],[1,1],100)
        self.assertFalse(r['resolution_passed']);self.assertTrue(r['observed_consistent_direction']);self.assertEqual(r['status'],'HOLD_SLOWDOWN')
    def test_bad_calibration_retains_positive_diagnostics_without_causal_claim(self):
        x=S.interval([50]*8,1,8);bad=S.interval([200]*8,1,8)
        for nulls,main in [([bad]*6,True),([S.interval([0]*8,1,8)]*6,False)]:
            r=S.classify_guard(x,nulls,[50]*8,[50,50],100,main)
            self.assertTrue(r['observed_positive_effect_interval']);self.assertTrue(r['observed_consistent_direction']);self.assertFalse(r['demonstrated_candidate_slowdown']);self.assertEqual(r['status'],'UNRESOLVED')
    def test_constant_slowdown_below_noise_limit_holds(self):
        zero=S.interval([0]*8,1,8)
        for val,limit in [(50,100),(.5,1)]:
            r=S.classify_guard(S.interval([val]*8,7.2,8),[zero]*6,[val]*8,[val,val],limit)
            self.assertEqual(r['status'],'HOLD_SLOWDOWN');self.assertTrue(r['demonstrated_candidate_slowdown'])
    def test_resolution_limited_is_not_zero_regression(self):
        zero=S.interval([0]*8,1,8);x=dict(mean=0,half=.2,ci=[-.2,.2],absolute_bound=.2)
        r=S.classify_guard(x,[zero]*6,[-1,1]*4,[0,0],1)
        self.assertEqual(r['status'],'RESOLUTION_LIMITED_CLEAR');self.assertFalse(r['zero_regression_proven'])
        x.update(half=1.2,ci=[-1.2,1.2],absolute_bound=1.2)
        self.assertEqual(S.classify_guard(x,[zero]*6,[-1,1]*4,[0,0],1)['status'],'UNRESOLVED')
    def test_mean_ratio_and_invalid_denominators(self):
        n=[100,1000]*4;s=[101,995]*4
        self.assertEqual(sum(100*(b-a)/a for a,b in zip(n,s))/8,.25)
        self.assertLess(100*(sum(s)-sum(n))/sum(n),0)
        for x in [0,-1,float('nan'),float('inf')]:self.assertFalse(math.isfinite(x) and x>0)
    def test_quantiles(self):
        self.assertAlmostEqual(S.quantile(1-.05/32,31),3.204873821676668,places=10)
        self.assertAlmostEqual(S.quantile(1-.05/560,7),7.192794492821542,places=8)

class PlanningTests(unittest.TestCase):
    def test_counts_profiles_and_canonical_bytes(self):
        eps,rows,commands=P.plans();self.assertEqual((len(eps),len(rows),len(commands)),(7040,28160,42240));self.assertEqual(collections.Counter(r['phase'] for r in rows),{1:8192,2:4096,3:7680,4:8192})
        inputs,profiles,data=P.canonical('/SYNTHETIC');self.assertEqual(len(inputs),548);self.assertEqual(sum(len(set(p['banks'])) for p in profiles),826)
        for p in profiles:self.assertEqual(p['iterations']%len(p['banks']),0)
        self.assertEqual(data[400],data[132]+b'\0')
    def test_guard_b_plus_four_conditional_balance_and_linear_time(self):
        es=[e for e in P.plans()[0] if e['phase']==3];groups=collections.defaultdict(list)
        for i in range(0,len(es),2):
            a,b=es[i:i+2];self.assertEqual(a['order']^b['order'],1);groups[a['worker'],a['work'],a['kind']].append(a)
        self.assertEqual(len(groups),120)
        for rs in groups.values():
            by={o:[e for e in rs if e['order']==o] for o in [0,1]}
            self.assertEqual(collections.Counter((e['worker_slot'],e['profile_slot'],e['case_slot']) for e in by[0]),collections.Counter((e['worker_slot'],e['profile_slot'],e['case_slot']) for e in by[1]))
            self.assertEqual([sum(e['block'] for e in by[o]) for o in [0,1]],[14,14])
            for j in range(4):
                a=next(e for e in rs if e['block']==j);b=next(e for e in rs if e['block']==j+4)
                self.assertEqual(tuple(a[k] for k in ['worker_slot','profile_slot','case_slot']),tuple(b[k] for k in ['worker_slot','profile_slot','case_slot']));self.assertNotEqual(a['order'],b['order'])
    def test_main_joint_position_and_linear_time(self):
        es=P.plans()[0]
        for phase,count,multiplicity in [(1,4,2),(2,2,4),(4,4,2)]:
            entries=[es[i] for i in range(0,len(es),2) if es[i]['phase']==phase];joint=collections.Counter((e['worker']&3,e['worker_slot'],e['case_slot'],e['kind']*2+e['work'] if phase!=2 else e['work']) for e in entries)
            self.assertEqual(len(joint),4*8*count*count);self.assertEqual(set(joint.values()),{multiplicity})
    def test_protocol_indices_are_canonical(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td);m=P.write_plan(root);inputs,_,data=P.canonical(root);(root/'inputs').mkdir()
            for x,b in zip(inputs,data):(root/'inputs'/f"{x['id']}.bin").write_bytes(b)
            P.validate_manifest(m,root);(root/'profiles.tsv').write_text('changed')
            with self.assertRaises(P.InvalidData):P.validate_manifest(m,root)

class RecordTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):cls.base=fixture();cls.result=calculate(cls.base)
    def invalid(self,change,pattern):
        fx=copy.deepcopy(self.base);change(fx)
        with self.assertRaisesRegex((P.InvalidData,KeyError),pattern):calculate(fx)
    def test_complete_synthetic_never_qualifies_native(self):
        r=self.result;self.assertTrue(r['statistical_criteria_passed']);self.assertFalse(r['bounded_native_criteria_passed']);self.assertEqual(len(r['controls']),64);self.assertEqual(len(r['effects']),16);self.assertEqual(len(r['guards']),40)
    def test_main_calibration_failure_keeps_all_guard_diagnostics(self):
        r=calculate(fixture(main_bias=200,guard_shift=50));g=next(g for g in r['guards'] if g['work']==3)
        self.assertFalse(r['primary_calibration_passed']);self.assertTrue(g['observed_positive_effect_interval']);self.assertFalse(g['demonstrated_candidate_slowdown']);self.assertEqual(r['rows'],28160)
    def test_weak_public_benefit_fails_without_attribution_rescue(self):self.assertFalse(calculate(fixture(gain=499))['public_benefit_passed'])
    def test_guard_constant_slowdown_holds(self):
        r=calculate(fixture(guard_shift=50));self.assertFalse(r['guard_gate_passed']);self.assertTrue(all(g['status']=='HOLD_SLOWDOWN' for g in r['guards'] if g['work']==3))
    def test_missing_reordered_wrong_labels_and_recipes(self):
        self.invalid(lambda f:f[1].pop(),'complete fixed')
        self.invalid(lambda f:f[1].__setitem__(slice(0,2),f[1][1::-1]),'row schedule')
        self.invalid(lambda f:f[1][0].update(arm=1),'row schedule')
        self.invalid(lambda f:f[1][0].update(warm_operations=256),'fixed warm')
        self.invalid(lambda f:f[2][0].update(reset_calls=2),'event recipe')
    def test_output_pointer_timestamp_and_proof_guards(self):
        for k in ['stream','state','def_entry','reset_entry','output']:
            self.invalid(lambda f,key=k:f[1][0].update({key:0}),'identity')
        self.invalid(lambda f:f[1][0].update(output_sum=0),'reference/output')
        self.invalid(lambda f:f[1][0].update(warm_end_ns=f[1][0]['end_ns']),'wall nesting')
        self.invalid(lambda f:f[5][0].update(after_checks=0),'final correctness')
    def test_clock_missing_duplicate_and_late(self):
        self.invalid(lambda f:f[3].pop(),'complete fixed')
        self.invalid(lambda f:f[3].__setitem__(0,f[3][1]),'clock order')
        self.invalid(lambda f:f[3][0].update(end_ns=f[2][1]['end_ns']),'clock interval')
    def test_native_and_smoke_origin_cannot_bypass_evidence(self):
        self.invalid(lambda f:f[0].update(record_origin='NATIVE_MEASUREMENT'),'native provenance')
        self.invalid(lambda f:f[0].update(record_origin='VALIDATION_ONLY_SYNTHETIC_CLOCK'),'not measurement')
    def test_observed_order_checked_before_sort(self):
        _,r,e,c,*_=self.base;wr=[x for x in r if x['worker']==0];we=[x for x in e if x['worker']==0];wc=[x for x in c if x['worker']==0];S.observed_order(0,wr,we,wc);wc[:2]=wc[1::-1]
        with self.assertRaisesRegex(P.InvalidData,'observed clock order'):S.observed_order(0,wr,we,wc)

class RatioTests(unittest.TestCase):
    def test_used_ratio_helper_and_invalid_denominators(self):
        raw,ratios=S.guard_differences([100,1000]*4,[101,995]*4);self.assertEqual(sum(ratios)/8,.25)
        for value in [0,-1,float('nan'),float('inf')]:
            n=[100]*8;n[0]=value
            with self.assertRaisesRegex(P.InvalidData,'denominator'):S.guard_differences(n,[101]*8)
    def test_full_scorer_uses_mean_of_ratios(self):
        result=calculate(fixture(ratio_example=True));g=next(g for g in result['guards'] if g['work']==5)
        expected=sum(100*(b-a)/a for a,b in zip(g['N_blocks'],g['S_blocks']))/8
        wrong=100*(sum(g['S_blocks'])-sum(g['N_blocks']))/sum(g['N_blocks'])
        self.assertEqual(g['effect']['mean'],expected);self.assertGreater(expected,0);self.assertLess(wrong,0)

class Clock:
    def __init__(self):self.now=0
    def __call__(self):return self.now
class Peer:
    def __init__(self,w,clock,fail=None):self.w=w;self.clock=clock;self.fail=fail;self.sent=[];self.closed=False
    def send(self,text,deadline):self.sent.append(text);self.clock.now+=.0001
    def expect(self,text,deadline):
        if self.fail=='late':self.clock.now+=901
        if self.fail in ['ack','eof'] and text.startswith('DONE'):raise P.InvalidData(self.fail)
        self.clock.now+=.0001
        import direct_study as C
        C.remaining(deadline,self.clock)
    def finish(self,deadline):
        if self.fail=='exit':raise P.InvalidData('nonzero exit')
    def close(self):self.closed=True
class Scorer:
    def __init__(self,changed=False):self.calls=0;self.changed=changed;self.scored=0
    def inventory(self,out):self.calls+=1;return dict(frozen=self.calls if self.changed else 1)
    def score(self,out):self.scored+=1;return dict(record_origin='SYNTHETIC_UNIT_TEST',bounded_native_criteria_passed=False)
    def report(self,out,result):pass
class CoordinatorTests(unittest.TestCase):
    def run_fake(self,td,fail=None,changed=False):
        import direct_study as C
        clock=Clock();peers={};scorer=Scorer(changed)
        def factory(w):peers[w]=Peer(w,clock,fail if w==0 else None);return peers[w]
        result=C.coordinate(td,factory,scorer,clock);self.assertTrue(all(p.closed for p in peers.values()));return result,peers,scorer
    def test_all_commands_and_phases_run_even_when_no_criteria_pass(self):
        with tempfile.TemporaryDirectory() as td:
            result,peers,scorer=self.run_fake(td);self.assertEqual(result['status'],'DIRECT_COMPARISON_COMPLETE');self.assertEqual(result['rows'],28160);self.assertEqual(scorer.scored,1)
            seen=sorted(int(t.split()[1]) for p in peers.values() for t in p.sent if t.startswith('X'))
            self.assertEqual(seen,list(range(42240)));self.assertFalse(result['bounded_native_criteria_passed'])
    def test_late_ack_eof_nonzero_and_mutated_provenance_abort_without_retry(self):
        for fail in ['late','ack','eof','exit']:
            with tempfile.TemporaryDirectory() as td:
                result,_,scorer=self.run_fake(td,fail);self.assertIn(result['status'],['INCOMPLETE_TIMEOUT','INVALID_DATA_OR_PROTOCOL']);self.assertEqual(scorer.scored,0);self.assertEqual(result['retries'],0)
        with tempfile.TemporaryDirectory() as td:
            result,_,scorer=self.run_fake(td,changed=True);self.assertEqual(result['status'],'INVALID_DATA_OR_PROTOCOL');self.assertEqual(scorer.scored,0)
    def test_default_plan_no_native_and_once_guards(self):
        import direct_study as C
        with tempfile.TemporaryDirectory() as td,mock.patch('sys.argv',['direct_study.py','--out',td]),mock.patch.object(C,'prepare',side_effect=AssertionError('native forbidden')):
            self.assertEqual(C.main(),0);self.assertEqual(json.loads((Path(td)/'manifest.json').read_text())['record_origin'],'PLAN_ONLY_NOT_MEASURED')
        with tempfile.TemporaryDirectory() as td:
            p=Path(td)/'once';C.L.claim_once(p,{'GITHUB_RUN_ATTEMPT':'1'})
            with self.assertRaises(P.InvalidData):C.L.claim_once(p,{'GITHUB_RUN_ATTEMPT':'1'})
        head='a'*40;ref='refs/tags/'+P.TAG;env=dict(GITHUB_ACTIONS='true',GITHUB_EVENT_NAME='push',GITHUB_REPOSITORY='re-thc/openjdk-jdk27u',GITHUB_REF_TYPE='tag',GITHUB_REF=ref,GITHUB_RUN_ATTEMPT='1',GITHUB_SHA=head)
        event=dict(repository=dict(full_name=env['GITHUB_REPOSITORY']),ref=ref,created=True,deleted=False,forced=False,before='0'*40,after=head)
        self.assertEqual(C.authorize(env,event,head)['attempt'],1)
        for key,value in [('GITHUB_RUN_ATTEMPT','2'),('GITHUB_REF','refs/heads/main'),('GITHUB_SHA','b'*40)]:
            with self.assertRaises(P.InvalidData):C.authorize(dict(env,**{key:value}),event,head)

def disk_fixture(root):
    import shutil
    root=Path(root);m=P.write_plan(root,'SYNTHETIC_UNIT_TEST');inputs,_,data=P.canonical(root);(root/'inputs').mkdir()
    for x,b in zip(inputs,data):Path(x['path']).write_bytes(b)
    for d in ['source','legacy-source','preparation']:(root/d).mkdir()
    for name in [*P.SOURCES,'tiny-zlib-direct-ns.yml']:
        source=HERE/name if name!='tiny-zlib-direct-ns.yml' else HERE.parents[1]/'workflows'/name
        shutil.copyfile(source,root/'source'/name)
    import direct_study as C
    for name in [*C.L.RUNTIME_FILES,'tiny-zlib-mechanism.yml']:
        source=HERE.parent/'reset-only'/name if name!='tiny-zlib-mechanism.yml' else HERE.parents[1]/'workflows'/name
        shutil.copyfile(source,root/'legacy-source'/name)
    products=['direct-driver','direct-driver-asan','reset-proof','reset-proof-asan','extended-boundaries','extended-boundaries-asan','reset-study','reset-check','reset-invariants','reset-invariants-asan','S/reset-control.o','V/reset-control.o','stock/libz.a']
    products += [v+'/'+n for v in ['N','S','NM','VM','NA','VA','V','SA','VD','VAD'] for n in ['libz.a','ng.so']]
    for name in products:
        p=root/'build'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(('SYNTHETIC_NONEXECUTABLE:'+name).encode())
    for name in ['N','S','SA']:(root/f'public-symbols-{name}.txt').write_text('PUBLIC_SYMBOLS\n')
    proof=dict(cases=66,first_sparse_0_through_64=True,**{'65_full_fallback':True},second_public_reset_full_every_case=True,head_empty_every_reset=True,prev_initialized_on_create=True,public_N_S_verifier_bytes_equal=True,public_libraries_no_test_counters=True,timing=False)
    P.dump(root/'second-reset-proof.json',proof);P.dump(root/'second-reset-proof-asan.json',proof)
    P.dump(root/'launch.json',dict(basecmd=[str(root/'build/direct-driver'),str(root/'build/N/ng.so'),str(root/'build/S/ng.so'),*[str(root/n) for n in ['inputs.tsv','profiles.tsv','episodes.tsv','commands.tsv']],str(root)]))
    for name in ['environment.json','build-commands.json','direct-build-commands.json','extended-boundaries.c','extended-boundaries.log','extended-boundaries-asan.log']:P.dump(root/name,dict(origin='SYNTHETIC_UNIT_TEST'))
    P.dump(root/'approved-publication.json',dict(repository='re-thc/openjdk-jdk27u',tag=P.TAG,attempt=1))
    P.dump(root/'preregistered.json',dict(manifest=P.sha(root/'manifest.json'),before_build=True,sources={str(p.relative_to(root)):P.sha(p) for top in ['source','legacy-source'] for p in (root/top).iterdir()}))
    P.dump(root/'preparation/preregistered.json',dict(frozen_before_measurement=True,files={p.name:P.sha(p) for p in (root/'legacy-source').iterdir()}))
    P.dump(root/'identities.json',{str(p.relative_to(root)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for top in ['source','legacy-source','inputs','build'] for p in (root/top).rglob('*') if p.is_file()})

class ProvenanceTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.root=Path(self.tmp.name);disk_fixture(self.root);self.nm=mock.patch.object(S.subprocess,'check_output',return_value='PUBLIC_SYMBOLS\n');self.nm.start()
    def tearDown(self):self.nm.stop();self.tmp.cleanup()
    def test_full_inventory_actual_bytes(self):self.assertIn('identities.json',S.inventory(self.root))
    def test_changed_inputs_sources_native_binary_and_launch(self):
        for rel in ['inputs/0.bin','source/direct_driver.c','build/S/ng.so']:
            p=self.root/rel;b=p.read_bytes();p.write_bytes(b+b'changed')
            with self.assertRaises(P.InvalidData):S.inventory(self.root)
            p.write_bytes(b)
        p=self.root/'launch.json';x=json.loads(p.read_text());x['basecmd'][2]=str(self.root/'build/VD/ng.so');P.dump(p,x)
        with self.assertRaisesRegex(P.InvalidData,'launch binding'):S.inventory(self.root)
    def test_required_product_and_source_cannot_be_deleted_from_inventory(self):
        p=self.root/'build/SA/ng.so';p.unlink();ids=json.loads((self.root/'identities.json').read_text());ids.pop('build/SA/ng.so');P.dump(self.root/'identities.json',ids)
        with self.assertRaisesRegex(P.InvalidData,'inventory'):S.inventory(self.root)
    def test_real_symbol_scan_bound_to_binary_and_reset_proof(self):
        with mock.patch.object(S.subprocess,'check_output',return_value='jdk_ng_test_sparse_resets\n'):
            with self.assertRaisesRegex(P.InvalidData,'instrumentation'):S.inventory(self.root)
        p=self.root/'second-reset-proof.json';proof=json.loads(p.read_text());proof['second_public_reset_full_every_case']=False;P.dump(p,proof)
        with self.assertRaisesRegex(P.InvalidData,'second reset'):S.inventory(self.root)
    def test_before_after_mismatch_rejected(self):
        proof=S.inventory(self.root);P.dump(self.root/'provenance-before.json',proof);P.dump(self.root/'provenance-after.json',dict(proof,changed=True))
        with self.assertRaisesRegex(P.InvalidData,'before/after'):S.score(self.root)


class SerializationTests(unittest.TestCase):
    def test_manifest_json_round_trip(self):
        m=P.write_plan(Path(tempfile.mkdtemp()),'SYNTHETIC_UNIT_TEST');P.validate_manifest(json.loads(json.dumps(m)))
    def test_kind_numeric_and_clock_symbol(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'x.csv';p.write_text('kind,worker\n2,0\nmono_pair,1\n')
            self.assertEqual(S.read_csv(p),[dict(kind=2,worker=0),dict(kind='mono_pair',worker=1)])

if __name__=='__main__':unittest.main(verbosity=2)

