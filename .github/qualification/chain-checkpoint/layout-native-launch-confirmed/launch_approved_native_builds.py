"""Launch the already-approved builds through a narrowly scoped Git push event."""
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
receipt_path = r / 'native-activation.json'
receipt = json.loads(receipt_path.read_text())
assert receipt['status'] == 'activated-awaiting-dispatch'
assert not receipt['hosted_dispatch_performed']
assert json.loads((r / 'native-dispatch.log.result.json').read_text())['exit_code'] != 0
assert 'Forbidden' in (r / 'native-dispatch.log').read_text()
branch = receipt['branch']
marker_path = '.github/qualification/chain-checkpoint/layout-native-activation/launch.json'
workflow_path = '.github/workflows/main.yml'
original = (r / 'native-review' / workflow_path).read_bytes()
assert hashlib.sha256(original).hexdigest() == receipt['files'][0]['sha256']
updated = original.decode().replace('  workflow_dispatch:\n',
    '  workflow_dispatch:\n  push:\n    branches: [pr/common-intrinsics-final-evidence]\n'
    '    paths: [.github/qualification/chain-checkpoint/layout-native-activation/launch.json]\n')
assert updated != original.decode()
parsed = yaml.load(updated, Loader=yaml.BaseLoader)
assert parsed['on']['push'] == {'branches': [branch], 'paths': [marker_path]}
assert parsed['jobs'] == yaml.load(original, Loader=yaml.BaseLoader)['jobs']
def git(*args, input=None, env=None):
    return subprocess.check_output(['git', '-c', 'gc.auto=0', '-c', 'maintenance.auto=false',
                                    '-C', str(repo), *args], input=input, env=env)
lock = pathlib.Path('/workspace/pr9-recovery/evidence-publish.lock').open('a')
fcntl.flock(lock, fcntl.LOCK_EX)
git('fetch', 'origin', 'refs/heads/' + branch + ':refs/remotes/origin/' + branch)
base = git('rev-parse', 'refs/remotes/origin/' + branch).decode().strip()
assert git('show', base + ':' + workflow_path) == original, 'Preserve any intervening workflow edits'
assert subprocess.run(['git', '-C', str(repo), 'cat-file', '-e', base + ':' + marker_path],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).returncode != 0
launch = {'source': receipt['source'], 'approved_draft_commit': receipt['approved_draft_commit'],
          'activation_commit': receipt['activation_commit'],
          'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
          'scope': receipt['scope'], 'approval': receipt['approval'],
          'trigger': 'Push of this single launch-marker path on the existing evidence branch.',
          'manual_dispatch': 'Forbidden; connected GitHub read confirmed zero runs for the activation commit.',
          'runtime_recipe_changed': False, 'pr_source_pushed': False}
payloads = {workflow_path: updated.encode(), marker_path: (json.dumps(launch, indent=2) + '\n').encode()}
with tempfile.TemporaryDirectory(prefix='native-launch-index-', dir='/workspace/pr9-recovery') as directory:
    env = dict(os.environ, GIT_INDEX_FILE=directory + '/index')
    git('read-tree', base, env=env)
    for path, data in sorted(payloads.items()):
        blob = git('hash-object', '-w', '--stdin', input=data).decode().strip()
        git('update-index', '--add', '--cacheinfo', '100644,' + blob + ',' + path, env=env)
    tree = git('write-tree', env=env).decode().strip()
    assert set(git('diff-tree', '--no-commit-id', '--name-only', '-r', base, tree).decode().splitlines()) == set(payloads)
    commit = git('commit-tree', tree, '-p', base,
                 input=b'Launch approved PR9 native builds from a scoped evidence marker\n').decode().strip()
    git('push', 'origin', commit + ':refs/heads/' + branch)
receipt.update(status='launch-commit-pushed-awaiting-run-confirmation',
               launch_commit=commit, launch_method='scoped-push-marker',
               manual_dispatch_result='Forbidden', hosted_dispatch_performed=False)
receipt_path.write_text(json.dumps(receipt, indent=2) + '\n')
(r / 'native-launch.json').write_text(json.dumps(launch | {'commit': commit}, indent=2) + '\n')
print(json.dumps({'status': receipt['status'], 'launch_commit': commit}), flush=True)
