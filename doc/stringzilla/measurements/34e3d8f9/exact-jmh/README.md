# Original JMH files

This partial collection preserves 1,624 matched original/enabled/disabled comparisons:
4,872 unchanged JMH JSON files and 48,720 measured samples. The planned complete
campaign contains 1,886 comparisons. Complete images were built from
`916ba895e834378e3f7eac7f030fc4abff641d33`; its production code matches runtime
`34e3d8f99b053eec3f8f7e0d4c458de662a7d977`. The original image is
`416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

The [normalized results](../RESULTS.md) retain every higher enabled mean,
including measured regressions. [VALIDATION.json](VALIDATION.json) records
independent byte, protocol and full-precision comparisons against those results.
Copying these saved files ran no JVM and collected no new measurements.

[INDEX.json](INDEX.json) records each gzip bundle's source artifact, size and
SHA-256 hashes. Each bundle's `raw_jmh` entries contain the original file bytes
encoded as base64. Parts retain complete original/enabled/disabled triplets.
Targeted compilation excerpts are untimed evidence. Four bundles omit 36 hosted-path
context lines; their original transport hashes and exact omissions are recorded.
Every original JMH file remains unchanged. The RAW-FILES manifests map all filenames
to their verified SHA-256 hashes.

From a repository checkout containing this evidence, this Python standard-library
example verifies both layers of hashes and extracts the original files. The
output directory must not already exist.

```sh
python3 - <<'PY'
import base64
import gzip
import hashlib
import json
from pathlib import Path, PurePosixPath

root = Path("doc/stringzilla/measurements/34e3d8f9/exact-jmh")
index = json.loads((root / "INDEX.json").read_bytes())
output = Path("stringzilla-34e3d8f9-json")
output.mkdir()

def verified(data, size, digest):
    if len(data) != size or hashlib.sha256(data).hexdigest() != digest:
        raise ValueError("Size or SHA-256 mismatch")
    return data

count = 0
for entry in index["files"]:
    packed = verified(Path(entry["path"]).read_bytes(),
                      entry["bytes"], entry["sha256"])
    plain = verified(gzip.decompress(packed),
                     entry["uncompressed_bytes"], entry["uncompressed_sha256"])
    bundle = json.loads(plain)
    for raw in bundle["raw_jmh"]:
        data = verified(base64.b64decode(raw["content"], validate=True),
                        raw["bytes"], raw["sha256"])
        relative = PurePosixPath(raw["path"])
        if relative.is_absolute() or ".." in relative.parts or "\\" in raw["path"]:
            raise ValueError("Invalid relative file path")
        target = output / entry["logical_group"] / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        with target.open("xb") as stream:
            stream.write(data)
        count += 1

if count != index["original_files"]:
    raise ValueError("Incomplete file count")
print(f"Extracted {count} verified original JSON files to {output}")
PY
```
