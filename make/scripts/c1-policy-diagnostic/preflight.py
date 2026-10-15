"""Fail closed on mismatched rebuild provenance, files, ISA or ELF resolution."""
import argparse
import json
import os
from pathlib import Path
import platform
import re
import resource
import shutil
import subprocess
import sys
import time

from common import BASE, CHANGED, HERE, ORIGINAL, PATCH_SHA, safe_extract, save, sha, snapshot, verify


def read(path):
    try:
        return Path(path).read_text().strip()
    except OSError as error:
        return 'unavailable: ' + str(error)


def host_metadata(invoke=None):
    cgroup = {name: read('/sys/fs/cgroup/' + name) for name in
              ['cpu.max', 'cpu.stat', 'cpuset.cpus.effective', 'pids.current', 'pids.max',
               'memory.current', 'memory.max', 'memory.events']}
    limits = {name: list(resource.getrlimit(getattr(resource, name))) for name in
              ['RLIMIT_NPROC', 'RLIMIT_NOFILE', 'RLIMIT_STACK', 'RLIMIT_AS']}
    hierarchy = []
    mount = Path('/sys/fs/cgroup')
    entries = [line.split('::', 1)[1] for line in read('/proc/self/cgroup').splitlines() if line.startswith('0::')]
    group = (mount / entries[0].lstrip('/')).resolve() if entries else mount
    if not group.is_relative_to(mount) or not group.is_dir():
        group = mount
    while group.is_relative_to(mount):
        hierarchy.append({'path': str(group), **{n: read(group / n) for n in cgroup}})
        if group == mount:
            break
        group = group.parent
    commands = {}
    for command in [['lscpu'], ['uname', '-a'], ['getconf', 'GNU_LIBC_VERSION'], ['free', '-b'],
                    ['ps', '-eo', 'pid,ppid,nlwp,stat,comm']]:
        if invoke:
            commands[' '.join(command)] = {'exit': 0, 'output': invoke(command, 10)}
        else:
            done = subprocess.run(command, text=True, capture_output=True, timeout=10)
            commands[' '.join(command)] = {'exit': done.returncode, 'stdout': done.stdout, 'stderr': done.stderr}
    return {'utc_unix': time.time(), 'system': platform.system(), 'machine': platform.machine(),
            'runner': {k: os.environ.get(k) for k in ['RUNNER_OS', 'RUNNER_ARCH', 'RUNNER_NAME',
                       'ImageOS', 'ImageVersion', 'GITHUB_SHA', 'GITHUB_RUN_ID', 'GITHUB_RUN_ATTEMPT']},
            'affinity': sorted(os.sched_getaffinity(0)), 'cgroup': cgroup, 'cgroup_ancestors': hierarchy, 'limits': limits,
            'cpuinfo': read('/proc/cpuinfo'), 'meminfo': read('/proc/meminfo'),
            'disk': dict(zip(['total', 'used', 'free'], shutil.disk_usage(os.environ.get('RUNNER_TEMP', '/tmp')))),
            'loadavg': read('/proc/loadavg'), 'commands': commands,
            'isolation': 'Not established by runner label; calibration is mandatory.'}


def require_host(metadata, building=False):
    if metadata['system'] != 'Linux' or metadata['machine'] != 'x86_64' or sys.byteorder != 'little':
        raise ValueError('A little-endian native-ISA Linux x86-64 host is required')
    if metadata['runner'].get('RUNNER_ARCH') not in [None, 'X64']:
        raise ValueError('Runner architecture disagrees with native x64 requirement')
    if metadata['runner'].get('GITHUB_RUN_ATTEMPT') not in [None, '1']:
        raise ValueError('Workflow reruns are outside this single-execution protocol')
    match = re.search(r'^flags\s*:\s*(.*)$', metadata['cpuinfo'], re.M)
    if match is None:
        raise ValueError('CPU feature flags unavailable')
    flags = set(match.group(1).split())
    required = {'avx', 'avx2', 'bmi1', 'bmi2', 'f16c', 'fma', 'movbe', 'xsave',
                'sse4_1', 'sse4_2', 'popcnt', 'cx16', 'ssse3', 'sse2', 'lahf_lm'}
    if not required <= flags or not flags.intersection({'abm', 'lzcnt'}):
        raise ValueError('CPU does not expose the frozen x86-64-v3 target features')
    if len(metadata['affinity']) < 2:
        raise ValueError('Fewer than two available CPUs')
    for group in metadata.get('cgroup_ancestors', []):
        quota = group['cpu.max'].split()
        if len(quota) == 2 and quota[0] != 'max' and int(quota[0]) / int(quota[1]) < 2:
            raise ValueError('Ancestor CPU quota below two CPUs: ' + group['path'])
        if building and group['memory.max'].isdigit() and int(group['memory.max']) < 6 * 1024**3:
            raise ValueError('Ancestor memory limit below 6 GiB: ' + group['path'])
        if group['pids.max'].isdigit() and group['pids.current'].isdigit() and int(group['pids.max']) - int(group['pids.current']) < 128:
            raise ValueError('Insufficient ancestor thread headroom: ' + group['path'])
    quota = metadata['cgroup']['cpu.max'].split()
    if len(quota) == 2 and quota[0] != 'max' and int(quota[0]) / int(quota[1]) < 2:
        raise ValueError('CPU quota below two CPUs')
    cap = metadata['cgroup']['memory.max']
    if building and cap.isdigit() and int(cap) < 6 * 1024**3:
        raise ValueError('Matched two-job builds require at least 6 GiB memory capacity')
    physical = re.search(r'^MemTotal:\s+(\d+) kB', metadata.get('meminfo', ''), re.M)
    if building and physical and int(physical.group(1)) * 1024 < 6 * 1024**3:
        raise ValueError('Physical memory below 6 GiB')
    if building and metadata['disk']['free'] < 9 * 1024**3:
        raise ValueError('Matched builds and image transfer require at least 9 GiB free disk')
    pid_max = metadata['cgroup']['pids.max']
    current = metadata['cgroup']['pids.current']
    if pid_max.isdigit() and current.isdigit() and int(pid_max) - int(current) < 128:
        raise ValueError('Insufficient process/thread headroom')
    forbidden = ['JAVA_TOOL_OPTIONS', 'JDK_JAVA_OPTIONS', '_JAVA_OPTIONS', 'LD_PRELOAD', 'LD_LIBRARY_PATH']
    if any(os.environ.get(k) for k in forbidden):
        raise ValueError('Uncontrolled JVM/loader environment override')


def verify_native(payload):
    payload = Path(payload)
    native = json.loads((payload / 'native-manifest.json').read_text())
    expected = ('matched-native-rebuild-v1', ORIGINAL, BASE, PATCH_SHA)
    actual = tuple(native.get(k) for k in ['experiment', 'original', 'base', 'patch_sha256'])
    if actual != expected:
        raise ValueError('Wrong experiment/source/patch identity')
    if snapshot(payload, excluded=('native-manifest.json',)) != native['files']:
        raise ValueError('Native payload hash/type/mode mismatch')
    support = json.loads((HERE / 'support-manifest.json').read_text())
    verify(payload / 'support', support['files'])
    provenance = payload / 'provenance'
    control = json.loads((provenance / 'current-source.json').read_text())
    repair = json.loads((provenance / 'repair-source.json').read_text())
    delta = {k for k in control.keys() | repair.keys() if control.get(k) != repair.get(k)}
    if delta != CHANGED:
        raise ValueError('Control/repair source delta is not the intended five files')
    tools = [json.loads((provenance / ('tool-inputs-' + t + '.json')).read_text()) for t in ['before', 'after']]
    if tools[0] != tools[1]:
        raise ValueError('Build inputs changed')
    revisions = json.loads((provenance / 'source-revisions.json').read_text())
    if revisions['before']['commit'] != ORIGINAL or revisions['current']['commit'] != BASE:
        raise ValueError('Wrong source revisions')
    if revisions['current'] != revisions['repair']:
        raise ValueError('Different control/repair base archives')
    bindings = json.loads((HERE / 'source-bindings.json').read_text())
    for arm, revision in [('before', ORIGINAL), ('current', BASE), ('repair', BASE)]:
        if revisions[arm]['git_tree'] != bindings['trees'][revision]:
            raise ValueError('Source Git tree identity differs')
    for arm, sources in [('current', control), ('repair', repair)]:
        if {name: sources[name]['sha256'] for name in CHANGED} != bindings[arm]:
            raise ValueError('Changed source contents differ from reviewed patch')
    def spec(name):
        return [line for line in (provenance / (name + '-spec.gmk')).read_text().splitlines()
                if line.strip() and not line.lstrip().startswith('#')]
    if spec('current') != spec('repair'):
        raise ValueError('Control/repair configure specifications differ')
    if json.loads((provenance / 'current-native-commands.json').read_text()) != json.loads((provenance / 'repair-native-commands.json').read_text()):
        raise ValueError('Actual native build commands changed')
    if snapshot(provenance / 'current-generated-inputs') != snapshot(provenance / 'repair-generated-inputs'):
        raise ValueError('Generated HotSpot source/header inputs changed')
    compiler = {arm: json.loads((provenance / (arm + '-compiler-inputs.json')).read_text())
                for arm in ['current', 'repair']}
    changes = {k for k in compiler['current'].keys() | compiler['repair'].keys()
               if compiler['current'].get(k) != compiler['repair'].get(k)}
    if len(changes) != len(CHANGED) or {p for p in CHANGED if any(k.endswith('/' + p) for k in changes)} != CHANGED:
        raise ValueError('Actual compiler source/header input delta differs')
    a = snapshot(payload / 'images/current')
    b = snapshot(payload / 'images/repair')
    if {k for k in a.keys() | b.keys() if a.get(k) != b.get(k)} != {'lib/server/libjvm.so'}:
        raise ValueError('Control/repair images differ outside libjvm.so')
    if sha(provenance / 'production.patch') != PATCH_SHA:
        raise ValueError('Production patch identity changed')
    return native


def check_elf(payload, output, invoke):
    records = []
    libraries = {}
    for arm in ['before', 'current', 'repair']:
        root = Path(payload) / 'images' / arm
        for path in sorted(root.rglob('*')):
            if not path.is_file() or path.is_symlink():
                continue
            with path.open('rb') as stream:
                if stream.read(4) != b'\x7fELF':
                    continue
            header = invoke(['readelf', '-h', str(path)], 10)
            if 'Advanced Micro Devices X86-64' not in header or 'ELF64' not in header:
                raise ValueError('Non-native ELF: ' + str(path))
            dynamic = invoke(['readelf', '-d', str(path)], 10)
            if 'NEEDED' not in dynamic:
                records.append({'arm': arm, 'path': str(path.relative_to(root)), 'dynamic': dynamic})
                continue
            resolved = invoke(['ldd', str(path)], 10)
            record = {'arm': arm, 'path': str(path.relative_to(root)), 'dynamic': dynamic, 'ldd': resolved}
            records.append(record)
            save(Path(output) / 'elf-resolution.json', records)
            if 'not found' in resolved:
                raise ValueError('Unresolved ELF dependency: ' + str(path))
            for word in resolved.split():
                if word.startswith('/'):
                    library = Path(word)
                    if not library.is_file():
                        raise ValueError('Missing resolved ELF library: ' + word)
                    libraries[str(library.resolve())] = sha(library)
    save(Path(output) / 'resolved-library-hashes.json', libraries)
    save(Path(output) / 'elf-resolution.json', records)


def main():
    parser = argparse.ArgumentParser(description='Stage an exact, hash-bound native rebuild artifact')
    parser.add_argument('--archive', type=Path, required=True)
    parser.add_argument('--archive-sha256', required=True)
    parser.add_argument('--manifest-sha256', required=True)
    parser.add_argument('--destination', type=Path, required=True)
    args = parser.parse_args()
    if sha(args.archive) != args.archive_sha256:
        raise ValueError('Build artifact archive hash mismatch')
    safe_extract(args.archive, args.destination)
    if sha(args.destination / 'native-manifest.json') != args.manifest_sha256:
        raise ValueError('Build artifact manifest hash mismatch')
    # Full image/provenance verification is repeated inside the runtime budget.


if __name__ == '__main__':
    main()
