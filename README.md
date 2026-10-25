# PR43 Apple evidence checkpoint

Proposed orphan branch: archive/pr43-apple-39627835348
Public repository: re-thc/openjdk-jdk27u. Publication pending explicit audience approval.
No workflows, PR, JDK source checkout, or executable scripts are added.
The original results ZIP is intact. The matched images ZIP is split into deterministic 90 MiB byte chunks. Archives may themselves contain original source snippets and binaries; source-free describes the branch checkout, not archive contents.

Run: https://github.com/re-thc/openjdk-jdk27u/actions/runs/39627835348
Job: 119317726743. Exact source and workflow identities are in source-manifest.json.
The standalone original local audit is missing. These manifests are new preservation records, not reconstructed original evidence.

Verify and reassemble from this directory (standard Python 3 only; archive contents are never executed):

```sh
python3 - <<'PYVERIFY'
from pathlib import Path
import hashlib, json
p=Path('.')
m=json.loads((p/'preservation-manifest.json').read_text())
r=p/'PR43-Apple-results-run39627835348.zip'
assert r.stat().st_size==m['results_bytes']
with r.open('rb') as f: assert hashlib.file_digest(f,'sha256').hexdigest()==m['results_sha256']
out=p/'PR43-Apple-matched-images-run39627835348.zip'
h=hashlib.sha256(); n=0
with out.open('xb') as f:
    for c in m['chunks']:
        b=(p/c['file']).read_bytes()
        assert len(b)==c['bytes'] and hashlib.sha256(b).hexdigest()==c['sha256']
        f.write(b); h.update(b); n+=len(b)
assert n==m['images_reassembled_bytes'] and h.hexdigest()==m['images_reassembled_sha256']
print('Both archives verified; no archive contents executed.')
PYVERIFY
```

The output archive is intentionally not stored alongside chunks in Git. Each chunk is below 100 MiB; no LFS is used. Keeping the archive branch adds approximately 401 MB of binary objects to normal all-branch clones; deleting files in later commits does not remove their history. This is a one-time checkpoint, not a rolling binary archive.
