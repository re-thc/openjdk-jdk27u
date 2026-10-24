#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only

# Consumes previously acquired, verified inputs; contains no acquisition commands.
# Run only under a process-group supervisor with the PLAN.md preparation deadline.
set -euo pipefail
test "$#" -eq 2 || { echo 'usage: prepare-clean-jtreg.sh INPUTS NEW_OUTPUT' >&2; exit 2; }
recipe_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
input_dir=$(cd -- "$1" && pwd -P)
output_dir=$2
[[ "$output_dir" = /* && ! -e "$output_dir" ]] || { echo 'Output must be a fresh absolute path' >&2; exit 2; }
[[ ! "$input_dir$output_dir" =~ [[:space:]] ]] || { echo 'Upstream build scripts require paths without whitespace' >&2; exit 2; }

python3 -I - "$recipe_dir/inputs.json" "$input_dir" "$output_dir" <<'PY'
from pathlib import Path
import hashlib, json, subprocess, sys, tarfile, zipfile
pins = json.loads(Path(sys.argv[1]).read_text()); root = Path(sys.argv[2]); out = Path(sys.argv[3]).resolve()
assert not out.is_relative_to(root), 'Output must be outside all input trees'
def digest(path, algorithm='sha256'):
    value = hashlib.new(algorithm)
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''): value.update(block)
    return value.hexdigest()
for name, pin in pins['sources'].items():
    source = root / name
    assert subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip() == pin['commit'], name
    assert not subprocess.check_output(['git', '-C', str(source), 'status', '--porcelain', '--untracked-files=all'], text=True), name + ' is dirty'
for name, pin in pins['archives'].items(): assert digest(root / name) == pin, name
for name, pin in pins['runtime_jars'].items(): assert digest(root / 'runtime' / name) == pin, name
assert digest(root / 'runtime/LICENSE-testng.txt', 'sha1') == pins['testng_license_sha1']
for name, pin in pins['jtreg_build_inputs'].items(): assert digest(root / 'jtreg' / name) == pin, name
recipe = Path(sys.argv[1]).with_name('prepare-clean-jtreg.sh')
out.mkdir(); (out / 'input-identities.json').write_text(json.dumps({'pins':pins, 'clean_sources_verified':True,
    'recipe_sha256':digest(recipe)}, indent=2) + '\n')
with tarfile.open(root / 'jdk17.tar.gz') as archive: archive.extractall(out / 'jdk17', filter='data')
with zipfile.ZipFile(root / 'ant.zip') as archive:
    for entry in archive.infolist():
        path = Path(entry.filename)
        assert not path.is_absolute() and '..' not in path.parts
        assert (entry.external_attr >> 16) & 0o170000 != 0o120000, 'Unexpected Ant symlink'
with zipfile.ZipFile(root / 'runtime/junit-platform-console-standalone-1.14.2.jar') as archive:
    (out / 'LICENSE-junit.txt').write_bytes(archive.read('LICENSE-junit.txt'))
PY
unzip -q "$input_dir/ant.zip" -d "$output_dir/ant"
task_jdk_home=$(python3 -I - "$output_dir/jdk17" <<'PY'
from pathlib import Path
import sys
root = Path(sys.argv[1]); homes = [p.parent for p in root.rglob('release') if (p.parent / 'bin/javac').is_file() and (p.parent / 'bin/java').is_file()]
assert len(homes) == 1; print(homes[0])
PY
)
task_ant="$output_dir/ant/apache-ant-1.10.15/bin/ant"
export JAVA_HOME="$task_jdk_home"
export PATH="$JAVA_HOME/bin:$PATH"
export ANT_HOME="$output_dir/ant/apache-ant-1.10.15"
export ANT_OPTS=
unset CLASSPATH JAVA_TOOL_OPTIONS _JAVA_OPTIONS JDK_JAVA_OPTIONS
"$task_ant" -DBUILD_DIR="$output_dir/jtharness" -f "$input_dir/jtharness/build/build.xml"
"$task_ant" -DBUILD_DIR="$output_dir/asmtools" -f "$input_dir/asmtools/build/build.xml"

env ANT="$task_ant" ROOT="$input_dir/jtreg" BUILD_DIR="$output_dir/jtreg" VERSION_NUMBERS="$input_dir/jtreg/make/build-support/version-numbers" \
  JTHARNESS_JAVATEST_JAR="$output_dir/jtharness/binaries/lib/javatest.jar" \
  JTHARNESS_LICENSE="$input_dir/jtharness/LICENSE" JTHARNESS_COPYRIGHT="$input_dir/jtharness/legal/copyright.txt" \
  ASMTOOLS_JAR="$output_dir/asmtools/binaries/lib/asmtools.jar" ASMTOOLS_LICENSE="$input_dir/asmtools/LICENSE" \
  JUNIT_JAR="$input_dir/runtime/junit-platform-console-standalone-1.14.2.jar" JUNIT_LICENSE="$output_dir/LICENSE-junit.txt" \
  TESTNG_JAR="$input_dir/runtime/testng-7.3.0.jar" TESTNG_LICENSE="$input_dir/runtime/LICENSE-testng.txt" \
  JCOMMANDER_JAR="$input_dir/runtime/jcommander-1.82.jar" GOOGLE_GUICE_JAR="$input_dir/runtime/guice-5.1.0.jar" \
  JTREG_BUILD_NUMBER=1 JTREG_BUILD_MILESTONE=dev JTREG_VERSION_STRING=8.3-dev+1 \
  SKIP_DOWNLOAD= SKIP_CHECKSUM_CHECK= SKIP_MAKE= MAKE_ARGS= \
  bash "$input_dir/jtreg/make/build.sh" --jdk "$task_jdk_home"

python3 -I - "$recipe_dir/inputs.json" "$input_dir" "$output_dir" <<'PY'
from pathlib import Path
import hashlib, json, subprocess, sys, zipfile
pins = json.loads(Path(sys.argv[1]).read_text()); root = Path(sys.argv[2]); out = Path(sys.argv[3]); image = out / 'jtreg/images/jtreg'
for name, pin in pins['sources'].items():
    source = root / name
    assert subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip() == pin['commit']
    assert not subprocess.check_output(['git', '-C', str(source), 'status', '--porcelain', '--untracked-files=all'], text=True), name + ' became dirty'
with zipfile.ZipFile(image / 'lib/jtreg.jar') as jar:
    assert 'jtreg-VersionString: 8.3-dev+1' in jar.read('META-INF/MANIFEST.MF').decode().splitlines()
release = (image / 'release').read_text().splitlines()
assert 'JTREG_VERSION=8.3 1' in release and 'SOURCE=git:551e17adac05' in release, 'Expected clean source identity'
files = [{'path':str(p.relative_to(image)), 'size':p.stat().st_size, 'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
         for p in sorted(image.rglob('*')) if p.is_file()]
for name, pin in pins['runtime_jars'].items():
    assert hashlib.sha256((image / 'lib' / name).read_bytes()).hexdigest() == pin
(out / 'output-identities.json').write_text(json.dumps({'inputs':pins, 'release':release, 'files':files}, indent=2) + '\n')
PY
