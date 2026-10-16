"""Reuse the security-prefetch slot for the remaining independent FD suites."""
import datetime
import json
import pathlib
import subprocess
import time

r = pathlib.Path('/workspace/pr9-layout-validation')
state_path = r / 'after-security-prefetch.json'
assert not state_path.exists(), 'Do not duplicate this slot queue'
state = {'source': 'e41d7823bf6de77c4bfba52e896bf325221488cb',
         'status': 'waiting-for-fastdebug-security-prefetch', 'steps': [],
         'scope': 'Reuse one completed slot, keeping at most four actual conc1 jtreg batches.'}
def save():
    state['updated_utc'] = datetime.datetime.now(datetime.timezone.utc).isoformat()
    temporary = state_path.with_suffix('.tmp')
    temporary.write_text(json.dumps(state, indent=2) + '\n')
    temporary.replace(state_path)
save()
while not (r / 'clean-fastdebug-tier2-jdk-security.result.json').exists():
    time.sleep(10)
for group in ['jdk-io-tools-time', 'langtools', 'jaxp']:
    state['status'] = 'prefetch-' + group
    save()
    command = ['python3', str(r / 'run_reaped.py'),
               str(r / ('queued-fastdebug-' + group + '.log')),
               'python3', str(r / 'tier2_layout.py'), 'fastdebug', '--only', group]
    code = subprocess.run(command, cwd='/workspace/openjdk-jdk27u').returncode
    state['steps'].append({'group': group, 'command': command, 'exit_code': code})
    save()
    if code:
        state['status'] = 'stopped-for-result-review'
        save()
        raise SystemExit(code)
state['status'] = 'completed'
save()
