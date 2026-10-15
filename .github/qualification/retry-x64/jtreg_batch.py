import argparse
import json
from pathlib import Path
import subprocess

p = argparse.ArgumentParser()
p.add_argument('name')
p.add_argument('jdk')
p.add_argument('tests', nargs='+')
p.add_argument('--vmoptions', default='-XX:ActiveProcessorCount=2 -XX:CICompilerCount=2 -Xmx512m -Dseed=42')
p.add_argument('--concurrency', type=int, default=1)
p.add_argument('--nativepath', default='/workspace/openjdk-jdk27u/build/pr9-release/images/test/hotspot/jtreg/native')
a = p.parse_args()
root = Path('/workspace/pr9-validation')
source_checkout = subprocess.check_output(['git', 'rev-parse', 'HEAD'],
                          cwd='/workspace/openjdk-jdk27u', text=True).strip()
command = ['/workspace/toolchains/jdk27/bin/java', '-XX:TieredStopAtLevel=1', '-XX:ActiveProcessorCount=1',
           '-XX:+UseSerialGC', '-Xmx512m', '-jar', '/workspace/toolchains/jtreg83/lib/jtreg.jar',
           '-jdk:' + a.jdk, '-othervm', '-conc:' + str(a.concurrency), '-timeoutFactor:4',
           '-nativepath:' + a.nativepath, '-vmoptions:' + a.vmoptions,
           '-w:' + str(root / (a.name + '-work')), '-r:' + str(root / (a.name + '-report')), *a.tests]
print(a.name, flush=True)
result = subprocess.run(['python3', str(root / 'run_reaped.py'), str(root / (a.name + '.log')), *command],
                        cwd='/workspace/openjdk-jdk27u')
summary = root / (a.name + '-report/text/summary.txt')
record = {'name': a.name, 'command': command, 'exit_code': result.returncode,
          'summary': summary.read_text() if summary.exists() else '',
          'source_checkout_at_start': source_checkout}
(root / (a.name + '.result.json')).write_text(json.dumps(record, indent=2) + '\n')
print(record['summary'], flush=True)
raise SystemExit(result.returncode)
