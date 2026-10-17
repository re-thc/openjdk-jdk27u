"""Offline orchestration, source-input, platform and retained-gate regression tests."""
import argparse
import copy
import json
import os
from pathlib import Path
import re
import struct
import subprocess
import sys
import tempfile
from types import SimpleNamespace
from unittest import mock

import native_source_qualify as n
import source_inputs as inputs
import jtreg83_harness as h
import focused_native as focused
from assembly_cohorts import cohorts,verify_index
import run_roundtrip_candidate as performance
from run_roundtrip_full import suite_counts
from classifier_images import payload_manifest,record,source_binding,pins
from check_roundtrip_assembly import cluster,check_conversion_loop


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True);a=p.parse_args()
    root=Path(__file__).resolve().parents[2];cases=[]
    def rejected(name,fn):
        try:fn()
        except (RuntimeError,SystemExit):cases.append(name)
        else:raise AssertionError('Accepted '+name)
    source_binding(root,pins());cases.append('complete current source binding and unchanged product/test/build trees')
    for target,scope,count,builds in [('linux','complete',720,5),('mac','complete',360,5),('mac','correctness',0,4),('mac','focused',0,2),('mac','assembly',0,3),('linux','assembly',0,3)]:
        with mock.patch.object(n.subprocess,'Popen',side_effect=AssertionError('Execution during planning')), mock.patch.object(n,'git',return_value='reviewhead'):
            plan=n.plan(root,Path('/not-created'),Path('/harness'),Path('/boot'),target,scope)
        assert plan['performance']['maximum_timed_JVMs']==count and len(plan['builds'])==builds
        assert sum(x['maximum_seconds'] for x in plan['stages'])<=plan['max_seconds']
        assert not plan['private_inputs_required'] and not plan['automatic_downloads'] and not plan['executed']
        assert not plan['historical_linux_recovery_claim']
        cases.append(target+'/'+scope+' plan has bounded independent scope and no execution/private prerequisites')
    with tempfile.TemporaryDirectory(prefix='native-source-offline-') as tmp:
        t=Path(tmp)
        def model(target='mac',scope='correctness',fail=None):
            out=t/('model-'+target+'-'+scope+'-'+str(fail));calls=[]
            class C:
                def __init__(self,*args):self.maximum_seconds=1;self.tools={'make':t/'inert-make'}
                def invariant(self):pass
                def save(self):pass
                def stage(self,name):calls.append(('stage',name))
                def run(self,name,args,cwd=None):
                    calls.append(('run',name))
                    if fail==name:raise RuntimeError('injected '+name)
                    if name=='make-version':(out/(name+'.log')).write_text('GNU Make 4.4')
                    if name=='harness-version':(out/(name+'.log')).write_text('8.3-dev+1')
                    if name=='host-default-SVE' or name.startswith('flags-'):(out/(name+'.log')).write_text('UseSVE = '+('0' if target=='mac' else '2'))
                def build(self,role,ref,level,template=None):
                    calls.append(('build',role+'-'+level));return t/(role+'-'+level),t/'spec'
                def python(self,name,module,args):
                    calls.append(('python',name))
                    if fail==name:raise RuntimeError('injected '+name)
                    assert '--platform' in args or name in ('harness-smoke','assembly-gate')
                    if '--platform' in args:assert args[args.index('--platform')+1]==target
                    if name=='assembly-gate':
                        (out/'assembly').mkdir(exist_ok=True);(out/'assembly/installed-assembly-gate.json').write_text('{"passed":true}')
                    elif name in ['legacy-recovery','compact-and-controls-retention']:
                        d=out/('recovery' if name=='legacy-recovery' else 'retention');d.mkdir();(d/'initial-gate.json').write_text('{"passes":true}')
                    elif name=='full-suites':
                        (out/'full').mkdir();(out/'full/full-result.json').write_text('{"passed":true}')
            def fake_focused(*args):
                calls.append(('focused','gate'))
                if fail=='focused':raise RuntimeError('injected focused')
            uname=SimpleNamespace(machine='arm64' if target=='mac' else 'aarch64')
            with mock.patch.object(n,'native_macho'),mock.patch.object(n.focused_native,'run',side_effect=fake_focused),mock.patch.object(n,'Campaign',C),mock.patch.object(n,'source_binding'),mock.patch.object(n,'inventory'),mock.patch.object(n,'harness_version',return_value='8.3-dev+1'), \
                 mock.patch.object(n,'compile_inputs',return_value=(t/'frozen',t/'controller',t/'manifest')), mock.patch.object(n,'complete_manifest',return_value=t/'complete-manifest'), \
                 mock.patch.object(n.os,'uname',return_value=uname),mock.patch.object(n.sys,'platform','darwin' if target=='mac' else 'linux'), \
                 mock.patch.object(n.signal,'signal'),mock.patch.object(n.signal,'setitimer'), \
                 mock.patch.object(n.ctypes,'CDLL',return_value=SimpleNamespace(prctl=lambda *args:0)), \
                 mock.patch.dict(sys.modules,{'capstone':SimpleNamespace(CS_ARCH_ARM64=0,CS_MODE_ARM=0)}), \
                 mock.patch.dict(os.environ,{},clear=True):
                if fail:
                    rejected('failure '+fail+' stops '+target+'/'+scope,lambda:n.execute(root,out,t/'harness',t/'boot',target,scope))
                else:n.execute(root,out,t/'harness',t/'boot',target,scope)
            return calls,out
        for failure in ['harness-version','harness-smoke']:
            calls,_=model(fail=failure)
            assert not any(c[0]=='build' and c[1].startswith('candidate') for c in calls)
        cases.append('harness admission failures prevent candidate overlays')
        for failure,forbidden in [('correctness','assembly'),('assembly-gate','legacy-recovery'),('legacy-recovery','compact-and-controls-retention'),('compact-and-controls-retention','full-suites')]:
            calls,_=model('linux','complete',failure)
            assert ('python',forbidden) not in calls
        calls,out=model('mac','correctness')
        assert not any(c[0]=='python' and c[1] in ['assembly','legacy-recovery','compact-and-controls-retention'] for c in calls)
        assert not any(c==('build','base87-release') for c in calls)
        assert json.loads((out/'qualification-result.json').read_text())['timing_executed'] is False
        cases.append('Mac correctness never builds baseline87 or runs assembly/timing campaign')
        calls,_=model('mac','complete');assert ('python','legacy-recovery') in calls
        assert calls.index(('build','base87-release'))>calls.index(('python','correctness'))
        cases.append('separate Mac complete scope retains ordered assembly/recovery/retention/full gates')

        calls,out=model('mac','focused')
        assert [v for k,v in calls if k=='build']==['b3-fastdebug','candidate-fastdebug']
        assert ('focused','gate') in calls and not any(k=='python' and v!='harness-smoke' for k,v in calls)
        assert json.loads((out/'qualification-result.json').read_text())['full_suites'] is False
        cases.append('focused Mac runs only matched fastdebug smoke semantics and IR')
        calls,_=model('mac','focused','harness-smoke')
        assert ('build','candidate-fastdebug') not in calls
        calls,_=model('mac','focused','focused')
        cases.append('focused harness and IR failures stop without release/timing fallback')
        calls,out=model('mac','assembly')
        assert [v for k,v in calls if k=='build']==['b3-fastdebug','b3-release','candidate-release']
        assert ('python','assembly-gate') in calls and ('python','full-suites') not in calls
        assert not json.loads((out/'qualification-result.json').read_text())['timing_executed']
        cases.append('assembly scope needs no original87 candidate fastdebug full suites or timing')

        reports=t/'focused-fixture';reports.mkdir()
        def report_text(name):
            text='test result: Passed.\n-DShouldDoIRVerification=true\n'
            if name=='TestFloatRoundTripReduction':
                for mode,level in [('semantics',0),('semantics',1),('semantics',4),('cold',0)]:
                    text+=f'ROUNDTRIP_REDUCTION_PASS mode={mode} required={level} actual={level} after={level}\n'
            if name=='TestFloatRoundTripReductionEdges':
                for mode,level in [('semantics',0),('semantics',1),('semantics',4),('cold',0)]:
                    text+=f'ROUNDTRIP_EDGES_PASS mode={mode} six_targets_level={level}\n'
            return text
        for name in focused.SEMANTICS+focused.IR:(reports/(name+'.jtr')).write_text(report_text(name))
        focused.verify_reports(reports,True);cases.append('focused actual tier and IR evidence accepted')
        for name,marker in [('TestFloatRoundTripReduction','actual=1'),('TestZeroSeedFPReductionIR','-DShouldDoIRVerification=true')]:
            f=reports/(name+'.jtr');f.write_text(report_text(name).replace(marker,''))
            rejected('focused missing '+marker,lambda:focused.verify_reports(reports,True));f.write_text(report_text(name))
        for name,method in [('TestFloatRoundTripReduction','carried128'),('TestFloatRoundTripReductionEdges','reversed')]:
            f=reports/(name+'.jtr');f.write_text(report_text(name)+f'Disabling IR matching for rule 1 of 2 in {method}:')
            rejected('focused skipped positive '+method,lambda:focused.verify_reports(reports,True));f.write_text(report_text(name))
        f=reports/'TestZeroSeedFPReductionStrictIR.jtr';f.write_text(report_text(f.stem)+'IR verification disabled')
        rejected('focused disabled strict IR rejected',lambda:focused.verify_reports(reports,True));f.unlink()
        rejected('focused missing report rejected',lambda:focused.verify_reports(reports,True))

        # Exercise the real small-scope command generator against inert report writers.
        class FocusedCampaign:
            target='mac';boot=t/'boot';jtreg=t/'jtreg'
            builds={'candidate-fastdebug':{'source_head':'reviewhead'}}
            def __init__(self):self.root=root;self.out=t/'focused-command-model';self.out.mkdir();self.commands=[]
            def invariant(self):pass
            def run(self,name,argv):
                self.commands.append((name,argv))
                if name.endswith('-flags'):
                    (self.out/(name+'.log')).write_text('UseSVE = 0 MaxVectorSize = 16');return
                work=Path(next(str(v)[3:] for v in argv if str(v).startswith('-w:')));work.mkdir(parents=True)
                names=focused.SEMANTICS+(focused.IR if 'candidate' in name else [])
                for test in names:(work/(test+'.jtr')).write_text(report_text(test))
        fc=FocusedCampaign();focused.run(fc,t/'control-image',t/'candidate-image')
        assert len(fc.commands)==4
        assert '-javaoptions:-XX:UseSVE=0 -DVerifyIR=false' in fc.commands[1][1]
        assert '-javaoptions:-XX:UseSVE=0' in fc.commands[3][1]
        assert json.loads((fc.out/'focused/gate.json').read_text())['passed']
        cases.append('actual focused command generator preserves candidate IR and restricts VerifyIR=false to control')
        for target,pair,count in [('mac',True,14),('linux',True,28),('mac',False,18),('linux',False,36)]:
            rows=[dict(condition=condition,image=image,name=str(i)) for i,(condition,image) in enumerate(cohorts(target,pair))]
            assert len(rows)==count;verify_index(rows,target,pair)
            if pair:assert not any(r['image']=='base87' for r in rows)
            rows[-1]=rows[0]
            rejected('duplicate assembly cohort rejected '+target+str(pair),lambda:verify_index(rows,target,pair))
        cases.append('separate pair-only and complete assembly cohorts preserve exact roles and conditions')

        # Build inert once-compiled input and image manifests; no executable content.
        frozen=t/'frozen';controller=t/'controller';src=t/'src';src.mkdir()
        roots={'classes':frozen/'qualification/classes','whitebox':frozen/'qualification/whitebox','controller':controller}
        for d in roots.values():d.mkdir(parents=True)
        for name in ['PhaseVectorKernels.class','PhaseVectorProbe.class']:(roots['classes']/name).write_text('INERT '+name)
        for name in ['FixedVectorProbe.class','ProbeControllerPrimer.class']:(controller/name).write_text('INERT '+name)
        (roots['whitebox']/'WhiteBox.class').write_text('INERT WHITEBOX');(src/'Probe.java').write_text('INERT SOURCE')
        roles=['base87-release','b3-release','b3-fastdebug','candidate-release','candidate-fastdebug'];images={};receipts={}
        for role in roles:
            d=t/'images'/role
            for name in n.image_files('linux'):
                f=d/name;f.parent.mkdir(parents=True,exist_ok=True)
                content=role if name=='lib/server/libjvm.so' else role.replace('candidate','b3')
                f.write_text('INERT '+content+' '+name)
            images[role]=dict(root=str(d),files={name:record(d/name) for name in n.image_files('linux')})
            ref=n.BASE if role.startswith('base87') else n.B3 if role.startswith('b3') else 'reviewhead'
            receipts[role]=dict(source_head=ref,same_tools={'compiler':'inert'})
        # Optional reuse is fail-closed on all identities, without executing images.
        reuse=t/'reuse';reuse.mkdir();rc=n.Campaign.__new__(n.Campaign)
        rc.root=src;rc.target='linux';rc.boot=t/'boot';rc.jtreg=t/'harness';rc.sdk=None
        rc.tool_invocations={'compiler':'inert invocation'};rc.tool_records={'compiler':'inert'};rc.harness_jars={'lib/jtreg.jar':'inert'};rc.harness={'payload':'inert'};rc.reuse={}
        ri=images['b3-release'];source=t/'reuse-source';source.mkdir();spec=source/'spec.gmk';spec.write_text('INERT SPEC')
        receipt=dict(source_dir=str(source),source_head=n.B3,spec_path=str(spec),spec=record(spec),
                     same_tools=rc.tool_records,configure_arguments=rc.configure_arguments('release'),
                     image_payload=payload_manifest(Path(ri['root'])))
        saved=dict(source_head='reviewhead',platform='linux',tools=rc.tool_records,tool_invocations=rc.tool_invocations,sdk=None,
                   harness_jars=rc.harness_jars,harness_payload=rc.harness,images={'b3-release':ri},builds={'b3-release':receipt})
        def check_reuse(value):
            (reuse/'campaign.json').write_text(json.dumps(value))
            def fake_git(directory,*args):return ('reviewhead' if directory==src else n.B3) if args[0]=='rev-parse' else ''
            with mock.patch.object(n,'git',side_effect=fake_git):rc.load_reuse(reuse)
        check_reuse(saved);assert 'b3-release' in rc.reuse
        cases.append('optional matching source/configuration/full image/tool/harness reuse accepted')
        for label,mutate in [
                ('head',lambda x:x.update(source_head='other')),
                ('tools',lambda x:x.update(tools={})),
                ('invocations',lambda x:x.update(tool_invocations={})),
                ('SDK',lambda x:x.update(sdk={'other':True})),
                ('harness',lambda x:x.update(harness_jars={})),
                ('spec',lambda x:x['builds']['b3-release'].update(spec={})),
                ('configuration',lambda x:x['builds']['b3-release'].update(configure_arguments=[])),
                ('payload',lambda x:x['builds']['b3-release'].update(image_payload={})),
                ('core image',lambda x:x['images']['b3-release']['files'].update(release={}))]:
            wrong=copy.deepcopy(saved);mutate(wrong)
            rejected('reuse mismatch rejected '+label,lambda:check_reuse(wrong))

        value=dict(schema=1,experiment='pr14-native-source-v1',scope='complete',source_head='reviewhead',
            frozen=str(frozen),controller=str(controller),same_toolchain=True,images=images,build_receipts=receipts,
            build_toolchain={'compiler':'inert'},sources={'Probe.java':record(src/'Probe.java')},
            payloads={name:payload_manifest(d) for name,d in roots.items()},
            kernel_classes={p.name:record(p)['sha256'] for p in roots['classes'].glob('*.class')},
            controller_classes={p.name:record(p)['sha256'] for p in controller.glob('*.class')})
        manifest=t/'source-inputs.json'
        def verify(v):
            manifest.write_text(json.dumps(v))
            with mock.patch.object(inputs,'git',side_effect=lambda root,*args:'reviewhead' if args[0]=='rev-parse' else ''):
                return inputs.verify(manifest,frozen,controller,src)
        verify(value);cases.append('new source-compiled identities accepted without historical class hashes')
        for key,bad in [('same_toolchain',False),('kernel_classes',{}),('controller_classes',{}),('images',{}),('scope','unknown')]:
            wrong=copy.deepcopy(value);wrong[key]=bad;rejected('changed '+key+' rejected',lambda:verify(wrong))
        (roots['classes']/'PhaseVectorProbe.class').write_text('changed')
        rejected('compiled input mutation rejected',lambda:verify(value))
        (roots['classes']/'PhaseVectorProbe.class').write_text('INERT PhaseVectorProbe.class')
        wrong=copy.deepcopy(value);wrong['build_receipts']['b3-release']['source_head']='wrong'
        rejected('wrong source role rejected',lambda:verify(wrong))

        correctness=copy.deepcopy(value);correctness['scope']='correctness'
        for key in ['images','build_receipts']:correctness[key].pop('base87-release')
        verify(correctness);cases.append('correctness input manifest needs no original87 image')
        assembly=copy.deepcopy(correctness);assembly['scope']='assembly'
        for key in ['images','build_receipts']:assembly[key].pop('candidate-fastdebug')
        verify(assembly);cases.append('assembly source manifest binds exactly three required roles')

        jar=t/'stable83/lib/jtreg.jar';jar.parent.mkdir(parents=True)
        import zipfile
        with zipfile.ZipFile(jar,'w') as z:z.writestr('META-INF/MANIFEST.MF','jtreg-VersionString: 8.3+1\n')
        assert h.harness_version(jar.parent.parent)=='8.3+1'
        cases.append('compatible release8.3+1 does not require the historical dev milestone')

        # Mach-O static compatibility works without ELF or retained host binaries.
        debug=t/'mac-debug';spec=t/'mac-build/spec.gmk';spec.parent.mkdir()
        for name in n.image_files('mac'):
            f=debug/name;f.parent.mkdir(parents=True,exist_ok=True)
            header=bytearray(20);header[:4]=b'\xcf\xfa\xed\xfe';header[4:8]=struct.pack('<I',0x0100000c);f.write_bytes(header)
        vm=spec.parent/'jdk/lib/server/libjvm.dylib';vm.parent.mkdir(parents=True);vm.write_bytes((debug/'lib/server/libjvm.dylib').read_bytes())
        spec.write_text('DEBUG_LEVEL := fastdebug\nOPENJDK_TARGET_CPU := aarch64\n')
        with mock.patch.object(h.platform,'system',return_value='Darwin'),mock.patch.object(h.platform,'machine',return_value='arm64'):
            n.native_macho(debug/'bin/java')
            assert h.debug_assessment(debug,spec)['available'];cases.append('native Mach-O arm64 fastdebug compatibility admission')

        bad=t/'wrong-macho';bad.write_bytes(b'INERT ELF')
        rejected('non-native Mach-O launcher rejected before any JVM',lambda:n.native_macho(bad))
        sdk=t/'Xcode-SDK';sdk.mkdir();(sdk/'SDKSettings.json').write_text('INERT SDK')
        tools=t/'Xcode-tools';tools.mkdir()
        for name in ['clang','ld','ar','make']:(tools/name).write_text('INERT '+name)
        (tools/'clang++').symlink_to('clang');(tools/'gmake').symlink_to('make')
        boot=t/'boot-tools'
        for name in ['bin/java','bin/javac','lib/modules','release']:
            f=boot/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text('INERT '+name)
        def xcrun(args,**kwargs):
            assert args[0]=='xcrun'
            return str(sdk if args[1]=='--show-sdk-path' else tools/args[2])+'\n'
        with mock.patch.object(n.subprocess,'check_output',side_effect=xcrun), \
             mock.patch.object(n.shutil,'which',return_value=str(tools/'gmake')),mock.patch.object(n,'git',return_value=''):
            c=n.Campaign(src,t/'unused-output',jar.parent.parent,boot,'mac','focused')
            assert c.tools['clang']==(tools/'clang').resolve() and c.tools['make']==tools/'gmake' and c.tools['clang++']==tools/'clang++'
            assert c.env['SDKROOT']==str(sdk) and '--with-sysroot='+str(sdk) in c.configure_arguments('fastdebug')
            c.invariant();cases.append('Mac preserves clang++ and gmake symlink invocation names with independently bound SDK')
            assert c.env['CXX']==str(tools/'clang++') and c.tool_invocations['clang++']['resolved']==str(tools/'clang')
            (tools/'clang-alternate').write_text((tools/'clang').read_text())
            (tools/'clang++').unlink();(tools/'clang++').symlink_to('clang-alternate')
            rejected('same-byte clang++ symlink retarget stops next stage',c.invariant)
            (tools/'clang++').unlink();(tools/'clang++').symlink_to('clang')
            (sdk/'SDKSettings.json').write_text('CHANGED')
            rejected('changed Mac SDK stops next stage',c.invariant)
        reports=t/'suite-reports';reports.mkdir()
        (reports/'pass.jtr').write_text('test result: Passed. Execution successful')
        (reports/'skip.jtr').write_text('test result: Not run. Platform requires SVE')
        assert suite_counts(reports)['counts']=={'Passed':1,'Not run':1,'Failed':0,'Error':0}
        cases.append('full suite records real passes and explicit platform skips')
        (reports/'pass.jtr').unlink()
        rejected('all-skipped full suite rejected',lambda:suite_counts(reports))
        (reports/'pass.jtr').write_text('test result: Passed. Execution successful')
        (reports/'bad.jtr').write_text('test result: Failed. Assertion')
        rejected('failed full suite report rejected even if process status were zero',lambda:suite_counts(reports))

        # Existing numerical and machine-code gates remain real, independent of build plumbing.
        comparison={'subject':'candidate','reference':'base87','condition':['four','0','default','conversion']}
        paired=[dict(comparison=comparison,results={'candidate':{'ns_per_op':99,'B_per_op':0},'base87':{'ns_per_op':100,'B_per_op':0}}) for _ in range(12)]
        d=t/'bounds';d.mkdir()
        with mock.patch.object(performance,'interval',return_value=[.98,1.005]):
            rejected('compact gain upper bound must be strictly below1',lambda:performance.finish_timing_gate(d,paired,[comparison]))
        comparison['condition']=['legacy','0','default','conversion']
        with mock.patch.object(performance,'interval',return_value=[.99,1.03]):
            rejected('legacy recovery retains1.02 upper bound',lambda:performance.finish_timing_gate(d,paired,[comparison]))
        for row in paired:row['results']['candidate']['B_per_op']=.011
        with mock.patch.object(performance,'interval',return_value=[.98,1.0]):
            rejected('maximum allocation bound retained',lambda:performance.finish_timing_gate(d,paired,[comparison]))
        ins=[dict(address=i*4,mnemonic=m,operands=o) for i,(m,o) in enumerate([
            ('fcvtzs','v1.4s, v2.4s'),('scvtf','v1.4s, v1.4s'),('faddp','v1.4s, v1.4s, v1.4s'),
            ('faddp','s1, v1.2s'),('fadd','s0, s0, s1')])]
        body=dict(instructions=ins,clusters=cluster(ins))
        check_conversion_loop([body],'fixture');cases.append('real conversion dataflow/recurrence assembly gate retained')
        ins.pop(3);body=dict(instructions=ins,clusters=cluster(ins))
        rejected('incomplete conversion chain rejected',lambda:check_conversion_loop([body],'fixture'))
    assert len([x for x in performance.SPECS if x['subject']=='candidate'])==30
    assert len([x for x in performance.SPECS if x['subject']=='candidate' and x['condition'][1]=='0'])==15
    cases.append('all30 Linux and separate15 Mac primary conditions preserved')
    assert not (root/'.github/workflows/vector-api-classifier-jtreg83.yml').exists()
    for doc in ['NATIVE-SOURCE-QUALIFICATION.md','MAC-ARM-VALIDATION.md']:
        for block in re.findall(r'```bash\n(.*?)```',(root/'qualification/native_unroll'/doc).read_text(),re.S):
            subprocess.run(['bash','-n'],input=block,text=True,check=True)
    cases.append('committed Linux/Mac command blocks parse; retired blocked workflow absent')
    a.out.mkdir(parents=True,exist_ok=False)
    value=dict(passed=True,count=len(cases),cases=cases,JVMs=0,compiler_builds=0,network_calls=0,CI_launches=0)
    (a.out/'results.json').write_text(json.dumps(value,indent=2)+'\n');print(json.dumps(value))


if __name__=='__main__':main()
