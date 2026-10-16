"""jtreg83 byte admission and generic compatibility smoke; execution is opt-in."""
import argparse
import json
import os
from pathlib import Path
import platform
import re
import struct
import subprocess
import zipfile

from classifier_images import record, require

EXPERIMENT = 'pr14-classifier-jtreg83-v1'
SOURCE = '551e17adac0579859012c4c46318b8fa3cf2ff37'
VERSION = '8.3-dev+1'


def pins():
    return json.loads(Path(__file__).with_name('jtreg83-provenance.json').read_text())


def inventory(image):
    image = Path(image)
    require(image.is_dir() and not image.is_symlink(), 'Harness directory must be real')
    jars = sorted(image.rglob('*.jar'))
    require(all(not p.is_symlink() and p.resolve().is_relative_to(image.resolve()) for p in jars),
            'Harness JAR symlink/escape')
    actual = {p.relative_to(image).as_posix(): record(p) for p in jars}
    require(set(actual) == set(pins()['installed']['consumer_jars']), 'Seven-JAR inventory differs')
    with zipfile.ZipFile(image / 'lib/jtreg.jar') as z:
        lines = z.read('META-INF/MANIFEST.MF').decode().splitlines()
    require('jtreg-VersionString: ' + VERSION in lines, 'Harness version differs')
    return actual


def verify_installed(image):
    actual = inventory(image)
    require(actual == pins()['installed']['consumer_jars'], 'Installed jtreg83 bytes differ')
    return actual


def admit():
    route = pins()['ci']['route']
    require(route['status'] == 'verified-authorized' and route['admitted'] is True,
            'Harness route unresolved: no source retrieval, delivery or native compute admitted')
    # No admission producer is implemented until the access/delivery decision is resolved.
    raise RuntimeError('No reviewed route admission producer exists; workflow must remain disabled')


def verify_ci(image, receipt):
    admit()  # Always fail closed while the route has no authorized, verified implementation.


def debug_assessment(image, spec):
    if image is None or spec is None:
        return dict(available=False, reason='Provide an existing matching-ISA fastdebug image and its build spec; source-build instructions are committed')
    image, spec = Path(image).resolve(), Path(spec).resolve()
    try:
        required = ('bin/java','bin/javac','lib/modules','lib/server/libjvm.so','release')
        require(all((image / n).is_file() for n in required) and spec.is_file(), 'Incomplete debug image/spec')
        text = spec.read_text()
        require(re.search(r'^DEBUG_LEVEL\s*:=\s*fastdebug\s*$', text, re.M), 'Spec is not fastdebug')
        host = platform.machine()
        cpu, machine = {'x86_64':('x86_64',62),'aarch64':('aarch64',183)}[host]
        require(re.search(r'^OPENJDK_TARGET_CPU\s*:=\s*' + cpu + r'\s*$', text, re.M), 'Spec ISA differs from host')
        for name in ('bin/java','lib/server/libjvm.so'):
            with (image / name).open('rb') as f:
                header=f.read(20)
            require(header[:4] == b'\x7fELF' and header[5] == 1 and
                    struct.unpack('<H',header[18:20])[0] == machine, 'Image ISA differs from host')
        require(record(image / 'lib/server/libjvm.so') == record(spec.parent / 'jdk/lib/server/libjvm.so'),
                'Image VM differs from fastdebug build output')
        return dict(available=True, image=str(image), spec=str(spec), host_isa=host,
                    files={n:record(image/n) for n in required}, spec_record=record(spec),
                    runtime_verified=False, role='generic harness compatibility; no classifier attribution')
    except (RuntimeError, KeyError, OSError) as error:
        return dict(available=False, reason=str(error), runtime_verified=False)


def smoke_sources(repo, suite):
    require(not any(c.isspace() for c in str(repo)), 'Smoke library root must not contain whitespace')
    return {
        'TEST.ROOT': 'requiredVersion=8.2.1+1\nexternal.lib.roots = ' + os.path.relpath(repo,suite) + '\n',
        'HarnessMinimum.java': '''/* @test
 * @run main/othervm HarnessMinimum
 */
public class HarnessMinimum { public static void main(String[] a) { System.out.println("HARNESS_MINIMUM_SMOKE_OK"); } }
''',
        'WhiteBoxOthervmSmoke.java': '''/* @test
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. WhiteBoxOthervmSmoke
 */
import jdk.test.whitebox.WhiteBox;
public class WhiteBoxOthervmSmoke {
    public static void main(String[] a) {
        if (!Boolean.TRUE.equals(WhiteBox.getWhiteBox().getBooleanVMFlag("WhiteBoxAPI"))) throw new AssertionError("WhiteBox unavailable");
        System.out.println("HARNESS_WHITEBOX_OTHERVM_OK");
    }
}
''',
        'HarnessIRSmoke.java': '''/* @test
 * @library /test/lib /test/hotspot/jtreg
 * @run driver HarnessIRSmoke
 */
import compiler.lib.ir_framework.*;
import jdk.test.whitebox.WhiteBox;
public class HarnessIRSmoke {
    static boolean printed;
    public static void main(String[] a) {
        System.setProperty("Verbose", "true");
        TestFramework.run();
        System.out.println("HARNESS_IR_ASSERTION_PASSED");
    }
    @Test(compLevel=CompLevel.C2)
    @IR(counts={IRNode.ADD_I, ">=1"}, phase=CompilePhase.PRINT_IDEAL)
    public static int add(int x, int y) { return x + y; }
    @Run(test="add")
    public static void exercise() {
        if (!Boolean.TRUE.equals(WhiteBox.getWhiteBox().getBooleanVMFlag("WhiteBoxAPI"))) throw new AssertionError("WhiteBox unavailable in Test VM");
        if (!Boolean.getBoolean("ShouldDoIRVerification")) throw new AssertionError("IR verification inactive");
        if (add(17,25) != 42) throw new AssertionError("wrong result");
        if (!printed) { System.out.println("HARNESS_IR_ENABLED=true WHITEBOX_API_READY=true"); printed=true; }
    }
}
'''}


def verify_smoke_reports(work):
    expected = {'HarnessMinimum':'HARNESS_MINIMUM_SMOKE_OK',
                'WhiteBoxOthervmSmoke':'HARNESS_WHITEBOX_OTHERVM_OK',
                'HarnessIRSmoke':'HARNESS_IR_ASSERTION_PASSED'}
    reports = {p.stem:p for p in Path(work).rglob('*.jtr')}
    require(set(reports) == set(expected), 'Missing/extra compatibility report')
    for name, marker in expected.items():
        text = reports[name].read_text()
        require('test result: Passed.' in text and marker in text, 'Compatibility action did not execute/pass: '+name)
    text=reports['HarnessIRSmoke'].read_text()
    require('HARNESS_IR_ENABLED=true WHITEBOX_API_READY=true' in text, 'IR/WhiteBox evidence missing')
    require('IR verification disabled' not in text and 'Disabling IR matching' not in text, 'IR assertion skipped/disabled')
    return {n:record(p) for n,p in reports.items()}


def smoke(image, jdk, out, debug_jdk=None, debug_spec=None, execute=False):
    image, jdk, out = map(lambda p:Path(p).resolve(), (image,jdk,out))
    repo=Path(__file__).resolve().parents[2]
    assessment=debug_assessment(debug_jdk,debug_spec)
    testjdk=str(Path(debug_jdk).resolve()) if debug_jdk else '<fastdebug-image-required>'
    commands = [[str(jdk/'bin/java'),'-jar',str(image/'lib/jtreg.jar'),'-version'],
        [str(jdk/'bin/java'),'-jar',str(image/'lib/jtreg.jar'),'-jdk:'+testjdk,'-othervm',
         '-concurrency:1','-timeoutFactor:2','-verbose:summary','-w:'+str(out/'work'),'-r:'+str(out/'report'),
         str(out/'suite')]]
    plan=dict(experiment=EXPERIMENT,commands=commands,maximum_seconds=390,executes=execute,
        required_minimum='8.2.1+1',debug_assessment=assessment,
        compatibility_status='planned-not-executed' if assessment['available'] else 'deferred-unavailable-debug-image',
        required_checks=['minimum-version','driver/ClassFileInstaller','WhiteBox native API in othervm',
                         'fastdebug C2 ADD_I IR assertion with positive enabled evidence'],qualified=False)
    if not execute:
        return plan
    require(assessment['available'], 'Complete compatibility smoke unavailable: '+assessment.get('reason',''))
    require(not any(os.environ.get(k) for k in ('JAVA_TOOL_OPTIONS','JDK_JAVA_OPTIONS','_JAVA_OPTIONS')), 'Inherited JVM options not admitted')
    before=inventory(image)
    out.mkdir(parents=True,exist_ok=False)
    (out/'suite').mkdir()
    for name,text in smoke_sources(repo,out/'suite').items():(out/'suite'/name).write_text(text)
    for i,cmd in enumerate(commands):
        with (out/(str(i)+'.log')).open('w') as f:
            status=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,timeout=90 if i==0 else 300)
        require(status.returncode==0,'Compatibility command failed')
    require(VERSION in (out/'0.log').read_text(),'Runtime harness version differs')
    plan['reports']=verify_smoke_reports(out/'work')
    require(inventory(image)==before,'Harness changed during compatibility smoke')
    plan.update(passed=True,compatibility_status='complete-smoke-passed',consumer_jars=before)
    (out/'result.json').write_text(json.dumps(plan,indent=2)+'\n')
    return plan


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('operation',choices=['verify-installed','verify-ci','smoke','admit'])
    for name in ['image','jdk','receipt','out','debug-jdk','debug-spec']:p.add_argument('--'+name,type=Path)
    p.add_argument('--execute',action='store_true')
    a=p.parse_args()
    if a.operation=='admit':value=admit()
    elif a.operation=='verify-installed':value=verify_installed(a.image)
    elif a.operation=='verify-ci':value=verify_ci(a.image,a.receipt)
    else:value=smoke(a.image,a.jdk,a.out,a.debug_jdk,a.debug_spec,a.execute)
    print('JTREG83_RESULT='+json.dumps(value,sort_keys=True))


if __name__=='__main__':main()
