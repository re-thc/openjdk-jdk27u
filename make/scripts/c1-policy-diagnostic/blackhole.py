"""Bounded, untimed checks of actual JMH auxiliary probes and autodetection."""
from pathlib import Path
import json
import re
import shutil

from common import HERE, classpath, image, save, sha

CDS_ERROR = re.compile(r'Mark mismatch|Unable to (?:use|map) shared|Error occurred during initialization|'
                       r'error.*shared (?:file|archive)|fatal error', re.I)


def validate_probe(text, quiet):
    if CDS_ERROR.search(text):
        raise ValueError('CDS/startup error in JMH blackhole probe')
    markers = [line for line in text.splitlines() if 'CompilerOracle' in line or 'CompileCommand' in line]
    if quiet and markers:
        raise ValueError('JMH quiet blackhole probe reported compiler-command errors')
    if not quiet and (len(markers) != 1 or not re.match(
            r'^CompileCommand:\s+blackhole\s+some/fake/Class\.method\s+bool\s+blackhole\s*=\s*true$', markers[0])):
        raise ValueError('Missing genuine compiler blackhole acceptance marker')


def validate_selection(text):
    if CDS_ERROR.search(text):
        raise ValueError('CDS/startup error during actual JMH blackhole selection')
    modes = re.findall(r'^# Blackhole mode: (.+)$', text, re.M)
    hashes = re.findall(r'^HINTS_SHA256=([0-9a-f]{64})$', text, re.M)
    if (len(modes) != 1 or not modes[0].startswith('compiler (auto-detected,') or
            len(hashes) != 1 or 'BLACKHOLE_READINESS_PASS_AUTO_COMPILER' not in text):
        raise ValueError('Actual JMH did not auto-select compiler blackholes')
    return {'mode': modes[0], 'hints_sha256': hashes[0]}


def validate_timing_mode(text, expected):
    modes = re.findall(r'^# Blackhole mode: (.+)$', text, re.M)
    if modes != [expected] or CDS_ERROR.search(text):
        raise ValueError('Measured JMH blackhole mode differs from validated readiness')


def probe_arguments(quiet):
    result = ['-XX:+UnlockExperimentalVMOptions']
    if quiet:
        result += ['-XX:CompileCommand=quiet']
    return result + ['-XX:CompileCommand=blackhole,some/fake/Class.method', '-version']


def validate_trace(prefix, java):
    probes = []
    for path in sorted(Path(prefix).parent.glob(Path(prefix).name + '.*')):
        if not path.name.rsplit('.', 1)[-1].isdigit():
            continue
        text = path.read_text()
        for match in re.finditer(r'^execve\("([^"\n]+)", (\[.*\]), .*\)\s+= 0$', text, re.M):
            command = json.loads(match[2])
            if not command or command[-1] != '-version':
                continue
            if match[1] != java or command[0] != java:
                raise ValueError('Actual JMH auxiliary probe used a different JVM')
            exits = re.findall(r'^\+\+\+ exited with (\d+) \+\+\+$', text, re.M)
            if exits != ['0']:
                raise ValueError('Actual JMH auxiliary probe did not exit successfully: ' + str(path))
            probes.append({'command': command, 'exit': 0, 'trace': str(path), 'sha256': sha(path)})
    expected = [[java] + probe_arguments(quiet) for quiet in [True, False]]
    if sorted(p['command'] for p in probes) != sorted(expected):
        raise ValueError('Actual JMH did not execute the exact two expected blackhole probes')
    return probes


def check_blackholes(payload, images, output, cpu, invoke):
    output = Path(output)
    if Path('.hotspot_compiler').exists():
        raise ValueError('Uncontrolled .hotspot_compiler input')
    classes = output / 'blackhole-classes'
    classes.mkdir()
    source = HERE / 'BlackholeReadiness.java'
    invoke([str(image(payload, 'current', images) / 'bin/javac'), '-J-Xshare:off',
            '-J-XX:ActiveProcessorCount=2', '--release', '17', '-proc:none', '-cp', classpath(payload),
            '-d', str(classes), str(source)], output / 'blackhole-compile.log', 20,
           phase='readiness', kind='blackhole-helper-compile')
    tracer = shutil.which('strace')
    if tracer is None:
        raise ValueError('strace is required to verify actual JMH probe exits')
    records = {'source_sha256': sha(source), 'helper_sha256': sha(classes / 'BlackholeReadiness.class'),
               'strace': {'path': tracer, 'sha256': sha(tracer)},
               'unmodified_JMH_autodetection': True, 'images': {}}
    expected_hints = sha(Path(payload) / 'support/compiler-hints.txt')
    for arm in ['before', 'current', 'repair']:
        java = str(image(payload, arm, images) / 'bin/java')
        for quiet in [True, False]:
            text = invoke(['taskset', '-c', str(cpu), java] + probe_arguments(quiet),
                          output / (arm + '-blackhole-' + ('quiet' if quiet else 'accept') + '.log'), 10,
                          phase='readiness', kind='blackhole-version-probe', arm=arm)
            validate_probe(text, quiet)
        prefix = output / (arm + '-blackhole-process')
        if list(output.glob(prefix.name + '.*')):
            raise ValueError('Blackhole process trace already exists: ' + arm)
        text = invoke([tracer, '-ff', '-q', '-s', '4096', '-e', 'trace=execve,exit_group', '-o', str(prefix),
                       'taskset', '-c', str(cpu), java, '-Xshare:off', '-XX:ActiveProcessorCount=2',
                       '-Djmh.blackhole.debug=true', '-cp', str(classes) + ':' + classpath(payload),
                       'BlackholeReadiness'], output / (arm + '-blackhole-selection.log'), 20,
                      phase='readiness', kind='actual-JMH-blackhole-selection', arm=arm)
        records['images'][arm] = validate_selection(text)
        save(output / 'blackhole-selection.json', records)
        records['images'][arm]['actual_probes'] = validate_trace(prefix, java)
        save(output / 'blackhole-selection.json', records)
        if records['images'][arm]['hints_sha256'] != expected_hints:
            raise ValueError('JMH compiler hints differ from frozen compiler-blackhole hints: ' + arm)
    values = [{k: v for k, v in value.items() if k in ['mode', 'hints_sha256']}
              for value in records['images'].values()]
    if any(value != values[0] for value in values[1:]):
        raise ValueError('JMH blackhole modes or compiler hints differ across images')
    return records
