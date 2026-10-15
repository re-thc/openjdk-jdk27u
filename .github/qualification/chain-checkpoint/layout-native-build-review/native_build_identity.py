"""Verify an image's actual source and emit a portable native-build receipt."""
import argparse
import datetime
import hashlib
import json
import os
import pathlib
import platform
import re
import subprocess

p = argparse.ArgumentParser()
p.add_argument('--repo', type=pathlib.Path, required=True)
p.add_argument('--image', type=pathlib.Path, required=True)
p.add_argument('--expected-source', required=True)
p.add_argument('--output', type=pathlib.Path, required=True)
a = p.parse_args()
assert re.fullmatch('[0-9a-f]{40}', a.expected_source)
head = subprocess.check_output(['git', '-C', str(a.repo), 'rev-parse', 'HEAD'], text=True).strip()
assert head == a.expected_source, (head, a.expected_source)
status = subprocess.check_output(['git', '-C', str(a.repo), 'status', '--porcelain',
                                  '--untracked-files=no'], text=True)
assert not status.strip(), 'Tracked build source changed'
release = (a.image / 'release').read_text()
match = re.search(r'^SOURCE="\.:git:([0-9a-f]+)"$', release, re.M)
assert match and len(match[1]) >= 12 and a.expected_source.startswith(match[1]), release
payloads = [a.image / 'release', a.image / 'lib/modules', *a.image.glob('**/libjvm.so'),
            *a.image.glob('**/jvm.dll'), *a.image.glob('**/classes*.jsa')]
vm = [f for f in payloads if f.name in ['libjvm.so', 'jvm.dll']]
assert len(vm) == 1, vm
rows = []
for file in sorted(set(payloads)):
    digest = hashlib.sha256()
    with file.open('rb') as stream:
        for block in iter(lambda: stream.read(8 * 1024 * 1024), b''):
            digest.update(block)
    rows.append({'path': str(file.relative_to(a.image)), 'bytes': file.stat().st_size,
                 'sha256': digest.hexdigest()})
java = a.image / ('bin/java.exe' if os.name == 'nt' else 'bin/java')
version = subprocess.run([str(java), '-XX:ActiveProcessorCount=1', '-version'],
                         capture_output=True, text=True, check=True)
record = {'status': 'source-and-core-image-identity-verified',
          'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
          'expected_source': a.expected_source, 'checkout_source': head,
          'jvm_release_source': match[1], 'release': release,
          'workflow_revision': os.environ.get('GITHUB_SHA'),
          'workflow_ref': os.environ.get('GITHUB_WORKFLOW_REF'),
          'workflow_run_id': os.environ.get('GITHUB_RUN_ID'),
          'platform': platform.platform(), 'machine': platform.machine(),
          'image_payloads': rows, 'version_stdout': version.stdout,
          'version_stderr': version.stderr,
          'scope': 'Build/image identity only; no jtreg, native test or performance qualification is implied.'}
a.output.parent.mkdir(parents=True, exist_ok=True)
assert not a.output.exists(), 'Preserve the original build receipt'
a.output.write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps({'status': record['status'], 'source': head, 'payloads': len(rows)}))
