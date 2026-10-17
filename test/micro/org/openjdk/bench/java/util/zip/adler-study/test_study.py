#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Synthetic/mocked tests. Never launches JMH or a measured process."""
from pathlib import Path
import copy, json, shlex, tempfile, unittest
from unittest.mock import patch, MagicMock
import study as A


def data(ratio=1):
    return {arm:{key:[[100*(ratio if arm=='B' else 1)*x for x in [.9999,1,1.0001]] for _ in range(2)] for key in A.CASES} for arm in A.ARMS}


def xml(decision='intrinsic', compiler='c1'):
    event="<inline_success reason='intrinsic'/>" if decision=='intrinsic' else "<inline_fail reason='native method'/>"
    return f'''<hotspot_log><nmethod compile_id="1" compiler="{compiler}" level="1"/>
      <task compile_id="1"><klass id="1" name="{A.NAME}"/><klass id="2" name="java.util.zip.Adler32"/>
      <method id="10" holder="1" name="adlerDirect"/><method id="11" holder="2" name="updateByteBuffer"/>
      <parse method="10"><call method="11" instr="invokestatic"/>{event}</parse>
      <task_done success="1"/></task></hotspot_log>'''


class StudyTests(unittest.TestCase):
    def test_atomic_json_success_and_same_directory_replace(self):
        with tempfile.TemporaryDirectory() as t:
            path=Path(t)/'state.json';A.dump(path,{'old':True})
            replace=A.os.replace
            def checked(src,dst):
                self.assertEqual(Path(src).parent,path.parent)
                self.assertEqual(Path(dst),path)
                self.assertEqual(A.read(path),{'old':True})
                self.assertEqual(A.read(src),{'new':True})
                replace(src,dst)
            with patch.object(A.os,'replace',side_effect=checked):A.dump(path,{'new':True})
            self.assertEqual(A.read(path),{'new':True})
            self.assertEqual(list(Path(t).iterdir()),[path])

    def test_failed_or_interrupted_json_write_preserves_prior_file(self):
        for error in [OSError('disk full'),KeyboardInterrupt()]:
            with self.subTest(error=type(error).__name__),tempfile.TemporaryDirectory() as t:
                path=Path(t)/'result.json';A.dump(path,{'status':'INVALID'})
                prior=path.read_bytes()
                def partial(value,f,**kwargs):
                    f.write('{"status":');f.flush();raise error
                with patch.object(A.json,'dump',side_effect=partial):
                    with self.assertRaises(type(error)):A.dump(path,{'status':'COMPLETE'})
                self.assertEqual(path.read_bytes(),prior)
                self.assertEqual(list(Path(t).iterdir()),[path])

    def test_failed_sync_or_replace_preserves_prior_and_absent_state(self):
        for action in ['fsync','replace']:
            for exists in [False,True]:
                with self.subTest(action=action,exists=exists),tempfile.TemporaryDirectory() as t:
                    path=Path(t)/'manifest.json'
                    if exists:A.dump(path,{'old':True})
                    with patch.object(A.os,action,side_effect=OSError('publication failure')):
                        with self.assertRaises(OSError):A.dump(path,{'new':True})
                    self.assertEqual(path.exists(),exists)
                    if exists:self.assertEqual(A.read(path),{'old':True})
                    self.assertEqual(list(Path(t).glob('*.tmp')),[])

    def test_failed_result_publication_cannot_return_success(self):
        with tempfile.TemporaryDirectory() as t:
            out=Path(t);replace=A.os.replace;failed=False
            def fail_success(src,dst):
                nonlocal failed
                if Path(dst).name=='result.json' and not failed:
                    failed=True;raise OSError('result publication failure')
                replace(src,dst)
            def fake_analysis(out):
                A.dump(out/'result.json',{'status':'BASELINE_BENEFIT_WITH_BOUNDED_GUARDS'})
                return {'status':'BASELINE_BENEFIT_WITH_BOUNDED_GUARDS'}
            with patch.object(A,'_analyze',side_effect=fake_analysis),patch.object(A.os,'replace',side_effect=fail_success):
                with self.assertRaises(OSError):A.analyze(out)
            self.assertEqual(A.read(out/'result.json')['status'],'INVALID')

    def test_plan_defaults_never_launch_or_download(self):
        with tempfile.TemporaryDirectory() as t,patch.object(A.subprocess,'Popen',side_effect=AssertionError('launch')):
            out=A.plan(Path(t)/'plan');self.assertEqual(A.verify(out)['policy'],A.policy())
            self.assertFalse(A.read(out/'approval-template.json')['approved'])
            self.assertEqual(sum(A.PHASES.values()),900);self.assertEqual(len(A.CASES),7)
            self.assertEqual(A.policy()['timed_forks'],168)
            with self.assertRaises(FileExistsError):A.plan(out)

    def test_no_implicit_execution_approval(self):
        with tempfile.TemporaryDirectory() as t,patch.object(A.subprocess,'Popen',side_effect=AssertionError('launch')):
            out=A.plan(Path(t)/'plan')
            with self.assertRaisesRegex(ValueError,'approval'):A.execute(out,out/'approval-template.json')

    def test_t_quantiles_and_fractional_df(self):
        self.assertAlmostEqual(A.SCORE.t_quantile(.975,5),2.5705818356,places=7)
        self.assertAlmostEqual(A.SCORE.t_quantile(.975,7),2.3646242510,places=7)
        self.assertGreater(A.SCORE.t_quantile(.99,4.5),A.SCORE.t_quantile(.975,4.5))

    def test_interval_is_fork_level_and_stratified(self):
        c=A.SCORE.contrast([[98,99,100],[99,100,101]],[[100,101,102],[100,101,102]])
        self.assertEqual(len(c['session_ratios']),2);self.assertEqual(len(c['log_variance_components']),4)
        self.assertTrue(2<=c['df']<=8.0000001);self.assertEqual(c['family'],14)
        with self.assertRaises(ValueError):A.SCORE.contrast([[1,2]],[[1,2]])
        with self.assertRaises(ValueError):A.SCORE.contrast([[1,1,0]]*2,[[1,1,1]]*2)

    def test_baseline_gate_not_jni_race(self):
        d=data(.96)
        for key in A.CASES:d['C'][key]=[[89.991,90,90.009]]*2;d['CP'][key]=[[89.991,90,90.009]]*2
        result=A.SCORE.assess(d,A.CASES)
        self.assertEqual(result['status'],'BASELINE_BENEFIT_WITH_BOUNDED_GUARDS')
        self.assertGreater(result['comparisons']['direct-4096']['B_over_C_descriptive'][0],1)
        self.assertFalse(result['shipping_qualified'])

    def test_unresolved_control_harm_and_no_benefit_are_distinct(self):
        d=data();self.assertEqual(A.SCORE.assess(d,A.CASES)['status'],'BOUNDED_NONREGRESSION_NO_PROVEN_BENEFIT')
        d['C']['direct-64']=[[150]*3]*2
        self.assertEqual(A.SCORE.assess(d,A.CASES)['status'],'UNRESOLVED_CONTROL')
        d=data(1.2);self.assertEqual(A.SCORE.assess(d,A.CASES)['status'],'HOLD_BASELINE_COST')

    def test_actual_c1_route_and_expected_decline_required(self):
        with tempfile.TemporaryDirectory() as t:
            p=Path(t)/'log.xml';p.write_text(xml());self.assertEqual(A.ROUTES.verify(p,'adlerDirect','intrinsic')['tier'],1)
            with self.assertRaises(ValueError):A.ROUTES.verify(p,'adlerDirect','declined')
            p.write_text(xml(compiler='c2'))
            with self.assertRaises(ValueError):A.ROUTES.verify(p,'adlerDirect','intrinsic')
            p.write_text(xml().replace('</hotspot_log>', '<nmethod compile_id="2" compiler="c2" level="4"/></hotspot_log>'))
            with self.assertRaises(ValueError):A.ROUTES.verify(p,'adlerDirect','intrinsic')
            p.write_text(xml('declined'));A.ROUTES.verify(p,'adlerDirect','declined')

    def test_result_counts_flags_units_and_raw_data_fail_closed(self):
        image=dict(path='/normal/jdk',enabled=True)
        row=dict(benchmark=A.NAME+'.adlerDirect',mode='avgt',threads=1,forks=3,jmhVersion='1.37',warmupIterations=2,measurementIterations=3,warmupTime='200 ms',measurementTime='200 ms',jvmArgs=A.FLAGS+['-XX:+UseAdler32Intrinsics'],jvm='/normal/jdk/bin/java',params=dict(size='4096'),primaryMetric=dict(scoreUnit='ns/op',rawData=[[10,11,12]]*3))
        with tempfile.TemporaryDirectory() as t:
            p=Path(t)/'r.json';A.dump(p,[row]);self.assertEqual(A.result_rows(p,'adlerDirect',[4096],3,image)[4096],[11]*3)
            for change in ['fork','flags','unit','duplicate','missing','nonfinite','duration']:
                with self.subTest(change=change):
                    r=copy.deepcopy(row);values=[r]
                    if change=='fork':r['primaryMetric']['rawData'].pop()
                    elif change=='flags':r['jvmArgs']+=['-XX:TieredStopAtLevel=4']
                    elif change=='unit':r['primaryMetric']['scoreUnit']='us/op'
                    elif change=='duplicate':values=[r,r]
                    elif change=='missing':values=[]
                    elif change=='duration':r['measurementTime']='1 s'
                    else:r['primaryMetric']['rawData'][0][0]=float('nan')
                    p.write_text(json.dumps(values))
                    with self.assertRaises(ValueError):A.result_rows(p,'adlerDirect',[4096],3,image)

    def test_timeout_kills_group_once_and_reap_is_bounded(self):
        with tempfile.TemporaryDirectory() as t:
            p=MagicMock();p.pid=123;p.poll.return_value=None;p.returncode=None
            p.wait.side_effect=A.subprocess.TimeoutExpired('mock',1)
            with patch.object(A.time,'monotonic',return_value=0):
                run=A.Runner(Path(t));run.phase('prepare')
                with patch.object(A.subprocess,'Popen',return_value=p),patch.object(A.os,'killpg') as kill:
                    with self.assertRaises(A.subprocess.TimeoutExpired):run.run(['mock'],'timeout')
                kill.assert_called_once_with(123,A.signal.SIGKILL)
                self.assertEqual([c.kwargs['timeout'] for c in p.wait.call_args_list],[180,5])
                self.assertIn('cleanup_error',A.read(Path(t)/'commands.json')[0])

    def test_evidence_freeze_includes_execution_and_rejects_changed_bytes(self):
        with tempfile.TemporaryDirectory() as t:
            out=Path(t);(out/'raw').mkdir();(out/'diagnostic').mkdir()
            for name in ['manifest.json','commands.json','classes.json','routes.json','execution.json']:A.dump(out/name,{'synthetic':True})
            A.freeze(out);old=A.read(out/'analysis-inputs.json');A.dump(out/'execution.json',{'synthetic':False})
            with self.assertRaises(ValueError):A.freeze(out)
            self.assertEqual(A.read(out/'analysis-inputs.json'),old)

    def test_images_require_clean_source_and_native_mac_libraries(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t)
            for name in ['bin/java','bin/javac','lib/modules','lib/server/libjvm.dylib','lib/libzip.dylib']:
                p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text('synthetic')
            (root/'release').write_text('SOURCE=".:git:'+A.BASE[:12]+'"\n');A.image_identity(root,A.BASE)
            (root/'release').write_text('SOURCE=".:git:'+A.BASE[:12]+'+"\n')
            with self.assertRaises(ValueError):A.image_identity(root,A.BASE)

    def test_complete_mocked_pipeline_and_failed_reaudit(self):
        # Synthetic JDK files and mocked commands only. No JMH/JVM process.
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);out=A.plan(root/'plan')
            images={}
            for name,rev in [('baseline',A.BASE),('candidate',A.CANDIDATE)]:
                home=root/name
                for n in ['bin/java','bin/javac','lib/modules','lib/server/libjvm.dylib','lib/libzip.dylib']:
                    p=home/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text('synthetic')
                (home/'release').write_text('SOURCE=".:git:'+rev[:12]+'"\n')
                images[name]=A.image_identity(home,rev)
            m=A.read(out/'manifest.json');m['images']=images;A.dump(out/'manifest.json',m)
            approval=out/'approved-synthetic.json';A.dump(approval,dict(approved=True,purpose='ADLER_PUBLIC_C1_COMPARISON',manifest_sha256=A.sha(out/'manifest.json'),total_seconds=900,retries=0))
            original_sha=A.sha
            def synthetic_sha(path):
                path=Path(path)
                return m['dependencies'][path.name]['sha256'] if path.parent==out/'deps' else original_sha(path)
            def command(run,cmd,label):
                cmd=list(map(str,cmd));run.commands.append(dict(phase=run.name,argv=cmd));A.dump(out/'commands.json',run.commands)
                if cmd[0]=='/usr/bin/curl':Path(cmd[cmd.index('-o')+1]).write_text('synthetic dependency')
                elif cmd[0].endswith('/javac'):(out/'classes'/(label+'.class')).write_text('synthetic class')
                elif label.endswith('-vm-identity'):(out/(label+'.log')).write_text('OpenJDK synthetic release image identity')
                elif '-rff' in cmd:
                    method='adlerDirect' if 'adlerDirect' in cmd[4] else 'adlerHeap'
                    sizes=list(map(int,cmd[cmd.index('-p')+1].split('=')[1].split(',')))
                    forks=int(cmd[cmd.index('-f')+1]);flags=shlex.split(cmd[cmd.index('-jvmArgs')+1]);enabled='-XX:+UseAdler32Intrinsics' in flags
                    which=Path(cmd[0]).parent.parent.name
                    value=100 if enabled and which=='baseline' else 96 if enabled else 90
                    rows=[dict(benchmark=A.NAME+'.'+method,mode='avgt',threads=1,forks=forks,jmhVersion='1.37',warmupIterations=2,measurementIterations=3,warmupTime='200 ms',measurementTime='200 ms',jvmArgs=flags,jvm=cmd[0],params=dict(size=str(n)),primaryMetric=dict(scoreUnit='ns/op',rawData=[[value*(1+.0001*(fork-1))]*3 for fork in range(forks)])) for n in sizes]
                    A.dump(Path(cmd[cmd.index('-rff')+1]),rows)
                    if forks==1:
                        log=next(f for f in flags if f.startswith('-XX:LogFile=')).split('=',1)[1].replace('%p','123')
                        decision='intrinsic' if enabled and (which=='baseline' or method=='adlerHeap') else 'declined'
                        body=xml(decision).replace('adlerDirect',method)
                        if method=='adlerHeap':body=body.replace('updateByteBuffer','updateBytes')
                        Path(log).write_text(body)
            with patch.object(A.Runner,'run',command),patch.object(A,'sha',side_effect=synthetic_sha),patch.object(A.platform,'system',return_value='Darwin'),patch.object(A.platform,'machine',return_value='arm64'),patch.dict(A.os.environ,{},clear=True),patch.object(A.subprocess,'Popen',side_effect=AssertionError('launch')):
                A.execute(out,approval)
                self.assertEqual(A.read(out/'result.json')['status'],'BASELINE_BENEFIT_WITH_BOUNDED_GUARDS')
                self.assertEqual(len(A.read(out/'routes.json')),28)
                self.assertEqual(len(list((out/'raw').glob('*.json'))),16)
                marker=(out/'EXECUTION_STARTED').read_bytes()
                # Neither a repeated run nor an interrupted marker can be overwritten.
                with self.assertRaises(FileExistsError):A.execute(out,approval)
                self.assertEqual((out/'EXECUTION_STARTED').read_bytes(),marker)
                (out/'EXECUTION_STARTED').write_text('{')
                with self.assertRaises(FileExistsError):A.execute(out,approval)
                self.assertEqual((out/'EXECUTION_STARTED').read_text(),'{')
                path=out/'raw/0-B-adlerDirect.json';rows=A.read(path);rows[0]['primaryMetric']['rawData'][0][0]+=1;A.dump(path,rows)
                with self.assertRaises(ValueError):A.analyze(out)
                self.assertEqual(A.read(out/'result.json')['status'],'INVALID')
                with self.assertRaises(ValueError):A.analyze(out)

    def test_changed_dependency_pins_are_not_executable(self):
        with tempfile.TemporaryDirectory() as t:
            out=A.plan(Path(t)/'plan');m=A.read(out/'manifest.json')
            m['dependencies']['jmh-core.jar']['sha256']='0'*64;A.dump(out/'manifest.json',m)
            with self.assertRaisesRegex(ValueError,'Dependency pins changed'):A.verify(out)

    def test_wide_interval_stays_unresolved_without_dropping_a_fork(self):
        d=data(.96);d['B']['direct-64']=[[50,100,150],[50,100,150]]
        self.assertEqual(A.SCORE.assess(d,A.CASES)['status'],'UNRESOLVED_PRECISION')
        self.assertEqual(d['B']['direct-64'][0],[50,100,150])

    def test_release_identity_rejects_debug_or_missing_metadata(self):
        with tempfile.TemporaryDirectory() as t:
            p=Path(t)/'baseline-vm-identity.log'
            p.write_text('OpenJDK synthetic fastdebug image identity')
            with self.assertRaises(ValueError):A.release_identity(Path(t),'baseline')
            p.write_text('')
            with self.assertRaises(ValueError):A.release_identity(Path(t),'baseline')

    def test_zero_fork_variance_is_not_zero_uncertainty(self):
        d=data()
        d['C']['direct-64']=[[100]*3]*2;d['CP']['direct-64']=[[100]*3]*2
        result=A.SCORE.assess(d,A.CASES)
        self.assertEqual(result['status'],'UNRESOLVED_CONTROL')
        self.assertIsNone(result['comparisons']['direct-64']['image_control']['upper'])

if __name__=='__main__':unittest.main(verbosity=2)
