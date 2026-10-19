import datetime
import hashlib
import itertools
import json
import os
from pathlib import Path
import platform
import re
import shutil
import statistics
import subprocess
import sys
import time
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

ROOT = Path(__file__).resolve().parent
WORK = Path.cwd()
OUT = WORK / 'windows-repository-evidence'
DEADLINE = None


def utc():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def remaining():
    seconds = DEADLINE - time.monotonic()
    if seconds <= 0:
        raise TimeoutError('Approved controller deadline reached')
    return seconds


def run(name, argv, timeout=60):
    budget = min(timeout, remaining())
    start = utc()
    path = OUT / (name + '.log')
    timed_out = False
    with path.open('w') as stream:
        child_env = {key: value for key, value in os.environ.items() if key not in ('GH_TOKEN', 'GITHUB_TOKEN')}
        process = subprocess.Popen([str(x) for x in argv], stdout=stream, stderr=subprocess.STDOUT, env=child_env)
        try:
            code = process.wait(timeout=budget)
        except subprocess.TimeoutExpired:
            timed_out = True
            # Restrict cleanup to this controller's process and its descendants.
            cleanup = subprocess.run(['taskkill', '/PID', str(process.pid), '/T', '/F'],
                                     stdout=stream, stderr=subprocess.STDOUT, timeout=20)
            code = process.wait(timeout=20)
            if cleanup.returncode:
                stream.write('\nOwned process-tree cleanup returned ' + str(cleanup.returncode))
    receipt = {'argv': [str(x) for x in argv], 'start_utc': start, 'end_utc': utc(),
               'exit_code': code, 'timed_out': timed_out, 'log': path.name, 'log_sha256': sha(path)}
    save(name + '.json', receipt)
    if timed_out or code:
        raise RuntimeError(f'{name}: exit={code} timed_out={timed_out}; retained {path.name}')
    print(name + ': PASS', flush=True)
    return path.read_text(errors='replace'), receipt


def api(path):
    request = urllib.request.Request('https://api.github.com/repos/re-thc/openjdk-jdk27u/' + path,
        headers={'Authorization': 'Bearer ' + os.environ['GH_TOKEN'],
                 'Accept': 'application/vnd.github+json', 'User-Agent': 'PR51-repository-qualification'})
    return request


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, request, fp, code, msg, headers, newurl):
        return None


def download(name, pinned, run_id):
    print('Verifying retained image ' + name, flush=True)
    artifact_id = pinned['artifact_id']
    with urllib.request.urlopen(api(f'actions/artifacts/{artifact_id}'), timeout=min(45, remaining())) as response:
        metadata = json.load(response)
    assert metadata['id'] == artifact_id and metadata['name'] == pinned['name']
    assert metadata['workflow_run']['id'] == run_id and not metadata['expired']
    assert metadata['workflow_run']['head_sha'] == pinned['workflow_sha']
    assert metadata['digest'] == 'sha256:' + pinned['archive_sha256']
    try:
        urllib.request.build_opener(NoRedirect).open(api(f'actions/artifacts/{artifact_id}/zip'),
                                                    timeout=min(45, remaining()))
        raise AssertionError('Expected GitHub artifact download redirect')
    except urllib.error.HTTPError as redirect:
        if redirect.code != 302:
            raise
        location = redirect.headers['Location']
        assert location.startswith('https://')
    archives = WORK / 'retained-image-archives'
    archives.mkdir(exist_ok=True)
    archive = archives / (name + '.zip')
    # The signed blob URL is opened WITHOUT the GitHub authorization header.
    with urllib.request.urlopen(location, timeout=min(45, remaining())) as response, archive.open('wb') as stream:
        while chunk := response.read(1024 * 1024):
            remaining()
            stream.write(chunk)
    assert archive.stat().st_size == metadata['size_in_bytes']
    assert sha(archive) == pinned['archive_sha256']
    image = WORK / 'images' / name
    image.mkdir(parents=True, exist_ok=False)
    with zipfile.ZipFile(archive) as entries:
        for entry in entries.infolist():
            remaining()
            destination = (image / entry.filename).resolve()
            destination.relative_to(image.resolve())
            if entry.is_dir():
                destination.mkdir(parents=True, exist_ok=True)
            else:
                destination.parent.mkdir(parents=True, exist_ok=True)
                with entries.open(entry) as source, destination.open('wb') as target:
                    shutil.copyfileobj(source, target)
    build = json.loads((image / 'metadata.json').read_text(encoding='utf-8-sig'))
    assert not build['dirty'] and str(build['run_id']) == str(run_id)
    for key in ('source', 'debug', 'compiler', 'configuration', 'workflow_sha', 'runner_image'):
        assert build[key] == pinned[key], (name, key)
    assert sha(image / 'jdk/bin/server/jvm.dll') == build['jvm_sha256'] == pinned['jvm_sha256']
    assert sha(image / 'jdk/bin/java.exe') == build['java_sha256'] == pinned['java_sha256']
    identities = OUT / 'image-identities' / name
    identities.mkdir(parents=True)
    for file in ('metadata.json', 'spec.gmk', 'configure.log', 'build.log', 'java-version.txt'):
        shutil.copyfile(image / file, identities / file)
    save('image-' + name + '.json', {'artifact': metadata, 'expected': pinned, 'build': build,
                                   'archive_sha256_verified': sha(archive), 'jvm_and_launcher_hashes_verified': True})
    return image


def spread(values):
    q = statistics.quantiles(values, n=4, method='inclusive')
    return {'median': statistics.median(values), 'min': min(values), 'max': max(values),
            'q1': q[0], 'q3': q[2], 'values_in_block_order': values}


def compile_details(path, target, begin=None, end=None):
    tree = ET.parse(path)
    methods = [dict(node.attrib) for node in tree.iter('nmethod')
               if node.get('method', '').split()[:2] == ['StandaloneColdCallProbe', target]]
    normal = [n for n in methods if n.get('compiler') == 'c2' and n.get('compile_kind') != 'osr']
    assert len(normal) == 1, ('Expected exactly one normal target C2 nmethod', methods)
    ids = {n['compile_id'] for n in normal}
    invalidations = [dict(n.attrib) for n in tree.iter('make_not_entrant') if n.get('compile_id') in ids]
    if begin is not None:
        assert float(normal[0]['stamp']) * 1000 <= begin, normal
        assert not [n for n in invalidations if float(n['stamp']) * 1000 <= end], invalidations
    tasks = [dict(t.attrib, done=[dict(d.attrib) for d in t.iter('task_done')],
                  regalloc=[dict(d.attrib) for d in t.iter('regalloc')])
             for t in tree.iter('task') if t.get('compile_id') in ids]
    return {'target_nmethods': methods, 'target_normal_c2_tasks': tasks, 'target_invalidations': invalidations,
            'xml_sha256': sha(path), 'normal_c2_resident_through_measurement': begin is not None}


def activation(text, target, enabled, case):
    start = text.index('BEGIN_COMPILE ' + target)
    end = text.index('END_COMPILE ' + target, start)
    trace = text[start:end]
    counts = {token: trace.count(token + ' ') for token in ('CCDEFER', 'CCPHI', 'CCPHI_INPUT', 'CCHRP')}
    if enabled and case != 'hot':
        assert counts['CCDEFER'] > 0, (case, counts)
        if case == 'joins':
            assert len(re.findall(r'(?m)^CCDEFER .* loadL=1$', trace)) == 3, counts
            assert counts['CCPHI'] >= 6 and counts['CCPHI_INPUT'] >= 12, counts
            assert len(re.findall(r'(?m)^CCHRP .* keep=1 ', trace)) >= 6, counts
            assert len(re.findall(r'(?m)^CCPHI .* pressure_down=1$', trace)) >= 6, counts
    else:
        assert not any(counts.values()), (case, enabled, counts)
    return counts


def main():
    global DEADLINE
    plan_path = ROOT / 'standalone-plan.json'
    plan = json.loads(plan_path.read_text())
    approval = json.loads((ROOT / 'standalone-approval.json').read_text())
    assert approval['plan_sha256'] == sha(plan_path)
    assert approval['runner_sha256'] == sha(Path(__file__).resolve())
    assert plan['probe_sha256'] == sha(ROOT / 'StandaloneColdCallProbe.java')
    assert plan['total_timing_forks'] == len(plan['schedule']) == 54
    assert len({(r['block'], r['case'], r['variant']) for r in plan['schedule']}) == 54
    assert plan['cases'] == ['cold', 'joins', 'hot']
    for case in plan['cases']:
        orders = [tuple(r['variant'] for r in plan['schedule'] if r['case'] == case and r['block'] == block)
                  for block in range(6)]
        assert set(orders) == set(itertools.permutations(['baseline', 'off', 'on']))
    assert not any('TraceSpilling' in flag or 'VerifyRegisterAllocator' in flag for flag in plan['common_flags'])
    assert plan['controller_cap_seconds'] < plan['job_execution_cap_seconds'] == 3000
    if '--validate-only' in sys.argv:
        print('Frozen plan, source, approval and 54-fork schedule verified')
        return
    assert platform.system() == 'Windows' and platform.machine().lower() in ('amd64', 'x86_64')
    assert os.environ['GITHUB_RUN_ATTEMPT'] == '1', 'No automatic run/job retries are approved'
    DEADLINE = time.monotonic() + plan['controller_cap_seconds']
    OUT.mkdir(exist_ok=False)
    save('execution-start.json', {'utc': utc(), 'run_id': os.environ['GITHUB_RUN_ID'],
         'workflow_sha': os.environ['GITHUB_SHA'], 'plan_sha256': sha(plan_path), 'approval': approval,
         'controller_cap_seconds': plan['controller_cap_seconds'], 'job_cap_seconds': 3000,
         'runner_image': os.environ.get('ImageVersion'), 'platform': platform.platform()})
    source = WORK / 'candidate-source'
    identity, _ = run('candidate-source-identity', ['git', '-C', source, 'rev-parse', 'HEAD'])
    assert identity.strip() == plan['candidate_source']
    changes, _ = run('candidate-source-clean', ['git', '-C', source, 'status', '--porcelain'])
    assert not changes.strip(), changes
    for file, expected in plan['source_sha256'].items():
        assert sha(source / file) == expected, file
    images = {name: download(name, pinned, plan['retained_run_id']) for name, pinned in plan['images'].items()}
    # Match actual recorded compiler/profile fields, in addition to image hashes.
    keys = ('OPENJDK_TARGET_CPU', 'OPENJDK_TARGET_CPU_BITS', 'HOTSPOT_TARGET_CPU', 'HOTSPOT_TARGET_CPU_ARCH',
            'DEBUG_LEVEL', 'JVM_VARIANTS', 'JVM_FEATURES_server', 'TOOLCHAIN_TYPE', 'TOOLCHAIN_VERSION',
            'CC_VERSION_NUMBER', 'CXX_VERSION_NUMBER', 'CFLAGS_JDKLIB', 'CXXFLAGS_JDKLIB', 'CFLAGS_JDKEXE',
            'JVM_CFLAGS', 'JVM_LDFLAGS', 'EXTRA_CFLAGS', 'EXTRA_CXXFLAGS', 'EXTRA_LDFLAGS')
    profiles = {}
    for name in ('baseline-release', 'candidate-release'):
        spec = (images[name] / 'spec.gmk').read_text()
        profiles[name] = {k: re.search(r'^' + re.escape(k) + r'\s*:?=\s*(.*)$', spec, re.M)[1].strip() for k in keys}
    assert profiles['baseline-release'] == profiles['candidate-release']
    save('matched-release-profiles.json', profiles)
    for name, image in images.items():
        java = image / 'jdk/bin/java.exe'
        text, _ = run('flags-' + name + '-default', [java, '-Xlog:os+cpu=info', '-XX:+PrintFlagsFinal', '-version'])
        if name != 'baseline-release':
            assert re.search(r'UseColdCallSpillDeferral\s*=\s*false.*\{C2 product\}.*\{default\}', text)
            for variant in ('off', 'on'):
                flag = '-XX:' + ('+' if variant == 'on' else '-') + 'UseColdCallSpillDeferral'
                text, _ = run('flags-' + name + '-' + variant, [java, flag, '-XX:+PrintFlagsFinal', '-version'])
                assert re.search(r'UseColdCallSpillDeferral\s*=\s*' + str(variant == 'on').lower(), text)
    jtreg = os.environ['JTREG_PATH']
    if re.match(r'^/[A-Za-z]/', jtreg):
        jtreg = jtreg[1] + ':' + jtreg[2:]
    save('jtreg-identity.json', {'jar_sha256': sha(Path(jtreg) / 'lib/jtreg.jar'),
                               'retained_jtreg_run': 39169278668})
    run('jtreg-version', [images['candidate-release'] / 'jdk/bin/java.exe', '-jar', Path(jtreg) / 'lib/jtreg.jar', '-version'])
    tests = ['TestColdCallSpillPlacement', 'TestColdCallDebugHome', 'TestColdCallDerivedPointers', 'TestColdCallSpillPolicy']
    fixture_receipts = []
    for name in ('candidate-fastdebug', 'candidate-release'):
        image = images[name]
        assert (image / 'native/ColdCallSpillPolicy.dll').is_file()
        run('jtreg-' + name, [image / 'jdk/bin/java.exe', '-jar', Path(jtreg) / 'lib/jtreg.jar',
            '-jdk:' + str(image / 'jdk'), '-conc:1', '-verbose:summary', '-retain:all',
            '-nativepath:' + str(image / 'native'), '-w:' + str(OUT / ('work-' + name)),
            '-r:' + str(OUT / ('report-' + name)),
            *[source / 'test/hotspot/jtreg/compiler/regalloc' / (test + '.java') for test in tests]], timeout=600)
        for test in tests:
            jtr = OUT / ('work-' + name) / 'compiler/regalloc' / (test + '.jtr')
            result = jtr.read_text(errors='replace')
            assert re.search(r'(?m)^execStatus=Passed\.', result), (name, test, 'Required fixture did not pass')
            fixture_receipts.append({'image': name, 'test': test, 'jtr': str(jtr.relative_to(OUT)),
                                     'sha256': sha(jtr), 'execStatus': 'Passed'})
    save('repository-tests-pass.json', {'checks': 8, 'tests': tests, 'records': fixture_receipts})
    classes = OUT / 'classes'
    classes.mkdir()
    run('compile-standalone', [images['candidate-release'] / 'jdk/bin/javac.exe', '-d', classes,
        source / 'test/lib/jdk/test/whitebox/WhiteBox.java',
        source / 'test/lib/jdk/test/whitebox/parser/DiagnosticCommand.java', ROOT / 'StandaloneColdCallProbe.java'])
    targets = {'cold': 'testCold', 'joins': 'testJoins', 'hot': 'testHot'}

    def command(image, case, variant, mode, xml):
        flags = [] if variant == 'baseline' else ['-XX:' + ('+' if variant == 'on' else '-') + 'UseColdCallSpillDeferral']
        trace = ['-XX:+TraceSpilling', '-XX:+VerifyRegisterAllocator'] if mode == 'activation' else []
        return [image / 'jdk/bin/java.exe', *plan['common_flags'], *plan['case_extra_flags'].get(case, []),
                *flags, *trace, '-XX:+LogCompilation', '-XX:LogFile=' + str(xml),
                '-Xbootclasspath/a:' + str(classes), '-cp', classes, 'StandaloneColdCallProbe', case, variant, mode]

    activations = []
    for case in plan['cases']:
        for variant in ('off', 'on'):
            stem = 'activation-' + case + '-' + variant
            xml = OUT / (stem + '.xml')
            text, receipt = run(stem, command(images['candidate-fastdebug'], case, variant, 'activation', xml))
            assert 'ACTIVATION_OK case=' + case in text
            counts = activation(text, targets[case], variant == 'on', case)
            activations.append(dict(case=case, variant=variant, trace_counts=counts, **receipt,
                                    **compile_details(xml, targets[case])))
    save('activation-pass.json', {'result': 'PASS', 'records': activations})
    print('Repository correctness and actual standalone fastdebug activation PASS; starting fixed 54-fork schedule', flush=True)
    records = []
    for item in plan['schedule']:
        stem = f"{item['sequence']:03d}-{item['case']}-b{item['block']}-{item['variant']}"
        xml = OUT / (stem + '.xml')
        image = images['baseline-release' if item['variant'] == 'baseline' else 'candidate-release']
        text, receipt = run(stem, command(image, item['case'], item['variant'], 'timing', xml), timeout=30)
        samples = [dict(count=int(m[1]), elapsed_ns=int(m[2]), checksum=int(m[3]), ns_per_op=float(m[4]))
                   for m in re.finditer(r'SAMPLE count=(\d+) elapsed_ns=(\d+) checksum=(-?\d+) ns_per_op=([\d.]+)', text)]
        assert len(samples) == 5 and all(s['count'] > 0 and s['elapsed_ns'] >= 700_000_000 for s in samples)
        match = re.search(r'TIMING_OK case=(\w+) target=(\w+) normal_c2=true boundary_uptime_ms=(\d+) end_uptime_ms=(\d+) compiler_before_ms=(\d+) compiler_measured_ms=(\d+)', text)
        assert match and match[1] == item['case'] and match[2] == targets[item['case']]
        begin, end, before, measured = map(int, match.groups()[2:])
        detail = compile_details(xml, targets[item['case']], begin, end)
        record = dict(item, **receipt, samples=samples, median_ns_per_op=statistics.median(s['ns_per_op'] for s in samples),
                      boundary_uptime_ms=begin, end_uptime_ms=end, compiler_before_ms=before, compiler_measured_ms=measured, **detail)
        records.append(record)
        save('performance-results.json', {'records': records, 'plan_sha256': sha(plan_path)})
        print(stem, record['median_ns_per_op'], flush=True)
    summary = {}
    for case in plan['cases']:
        rows = [r for r in records if r['case'] == case]
        blocks = {b: {r['variant']: r['median_ns_per_op'] for r in rows if r['block'] == b} for b in range(6)}
        summary[case] = {'ns_per_op': {v: spread([r['median_ns_per_op'] for r in rows if r['variant'] == v])
                                     for v in ('baseline', 'off', 'on')},
            'paired_speed_gain_percent': {label: spread([100 * (rates[b] / rates[a] - 1) for rates in blocks.values()])
                for label, a, b in [('on_vs_off', 'on', 'off'), ('on_vs_baseline', 'on', 'baseline'), ('off_vs_baseline', 'off', 'baseline')]}}
    save('performance-summary.json', summary)
    save('complete.json', {'result': 'PASS', 'meaning': 'Execution and correctness gates passed; adoption requires analysis',
                          'utc': utc(), 'repository_checks': 8, 'activation_forks': 6, 'timing_forks': len(records)})
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    try:
        main()
    except BaseException as error:
        if OUT.is_dir():
            save('terminal-failure.json', {'utc': utc(), 'error_type': type(error).__name__, 'reason': str(error)})
        raise
