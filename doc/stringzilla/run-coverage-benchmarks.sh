#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-coverage-benchmarks.sh ORIGINAL_JDK ENABLED_JDK DISABLED_JDK JMH_CLASSPATH OUTPUT_DIR [CPU [CASE_MANIFEST]]
set -euo pipefail
usage() {
    printf 'Usage: %s ORIGINAL_JDK ENABLED_JDK DISABLED_JDK JMH_CLASSPATH OUTPUT_DIR [CPU [CASE_MANIFEST]]\n' "${0##*/}"
}
if [ "$#" -eq 1 ] && { [ "$1" = --help ] || [ "$1" = -h ]; }; then usage; exit 0; fi
if [ "$#" -lt 5 ] || [ "$#" -gt 7 ]; then usage >&2; exit 2; fi
original_jdk=$(cd "$1" && pwd)
enabled_jdk=$(cd "$2" && pwd)
disabled_jdk=$(cd "$3" && pwd)
benchmark_classpath=$4
benchmark_output=$5
benchmark_cases=$(cd "$(dirname "$0")" && pwd)/dispatch-cases.tsv
if [ "$#" -eq 7 ]; then benchmark_cases=$7; fi
benchmark_pin=()
if [ "$#" -ge 6 ]; then benchmark_pin=(taskset -c "$6"); fi
mkdir -p "$benchmark_output"
benchmark_lock=$benchmark_output/.running
if ! mkdir "$benchmark_lock" 2>/dev/null; then
    printf 'Campaign lock exists: %s; check its owner before resuming.\n' "$benchmark_lock" >&2
    exit 1
fi
printf '%s\n' "$$" > "$benchmark_lock/pid"
trap 'rm -f "$benchmark_lock/pid"; rmdir "$benchmark_lock"' EXIT
unset JAVA_TOOL_OPTIONS _JAVA_OPTIONS JDK_JAVA_OPTIONS

# Hash complete distributions and the harness before accepting retained samples.
verify_fingerprints() {
python3 - "$original_jdk" "$enabled_jdk" "$disabled_jdk" "$benchmark_classpath" "$benchmark_output" "$benchmark_cases" "$0" <<'VERIFY'
import glob,hashlib,json,os,stat,sys
from pathlib import Path
original,enabled,disabled,classpath,output,manifest,runner=sys.argv[1:]
cache={}
def digest(p):
    s=p.stat();key=(s.st_dev,s.st_ino,s.st_size,s.st_mtime_ns)
    if key not in cache:cache[key]=hashlib.sha256(p.read_bytes()).hexdigest()
    return cache[key]
def image(path):
    root=Path(path)
    for name in ['bin/java','bin/javac','lib/modules','lib/server/libjvm.so','lib/libjava.so','release']:
        assert (root/name).is_file(),f'Incomplete JDK: {root/name}'
    rows=[]
    for p in sorted(root.rglob('*')):
        if p.is_symlink():rows.append({'path':str(p.relative_to(root)),'link':os.readlink(p)})
        elif p.is_file():rows.append({'path':str(p.relative_to(root)),'mode':stat.S_IMODE(p.stat().st_mode),'bytes':p.stat().st_size,'sha256':digest(p)})
    return {'root':str(root),'files':rows,'tree_sha256':hashlib.sha256(json.dumps(rows,sort_keys=True).encode()).hexdigest()}
harness=[]
for entry in classpath.split(os.pathsep):
    matches=glob.glob(entry) if '*' in entry else [entry]
    assert matches,entry
    for name in matches:
        p=Path(name);assert p.exists(),name
        for f in sorted(p.rglob('*')) if p.is_dir() else [p]:
            if f.is_file():harness.append({'path':str(f),'sha256':digest(f)})
data={'images':{k:image(v) for k,v in [('original',original),('enabled',enabled),('disabled',disabled)]},'harness':harness,'manifest_sha256':digest(Path(manifest)),'runner_sha256':digest(Path(runner))}
assert data['images']['enabled']['tree_sha256']==data['images']['disabled']['tree_sha256'],'Enabled/disabled distributions must match byte-for-byte'
assert data['images']['original']['tree_sha256']!=data['images']['enabled']['tree_sha256'],'Original must be a separate complete baseline image'
p=Path(output)/'fingerprints.json'
if p.exists():assert json.loads(p.read_text())==data,'Images, harness or manifest changed; use a new output directory'
else:p.write_text(json.dumps(data,indent=2)+'\n')
print('Complete image and harness fingerprints verified',flush=True)
VERIFY
}
verify_fingerprints
controls=(enabled disabled original)
rotation=0
for backend in avx2 serial avx512; do
    case "$backend" in serial) avx=0 ;; avx2) avx=2 ;; avx512) avx=3 ;; esac
    for tier in interpreter c1 c2; do
        while IFS=$'\t' read -r id benchmark length coder position needle shape backends; do
            if [ "$id" = id ]; then continue; fi
            case ",$backends," in *",$backend,"*) ;; *) continue ;; esac
            case_rotation=$rotation
            rotation=$((rotation + 1))
            if [[ ! $id =~ ${STRINGZILLA_CASE_FILTER:-.} ]]; then continue; fi
            if [[ ! $backend-$tier =~ ${STRINGZILLA_CONFIG_FILTER:-.} ]]; then continue; fi
            params=(-p "length=$length" -p "needleLength=$needle")
            if [ "$shape" != - ]; then params+=(-p "shape=$shape"); else params+=(-p "coder=$coder" -p "position=$position"); fi
            for step in 0 1 2; do
                control=${controls[$(( (case_rotation + step) % 3 ))]}
                options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off "-XX:UseAVX=$avx")
                case "$tier" in interpreter) options+=(-Xint) ;; c1) options+=(-XX:TieredStopAtLevel=1) ;; c2) options+=(-XX:-TieredCompilation) ;; esac
                case "$control" in
                    original) benchmark_jdk=$original_jdk ;;
                    enabled) benchmark_jdk=$enabled_jdk; options+=(-XX:+UseStringZillaIntrinsics) ;;
                    disabled) benchmark_jdk=$disabled_jdk; options+=(-XX:-UseStringZillaIntrinsics) ;;
                esac
                name=$backend-$tier-$id-$control
                result=$benchmark_output/$name.json
                if [ -s "$result" ]; then
                    python3 - "$result" "$benchmark_jdk/bin/java" "$benchmark" "$length" "$coder" "$position" "$needle" "$shape" "${options[@]}" <<'CHECK'
import json,math,sys
path,java,benchmark,length,coder,position,needle,shape,*options=sys.argv[1:]
r=json.load(open(path));assert len(r)==1;r=r[0]
assert r['jvm']==java and r['jvmArgs']==options
assert not any(x.startswith('--patch-module') for x in r['jvmArgs'])
assert r['benchmark'].endswith('.'+benchmark)
params={'length':length,'needleLength':needle}
params.update(shape=shape) if shape!='-' else params.update(coder=coder,position=position)
assert r['params']==params
assert r['forks']==2 and r['warmupIterations']==3 and r['measurementIterations']==5
assert r['warmupTime']==r['measurementTime']=='500 ms'
m=r['primaryMetric'];assert m['scoreUnit']=='ns/op' and [len(x) for x in m['rawData']]==[5,5]
assert math.isfinite(m['scoreError']) and math.isclose(m['score'],sum(map(sum,m['rawData']))/10)
CHECK
                    printf '%s retained complete measurement\n' "$name"
                    continue
                fi
                "${benchmark_pin[@]}" "$benchmark_jdk/bin/java" "${options[@]}" -cp "$benchmark_classpath" org.openjdk.jmh.Main "$benchmark\$" \
                    "${params[@]}" -f 2 -wi 3 -w 500ms -i 5 -r 500ms -foe true \
                    -jvm "$benchmark_jdk/bin/java" -jvmArgs "${options[*]}" -rf json -rff "$result" > "$benchmark_output/$name.log" 2>&1
                printf '%s complete\n' "$name"
            done
        done < "$benchmark_cases"
    done
done
verify_fingerprints
