"""Activate the reviewed four-build recipe after the user's explicit approval."""
import datetime
import fcntl
import hashlib
import json
import os
import pathlib
import subprocess
import tempfile

import yaml

r = pathlib.Path('/workspace/pr9-layout-validation')
repo = pathlib.Path('/workspace/openjdk-jdk27u')
draft = r / 'native-review'
branch = 'pr/common-intrinsics-final-evidence'
review = 'e0bb755df37a9c85f0b1036649820b99b951f0bf'
source = 'e41d7823bf6de77c4bfba52e896bf325221488cb'
receipt_path = r / 'native-activation.json'
assert not receipt_path.exists(), 'Do not repeat native workflow activation'

def git(*args, input=None, env=None):
    return subprocess.check_output(['git', '-c', 'gc.auto=0', '-c', 'maintenance.auto=false',
                                    '-C', str(repo), *args], input=input, env=env)

def optional_file(commit, path):
    result = subprocess.run(['git', '-C', str(repo), 'show', commit + ':' + path],
                            capture_output=True)
    if result.returncode:
        assert 'does not exist' in result.stderr.decode() or 'exists on disk, but not in' in result.stderr.decode()
        return None
    return result.stdout

qualification = json.loads((draft / 'qualification.json').read_text())
paths = [entry['path'] for entry in qualification['files']]
assert set(paths) == {'.github/workflows/main.yml', '.github/workflows/pr9-native-linux.yml',
                      '.github/workflows/pr9-native-windows.yml'}
payloads = {}
for entry in qualification['files']:
    data = (draft / entry['path']).read_bytes()
    assert hashlib.sha256(data).hexdigest() == entry['sha256']
    assert git('show', review + ':.github/qualification/chain-checkpoint/layout-native-build-review/' + entry['path']) == data
    payloads[entry['path']] = data
main = yaml.load(payloads['.github/workflows/main.yml'], Loader=yaml.BaseLoader)
assert set(main['on']) == {'workflow_dispatch'}
assert main['permissions'] == {'contents': 'read'}
assert set(main['jobs']) == {'prepare', 'linux-aarch64', 'windows-x64'}
assert git('rev-parse', 'HEAD').decode().strip() == source
assert not git('status', '--porcelain').decode().strip()
lock = pathlib.Path('/workspace/pr9-recovery/evidence-publish.lock').open('a')
fcntl.flock(lock, fcntl.LOCK_EX)
git('fetch', 'origin', 'refs/heads/' + branch + ':refs/remotes/origin/' + branch)
base = git('rev-parse', 'refs/remotes/origin/' + branch).decode().strip()
for path in paths:
    assert optional_file(base, path) == optional_file(review, path), \
        'Remote workflow changed after review; preserve it and inspect before updating: ' + path

receipt = {'source': source, 'approval': 'User replied Approved to activation/dispatch of the four-build native draft.',
           'scope': 'Release/fastdebug candidate builds on Linux ARM and Windows x64, on the existing evidence branch.',
           'approved_draft_commit': review, 'base': base, 'branch': branch,
           'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
           'files': qualification['files'], 'status': 'prepared-for-activation',
           'pr_source_push_authorized_by_this_action': False,
           'hosted_dispatch_performed': False}
approval_path = '.github/qualification/chain-checkpoint/layout-native-activation/approval.json'
payloads[approval_path] = (json.dumps(receipt, indent=2) + '\n').encode()
with tempfile.TemporaryDirectory(prefix='native-activation-index-', dir='/workspace/pr9-recovery') as directory:
    env = dict(os.environ, GIT_INDEX_FILE=directory + '/index')
    git('read-tree', base, env=env)
    for path, data in sorted(payloads.items()):
        blob = git('hash-object', '-w', '--stdin', input=data).decode().strip()
        git('update-index', '--add', '--cacheinfo', '100644,' + blob + ',' + path, env=env)
    tree = git('write-tree', env=env).decode().strip()
    changed = git('diff-tree', '--no-commit-id', '--name-only', '-r', base, tree).decode().splitlines()
    assert set(changed) == set(payloads), changed
    commit = git('commit-tree', tree, '-p', base,
                 input=b'Activate approved exact-source PR9 native build recipe\n').decode().strip()
    git('push', 'origin', commit + ':refs/heads/' + branch)
receipt.update(status='activated-awaiting-dispatch', activation_commit=commit)
receipt_path.write_text(json.dumps(receipt, indent=2) + '\n')
print(json.dumps(receipt, indent=2), flush=True)
