"""Source-only admission and compatibility-evidence checks; no JVM/build/download."""
import argparse
import copy
import json
import os
from pathlib import Path
import subprocess
import tempfile
from unittest import mock
import zipfile

import jtreg83_harness as h
from classifier_images import record,source_binding,pins
from run_classifier83_preflight import control_commands,verify_control_reports


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True);a=p.parse_args()
    root=Path(__file__).resolve().parents[2];cases=[]
    def reject(name,fn):
        try:fn()
        except RuntimeError:cases.append(name)
        else:raise AssertionError('Accepted '+name)
    assert record(root/'qualification/native_unroll/classifier-provenance.json')==h.pins()['preserved_experiment']['pin_record']
    source_binding(root,pins());cases.append('original pins/product/test/make/bin and exact executed source preserved')
    real=h.pins()['installed']['consumer_jars']
    if Path('/workspace/toolchains/jtreg83').is_dir():
        h.verify_installed('/workspace/toolchains/jtreg83');cases.append('optional installed83 exact seven-JAR bytes/version')
    else:cases.append('optional installed83 unavailable; offline fixture checks do not require it')
    reject('unresolved route rejects admission',h.admit)
    changed=copy.deepcopy(h.pins());changed['ci']['route'].update(status='verified-authorized',admitted=True)
    with mock.patch.object(h,'pins',return_value=changed):
        reject('editing status alone cannot enable absent admission producer',h.admit)
    with tempfile.TemporaryDirectory(prefix='jtreg83-offline-') as tmp:
        t=Path(tmp);image=t/'image';(image/'lib').mkdir(parents=True)
        for name in real:
            f=image/name
            if f.name=='jtreg.jar':
                with zipfile.ZipFile(f,'w') as z:z.writestr('META-INF/MANIFEST.MF','jtreg-VersionString: 8.3-dev+1\n')
            else:f.write_bytes(b'INERT')
        pin=copy.deepcopy(h.pins());pin['installed']['consumer_jars']={n:record(image/n) for n in real}
        with mock.patch.object(h,'pins',return_value=pin):
            h.verify_installed(image);cases.append('fixture valid pinned map accepted')
            f=image/'lib/asmtools.jar';saved=f.read_bytes();f.write_bytes(saved+b'changed')
            reject('modified JAR rejected',lambda:h.verify_installed(image));f.write_bytes(saved)
            extra=image/'extra.jar';extra.write_bytes(b'extra')
            reject('extra JAR rejected',lambda:h.verify_installed(image));extra.unlink()
            f.unlink();reject('missing JAR rejected',lambda:h.verify_installed(image))
            target=t/'external.jar';target.write_bytes(saved);f.symlink_to(target)
            assert h.inventory(image)['lib/asmtools.jar']==record(target);cases.append('distribution dependency symlink is hashed')
            f.unlink();f.write_bytes(saved)
        with mock.patch.object(h.subprocess,'run',side_effect=AssertionError('Unapproved execution')):
            plan=h.smoke(image,t/'jdk',t/'out')
            assert plan['compatibility_status']=='deferred-unavailable-debug-image' and not plan['executes']
            cases.append('no debug image explicitly defers complete compatibility')
            reject('no debug image prevents runtime smoke',lambda:h.smoke(image,t/'jdk',t/'out',execute=True))
            reject('CI verification cannot bypass unresolved admission',lambda:h.verify_ci(image,t/'receipt'))
        assert h.suite_minimum()=='8.2.1+1'
        for version in ['8.2.1+1','8.3+0','8.3-dev+0','8.10+0','8.2.1.0+1']:
            with zipfile.ZipFile(image/'lib/jtreg.jar','w') as z:
                z.writestr('META-INF/MANIFEST.MF','jtreg-VersionString: '+version+'\n')
            assert h.harness_version(image)==version
            cases.append('suite minimum admits '+version)
        for version in ['8.2.1+0','8.2+99','8.1+1000']:
            with zipfile.ZipFile(image/'lib/jtreg.jar','w') as z:
                z.writestr('META-INF/MANIFEST.MF','jtreg-VersionString: '+version+'\n')
            reject('older numeric version rejected '+version,lambda:h.inventory(image))
        with zipfile.ZipFile(image/'lib/jtreg.jar','w') as z:
            z.writestr('META-INF/MANIFEST.MF','jtreg-VersionString: 8.3+0\n')
        (image/'lib/asmtools.jar').rename(image/'lib/other-dependency.jar')
        (image/'additional').mkdir();(image/'additional/another.jar').write_bytes(b'INERT')
        assert 'additional/another.jar' in h.inventory(image)
        cases.append('generic compatible distribution accepts renamed/additional dependency JARs')
        link=image/'dependency-directory';link.symlink_to(image/'additional',target_is_directory=True)
        assert 'dependency-directory/another.jar' in h.inventory(image)
        cases.append('dependency directory symlink payload is inventoried')
        link.unlink();link.symlink_to(image,target_is_directory=True)
        reject('cyclic dependency directory rejected',lambda:h.inventory(image));link.unlink()
        optional=h.pins()['optional_local_debug_image']
        assessment=h.debug_assessment(optional['path'],optional['spec'])
        if assessment['available']:
            assert assessment['files']==optional['files'] and not assessment['runtime_verified']
            cases.append('optional complete host-ISA fastdebug image verified against recorded build output')
        else:cases.append('optional retained debug image unavailable; full smoke explicitly deferred until source build')
        # Inert ELF/spec fixture tests static ISA/provenance admission without a saved binary.
        import struct
        debug=t/'debug';spec=t/'build/spec.gmk';spec.parent.mkdir()
        for name in ('bin/java','bin/javac','lib/modules','lib/server/libjvm.so','release'):
            f=debug/name;f.parent.mkdir(parents=True,exist_ok=True)
            header=bytearray(20);header[:4]=b'\x7fELF';header[5]=1;header[18:20]=struct.pack('<H',62)
            f.write_bytes(header+b'INERT NOT A VM')
        vm=spec.parent/'jdk/lib/server/libjvm.so';vm.parent.mkdir(parents=True);vm.write_bytes((debug/'lib/server/libjvm.so').read_bytes())
        spec.write_text('DEBUG_LEVEL := fastdebug\nOPENJDK_TARGET_CPU := x86_64\n')
        with mock.patch.object(h.platform,'machine',return_value='x86_64'), mock.patch.object(h.platform,'system',return_value='Linux'):
            assert h.debug_assessment(debug,spec)['available']
            cases.append('inert complete fastdebug/spec correspondence accepted for static planning')
            with mock.patch.object(h.subprocess,'run',side_effect=AssertionError('Execution during plan')):
                plan=h.smoke(image,t/'jdk',t/'out',debug,spec)
                assert plan['compatibility_status']=='planned-not-executed' and len(plan['required_checks'])==4
                cases.append('full WhiteBox/driver/IR smoke is planning only')
        with mock.patch.object(h.platform,'machine',return_value='aarch64'), mock.patch.object(h.platform,'system',return_value='Linux'):
            assert not h.debug_assessment(debug,spec)['available'];cases.append('wrong-host-ISA image rejected')
        sources=h.smoke_sources(root,t/'suite')
        assert 'ClassFileInstaller' in sources['WhiteBoxOthervmSmoke.java'] and '@run main/othervm' in sources['WhiteBoxOthervmSmoke.java']
        ir=sources['HarnessIRSmoke.java']
        assert '@run driver' in ir and '@IR(counts={IRNode.ADD_I' in ir and 'ShouldDoIRVerification' in ir
        assert 'WhiteBox.getWhiteBox()' in ir and 'TestFramework.run();' in ir
        cases.append('smoke contains actual installation/native WhiteBox call and unconditional C2 IR assertion')
        work=t/'work';work.mkdir()
        texts={'HarnessMinimum':'test result: Passed.\nHARNESS_MINIMUM_SMOKE_OK',
               'WhiteBoxOthervmSmoke':'test result: Passed.\nHARNESS_WHITEBOX_OTHERVM_OK',
               'HarnessIRSmoke':'test result: Passed.\nHARNESS_IR_ASSERTION_PASSED\nHARNESS_IR_ENABLED=true WHITEBOX_API_READY=true'}
        for name,text in texts.items():(work/(name+'.jtr')).write_text(text)
        h.verify_smoke_reports(work);cases.append('all compatibility action and IR evidence accepted')
        f=work/'HarnessIRSmoke.jtr';original=f.read_text()
        for marker in ['HARNESS_IR_ASSERTION_PASSED','HARNESS_IR_ENABLED=true WHITEBOX_API_READY=true']:
            f.write_text(original.replace(marker,''));reject('missing '+marker+' rejected',lambda:h.verify_smoke_reports(work))
        for marker in ['IR verification disabled','Disabling IR matching']:
            f.write_text(original+'\n'+marker);reject('skipped IR rejected: '+marker,lambda:h.verify_smoke_reports(work))
        f.write_text(original);(work/'WhiteBoxOthervmSmoke.jtr').unlink()
        reject('minimum-only/incomplete smoke rejected',lambda:h.verify_smoke_reports(work))
    assert not (root/'.github/workflows/vector-api-classifier-jtreg83.yml').exists()
    cases.append('artifact-bound native workflow retired; new source runner starts only explicitly')
    status=json.loads((root/'qualification/native_unroll/jtreg83-artifact-status.json').read_text())
    assert {x['id'] for x in status['artifacts']}=={11978661561,11981413932,11881672203}
    assert all(not x['expired'] for x in status['artifacts'])
    cases.append('fresh optional artifact metadata present/unexpired at recorded observation')
    a.out.mkdir(parents=True,exist_ok=False)
    value=dict(passed=True,count=len(cases),cases=cases,JVMs=0,builds=0,network_calls=0,workflow_runs=0)
    (a.out/'results.json').write_text(json.dumps(value,indent=2)+'\n');print(json.dumps(value))


if __name__=='__main__':main()
