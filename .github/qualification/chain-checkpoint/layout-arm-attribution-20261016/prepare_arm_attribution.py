import collections
import datetime
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path('/workspace/pr9-layout-validation')
REPO = Path('/workspace/openjdk-jdk27u')
OUT = ROOT / 'arm-attribution-20261016'
OUT.mkdir(exist_ok=True)
OLD = 'd8fc74ba01f7e6ed0a77e94f89b1a0922a79a776'
NEW = 'e41d7823bf6de77c4bfba52e896bf325221488cb'
TEST = '8bf01e9ed8a3df53fd8836d61216ed511ad3e591'
BASE = '87edd79d3104ff502f7befec034716b081436f49'

def git(*args):
    return subprocess.check_output(['git', '-C', str(REPO), *args])

def save(name, obj):
    (OUT / name).write_text(json.dumps(obj, indent=2) + '\n')

assert git('rev-parse', 'HEAD').decode().strip() == NEW
assert not git('status', '--porcelain')
log = ROOT / 'native-failure-logs/old-run38640541680.log'
assert hashlib.sha256(log.read_bytes()).hexdigest() == 'e11fd8775e2e8e10f9c91b4462c49cf0d91b6386ac0dd017a729db6a4f092d14'
lines = log.read_text().splitlines()
records = []
for number, line in enumerate(lines, 1):
    found = re.search(r'\{"block":.*', line)
    if found:
        record = json.loads(found.group())
        record['log_line'] = number
        record['log_timestamp'] = line.split(' ', 1)[0]
        records.append(record)
assert len(records) == 60
assert len({(x['block'], x['variant']) for x in records}) == 60
failed = [x for x in records if x['exit_code']]
assert [(x['block'], x['variant']) for x in failed] == [(1, 'pr-on'), (2, 'pr-on'), (3, 'pr-on'), (14, 'pr-on')]
paired = []
for f in failed:
    controls = [x for x in records if x['block'] == f['block'] and x['variant'] != 'pr-on']
    assert len(controls) == 2 and all(x['exit_code'] == 0 for x in controls)
    paired.append({'failure': f, 'controls': controls})
save('failure-and-controls.json', paired)
save('all-sixty-records.json', records)
shutil.copyfile(log, OUT / log.name)
ansi = re.compile(r'\x1b\[[0-9;]*m')
recipe = []
for line in lines[471:574]:
    cleaned = ansi.sub('', line).split(' ', 1)[1]
    recipe.append(cleaned)
(OUT / 'historical-command-construction.txt').write_text(
    'Historical quotation for attribution only; do not execute the stopped probe.\n'
    'This is the logged source recipe, not an expanded results.json command.\n\n' + '\n'.join(recipe) + '\n')
(OUT / 'historical-failure-control-excerpts.txt').write_text('\n'.join(
    f'{number}: {line}' for number, line in enumerate(lines, 1)
    if any(number == x['log_line'] for group in paired for x in [group['failure'], *group['controls']])) + '\n')

paths = [
 'test/hotspot/jtreg/runtime/cds/FourByteHeaderArchiveDeterminism.java',
 'test/hotspot/jtreg/runtime/cds/DeterministicDump.java',
 'test/lib/jdk/test/lib/cds/CDSTestUtils.java',
 'test/lib/jdk/test/lib/process/ProcessTools.java',
 'test/lib/jdk/test/lib/Utils.java',
 'src/hotspot/cpu/aarch64/templateInterpreterGenerator_aarch64.cpp',
 'src/hotspot/cpu/x86/templateInterpreterGenerator_x86_64.cpp',
 'src/hotspot/share/interpreter/abstractInterpreter.cpp',
 'src/hotspot/share/interpreter/abstractInterpreter.hpp',
 'src/java.base/share/classes/jdk/internal/util/ArraysSupport.java',
 'src/java.base/share/classes/java/lang/Long.java',
 'src/hotspot/share/oops/constantPool.cpp',
 'src/hotspot/share/cds/aotConstantPoolResolver.cpp',
 'src/hotspot/share/cds/cdsConfig.cpp',
 'src/hotspot/share/runtime/arguments.cpp',
 'make/SourceRevision.gmk', 'make/ReleaseFile.gmk',
 '.github/actions/get-gtest/action.yml',
]
blobs = []
for path in paths:
    versions = {ref: git('show', ref + ':' + path) for ref in (BASE, TEST, OLD, NEW)}
    item = {'path': path, 'sha256': {ref: hashlib.sha256(data).hexdigest() for ref, data in versions.items()},
            'git_blob': {ref: git('rev-parse', ref + ':' + path).decode().strip() for ref in versions},
            'tested_and_current_equal': versions[OLD] == versions[NEW]}
    blobs.append(item)
assert all(x['tested_and_current_equal'] for x in blobs)
trees = {ref: git('rev-parse', ref + '^{tree}').decode().strip() for ref in (BASE, TEST, OLD, NEW)}
assert trees[TEST] == trees[OLD]
save('source-identities.json', {'refs': {'baseline': BASE, 'test_checkout': TEST, 'tested_jvm': OLD, 'current': NEW},
                              'trees': trees, 'unchanged_files': blobs,
                              'interpretation': 'Equal source files/trees establish source equivalence only; they do not establish current-source ARM execution.'})
(OUT / 'tested-to-current.patch').write_bytes(git('diff', OLD, NEW))
(OUT / 'tested-to-current-stat.txt').write_bytes(git('diff', '--stat', OLD, NEW))
(OUT / 'candidate-commits.txt').write_bytes(git('log', '--format=%H %s', 'c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b..' + NEW))
snips = {
 'src/hotspot/cpu/aarch64/templateInterpreterGenerator_aarch64.cpp': [(986, 1048)],
 'src/hotspot/share/interpreter/abstractInterpreter.hpp': [(141, 152)],
 'src/hotspot/share/interpreter/templateInterpreterGenerator.cpp': [(243, 298)],
 'src/hotspot/share/interpreter/interpreterRuntime.cpp': [(280, 292), (818, 885)],
 'src/java.base/share/classes/jdk/internal/util/ArraysSupport.java': [(361, 375)],
 'src/java.base/share/classes/java/lang/Long.java': [(1547, 1553)],
 'src/hotspot/share/oops/cpCache.cpp': [(468, 493), (557, 616)],
 'src/hotspot/share/oops/constantPool.cpp': [(537, 566)],
 'src/hotspot/share/cds/aotConstantPoolResolver.cpp': [(40, 76)],
 'src/hotspot/share/cds/cdsConfig.cpp': [(45, 47), (568, 574), (650, 683)],
 'src/hotspot/share/runtime/arguments.cpp': [(2301, 2305)],
 'make/SourceRevision.gmk': [(40, 62), (101, 109)],
 '.github/actions/get-gtest/action.yml': [(42, 50)],
 'test/hotspot/jtreg/runtime/cds/DeterministicDump.java': [(66, 145)],
 'test/lib/jdk/test/lib/cds/CDSTestUtils.java': [(245, 269)],
 'test/lib/jdk/test/lib/process/ProcessTools.java': [(564, 566)],
 'test/lib/jdk/test/lib/Utils.java': [(228, 233)],
}
with (OUT / 'current-source-excerpts.txt').open('w') as out:
    out.write('Source ' + NEW + '; line numbers belong to this exact checkout.\n')
    for path, spans in snips.items():
        content = git('show', NEW + ':' + path).decode().splitlines()
        for start, end in spans:
            out.write('\n' + path + '\n')
            out.writelines(f'{i}: {content[i-1]}\n' for i in range(start, min(end, len(content)) + 1))
for path in paths[:2]:
    (OUT / Path(path).name).write_bytes(git('show', OLD + ':' + path))
for filename in ('identity-diagnostics.patch', 'synthetic-checks.json', 'qualification.json'):
    shutil.copyfile(ROOT / 'native-identity-diagnostic-repair' / filename,
                    OUT / ('identity-repair-' + filename))
shutil.copyfile(ROOT / 'original-arm-transfer-blockers.json', OUT / 'original-arm-transfer-blockers.json')
for job in (116759287247, 116759287279):
    p = ROOT / f'native-failure-logs/job-{job}.log'
    shutil.copyfile(p, OUT / p.name)
save('qualification.json', {
 'source': NEW, 'tested_jvm_source': OLD,
 'status': 'source-attribution-complete-native-confirmation-blocked',
 'updated_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'historical_run': 38640541680, 'identity_failure_run': 38829832202,
 'counts': {v: {'passed': sum(x['exit_code'] == 0 for x in records if x['variant'] == v),
                 'failed': sum(x['exit_code'] != 0 for x in records if x['variant'] == v)}
            for v in ('baseline', 'pr-off', 'pr-on')},
 'original_raw_jtr_archive_maps_available': False,
 'new_jvm_or_probe_execution': False, 'new_build': False,
 'hosted_launch_or_rerun': False, 'source_or_pr_modified': False,
 'fix_status': 'Existing 7454b15f static-dump entry guard is a source-supported candidate for both reported resolution-state causes; current ARM proof absent.',
 'identity_status': 'Retained native logs show exit 1 at identity step after successful build/profile; exact failed assertion/actual SOURCE line unprinted. Diagnostic patch unapplied.',
 'stopped_stress_constraint': 'No stopped four-byte-header probe, replacement test, or alternate execution route is authorized.'})
print(json.dumps({'packet': str(OUT), 'records': len(records), 'paired_failures': len(paired),
                  'unchanged_files_verified': len(blobs), 'source_unchanged': True}))
