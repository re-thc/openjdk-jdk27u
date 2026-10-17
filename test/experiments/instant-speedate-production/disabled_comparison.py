#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""UNEXECUTED fixed runtime-disabled comparison; see RUNTIME_DISABLED_AUDIT.md.

This controller never configures or builds a JDK. It consumes three previously
built normal images and fresh successful build/test receipts from the enclosing
audited job. There are exactly 12 compiler-diagnostic and 24 timing JVMs; an
early stop never adds replacement samples. All comparison JVMs set the startup
property to false. Separate positive native/bootstrap checks are prerequisites,
not timing samples. PASS releases only this canonical dispatch gate.
"""
import argparse
import csv
import difflib
import json
import math
import os
from pathlib import Path
import platform
import re
import statistics
import sys
import time
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True
from deadline import (TOTAL_SECONDS, LaunchHold, execute, fingerprint, image_files,
                      validate_launch_audit, validate_provenance)

PREVIOUS = '779753e390e43508372ac860fdf944a801c869c8'
VARIANTS = ('previous', 'enabled', 'configured-off')
ROUTES = tuple((image, call) for image in VARIANTS for call in ('public', 'direct'))
RELATIVE = Path('test/experiments/instant-speedate-production')
ORACLE_DIGEST = 'a0c9818f610a52c4a5429fe59d286443efec207525cd6f1a64876f2bdd45ed8a'
ORACLE_NAMES = {'happy', 'mostly', 'mixed', 'fallback', 'syntax', 'calendar', 'custom'}
HAPPY = (
    '2026-10-16T12:34:56Z', '2000-02-29T01:02:03.123456Z',
    '1969-12-31T23:59:59.999999Z', '0000-02-29T12:34:56.000001Z',
    '9999-12-31T23:59:59.9Z', '1970-01-01T00:00:00.01Z',
    '1900-01-01T01:01:01.123Z', '2400-02-29T12:34:56.12345Z')
LOOP_CALL = 'Instant.parse(values[i%values.length])'
DIRECT_CALL = 'DateTimeFormatter.ISO_INSTANT.parse(values[i%values.length],Instant::from)'
BAD_JVM = re.compile(r'(?m)^(?:Exception in thread "[^"]*" |Caused by: )?'
                     r'(?:java\.lang\.)?AssertionError(?:[:\s]|$)|'
                     r'WARNING in native method|FATAL ERROR in native method|'
                     r'JNI DETECTED ERROR|A fatal error has been detected by the Java Runtime Environment')
NATIVE_LOAD = re.compile(r'Loaded library [^\n]*instant\.(?:so|dylib|dll)')


class CorrectnessFailure(RuntimeError):
    pass


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def correct(condition, message):
    if not condition:
        raise CorrectnessFailure(message)


def atomic_json(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')
    temporary.replace(path)


class Comparison:
    def __init__(self, args):
        self.a = args
        self.root = args.root.resolve()
        self.repo = args.repo.resolve()
        self.here = Path(__file__).resolve().parent
        self.out = self.root / 'disabled-comparison'
        self.out.mkdir(exist_ok=False)
        self.ev = self.out / 'evidence'
        self.ev.mkdir()
        self.deadline = args.started + TOTAL_SECONDS
        self.homes = {name: self.root / name / 'build/qualification/images/jdk' for name in VARIANTS}
        self.rows, self.events, self.comparisons = [], [], []
        self.findings = {'NOGO': [], 'HOLD': [], 'INCONCLUSIVE': []}
        self.completed = False
        self.oracles = None
        self.identities = {}
        self.provenance_identity = self.launch_identity = None
        self.evidence = {}
        self.evaluated = set()
        self.early_evaluated = set()
        self.checkpoint()

    def retain(self, path):
        path = Path(path)
        if path.is_file():
            identity = fingerprint(path)
            self.evidence[identity['path']] = identity

    def status(self):
        for verdict in ('NOGO', 'HOLD', 'INCONCLUSIVE'):
            if self.findings[verdict]:
                return verdict
        return 'PASS' if self.completed else 'INCONCLUSIVE'

    def checkpoint(self):
        # Persist the strongest verdict first; later errors cannot erase it.
        report = dict(schema=1, status=self.status(), candidate_sha=self.a.candidate_sha,
                      previous_sha=PREVIOUS, completed=self.completed,
                      scope='canonical-eight/G1/runtime-disabled/Linux-only',
                      started_monotonic=self.a.started, total_seconds=TOTAL_SECONDS,
                      provenance=self.provenance_identity, launch_audit=self.launch_identity,
                      findings=self.findings, comparisons=self.comparisons,
                      events=self.events, evidence_files=list(self.evidence.values()))
        atomic_json(self.out / 'causal-decision.json', report)
        for name, data in (('blocks.csv', self.rows), ('processes.csv', self.summaries())):
            if data:
                path = self.ev / name
                temporary = path.with_suffix('.tmp')
                with temporary.open('w', newline='') as stream:
                    writer = csv.DictWriter(stream, fieldnames=list(data[0]), lineterminator='\n')
                    writer.writeheader()
                    writer.writerows(data)
                temporary.replace(path)
        atomic_json(self.ev / 'events.json', self.events)
        atomic_json(self.ev / 'comparisons.json', self.comparisons)

    def finding(self, verdict, message):
        if message not in self.findings[verdict]:
            self.findings[verdict].append(message)
        self.checkpoint()

    def invoke(self, name, command, timeout=120, cwd=None, compiler=False):
        require(name not in [event['name'] for event in self.events], 'duplicate command: ' + name)
        event = dict(name=name, command=[str(item) for item in command], status='started')
        self.events.append(event)
        self.checkpoint()
        print(name, flush=True)
        log = self.ev / (name + '.log')
        try:
            result = execute(command, log, self.deadline, timeout, cwd=cwd or self.repo,
                             provenance=self.a.provenance if compiler else None,
                             launch_audit=self.a.launch_audit, started=self.a.started)
            event.update(status='completed', wall_ns=result['wall_ns'])
            correct(not BAD_JVM.search(result['stdout']), name + ': assertion/JNI/JVM failure')
            return result['stdout']
        except BaseException:
            event['status'] = 'failed'
            text = log.read_text(errors='replace') if log.is_file() else ''
            if BAD_JVM.search(text):
                self.finding('NOGO', name + ': retained assertion/JNI/JVM failure')
            raise
        finally:
            self.retain(log)
            self.retain(log.with_suffix(log.suffix + '.receipt.json'))
            self.checkpoint()

    def java(self, name, image, call, action, compact, flags=(), disabled=True, diagnostic=False):
        command = [self.homes[image] / 'bin/java', '-Xms256m', '-Xmx256m',
                   '-XX:ActiveProcessorCount=2', '-XX:+UseG1GC', '-Xbatch',
                   '-XX:+CompactStrings' if compact else '-XX:-CompactStrings']
        if disabled:
            command.append('-Djdk.time.instantSpeedate=false')
        command += list(flags)
        if diagnostic:
            xml = self.ev / (name + '.xml')
            command += ['-XX:+UnlockDiagnosticVMOptions', '-XX:+LogCompilation',
                        '-XX:LogFile=' + str(xml), '-XX:+PrintCompilation', '-XX:+PrintInlining',
                        '-XX:+PrintCommandLineFlags', '-XX:+PrintFlagsFinal',
                        '-Xlog:class+load=info,library=info']
        command += ['-cp', self.out / ('classes-' + call)] + list(action)
        return self.invoke(name, command)

    def preflight(self):
        require(platform.system() == 'Linux', 'this staged comparison is Linux-only')
        require(re.fullmatch('[0-9a-f]{40}', self.a.candidate_sha) is not None,
                'candidate must be a complete Git SHA')
        require(self.a.candidate_sha != PREVIOUS, 'candidate is the pre-correction revision')
        require(0 <= time.monotonic() - self.a.started < TOTAL_SECONDS, 'invalid/expired packet clock')
        validate_launch_audit(self.a.launch_audit, self.a.started, self.a.candidate_sha, self.root)
        self.manifest = validate_provenance(self.a.provenance, root=self.root,
            candidate_sha=self.a.candidate_sha, started=self.a.started, variants=VARIANTS)
        self.provenance_identity = fingerprint(self.a.provenance)
        self.launch_identity = fingerprint(self.a.launch_audit)
        for path in (self.a.provenance, self.a.launch_audit):
            self.retain(path)
        for key in ('JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS', 'CLASSPATH',
                    'LD_PRELOAD', 'DYLD_INSERT_LIBRARIES'):
            require(not os.environ.get(key), key + ' must be empty')
        require(self.invoke('packet-head', ['git', '-C', self.repo, 'rev-parse', 'HEAD']).strip()
                == self.a.candidate_sha, 'packet source is not the frozen candidate')
        require(not self.invoke('packet-status', ['git', '-C', self.repo, 'status', '--porcelain',
                    '--untracked-files=all']).strip(), 'packet source is dirty')
        for name in ('disabled_comparison.py', 'deadline.py', 'QualificationProbe.java',
                     'ProductionProbe.java', 'OnLoad.c', 'RUNTIME_DISABLED_AUDIT.md', 'QUALIFICATION.md',
                     'launch_qualification.sh', 'job_entry.py', 'build_and_qualify.sh',
                     'qualification_matrix.py', 'prepare_java_control.py'):
            source = self.here / name
            require(source.read_bytes() == (self.repo / RELATIVE / name).read_bytes(),
                    'helper differs from frozen packet: ' + name)
            require(source.read_bytes() == (self.root / 'enabled' / RELATIVE / name).read_bytes(),
                    'helper differs from frozen candidate: ' + name)
            self.retain(source)
        for image in VARIANTS:
            source = self.root / image
            expected = PREVIOUS if image == 'previous' else self.a.candidate_sha
            require(self.manifest['expected_source_revisions'][image] == expected,
                    'wrong manifest source revision: ' + image)
            actual = self.invoke('source-head-' + image, ['git', '-C', source, 'rev-parse', 'HEAD']).strip()
            require(actual == expected, 'wrong normal-image source: ' + image)
            require(not self.invoke('source-status-' + image, ['git', '-C', source, 'status',
                    '--porcelain', '--untracked-files=all']).strip(), 'dirty normal-image source: ' + image)
            self.identities[image] = image_files(source)
            for item in self.identities[image].values():
                self.evidence[item['path']] = item
            self.retain(self.homes[image] / 'bin/javac')
        changed = self.invoke('production-source-diff', ['git', '-C', self.repo, 'diff', '--name-only',
            PREVIOUS, self.a.candidate_sha, '--', 'src', 'make']).splitlines()
        require(changed == ['src/java.base/share/classes/java/time/InstantParser.java'],
                'production delta extends beyond the intended parser correction')
        for image in ('previous', 'enabled'):
            require((self.homes[image] / 'lib/libinstant.so').is_file(), image + ': missing backend')
        for name in ('lib/libinstant.so', 'legal/java.base/speedate.md',
                     'legal/java.base/COPYRIGHT-library.html'):
            require(not (self.homes['configured-off'] / name).exists(),
                    'configured-off image contains backend/notice: ' + name)
        for name in ('legal/java.base/speedate.md', 'legal/java.base/COPYRIGHT-library.html'):
            require((self.homes['enabled'] / name).is_file(), 'enabled notice missing: ' + name)
        require(self.manifest['configurations']['previous']['ENABLE_INSTANT_SPEEDATE'] == 'true',
                'pre-correction image was configured off')
        self.validate_receipts()
        atomic_json(self.ev / 'source-image-tool-identities.json', dict(
            images=self.identities, sources=self.manifest['expected_source_revisions'],
            configurations=self.manifest['configurations'], tools=self.manifest['files'],
            tool_environment=self.manifest['tool_environment']))
        self.retain(self.ev / 'source-image-tool-identities.json')
        self.checkpoint()

    def validate_receipts(self):
        ordinary = ' '.join(['test/jdk/java/time/test/java/time/TestInstant.java',
            'test/jdk/java/time/tck/java/time/TCKInstant.java',
            'test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java'])
        candidate_tests = ('test/jdk/java/time/test/java/time/TestInstantSpeedate.java ' + ordinary
            + ' test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java')
        options = ['TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m',
                   'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0']
        contracts = {f'images-{v}': (v, ['make', 'CONF=qualification', 'JOBS=4', 'images'], 'make')
                     for v in VARIANTS}
        for image in ('enabled', 'configured-off'):
            contracts['junit-' + image] = (image, ['make', 'CONF=qualification', 'JOBS=1',
                'run-test', 'TEST=' + candidate_tests] + options, 'make')
        rust = self.manifest['rust']
        contracts['rust-tests'] = ('enabled', ['env', '-u', 'CARGO_ENCODED_RUSTFLAGS',
            'CARGO_BUILD_JOBS=2', 'RUSTC=' + rust['rustc'],
            'RUSTFLAGS=-C target-cpu=' + rust['cpu'] + ' -C panic=unwind', rust['cargo'],
            'test', '--frozen', '--manifest-path', 'src/java.base/share/native/libinstant/rust/Cargo.toml',
            '--target', rust['target'], '--target-dir', str(self.root / 'rust-tests')], 'env')
        for name, (image, command, tool) in contracts.items():
            path = self.root / 'logs' / (name + '.log.receipt.json')
            receipt = json.loads(path.read_text())
            require(receipt.get('schema') == 2 and receipt['exit_status'] == 0
                and self.a.started <= self.manifest['created_monotonic'] <= receipt['started_monotonic']
                    <= time.monotonic()
                and receipt['packet_started_monotonic'] == self.a.started
                and receipt['deadline'] <= self.deadline
                and receipt['timeout_seconds'] == (1800 if name.startswith('images-') else 600),
                name + ': missing fresh successful normal build/check receipt')
            require(Path(receipt['cwd']).resolve() == (self.root / image).resolve()
                and receipt['command'] == command, name + ': wrong source or command')
            require(receipt['provenance'] == self.provenance_identity
                and receipt['launch_audit'] == self.launch_identity, name + ': wrong provenance/audit')
            pinned = self.manifest['files']['tool:' + tool]
            require(all(receipt['executable'][key] == pinned[key] for key in ('resolved', 'sha256')),
                    name + ': command executable differs from pinned tool')
            require(receipt['capture_helper']['sha256'] == fingerprint(self.here / 'deadline.py')['sha256']
                and receipt['cargo_encoded_rustflags'] is None, name + ': altered capture helper/Cargo flags')
            if name.startswith(('images-', 'junit-')):
                require(receipt['image_after'] == self.identities[image], name + ': image changed')
                if name.startswith('junit-'):
                    require(receipt['image_before'] == self.identities[image], name + ': tested another image')
            self.retain(path)
            self.retain(path.with_name(name + '.log'))

    def prepare_fixtures(self):
        source = (self.here / 'QualificationProbe.java').read_text()
        match = re.search(r'static final String\[\] HAPPY = \{(.*?)\n    \};', source, re.S)
        require(match is not None and tuple(re.findall(r'"([^"\\]*)"', match.group(1))) == HAPPY,
                'canonical payload differs from the frozen eight literals')
        require(source.count(LOOP_CALL) == 1, 'public-loop substitution is ambiguous')
        require('for(int i=0;i<64;i++)loop(values,125000);' in source
            and source.count('loop(values,500000)') == 2 and 'new long[6]' in source,
            'fixture warmup/block counts changed')
        direct = source.replace(LOOP_CALL, DIRECT_CALL, 1)
        for call, body in (('public', source), ('direct', direct)):
            directory = self.out / ('source-' + call)
            directory.mkdir()
            path = directory / 'QualificationProbe.java'
            path.write_text(body)
            self.retain(path)
            classes = self.out / ('classes-' + call)
            classes.mkdir()
            self.invoke('compile-' + call, [self.homes['enabled'] / 'bin/javac',
                '-d', classes, path], compiler=True)
            for compiled in classes.rglob('*.class'):
                self.retain(compiled)
            require((classes / 'QualificationProbe.class').is_file(), 'missing compiled fixture')
        diff = ''.join(difflib.unified_diff(source.splitlines(keepends=True), direct.splitlines(keepends=True),
            fromfile='public/QualificationProbe.java', tofile='direct/QualificationProbe.java'))
        path = self.ev / 'public-direct.patch'
        path.write_text(diff)
        self.retain(path)
        (self.out / 'classes-production').mkdir()
        self.invoke('compile-production', [self.homes['enabled'] / 'bin/javac', '--add-exports',
            'java.base/jdk.internal.misc=ALL-UNNAMED', '-d', self.out / 'classes-production',
            self.here / 'ProductionProbe.java'], compiler=True)
        for compiled in (self.out / 'classes-production').rglob('*.class'):
            self.retain(compiled)
        self.checkpoint()

    def correctness(self):
        opens = ['--add-opens', 'java.base/java.time=ALL-UNNAMED']
        # Oracle computation is in separate JVMs, before either diagnostic/timing
        # cohort. ISO_INSTANT supplies checksums, including pre-epoch fractions.
        for compact in (True, False):
            for image, call in ROUTES:
                name = f'oracle-{image}-{call}-{compact}'
                text = self.java(name, image, call, ['QualificationProbe', 'audit'], compact,
                                 ['-Xcheck:jni', '-Xlog:library=info'])
                entries = [line.split(',') for line in text.splitlines() if line.startswith('oracle,')]
                correct(len(entries) == 7 and {entry[1] for entry in entries} == ORACLE_NAMES
                    and all(len(entry) == 5 and entry[3:] == ['0', '0'] for entry in entries),
                    name + ': incomplete nonnative oracle audit')
                current = {entry[1]: int(entry[2]) for entry in entries}
                if self.oracles is not None:
                    correct(current == self.oracles, name + ': independent oracle checksums differ')
                self.oracles = current
                correct(not NATIVE_LOAD.search(text), name + ': property-false route loaded backend')
            for image in VARIANTS:
                self.production_test(f'production-off-{image}-{compact}', image, compact, opens, False)
            self.production_test(f'production-native-{compact}', 'enabled', compact, opens, True)
        atomic_json(self.ev / 'independent-oracles.json', self.oracles)
        self.retain(self.ev / 'independent-oracles.json')
        # These positive checks deliberately do not set propertyfalse. Their
        # native route proof is separate from the runtime-disabled comparison.
        cc = self.manifest['configurations']['enabled']['CC']
        onload = self.out / 'libinstant_onload.so'
        self.invoke('compile-onload', [cc, '-O2', '-shared', '-fPIC',
            '-I' + str(self.homes['enabled'] / 'include'),
            '-I' + str(self.homes['enabled'] / 'include/linux'), self.here / 'OnLoad.c', '-o', onload],
            compiler=True)
        self.retain(onload)
        for compact in (True, False):
            text = self.java(f'preboot-{compact}', 'enabled', 'production', ['ProductionProbe', 'bootstrap'],
                compact, opens + ['--add-exports', 'java.base/jdk.internal.misc=ALL-UNNAMED',
                    '-Xlog:library=info', '-Djava.system.class.loader=ProductionProbe$EarlyLoader', '-Xcheck:jni'],
                disabled=False)
            loads = list(NATIVE_LOAD.finditer(text))
            correct('bootstrap_checked=preboot-fallback,postboot-native' in text and len(loads) == 1
                and 'postboot_parse_begin' in text and text.index('postboot_parse_begin') < loads[0].start(),
                'preboot/postboot route proof failed')
            text = self.java(f'cold-race-{compact}', 'enabled', 'production', ['ProductionProbe', 'race'], compact,
                opens + ['-Xlog:library=info', '-Xcheck:jni'], disabled=False)
            correct('cold_race_checked=8000' in text and len(NATIVE_LOAD.findall(text)) == 1,
                    'cold native-loading race failed')
            text = self.java(f'onload-race-{compact}', 'enabled', 'production', ['ProductionProbe', 'onload'], compact,
                opens + ['--add-opens', 'java.base/jdk.internal.loader=ALL-UNNAMED',
                    '--enable-native-access=ALL-UNNAMED', '-Xcheck:jni',
                    '-Dprobe.onload.library=' + str(onload.resolve()),
                    '-Dprobe.parser.library=' + str((self.homes['enabled'] / 'lib/libinstant.so').resolve())],
                disabled=False)
            correct('onload_race_checked=callback-fallback,post-load-native' in text,
                    'JNI_OnLoad callback/loading race failed')

    def production_test(self, name, image, compact, opens, native):
        flags = opens + ['-Xcheck:jni', '-Xlog:library=info'] + (['-Dprobe.native=true'] if native else [])
        text = self.java(name, image, 'production', ['ProductionProbe', 'test'], compact, flags, disabled=not native)
        correct('differential_checked=100308' in text and 'corpus_sha256=' + ORACLE_DIGEST in text,
                name + ': full differential oracle mismatch')
        if native:
            correct('systematic_native_hits=49680' in text
                and 'native_coverage=hits,misses,epoch-floor' in text, name + ': native route unproved')
        else:
            correct(not NATIVE_LOAD.search(text), name + ': disabled route loaded backend')

    def blocks(self, text, name, image, call, compact, fork, diagnostic):
        selected = []
        # Reject an interleaved/truncated report rather than reconstructing it or
        # relaunching a JVM. The raw compiler output and XML remain evidence.
        for line in text.splitlines():
            if not line.startswith('block,'):
                continue
            fields = line.split(',')
            require(len(fields) == 8 and all(re.fullmatch(r'-?\d+', field) for field in fields[1:]),
                    name + ': ambiguous/interleaved block report')
            index, ns, allocated, before, after, gc, checksum = map(int, fields[1:])
            selected.append(dict(phase='diagnostic' if diagnostic else 'timing', image=image, call=call,
                compact=compact, fork=fork, block=index, ns_total=ns, allocated_total=allocated,
                ns=ns / 500000, bytes=allocated / 500000,
                compile_before=before, compile_after=after, gc_ms=gc, checksum=checksum))
        # Persist all complete rows, even from a cohort rejected below.
        self.rows.extend(selected)
        self.checkpoint()
        require([row['block'] for row in selected] == list(range(6)), name + ': missing/duplicate block')
        correct(all(row['checksum'] == self.oracles['happy'] for row in selected), name + ': wrong checksum')
        require(all(math.isfinite(row['ns']) and math.isfinite(row['bytes']) and row['bytes'] >= 0
            and row['compile_before'] >= 0 and row['compile_after'] >= row['compile_before']
            and row['gc_ms'] >= 0 and (row['ns_total'] == 0 if diagnostic else row['ns_total'] > 0)
            for row in selected), name + ': invalid counters')
        require(max(row['bytes'] for row in selected) - min(row['bytes'] for row in selected) <= 1,
                name + ': allocation spread exceeds1B/op')
        require(selected[0]['compile_before'] == selected[-1]['compile_after']
            and all(left['compile_after'] <= right['compile_before']
                    for left, right in zip(selected, selected[1:])),
            name + ': compiler counter changed during blocks/interblock gaps')
        if not diagnostic:
            values = [row['ns'] for row in selected]
            require(max(values) / min(values) <= 1.10, name + ': timing max/min exceeds1.10')
            require(0.95 <= statistics.median(values[3:]) / statistics.median(values[:3]) <= 1.05,
                    name + ': last-three/first-three median outside5%')
            require(all(row['gc_ms'] <= 0.10 * row['ns_total'] / 1e6 for row in selected),
                    name + ': GC time exceeds10%')

    def compiler_proof(self, name):
        path = self.ev / (name + '.xml')
        self.retain(path)
        self.checkpoint()
        root = ET.parse(path).getroot()
        methods = [dict(node.attrib) for node in root.iter('nmethod')
            if node.attrib.get('method') == 'QualificationProbe loop ([Ljava/lang/CharSequence;I)J']
        normal = [method for method in methods if method.get('compiler') == 'c2'
                  and method.get('level', '4') == '4' and method.get('compile_kind') != 'osr']
        osr = [method for method in methods if method.get('compile_kind') == 'osr']
        invalidated = {node.attrib.get('compile_id') for node in root.iter()
            if node.tag in ('deoptimized', 'uncommon_trap', 'make_not_entrant')}
        surviving = [method for method in normal if method.get('compile_id') not in invalidated]
        summary = dict(loop_nmethods=methods, c2_normal_entry=normal, c2_normal_entry_surviving=surviving, osr=osr,
            note='OSR and normal-entry records are distinct; no generated-code identity claim',
            deoptimization_records=[dict(tag=node.tag, **node.attrib) for node in root.iter()
                if node.tag in ('deoptimized', 'uncommon_trap', 'make_not_entrant')])
        output = self.ev / (name + '-compiler.json')
        atomic_json(output, summary)
        self.retain(output)
        self.checkpoint()
        require(normal, name + ': no C2 normal-entry QualificationProbe.loop compilation')
        require(surviving, name + ': all C2 normal-entry loop compilations invalidated/deoptimized')

    def summaries(self):
        result = []
        keys = dict.fromkeys((row['phase'], row['image'], row['call'], row['compact'], row['fork'])
                             for row in self.rows)
        for phase, image, call, compact, fork in keys:
            data = [row for row in self.rows if (row['phase'], row['image'], row['call'], row['compact'], row['fork'])
                    == (phase, image, call, compact, fork)]
            result.append(dict(phase=phase, image=image, call=call, compact=compact, fork=fork,
                blocks=len(data), median_ns=statistics.median(row['ns'] for row in data),
                min_ns=min(row['ns'] for row in data), max_ns=max(row['ns'] for row in data),
                median_bytes=statistics.median(row['bytes'] for row in data)))
        return result

    def median(self, image, call, compact, fork, field='ns', diagnostic=False):
        data = [row[field] for row in self.rows if (row['phase'], row['image'], row['call'], row['compact'], row['fork'])
            == ('diagnostic' if diagnostic else 'timing', image, call, compact, fork)]
        require(len(data) == 6, 'comparison depends on an incomplete process')
        return statistics.median(data)

    def evaluate(self, compact):
        if compact in self.evaluated:
            return
        if not all(sum(row['phase'] == 'timing' and (row['image'], row['call'], row['compact'], row['fork'])
                       == (image, call, compact, fork) for row in self.rows) == 6
                   for image, call in ROUTES for fork in (0, 1)):
            return
        self.evaluated.add(compact)
        inconclusive = []

        def compare(label, numerator, denominator, policy):
            ratios = [self.median(*numerator, compact, fork) / self.median(*denominator, compact, fork)
                      for fork in (0, 1)]
            positive = [ratio > 1 for ratio in ratios]
            negative = [ratio < 1 for ratio in ratios]
            verdict, reason = 'PASS', ''
            if policy == 'record':
                verdict = 'OBSERVATION'
            elif policy == 'improvement':
                if all(positive):
                    verdict, reason = 'HOLD', 'corrected public is slower in both forks'
                elif not all(negative):
                    verdict, reason = 'INCONCLUSIVE', 'strict public improvement is not replicated'
            elif policy == 'protected':
                if all(positive):
                    verdict, reason = 'HOLD', 'positive loss in both forks, including losses below3%'
                elif any(positive) or not all(negative):
                    verdict, reason = 'INCONCLUSIVE', 'loss directions disagree or exact equality is unresolved'
            elif policy == 'unchanged':
                if any(abs(ratio - 1) > 0.03 for ratio in ratios):
                    verdict, reason = 'INCONCLUSIVE', 'unchanged control shifts by more than3%'
                elif all(positive):
                    verdict, reason = 'INCONCLUSIVE', 'unchanged control consistently loses, even below3%'
                elif any(positive) or not all(negative):
                    verdict, reason = 'INCONCLUSIVE', 'unchanged control signs disagree/equality unresolved'
            entry = dict(name=label, compact=compact, numerator=list(numerator), denominator=list(denominator),
                         ratios=ratios, verdict=verdict, reason=reason)
            self.comparisons.append(entry)
            if verdict in self.findings:
                self.finding(verdict, f'{label}/CompactStrings={compact}: {reason}; ratios={ratios}')
            if verdict == 'INCONCLUSIVE':
                inconclusive.append(label)
            self.checkpoint()
            return ratios

        # Establish any replicated candidate loss before checking noisier controls.
        compare('corrected-public/configured-off-public', ('enabled', 'public'), ('configured-off', 'public'), 'protected')
        public_change = compare('corrected-public/previous-public', ('enabled', 'public'), ('previous', 'public'), 'improvement')
        compare('previous-public/previous-direct', ('previous', 'public'), ('previous', 'direct'), 'record')
        compare('corrected-public/corrected-direct', ('enabled', 'public'), ('enabled', 'direct'), 'protected')
        off_calls = compare('configured-off-public/configured-off-direct', ('configured-off', 'public'), ('configured-off', 'direct'), 'unchanged')
        direct_change = compare('corrected-direct/previous-direct', ('enabled', 'direct'), ('previous', 'direct'), 'unchanged')
        direct_images = compare('corrected-direct/configured-off-direct', ('enabled', 'direct'), ('configured-off', 'direct'), 'unchanged')
        normalized = [public / direct for public, direct in zip(public_change, direct_change)]
        verdict = 'PASS' if all(ratio < 1 for ratio in normalized) else 'INCONCLUSIVE'
        self.comparisons.append(dict(name='public-change/direct-control-change', compact=compact,
            ratios=normalized, verdict=verdict,
            reason='require public improvement beyond the paired direct-control change'))
        if verdict != 'PASS':
            self.finding(verdict, f'CompactStrings={compact}: public-only reduction unresolved; ratios={normalized}')
            inconclusive.append('public-only reduction')
        # A point improvement buried inside observed unchanged-work movement
        # cannot establish dispatch removal. This is a predeclared conservative
        # control envelope, not a confidence interval or estimated noise model.
        envelope = [max(abs(control[fork] - 1) for control in (off_calls, direct_change, direct_images))
                    for fork in (0, 1)]
        gains = [1 - ratio for ratio in public_change]
        verdict = 'PASS' if all(gain > bound for gain, bound in zip(gains, envelope)) else 'INCONCLUSIVE'
        self.comparisons.append(dict(name='public-gain/outside-unchanged-control-movement', compact=compact,
            public_gains=gains, control_envelope=envelope, verdict=verdict,
            reason='each public gain must exceed the largest absolute unchanged-control movement in that fork'))
        if verdict != 'PASS':
            self.finding(verdict, f'CompactStrings={compact}: public gain lies inside observed control movement; '
                f'gains={gains}; envelope={envelope}')
            inconclusive.append('control-movement envelope')
        allocations = [self.median(image, call, compact, fork, 'bytes')
                       for image, call in ROUTES for fork in (0, 1)]
        if max(allocations) - min(allocations) > 1:
            self.finding('INCONCLUSIVE', f'CompactStrings={compact}: equal-work allocation controls differ >1B/op')
            inconclusive.append('allocation control')
        self.checkpoint()
        require(not inconclusive, 'comparison controls are inconclusive; no further samples: ' + ', '.join(inconclusive))

    def retain_ready_protected_losses(self, compact):
        # In reverse order these comparisons become known before the previous
        # image's second fork. Preserve a replicated loss even if that later JVM
        # times out. Only complete, already validated six-block processes count.
        for label, numerator, denominator in (
                ('corrected-public/configured-off-public', ('enabled', 'public'), ('configured-off', 'public')),
                ('corrected-public/corrected-direct', ('enabled', 'public'), ('enabled', 'direct'))):
            key = (label, compact)
            if key in self.early_evaluated:
                continue
            if not all(sum(row['phase'] == 'timing'
                           and (row['image'], row['call'], row['compact'], row['fork'])
                               == (image, call, compact, fork) for row in self.rows) == 6
                       for image, call in (numerator, denominator) for fork in (0, 1)):
                continue
            self.early_evaluated.add(key)
            ratios = [self.median(*numerator, compact, fork) / self.median(*denominator, compact, fork)
                      for fork in (0, 1)]
            if all(ratio > 1 for ratio in ratios):
                self.finding('HOLD', f'{label}/CompactStrings={compact}: positive loss in both forks, '
                    f'including losses below3%; ratios={ratios}')

    def run(self):
        self.preflight()
        self.prepare_fixtures()
        self.correctness()
        # Compiler cohorts precede every throughput cohort and never contribute ns.
        for compact in (True, False):
            for image, call in ROUTES:
                name = f'diagnostic-{image}-{call}-{compact}'
                try:
                    text = self.java(name, image, call, ['QualificationProbe', 'diagnostic', 'happy'],
                                     compact, diagnostic=True)
                    correct(not NATIVE_LOAD.search(text), name + ': property-false route loaded backend')
                    self.blocks(text, name, image, call, compact, -1, True)
                    self.compiler_proof(name)
                finally:
                    self.retain(self.ev / (name + '.xml'))
                    self.checkpoint()
        for compact in (True, False):
            for fork in (0, 1):
                order = ROUTES if fork == 0 else tuple(reversed(ROUTES))
                for image, call in order:
                    name = f'timing-{image}-{call}-{compact}-{fork}'
                    text = self.java(name, image, call, ['QualificationProbe', 'bench', 'happy'], compact)
                    self.blocks(text, name, image, call, compact, fork, False)
                    self.retain_ready_protected_losses(compact)
                    require(abs(self.median(image, call, compact, fork, 'bytes')
                                - self.median(image, call, compact, -1, 'bytes', True)) <= 1,
                            name + ': diagnostic/timing allocation control differs >1B/op')
                    self.evaluate(compact)
        require(sum(event['name'].startswith('diagnostic-') and event['status'] == 'completed'
                    for event in self.events) == 12, 'diagnostic cohort incomplete')
        require(sum(event['name'].startswith('timing-') and event['status'] == 'completed'
                    for event in self.events) == 24, 'timing cohort incomplete')
        require(sum(row['phase'] == 'timing' for row in self.rows) == 144, 'missing timing blocks')
        validate_provenance(self.a.provenance, root=self.root, candidate_sha=self.a.candidate_sha,
                            started=self.a.started, variants=VARIANTS)
        validate_launch_audit(self.a.launch_audit, self.a.started, self.a.candidate_sha, self.root)
        for image in VARIANTS:
            require(image_files(self.root / image) == self.identities[image], image + ': image mutated during audit')
            require(self.invoke('final-head-' + image, ['git', '-C', self.root / image, 'rev-parse', 'HEAD']).strip()
                == (PREVIOUS if image == 'previous' else self.a.candidate_sha), 'source revision changed')
            require(not self.invoke('final-status-' + image, ['git', '-C', self.root / image, 'status',
                '--porcelain', '--untracked-files=all']).strip(), 'source checkout changed')
        self.checkpoint()
        # CSV/report inventories are finalized only once; decision itself is not
        # self-hashed. Every delivered evidence hash must remain valid afterward.
        for path in self.ev.rglob('*'):
            self.retain(path)
        for identity in list(self.evidence.values()):
            require(fingerprint(identity['path']) == identity, 'retained evidence changed: ' + identity['path'])
        require(time.monotonic() < self.deadline, 'packet clock expired during final identity checks')
        self.completed = True
        self.checkpoint()

    def finalize(self):
        # Bind partial evidence too. A rejected/incomplete cohort is a retained
        # result, and no future controller may treat its directory as reusable.
        self.checkpoint()
        for path in self.ev.rglob('*'):
            self.retain(path)
        self.checkpoint()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for field in ('repo', 'root', 'provenance', 'launch-audit'):
        parser.add_argument('--' + field, type=Path, required=True)
    parser.add_argument('--candidate-sha', required=True)
    parser.add_argument('--started', type=float, required=True)
    args = parser.parse_args()
    comparison = Comparison(args)
    try:
        comparison.run()
    except CorrectnessFailure as error:
        comparison.finding('NOGO', str(error))
    except LaunchHold as error:
        comparison.finding('HOLD', 'audited launch/provenance prerequisite failed: ' + str(error))
    except KeyboardInterrupt:
        comparison.finding('INCONCLUSIVE', 'interrupted; retained established NOGO/HOLD takes precedence')
    except Exception as error:
        comparison.finding('INCONCLUSIVE', type(error).__name__ + ': ' + str(error))
    finally:
        comparison.finalize()
    print(comparison.out / 'causal-decision.json', flush=True)
    return 0 if comparison.status() == 'PASS' else 1


if __name__ == '__main__':
    sys.exit(main())
