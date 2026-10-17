"""Offline contract and orchestration checks: inert files and mocked workloads only."""
import copy
import io
import json
import math
import os
from pathlib import Path
import struct
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

import current_campaign as c
import current_campaign_contract as k
from classifier_images import canonical,payload_manifest,record
from tool_invocation import invocation_record


def plan(platform='mac'):
    p=dict(schema=2,experiment='pr14-current-decision-v2',refs=dict(k.REFS),platform=platform,
        comparisons=k.comparisons(platform),observed=[[condition,role] for condition,role in k.observed(platform)],
        pairs=12,windows=5,calls=100000,limits=dict(ratio=1.02,allocation=.01,bootstrap=20000),
        stages=k.STAGES,stage_caps=k.stage_caps(platform),
        counts=k.counts(platform),automatic_retry=False,qualified=False,
        builds='two full release images, no module overlays',affinity=None if platform=='mac' else [2,3],
        history=dict(primer_kernel_calls=61001,zero_call_metadata_windows=1000,warmup_calls=10000,calibration_calls=1000))
    return seal(p)

def seal(p):
    p['sha256']=canonical({key:value for key,value in p.items() if key!='sha256'});return p

def windows(diagnostic=False):
    return [dict(kernel='conversion',phase='measure'+str(i),count='0',calls='1000' if diagnostic else '100000',
        nanoseconds='10000000',allocated_bytes='0',compilation_ms='0',checksum='123',
        normal_before='4' if diagnostic else '-1',normal_after='4' if diagnostic else '-1',
        osr_installed_before='-1',osr_installed_after='-1') for i in range(5)]

def pairs(specs):
    return [dict(comparison=spec,pair=i,order=[spec['reference'],'candidate'] if i%2==0 else ['candidate',spec['reference']],
        results={role:dict(ns_per_op=.99 if role=='candidate' else 1.,B_per_op=0.,checksum='123')
            for role in ['candidate',spec['reference']]}) for spec in specs for i in range(12)]

class Contract(unittest.TestCase):
    def test_counts_and_separate_historical_questions(self):
        for platform,n,timed,observed in [('mac',7,168,16),('linux',14,336,32)]:
            p=k.verify_plan(plan(platform));self.assertEqual(p['counts'],dict(comparisons=n,timed_JVMs=timed,
                observed_JVMs=observed,legacy_JVMs=24 if platform=='mac' else 48,
                controls_JVMs=144 if platform=='mac' else 288,
                legacy_observed_JVMs=4 if platform=='mac' else 8,
                controls_observed_JVMs=12 if platform=='mac' else 24))
            self.assertEqual(len({canonical(s) for s in p['comparisons']}),n)
            self.assertEqual(set(p['refs']),{'master','candidate'})
            self.assertTrue(all(s['reference']=='master' for s in p['comparisons']))
            self.assertEqual(sum(p['stage_caps'].values()),14100 if platform=='mac' else 19200)

    def test_resealed_policy_mutations_rejected(self):
        changes={'pairs':14,'calls':90000,'windows':4,'qualified':True,'automatic_retry':True,
            'builds':'b3 module overlay','counts':{},'history':{},'refs':{},'comparisons':[],
            'observed':[],'stage_caps':{},'stages':[],'limits':{},'affinity':[1],'schema':1}
        for name,value in changes.items():
            with self.subTest(name=name),self.assertRaises(RuntimeError):
                p=plan();p[name]=value;k.verify_plan(seal(p))
        p=plan();p['calls']=1
        with self.assertRaises(RuntimeError):k.verify_plan(p)

    def test_receipts_are_source_and_platform_scoped(self):
        with tempfile.TemporaryDirectory() as tmp:
            path=Path(tmp)/'receipt.json'
            value=dict(passed=True,source=k.REFS['candidate'],scope='current-native-fastdebug-codegen',UseSVE=0)
            path.write_text(json.dumps(value));k.correctness(path,'mac')
            with self.assertRaises(RuntimeError):k.correctness(path,'linux')
            value.update(platform='linux',sve_modes=['default','0']);path.write_text(json.dumps(value));k.correctness(path,'linux')
            value['source_head']='wrong';path.write_text(json.dumps(value))
            with self.assertRaises(RuntimeError):k.correctness(path,'mac')
            value.pop('source');value.update(source_head=k.REFS['candidate'],kind='user-reported-native-current-codegen-result',
                source_clean=True,user_checked_raw_markers=True,full_native_fastdebug_image=True)
            path.write_text(json.dumps(value));k.correctness(path,'mac')
            with self.assertRaises(RuntimeError):k.correctness(path,'linux')

    def test_windows_fail_closed(self):
        k.validate_windows(windows(),'conversion',False);k.validate_windows(windows(True),'conversion',True)
        for key,value in [('phase','measure0'),('calls','1'),('kernel','rawBits'),('count','2'),
            ('nanoseconds','0'),('allocated_bytes','-1'),('compilation_ms','1'),('normal_before','4'),('checksum','124')]:
            with self.subTest(key=key),self.assertRaises(RuntimeError):
                rows=windows();rows[-1][key]=value;k.validate_windows(rows,'conversion',False)
        for changed in [windows()[:-1],windows()+windows()[:1]]:
            with self.assertRaises(RuntimeError):k.validate_windows(changed,'conversion',False)
        rows=windows(True);rows[0]['normal_after']='0'
        with self.assertRaises(RuntimeError):k.validate_windows(rows,'conversion',True)

    def test_independent_pair_gates_and_boundaries(self):
        specs=k.comparisons('mac');sample=pairs(specs)
        with mock.patch.object(k,'interval',return_value=[.98,1.02]):
            result=k.gate(sample,specs)
            self.assertTrue(result['passed']);self.assertEqual(len(result['summaries']),7)
        with mock.patch.object(k,'interval',return_value=[.98,.999]):self.assertTrue(k.gate(sample,specs)['passed'])
        recovery=[s for s in specs if s['stage']=='legacy'];sample=pairs(recovery)
        sample[0]['results']['candidate']['B_per_op']=.01
        with mock.patch.object(k,'interval',return_value=[1.,1.02]):self.assertTrue(k.gate(sample,recovery)['passed'])
        sample[0]['results']['candidate']['B_per_op']=.01001
        with mock.patch.object(k,'interval',return_value=[1.,1.02]):self.assertFalse(k.gate(sample,recovery)['passed'])

    def test_regression_and_inconclusive_are_stops_not_sample_extensions(self):
        specs=[s for s in k.comparisons('mac') if s['stage']=='legacy'];sample=pairs(specs)
        for ci,verdict in [([.99,1.03],'inconclusive'),([1.021,1.04],'regression')]:
            with mock.patch.object(k,'interval',return_value=ci):
                result=k.gate(sample,specs);self.assertFalse(result['passed'])
                self.assertEqual(result['summaries'][0]['verdict'],verdict)
                self.assertEqual(result['summaries'][0]['pairs'],12)

    def test_malformed_pair_samples_rejected(self):
        spec=k.comparisons('mac')[:1]
        for field,value in [('ns_per_op',0),('ns_per_op',-1),('ns_per_op',math.nan),('ns_per_op',math.inf),
            ('B_per_op',-1),('B_per_op',math.nan),('B_per_op',math.inf)]:
            with self.subTest(field=field,value=value),self.assertRaises(RuntimeError):
                sample=pairs(spec);sample[0]['results']['candidate'][field]=value;k.gate(sample,spec)
        for change in ['duplicate','order','checksum','roles','missing']:
            sample=pairs(spec)
            if change=='duplicate':sample[-1]['pair']=0
            if change=='order':sample[0]['order'].reverse()
            if change=='checksum':sample[0]['results']['candidate']['checksum']='wrong'
            if change=='roles':sample[0]['results']['other']=sample[0]['results']['candidate']
            if change=='missing':sample.pop()
            with self.subTest(change=change),self.assertRaises(RuntimeError):k.gate(sample,spec)

    def test_real_pair_bootstrap(self):
        spec=k.comparisons('mac')[:1];result=k.gate(pairs(spec),spec)
        self.assertTrue(result['passed']);self.assertAlmostEqual(result['summaries'][0]['paired_95_ratio'][1],.99)


class Orchestration(unittest.TestCase):
    def test_product_object_refs_have_common_configure_and_different_module_sources(self):
        identities={role:c.source_identity(c.ROOT,ref) for role,ref in k.REFS.items()}
        self.assertEqual(len({r['configure_blob'] for r in identities.values()}),1)
        self.assertEqual(next(iter(identities.values()))['configure_blob'],'2ecd0af5f39cde720ec453bd6346a99c97d3600d')
        self.assertNotEqual(identities['candidate']['trees']['src'],identities['master']['trees']['src'])
        self.assertNotEqual(c.git(c.ROOT,'rev-parse',k.REFS['candidate']+':src/jdk.incubator.vector'),
                            c.git(c.ROOT,'rev-parse',k.REFS['master']+':src/jdk.incubator.vector'))

    def test_dual_root_plan_and_mutation_admission_without_workloads(self):
        with tempfile.TemporaryDirectory() as tmp:
            t=Path(tmp);harness=t/'harness';harness.mkdir();receipt=t/'correctness.json'
            receipt.write_text(json.dumps(dict(passed=True,source=k.REFS['candidate'],scope='current-native-fastdebug-codegen',UseSVE=0)))
            jtreg=t/'jtreg';jtreg.mkdir();decoder=t/'decoder';decoder.mkdir();(decoder/'inert.py').write_text('inert')
            args=SimpleNamespace(product_repo=c.ROOT,boot_jdk=t/'boot',jtreg=jtreg,out=t/'fresh',platform='mac',correctness_receipt=receipt)
            source_ids={role:c.source_identity(c.ROOT,ref) for role,ref in k.REFS.items()}
            fake_tools=dict(paths={},identities={},sdk=None);original_git=c.git
            def git(root,*argv):
                return 'harness-commit' if Path(root)==harness else original_git(root,*argv)
            fake_decoder=SimpleNamespace(__file__=str(decoder/'inert.py'))
            with mock.patch.object(c,'ROOT',harness),mock.patch.object(c,'SOURCES',[]),mock.patch.object(c,'snapshot_tools',return_value=fake_tools), \
                 mock.patch.object(c,'executed_binding',return_value={'tree':'harness-bytes'}),mock.patch.object(c,'git',side_effect=git), \
                 mock.patch.object(c,'inventory',return_value={}),mock.patch.object(c,'harness_version',return_value='8.3+0'), \
                 mock.patch.object(c.importlib.metadata,'version',return_value='inert'),mock.patch.dict(sys.modules,{'capstone':fake_decoder}), \
                 mock.patch.object(c.subprocess,'Popen',side_effect=AssertionError('No workload permitted')):
                # Source object reads were captured before denying all subprocess execution.
                with mock.patch.object(c,'source_identity',side_effect=lambda repo,ref:source_ids[next(r for r,v in k.REFS.items() if v==ref)]):
                    p=c.make_plan(args)
                    self.assertEqual(p['harness_root'],str(harness));self.assertEqual(p['product_repo'],str(args.product_repo))
                    self.assertFalse(args.out.exists())
                    s=c.Session.__new__(c.Session);s.p=p;s.repo=args.product_repo
                    c.Session.invariant(s)
                    with mock.patch.object(c,'executed_binding',return_value={'tree':'changed-harness'}):
                        with self.assertRaises(RuntimeError):s.invariant()
                    with mock.patch.object(c,'source_identity',return_value={'head':'changed-product'}):
                        with self.assertRaises(RuntimeError):s.invariant()

    def test_timing_and_observation_arguments_are_separate(self):
        for platform in ['mac','linux']:
            p=plan(platform);p['tools']={'paths':{'taskset':'/recorded/taskset'}}
            s=SimpleNamespace(p=p,manifest={'binding':{'images':{'candidate':{'root':'/full/candidate'}},'classes':'/classes'}},stage_dir=Path('/observed'))
            timed=list(map(str,c.launch_arguments(s,'candidate',['legacy','0','default','conversion'],'case',False)))
            diagnostic=list(map(str,c.launch_arguments(s,'candidate',['legacy','0','1','conversion'],'case',True)))
            self.assertIn('-DmeasureCalls=100000',timed);self.assertIn('-DmeasureCalls=1000',diagnostic)
            self.assertFalse(any(any(token in arg for token in ['WhiteBox','LogCompilation','LogFile','PrintFlags','observeCompilation','CompileCommand=print','LoopMaxUnroll']) for arg in timed))
            self.assertIn('-XX:LoopMaxUnroll=1',diagnostic)
            if platform=='linux':self.assertEqual(timed[:3],['/recorded/taskset','-c','2'])
            self.assertIn('/full/candidate/bin/java',timed)

    def test_plan_and_dry_commands_do_not_start_workloads(self):
        with tempfile.TemporaryDirectory() as tmp:
            path=Path(tmp)/'plan.json';path.write_text(json.dumps(plan()))
            for stage in k.STAGES:
                with mock.patch.object(sys,'argv',['runner',stage,'--plan',str(path)]),mock.patch.object(c,'Session',side_effect=AssertionError('Executed dry command')),mock.patch('sys.stdout',new_callable=io.StringIO) as out:
                    c.main();self.assertFalse(json.loads(out.getvalue())['executed'])
            with mock.patch.object(sys,'argv',['runner','legacy','--plan',str(path),'--execute']),mock.patch.object(c,'Session',side_effect=AssertionError('Missing approval gate')):
                with self.assertRaises(RuntimeError):c.main()

    def test_exact_balanced_orchestration_without_jvms(self):
        with tempfile.TemporaryDirectory() as tmp:
            for platform in ['mac','linux']:
                for stage in ['legacy','controls']:
                    directory=Path(tmp)/(platform+'-'+stage);directory.mkdir();seen=[];prereqs=[]
                    s=SimpleNamespace(p=plan(platform),stage=stage,stage_dir=directory,
                        prerequisite=lambda name:prereqs.append(name),finish=lambda value:value)
                    def launch(session,role,condition,name,diagnostic):
                        self.assertFalse(diagnostic);seen.append((role,condition,name))
                        return dict(ns_per_op=.99 if role=='candidate' else 1.,B_per_op=0.,checksum='123')
                    with mock.patch.object(c,'launch',side_effect=launch),mock.patch.object(k,'interval',return_value=[.98,.999]):
                        self.assertTrue(c.timing(s)['passed'])
                    self.assertEqual(len(seen),s.p['counts'][stage+'_JVMs'])
                    self.assertEqual(prereqs,[stage+'-assembly']+(['legacy'] if stage=='controls' else []))
                    self.assertEqual(len((directory/'pairs.jsonl').read_text().splitlines()),len(seen)//2)
                    for left,right in zip(seen[::2],seen[1::2]):self.assertEqual(left[1],right[1])

    def test_failed_prerequisite_or_sample_stops_without_retry(self):
        with tempfile.TemporaryDirectory() as tmp:
            s=SimpleNamespace(p=plan(),stage='controls',stage_dir=Path(tmp),
                prerequisite=mock.Mock(side_effect=RuntimeError('missing gate')),finish=lambda value:value)
            with mock.patch.object(c,'launch') as launch:
                with self.assertRaises(RuntimeError):c.timing(s)
                launch.assert_not_called()
            s.prerequisite=mock.Mock()
            with mock.patch.object(c,'launch',side_effect=RuntimeError('first sample failed')) as launch:
                with self.assertRaises(RuntimeError):c.timing(s)
                self.assertEqual(launch.call_count,1)

    def test_complete_nonpassing_legacy_cohort_is_retained_without_topup(self):
        with tempfile.TemporaryDirectory() as tmp:
            saved=[];s=SimpleNamespace(p=plan(),stage='legacy',stage_dir=Path(tmp),
                prerequisite=mock.Mock(),finish=lambda result:saved.append(result))
            result=dict(ns_per_op=1.,B_per_op=0.,checksum='123')
            with mock.patch.object(c,'launch',return_value=result) as launch,mock.patch.object(k,'interval',return_value=[.99,1.03]):
                with self.assertRaises(RuntimeError):c.timing(s)
                self.assertEqual(launch.call_count,24)
            self.assertEqual(len((Path(tmp)/'pairs.jsonl').read_text().splitlines()),12)
            self.assertEqual(saved[0]['summaries'][0]['verdict'],'inconclusive')
            self.assertFalse(saved[0]['passed'])

    def test_controls_assembly_waits_for_legacy_then_observes_only_frozen_cells(self):
        with tempfile.TemporaryDirectory() as tmp:
            directory=Path(tmp);s=SimpleNamespace(p=plan(),stage='controls-assembly',stage_dir=directory,
                prerequisite=mock.Mock(side_effect=RuntimeError('legacy inconclusive')),finish=lambda value:value)
            with mock.patch.object(c,'launch') as launch:
                with self.assertRaises(RuntimeError):c.assembly(s)
                launch.assert_not_called();s.prerequisite.assert_called_once_with('legacy')
            s.prerequisite=mock.Mock();seen=[]
            def launch(session,role,condition,name,diagnostic):
                seen.append((role,condition))
                (directory/(name+'.xml')).write_text('<hotspot_log>'+
                    '<nmethod compile_id="1" method="PhaseVectorKernels '+condition[3]+' (I)J"/>'+
                    '<nmethod compile_id="2" method="FixedVectorProbe invoke (I)J"/>'+
                    '<nmethod compile_id="3" method="FixedVectorProbe window (Ljava/lang/String;II)V"/>'+
                    '</hotspot_log>')
                (directory/(name+'.out')).write_text(role)
            # Changed current-source raw code is preserved, not required to equal unbuilt b3 code.
            with mock.patch.object(c,'launch',side_effect=launch),mock.patch.object(c,'decode_ordinary',side_effect=lambda text,n:dict(role=text)), \
                 mock.patch.object(c,'loops',side_effect=lambda code:[dict(instructions=[{}],bytes=code['role'])]), \
                 mock.patch.object(c,'check_conversion_loop',side_effect=lambda bodies,name:bodies[0]):
                self.assertEqual(c.assembly(s)['observed_JVMs'],12)
            self.assertEqual({(cond[0],cond[3]) for role,cond in seen},set(k.CONTROL_CELLS))
            self.assertEqual(set(role for role,cond in seen),{'master','candidate'})
            self.assertNotIn(('legacy','conversion'),{(cond[0],cond[3]) for role,cond in seen})

    def test_assembly_exact_cohort_and_fail_closed_caller_or_kernel_evidence(self):
        for failure in [None,'missing-caller','dead-caller','osr-kernel','bad-bytes','missing-loop']:
            with self.subTest(failure=failure),tempfile.TemporaryDirectory() as tmp:
                directory=Path(tmp);s=SimpleNamespace(p=plan(),stage='legacy-assembly',stage_dir=directory,finish=lambda result:result);seen=[]
                def launch(session,role,condition,name,diagnostic):
                    self.assertTrue(diagnostic);seen.append((role,condition))
                    kernel_kind=' compile_kind="osr"' if failure=='osr-kernel' else ''
                    xml='<hotspot_log><nmethod compile_id="1" method="PhaseVectorKernels '+condition[3]+' (I)J"'+kernel_kind+'/>'
                    if failure!='missing-caller':xml+='<nmethod compile_id="2" method="FixedVectorProbe invoke (I)J"/>'
                    xml+='<nmethod compile_id="3" method="FixedVectorProbe window (Ljava/lang/String;II)V"/>'
                    if failure=='dead-caller':xml+='<make_not_entrant compile_id="2"/>'
                    (directory/(name+'.xml')).write_text(xml+'</hotspot_log>')
                    (directory/(name+'.out')).write_text(role+' '+condition[3])
                def decode(text,nmethod):
                    if failure=='bad-bytes':raise RuntimeError('incomplete raw bytes')
                    return dict(fixture=text,id=nmethod['compile_id'])
                def loops(code):
                    if failure=='missing-loop':return []
                    return [dict(instructions=[{}],bytes='common')]
                with mock.patch.object(c,'launch',side_effect=launch),mock.patch.object(c,'decode_ordinary',side_effect=decode), \
                     mock.patch.object(c,'loops',side_effect=loops),mock.patch.object(c,'check_conversion_loop',side_effect=lambda bodies,name:bodies[0]):
                    if failure:
                        with self.assertRaises((RuntimeError,IndexError)):c.assembly(s)
                    else:
                        result=c.assembly(s);self.assertTrue(result['passed']);self.assertEqual(result['observed_JVMs'],4)
                        self.assertEqual(seen,[(role,condition) for condition,role in k.observed('mac','legacy-assembly')])

    def test_prepare_two_full_images_one_common_class_compilation(self):
        with tempfile.TemporaryDirectory() as tmp:
            out=Path(tmp);commands=[];p=plan();p.update(boot='/native/boot',jtreg='/installed/jtreg',harness_version='8.3+0',
                tools={'paths':{'make':'/tools/gmake','git':'/tools/git','bash':'/tools/bash'},'sdk':'/SDK'})
            def run(name,args,cwd=None,maximum=180):
                args=list(map(str,args));commands.append((name,args));log=out/(name+'.out')
                log.write_text('GNU Make 4.4\n8.3+0\n')
                if name.endswith('-checkout'):Path(args[-2]).mkdir(parents=True)
                if name.endswith('-build'):
                    image=cwd/'build/current-full/images/jdk'
                    for relative in ['bin/java','bin/javac','lib/modules','release','lib/server/libjvm.dylib']:
                        target=image/relative;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(b'inert '+name.encode())
                    (cwd/'build/current-full/spec.gmk').write_text('CC = /tools/clang\nCXX = /tools/clang++\n')
                if name=='compile-whitebox':(out/'classes/WhiteBox.class').write_bytes(b'inert common WB')
                if name=='compile-frozen-inputs':(out/'classes/Frozen.class').write_bytes(b'inert common frozen classes')
                return log
            s=SimpleNamespace(p=p,out=out,repo=Path('/product-objects'),run=run,finish=lambda result:result)
            with mock.patch.object(c,'native_image'),mock.patch.object(c,'require_clean') as clean:
                result=c.prepare(s)
            self.assertTrue(result['passed']);self.assertEqual(clean.call_count,2);self.assertEqual(result['full_images'],2)
            self.assertEqual([name for name,args in commands if name.endswith('-build')],[r+'-build' for r in k.REFS])
            self.assertEqual(sum(name=='compile-frozen-inputs' for name,args in commands),1)
            self.assertEqual(sum(name=='compile-whitebox' for name,args in commands),1)
            for role,ref in k.REFS.items():
                checkout=next(args for name,args in commands if name==role+'-checkout');self.assertEqual(checkout[-1],ref)
                build=next(args for name,args in commands if name==role+'-build');self.assertEqual(build[-1],'images')
                configure=next(args for name,args in commands if name==role+'-configure');self.assertIn('--disable-ccache',configure)
            manifest=json.loads((out/'inputs.json').read_text());self.assertEqual(len(manifest['binding']['images']),2)
            self.assertEqual(len({r['payload']['lib/modules']['sha256'] for r in manifest['binding']['images'].values()}),2)
            self.assertEqual(manifest['binding']['whitebox_source']['source_ref'],k.REFS['master'])
            self.assertEqual(result['inputs_record'],record(out/'inputs.json'))

    def test_driver_alias_preserved_and_native_image_headers(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);driver=root/'clang';driver.write_bytes(b'inert compiler');alias=root/'clang++';alias.symlink_to(driver.name)
            value=invocation_record(alias);self.assertEqual(value['invocation'],str(alias));self.assertEqual(value['resolved'],str(driver.resolve()))
            for platform in ['mac','linux']:
                header=(b'\xcf\xfa\xed\xfe'+struct.pack('<I',0x0100000c)) if platform=='mac' else (b'\x7fELF\x02\x01'+b'\0'*12+struct.pack('<H',183))
                names=['bin/java','bin/javac','lib/server/libjvm.'+('dylib' if platform=='mac' else 'so')]
                for name in names:
                    path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(header)
                c.native_image(root,platform)
                (root/'bin/java').write_bytes(b'x86 or malformed')
                with self.assertRaises(RuntimeError):c.native_image(root,platform)

    def test_image_spec_class_and_manifest_mutations_rejected(self):
        for change in ['manifest','class-added','class-changed','spec','image','source','roles']:
            with self.subTest(change=change),tempfile.TemporaryDirectory() as tmp:
                out=Path(tmp);images={}
                for role in k.REFS:
                    root=out/role;root.mkdir();core=root/'core';core.write_bytes(role.encode());spec=root/'spec';spec.write_text('config')
                    images[role]=dict(root=str(root),source='/source/'+role,spec=str(spec),spec_record=record(spec),
                        payload=payload_manifest(root),core_stat={'core':c.stat_record(core)})
                classes=out/'classes';classes.mkdir();clazz=classes/'Frozen.class';clazz.write_bytes(b'common')
                binding=dict(images=images,classes=str(classes),assets={str(clazz):record(clazz)})
                m=dict(plan_sha=plan()['sha256'],binding=binding,binding_sha=canonical(binding));path=out/'inputs.json';path.write_text(json.dumps(m))
                s=c.Session.__new__(c.Session);s.out=out;s.manifest=m;s.p=plan();s.prepared={'inputs_record':record(path)}
                with mock.patch.object(c,'require_clean'):s.verify_inputs(True)
                if change=='manifest':path.write_text(path.read_text()+' ')
                if change=='class-added':(classes/'Unexpected.class').write_bytes(b'shadow')
                if change=='class-changed':clazz.write_bytes(b'changed')
                if change=='spec':(out/'candidate/spec').write_text('changed config')
                if change=='image':(out/'candidate/core').write_bytes(b'changed VM')
                if change=='roles':m['binding']['images'].pop('master');m['binding_sha']=canonical(m['binding'])
                with mock.patch.object(c,'require_clean',side_effect=RuntimeError('changed source') if change=='source' else None):
                    with self.assertRaises(RuntimeError):s.verify_inputs(True)


if __name__=='__main__':unittest.main(verbosity=2)
