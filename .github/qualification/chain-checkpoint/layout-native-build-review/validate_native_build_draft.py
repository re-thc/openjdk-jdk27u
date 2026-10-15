"""Static recipe checks only; do not publish or dispatch a workflow."""
import hashlib
import json
import pathlib
import re
import subprocess

import yaml

r = pathlib.Path('/workspace/pr9-layout-validation')
out = r / 'native-review'
root = out / '.github/workflows'
rows = []
for path in sorted(root.glob('*.yml')):
    data = path.read_text()
    obj = yaml.load(data, Loader=yaml.BaseLoader)
    assert 'push' not in obj['on'] and 'pull_request' not in obj['on']
    for job_name, job in obj['jobs'].items():
        if 'uses' in job:
            assert (out / job['uses']).is_file(), job['uses']
        for index, step in enumerate(job.get('steps', [])):
            if 'run' not in step:
                continue
            script = re.sub(r'\$\{\{.*?\}\}', 'static-check-value', step['run'], flags=re.S)
            result = subprocess.run(['bash', '-n'], input=script, text=True,
                                    capture_output=True)
            assert result.returncode == 0, (path, job_name, index, result.stderr)
            rows.append({'workflow': str(path.relative_to(out)), 'job': job_name,
                         'step': step.get('name'), 'check': 'bash-n-only'})
    if path.name != 'main.yml':
        assert data.count('git bundle verify') == 1
        assert '79f0619e2fe9cf1b26b9526c615ce56c1d5b60082aa389c511098c9354ff1ed9' in data
        assert "grep -Fx 'SOURCE=\".:git:e41d7823bf6d\"'" in data
    assert not re.search(r'(?m)^\s+(git push|gh workflow run)', data)
record = {'source': 'e41d7823bf6de77c4bfba52e896bf325221488cb',
          'status': 'static-yaml-and-bash-checks-passed', 'checks': rows,
          'scope': 'No GitHub runner, build, test or dispatch was executed. '
                   'GHA expression evaluation and native toolchain execution remain untested.'}
(out / 'static-validation.json').write_text(json.dumps(record, indent=2) + '\n')
qualification = json.loads((out / 'qualification.json').read_text())
qualification['static_validation'] = {'path': 'static-validation.json',
    'sha256': hashlib.sha256((out / 'static-validation.json').read_bytes()).hexdigest(),
    'checks': len(rows)}
(out / 'qualification.json').write_text(json.dumps(qualification, indent=2) + '\n')
print(json.dumps({'status': record['status'], 'shell_steps': len(rows)}))
