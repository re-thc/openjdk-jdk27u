#!/usr/bin/env python3
"""Copy text-only qualification evidence into a new, separate repository root."""
import hashlib, json, shutil
from pathlib import Path

root = Path('/workspace/sz-evidence')
target = Path('/workspace/sz-retained')
if target.exists():
    raise SystemExit('Refusing to replace existing retained directory')
exclude = {'jmh', 'bench-classes', 'classes', '__pycache__'}
suffixes = {'.log', '.json', '.txt', '.java', '.c', '.py', '.sh', '.md',
            '.commands', '.flags', '.jsonl', '.jtr', '.patch'}
target.mkdir()
for source in sorted(root.rglob('*')):
    if not source.is_file():
        continue
    relative = source.relative_to(root)
    if any(part in exclude for part in relative.parts) or source.suffix not in suffixes:
        continue
    if relative.name == 'RAW-README-draft.md':
        relative = Path('README.md')
    destination = target / relative
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)

support = Path('/workspace/sz-candidate/build/scans/test-support')
jtrs = sorted(support.rglob('*.jtr'))
if len(jtrs) != 127:
    raise SystemExit('Unexpected final jtreg report count: ' + str(len(jtrs)))
for source in jtrs:
    destination = target / 'final-jtr' / source.relative_to(support)
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)
shutil.copy2('/workspace/sz-candidate/build/scans/test-results/test-summary.txt',
             target / 'final-test-summary.txt')

manifest = {}
for source in sorted(target.rglob('*')):
    if source.is_file():
        data = source.read_bytes()
        if b'\0' in data:
            raise SystemExit('Unexpected binary evidence: ' + str(source))
        manifest[str(source.relative_to(target))] = dict(
            bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
(target / 'TEXT-MANIFEST.json').write_text(json.dumps(manifest, indent=2) + '\n')
print('Copied', len(manifest), 'text files;', sum(v['bytes'] for v in manifest.values()), 'bytes')
