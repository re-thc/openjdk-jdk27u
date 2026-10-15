"""Portable bindings for the unchanged, independently reviewed protocol."""
import hashlib
import json
import os
from pathlib import Path
import stat
import tarfile

HERE = Path(__file__).resolve().parent
PLAN_SHA = '61c3b051bae7ad9bbdd52a7ae6a70635ee2fe04e178b1d159d237f163a84ace5'
BASE = 'fc06b7bf0599d23ef644bf5657ddab36e8d96a3d'
ORIGINAL = '38582c8d0cba313ca046fb8d17bf9458aba2f7ef'
PATCH_SHA = '271a20c50b5bb46e8302ff1bcb1ed9182d9ae7d9a682ff42c052d6b70047980b'
CHANGED = {
    'src/hotspot/share/c1/c1_GraphBuilder.cpp',
    'src/hotspot/share/classfile/vmSymbols.hpp',
    'src/hotspot/share/prims/jvm.cpp',
    'src/hotspot/share/utilities/zmij.cpp',
    'src/hotspot/share/utilities/zmij.hpp',
}


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def save(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + '.tmp')
    temporary.write_text(json.dumps(value, indent=2) + '\n')
    temporary.replace(path)


def plan():
    assert sha(HERE / 'frozen-plan.json') == PLAN_SHA
    return json.loads((HERE / 'frozen-plan.json').read_text())


def snapshot(root, excluded=()):
    root = Path(root)
    result = {}
    for directory, names, files in os.walk(root, followlinks=False):
        relative = Path(directory).relative_to(root)
        if relative == Path('.'):
            names[:] = [n for n in names if n not in excluded]
            files = [n for n in files if n not in excluded]
        for name in sorted(names + files):
            path = Path(directory) / name
            key = path.relative_to(root).as_posix()
            mode = stat.S_IMODE(path.lstat().st_mode)
            if path.is_symlink():
                result[key] = {'type': 'link', 'target': os.readlink(path), 'mode': mode}
            elif path.is_file():
                result[key] = {'type': 'file', 'bytes': path.stat().st_size,
                               'sha256': sha(path), 'mode': mode}
            elif path.is_dir():
                result[key] = {'type': 'directory', 'mode': mode}
            else:
                raise ValueError('Unsupported filesystem object: ' + str(path))
    return result


def verify(root, expected):
    actual = snapshot(root)
    if actual != expected:
        differences = sorted(k for k in actual.keys() | expected.keys()
                             if actual.get(k) != expected.get(k))
        raise ValueError('Manifest mismatch: ' + repr(differences[:20]))


def safe_extract(archive, destination):
    destination = Path(destination)
    destination.mkdir(exist_ok=False, parents=True)
    with tarfile.open(archive) as stream:
        seen = set()
        for member in stream.getmembers():
            name = Path(member.name)
            if name.is_absolute() or '..' in name.parts or member.name in seen:
                raise ValueError('Unsafe/duplicate archive member: ' + member.name)
            seen.add(member.name)
            if not (member.isfile() or member.isdir() or member.issym()):
                raise ValueError('Unsupported archive member: ' + member.name)
            if member.issym():
                target = Path(member.linkname)
                resolved = (destination / name.parent / target).resolve()
                if target.is_absolute() or not resolved.is_relative_to(destination.resolve()):
                    raise ValueError('Escaping archive link: ' + member.name)
        stream.extractall(destination, filter='data')
        # data_filter intentionally ignores directory modes. Restore only ordinary
        # permission bits inside this owned, hash-bound destination.
        for member in sorted(stream.getmembers(), key=lambda m: len(Path(m.name).parts), reverse=True):
            if member.isfile() or member.isdir():
                os.chmod(destination / member.name, member.mode & 0o777)


def schedule():
    p = plan()
    rows = []
    def add(case, input_name, mode, route, orders, historical, phase):
        for number, order in enumerate(orders):
            for position, arm in enumerate(order):
                rows.append(dict(tag=f'{case}-r{number:02}-p{position}-{arm}',
                                 case=case, input=input_name, mode=mode, route=route,
                                 arm=arm, round=number, position=position,
                                 historical=historical, phase=phase))
    a, b, c, d = p['phases']
    add(a['case'], 'ordinary', 'c1', 'optout', a['orders'], False, 'A')
    for name in ['short', 'full-range']:
        add('long-c1-optout-' + name, name, 'c1', 'optout', b['orders_each'], False, 'B')
    for cell in c['cases']:
        add(cell['case'], cell['input'], cell['mode'], cell['route'], c['orders_each'], False, 'C')
    add(d['case'], 'ordinary', 'c1', 'optout', d['orders'], True, 'D')
    assert len(rows) == 196 and len({r['tag'] for r in rows}) == 196
    return rows


def probes():
    result = [('c1-optout-' + name, name, 'c1', 'optout', arm)
              for name in ['ordinary', 'short', 'full-range']
              for arm in ['before', 'current', 'repair']]
    result += [(mode + '-' + route + '-ordinary', 'ordinary', mode, route, arm)
               for mode, route in [('c1', 'native'), ('c2', 'optout'), ('c2', 'native')]
               for arm in ['current', 'repair']]
    assert len(result) == 15
    return result


def flags(mode, route):
    common = ('-Xms256m -Xmx256m -Xshare:off -XX:ActiveProcessorCount=2 -XX:+UseG1GC '
              '-XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders '
              '--add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.math=ALL-UNNAMED '
              '--add-exports=java.base/jdk.internal.util=ALL-UNNAMED --add-opens=java.base/jdk.internal.math=ALL-UNNAMED')
    modes = {'c1': '-Xbatch -XX:TieredStopAtLevel=1', 'c2': '-Xbatch -XX:-TieredCompilation',
             'interpreter': '-Xint', 'tiered': ''}
    return common + ' ' + modes[mode] + ' -XX:' + ('+' if route == 'native' else '-') + 'UseZmijIntrinsics'


def image(payload, arm):
    return Path(payload) / 'images' / ('current' if arm == 'calibration' else arm)


def classpath(payload):
    root = Path(payload) / 'support' / 'bench'
    return ':'.join([str(root / 'classes')] + [str(p) for p in sorted(root.glob('*.jar'))])


def timing_command(row, payload, output, cpu):
    java = str(image(payload, row['arm']) / 'bin/java')
    data = plan()['inputs'][row['input']]
    cmd = ['taskset', '-c', str(cpu), java, '-XX:ActiveProcessorCount=2', '-cp',
           classpath(payload), 'org.openjdk.jmh.Main', data['benchmark'] + '$']
    for key, value in data['params'].items():
        cmd += ['-p', key + '=' + value]
    short = row['historical']
    return cmd + ['-jvm', java, '-jvmArgsAppend', flags(row['mode'], row['route']),
                  '-f', '1', '-t', '1', '-wi', '3' if short else '5', '-w', '500ms' if short else '1s',
                  '-i', '3' if short else '5', '-r', '500ms' if short else '2s',
                  '-prof', 'gc', '-foe', 'true', '-rf', 'json', '-rff',
                  str(Path(output) / 'timing' / (row['tag'] + '.json'))]


def execute_protocol(invoke, calibration_gate, diagnostic):
    completed = 0
    for row in schedule():
        invoke(row)
        completed += 1
        if completed == 32 and not calibration_gate():
            return completed, 0
    for row in probes():
        diagnostic(row)
    return completed, 15
