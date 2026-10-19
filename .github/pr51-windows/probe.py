import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import statistics
import subprocess
import sys
import time
import xml.etree.ElementTree as ET


ROOT = Path(__file__).resolve().parent
WORK = Path.cwd()
OUT = WORK / 'windows-evidence'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def run(name, args, timeout=180, expected=0):
    log = OUT / (name + '.log')
    start = datetime.datetime.now(datetime.timezone.utc).isoformat()
    with log.open('w') as stream:
        result = subprocess.run([str(a) for a in args], stdout=stream,
                                stderr=subprocess.STDOUT, timeout=timeout)
    text = log.read_text(errors='replace')
    receipt = {'argv': [str(a) for a in args], 'exit_code': result.returncode,
               'start_utc': start, 'end_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
               'log': log.name, 'log_sha256': sha(log)}
    save(name + '.json', receipt)
    if result.returncode != expected:
        raise RuntimeError(f'{name}: exit {result.returncode}; retained {log}')
    return text, receipt


def xml_details(path):
    tree = ET.parse(path)
    methods = [dict(n.attrib) for n in tree.iter('nmethod')
               if 'BlockDecoder decodeSequencesRolling ' in n.get('method', '')]
    ids = {n['compile_id'] for n in methods}
    return {'decoder_nmethods': methods,
            'decoder_tasks': [dict(t.attrib, done=[dict(d.attrib) for d in t.iter('task_done')],
                                  regalloc=[dict(d.attrib) for d in t.iter('regalloc')])
                              for t in tree.iter('task') if t.get('compile_id') in ids],
            'decoder_invalidations': [dict(n.attrib) for n in tree.iter('make_not_entrant')
                                      if n.get('compile_id') in ids]}


def spread(values):
    values = sorted(values)
    quartiles = statistics.quantiles(values, n=4, method='inclusive') if len(values) > 1 else [values[0]] * 3
    return {'median': statistics.median(values), 'min': values[0], 'max': values[-1],
            'q1': quartiles[0], 'q3': quartiles[2], 'values': values}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--jtreg', required=True)
    parser.add_argument('--validate-only', action='store_true')
    args = parser.parse_args()
    jtreg_path = args.jtreg
    if re.match(r'^/[A-Za-z]/', jtreg_path):
        jtreg_path = jtreg_path[1] + ':' + jtreg_path[2:]
    plan_data = (ROOT / 'plan.json').read_bytes()
    plan = json.loads(plan_data)
    for name, expected in plan['input_sha256'].items():
        assert sha(ROOT / name) == expected, name
    assert len(plan['schedule']) == plan['total_forks'] == 144
    if args.validate_only:
        print('Plan and fixed input hashes verified')
        return
    assert platform.system() == 'Windows' and platform.machine().lower() in ('amd64', 'x86_64')
    OUT.mkdir(exist_ok=False)
    images = {name: WORK / 'images' / ('pr51-windows-' + name)
              for name in ('baseline-release', 'candidate-release', 'candidate-fastdebug')}
    metadata = {name: json.loads((path / 'metadata.json').read_text(encoding='utf-8-sig'))
                for name, path in images.items()}
    for name, image in images.items():
        record = metadata[name]
        assert record['source'] == plan['baseline_source' if name.startswith('baseline') else 'candidate_source']
        assert not record['dirty']
        assert record['jvm_sha256'].lower() == sha(image / 'jdk/bin/server/jvm.dll')
    save('identity.json', {'plan_sha256': hashlib.sha256(plan_data).hexdigest(), 'builds': metadata,
                          'platform': platform.platform(), 'processor': platform.processor(),
                          'cpu_count': os.cpu_count(), 'runner_image': os.environ.get('ImageVersion'),
                          'workflow_sha': os.environ.get('GITHUB_SHA')})
    release = images['candidate-release'] / 'jdk/bin/java.exe'
    debug = images['candidate-fastdebug'] / 'jdk/bin/java.exe'
    baseline = images['baseline-release'] / 'jdk/bin/java.exe'
    for name, java in [('baseline', baseline), ('release', release), ('fastdebug', debug)]:
        text, _ = run('identity-' + name, [java, '-Xlog:os+cpu=info', '-XX:+PrintFlagsFinal', '-version'])
        if name != 'baseline':
            assert re.search(r'UseColdCallSpillDeferral\s*=\s*false.*\{C2 product\}.*\{default\}', text), name
            for enabled in (False, True):
                flag = '-XX:' + ('+' if enabled else '-') + 'UseColdCallSpillDeferral'
                flags, _ = run('flag-' + name + '-' + str(enabled), [java, flag, '-XX:+PrintFlagsFinal', '-version'])
                assert re.search(r'UseColdCallSpillDeferral\s*=\s*' + str(enabled).lower(), flags)
    classes = OUT / 'classes'
    classes.mkdir()
    sources = sorted((WORK / 'codec/src/main/java').rglob('*.java')) + [ROOT / 'CodecProbe.java', ROOT / 'DecoderCheck.java']
    argfile = OUT / 'javac.args'
    argfile.write_text('\n'.join('"' + p.as_posix() + '"' for p in sources) + '\n')
    run('compile-codec', [images['candidate-release'] / 'jdk/bin/javac.exe', '--add-modules',
                          'jdk.incubator.vector', '-d', classes, '@' + str(argfile)])
    common = plan['common_flags']
    for image_name, java in [('baseline', baseline), ('release', release), ('fastdebug', debug)]:
        variants = [('default', [])] if image_name == 'baseline' else [
            ('default', []), ('off', ['-XX:-UseColdCallSpillDeferral']), ('on', ['-XX:+UseColdCallSpillDeferral'])]
        for variant, flags in variants:
            text, _ = run('correctness-' + image_name + '-' + variant,
                          [java, *common, *flags, '-cp', classes, 'DecoderCheck', ROOT / 'corpora',
                           str(plan['correctness_rounds'])])
            assert 'PASS frames=57 rounds=32 checksum=195202368' in text
    tests = ['TestColdCallDebugHome', 'TestColdCallSpillPlacement', 'TestColdCallDerivedPointers', 'TestColdCallSpillPolicy']
    for name in ('candidate-release', 'candidate-fastdebug'):
        image = images[name]
        run('jtreg-' + name, [image / 'jdk/bin/java.exe', '-jar', Path(jtreg_path) / 'lib/jtreg.jar',
            '-jdk:' + str(image / 'jdk'), '-conc:1', '-verbose:summary', '-retain:all',
            '-nativepath:' + str(image / 'native'), '-w:' + str(OUT / ('work-' + name)),
            '-r:' + str(OUT / ('report-' + name)),
            *[WORK / 'candidate-source/test/hotspot/jtreg/compiler/regalloc' / (test + '.java') for test in tests]],
            timeout=900)
    cases = {case['id']: case for case in plan['cases']}
    records = []
    for item in plan['schedule']:
        case = cases[item['case']]
        stem = f"{item['sequence']:03d}-{case['id']}-b{item['block']}-{item['variant']}"
        java = baseline if item['variant'] == 'baseline' else release
        flags = [] if item['variant'] == 'baseline' else [
            '-XX:' + ('+' if item['variant'] == 'on' else '-') + 'UseColdCallSpillDeferral']
        xml = OUT / (stem + '.xml')
        argv = [java, *common, *(plan['c2_extra_flags'] if case['vm'] == 'c2-only' else []),
                *flags, '-XX:+UnlockDiagnosticVMOptions', '-XX:+LogCompilation', '-XX:LogFile=' + str(xml),
                '-Dprobe.warmup=6', '-Dprobe.compilerStats=true', *case.get('options', []),
                '-cp', classes, 'CodecProbe', 'decode', ROOT / 'corpora' / (case['corpus'] + '.bin'),
                str(case['level']), ROOT / 'corpora' / (case['corpus'] + '.l' + str(case['level']) + '.zst')]
        text, receipt = run(stem, argv, timeout=90)
        match = re.search(r'median=([\d.]+) MB/s samples=\[([^]]+)\]', text)
        assert match, stem
        compiler = re.search(r'COMPILER warmup_ms=(\d+) measured_ms=(\d+) boundary_uptime_ms=(\d+)', text)
        assert compiler, stem
        record = dict(item, **receipt, median_MBps=float(match[1]),
                      samples_MBps=[float(x.strip()) for x in match[2].split(',')],
                      compiler=dict(zip(['warmup_ms', 'measured_ms', 'boundary_uptime_ms'], map(int, compiler.groups()))),
                      **xml_details(xml), xml_sha256=sha(xml))
        records.append(record)
        save('performance-results.json', {'plan_sha256': hashlib.sha256(plan_data).hexdigest(), 'records': records})
        print(stem, record['median_MBps'], flush=True)
    summary = {}
    for case in cases:
        rows = [r for r in records if r['case'] == case]
        per_block = {b: {r['variant']: r['median_MBps'] for r in rows if r['block'] == b} for b in range(6)}
        summary[case] = {'rates_MBps': {v: spread([r['median_MBps'] for r in rows if r['variant'] == v])
                                       for v in ('baseline', 'off', 'on')},
                         'paired_gain_percent': {label: spread([100 * (rates[a] / rates[b] - 1)
                                                               for rates in per_block.values()])
                                                  for label, a, b in [('on_vs_off', 'on', 'off'),
                                                                      ('on_vs_baseline', 'on', 'baseline'),
                                                                      ('off_vs_baseline', 'off', 'baseline')]}}
    save('performance-summary.json', summary)
    save('complete.json', {'result': 'PASS', 'forks': len(records), 'utc': datetime.datetime.now(datetime.timezone.utc).isoformat()})
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
