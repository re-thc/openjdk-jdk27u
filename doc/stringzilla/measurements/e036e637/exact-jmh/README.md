# Original JMH files

These bundles preserve all 630 matched original/enabled/disabled comparisons for
runtime `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d` against original JDK
`416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`: 1,890 unchanged JMH JSON files and
18,900 measured samples. The [normalized results](../COMPLETE-630-RESULTS.md)
retain every higher enabled mean, including measured regressions. These results
apply to this runtime; they do not qualify later code.

[INDEX.json](INDEX.json) records each bundle's compressed and decompressed sizes,
SHA-256 hashes and source artifact. Each bundle contains `raw_jmh` entries whose
`content` is the original file's bytes encoded as base64.

From a repository checkout containing this evidence, the following Python
standard-library example verifies the hashes and extracts every original file.
It runs no JVM and collects no new measurements. The output directory must not
already exist.

```sh
python3 - <<'PY'
import base64
import gzip
import hashlib
import json
from pathlib import Path, PurePosixPath

root = Path("doc/stringzilla/measurements/e036e637/exact-jmh")
index = json.loads((root / "INDEX.json").read_bytes())
output = Path("stringzilla-e036e637-json")
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

[VALIDATION.json](VALIDATION.json) records the independent byte, protocol and
full-precision score checks against the published normalized evidence.
