#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Source-based, sequential qualification. No workload runs without --execute.

No observer/perf/PMU, downloads, CI, installation, PR creation, or old controllers.
This new orchestrator has not yet been runtime-qualified; preserve every failure.
"""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import re
import resource
import selectors
import shlex
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import xml.etree.ElementTree as ET

sys.dont_write_bytecode = True  # Reviewed-source admission must not dirty its own checkout.

from process_cleanup import (ChildScope, LinuxProcesses, cleanup_errors,
                             enable_subreaper, require_no_children)
from nmt_other import check_accounting, parse_other_snapshot
from storage_guard import StorageGuard
from cancellation import Cancellation
from continuation import load as load_continuation, match_arguments, verify_claim, claim, git as verification_git
from deadline import FixedCutoff, UTC_CUTOFF, utc
from toolchain_inputs import capture as capture_toolchain, verify as verify_toolchain, covers as toolchain_covers
import staging

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
BASE = '89885a6288e7aaabd01678a704a586272c0f96e3'
CANDIDATE = 'f03c433e6846632173209a2d85ca471c6ae6aa22'
GCS = ['Serial', 'G1', 'Z']
METHODS = ['org.openjdk.bench.vm.gc.Alloc.testSmallObject',
           'org.openjdk.bench.memory.VerifiedJavac.testCompile',
           'org.openjdk.bench.java.lang.ThreadStartJoin.test',
           'org.openjdk.bench.memory.VerifiedFileChannelRead.test',
           'org.openjdk.bench.memory.VerifiedFileChannelWrite.test']
SOURCES = ['org/openjdk/bench/vm/gc/Alloc.java',
           'org/openjdk/bench/java/lang/ThreadStartJoin.java']
TESTS = ['test/hotspot/jtreg/gc/TestCodeCacheUnload.java#serial',
         'test/hotspot/jtreg/gc/TestCodeCacheUnload.java#g1',
         'test/hotspot/jtreg/gc/TestCodeCacheUnload.java#z',
         'test/hotspot/jtreg/gc/g1/TestCodeCacheUnloadDuringConcurrentMark.java',
         'test/hotspot/jtreg/compiler/types/TestInterfaceSetScratch.java',
         'test/hotspot/jtreg/compiler/stringopts/TestLongStringConcat.java',
         'test/jdk/sun/nio/ch/TemporaryBufferCarrier.java',
         'test/jdk/sun/nio/ch/TempBuffer.java',
         'test/jdk/java/nio/channels/FileChannel/TempDirectBuffersReclamation.java',
         'test/jdk/java/lang/Thread/SleepWithDuration.java',
         'test/jdk/java/lang/Thread/JoinWithDuration.java',
         'test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeTest.java#g1']
COMMON = ['-Xms256m', '-Xmx256m', '-Xss512k', '-XX:ActiveProcessorCount=4',
          '-XX:CICompilerCount=2', '-XX:ParallelGCThreads=2', '-XX:ConcGCThreads=1']


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def save(path, value):
    # Atomic replace. Existing runs are forbidden; receipts within one run evolve.
    temporary = Path(str(path) + '.tmp')
    temporary.write_text(json.dumps(value, indent=2, allow_nan=False) + '\n')
    temporary.replace(path)


def need(condition, message):
    if not condition:
        raise RuntimeError(message)


class Campaign:
    def __init__(self, args, cancellation):
        self.cancel = cancellation
        self.cancel.check()
        self.a = args
        self.clock_guard = FixedCutoff() if args.continuation is not None else None
        self.continuation = None
        self.toolchain_inputs = None
        if args.continuation is not None:
            need(not args.continuation.with_name('continuation.claim.json').exists(),
                 'This single-use continuation was already consumed')
            verification_records = []
            def check_verification():
                self.cancel.check()
                self.clock_guard.check_preparation()
            try:
                need(args.harness_commit is not None, 'Pin reviewed harness commit for matched continuation')
                # These Git/hash operations execute only inside the already
                # supervised controller, never before the outer scope/loop.
                from continuation import verification
                with verification(check_verification, verification_records, self.clock_guard.preparation_deadline):
                    need(verification_git(REPO, 'rev-parse', 'HEAD') == args.harness_commit,
                         'Reviewed harness HEAD differs')
                    need(not verification_git(REPO, 'status', '--porcelain', '--untracked-files=all'),
                         'Reviewed harness checkout is dirty')
                self.continuation = load_continuation(
                    args.continuation, args.continuation_sha256 or '',
                    matched_rebuild=args.matched_rebuild, check=check_verification,
                    records=verification_records, deadline=self.clock_guard.preparation_deadline)
            finally:
                save(Path(args.outer_owner_reference).parent / 'verification.json', {
                    'git': verification_records, 'fixed_utc_cutoff': '2026-10-18T01:23:44Z',
                    'original_boot_evidence': 'not recorded; no original monotonic epoch assumed',
                    'effective_monotonic_deadline': self.clock_guard.deadline})
            match_arguments(self.continuation, args)
            need(self.continuation['protocol'] == {
                'methods': METHODS, 'sources': SOURCES, 'tests': TESTS, 'flags': COMMON,
                'pairs': 8, 'order': 'BC,BB; CB,BB; repeated four times',
                'confidence': 'paired log Student-t, df=7, Bonferroni 72 intervals',
                'pause_metric': 'per-fork p99; paired log-ratio/delta t intervals'},
                'Continuation changed fixed correctness/sampling/statistical protocol')
        else:
            need(args.continuation_sha256 is None, 'Witness hash without continuation')
            need(not args.matched_rebuild, 'Matched rebuild needs original continuation evidence')
        self.out = args.output.resolve()
        need(not self.out.exists(), 'Refuse an existing output/attempt directory')
        need(sys.platform == 'linux' and os.uname().machine=='x86_64',
             'This frozen qualification is Linux x64 only')
        need(set(range(4)) <= os.sched_getaffinity(0), 'CPUs 0-3 unavailable')
        need(shutil.disk_usage(self.out.parent).free >= 12 * 1024**3,
             'Need 12 GiB free storage; no automatic deletion or installation')
        need(self.a.asan_runtime.is_file(), 'Installed matching ASan runtime missing')
        memory_max = Path('/sys/fs/cgroup/memory.max').read_text().strip()
        need(memory_max.isdigit() and int(memory_max)<=16*1024**3,
             'Require existing cgroup memory ceiling <=16 GiB; no cgroup provisioning')
        os.sched_setaffinity(0, {0,1,2,3})
        self.out.mkdir()
        self.start = time.monotonic()
        self.deadline = self.start + 36000
        if self.continuation is not None:
            self.deadline = self.clock_guard.deadline
            need(time.monotonic() < self.deadline - 60, 'Original campaign deadline exhausted')
        self.records = []
        self.samples = []
        self.coverage = []
        self.hello_sha = None
        self.number = 0
        self.staging_number = 0
        self.sealed = {}
        self.staging_plans = {}
        self.discarded_objects = {}
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))  # Job-local; prevent unbounded crash core files.
        self.env = os.environ.copy()
        self.env['PYTHONDONTWRITEBYTECODE'] = '1'
        for key in ['JAVA_TOOL_OPTIONS', '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS',
                    'JDK_JAVAC_OPTIONS', 'JTREG_JAVA_OPTIONS', 'TEST_VM_FLAGLESS']:
            self.env.pop(key, None)
        self.backend = LinuxProcesses()
        self.backend.verify_support()  # Fail admission before children if pidfd syscalls are unavailable.
        enable_subreaper()
        require_no_children(self.backend)
        self.stage = 'prepare'
        self.stage_end = self.deadline
        self.invocation_end = self.deadline
        if self.continuation is None:
            # A separately authorized fresh campaign must pin its reviewed
            # harness too. Verification remains inside the already-owned child.
            from continuation import verification
            records = []
            try:
                with verification(self.check_budget, records, self.deadline - 60):
                    need(verification_git(REPO, 'rev-parse', 'HEAD') == args.harness_commit,
                         'Reviewed harness HEAD differs')
                    need(not verification_git(REPO, 'status', '--porcelain', '--untracked-files=all'),
                         'Reviewed harness checkout is dirty')
            finally:
                save(Path(args.outer_owner_reference).parent / 'verification.json', {
                    'git': records, 'harness_commit': args.harness_commit,
                    'scope': 'new campaign; no original continuation budget is reset'})
        self.freeze()
        # Every new pair needs prospective byte custody, including ordinary
        # fresh entry points. No path/version-only fallback remains.
        self.toolchain_inputs = capture_toolchain(args.boot, args.toolchain_input_root, self.check_budget)
        save(self.out / 'matched-toolchain-inputs.json', self.toolchain_inputs)
        frozen = json.loads((self.out / 'freeze.json').read_text())
        frozen['matched_toolchain_inputs_sha256'] = sha(self.out / 'matched-toolchain-inputs.json')
        save(self.out / 'freeze.json', frozen)
        if self.continuation is not None:
            claim(args.continuation, args.continuation_sha256,
                  args.outer_owner_reference, [sys.executable] + sys.argv)
            verify_claim(args.continuation, args.continuation_sha256,
                         args.outer_owner_reference, args.output)

    def freeze(self):
        paths = list(HERE.glob('*.py')) + list(HERE.glob('*.java'))
        paths += [self.a.jmh / name for name in ['jmh-core-1.37.jar',
                  'jmh-generator-annprocess-1.37.jar', 'jopt-simple-5.0.4.jar',
                  'commons-math3-3.6.1.jar']]
        paths += [self.a.boot / 'bin/java', self.a.boot / 'bin/javac',
                  self.a.jtreg / 'lib/jtreg.jar',
                  self.a.gtest / 'googletest/include/gtest/gtest.h',
                  self.a.gtest / 'googlemock/include/gmock/gmock.h', self.a.asan_runtime,
                  REPO / 'bin/configure-dev']
        paths += sorted((self.a.jtreg/'lib').glob('*.jar'))
        if self.continuation is not None:
            paths.append(self.a.continuation)
        for path in paths:
            need(path.is_file(), 'Missing installed input: ' + str(path))
        need('1.14.0' in (self.a.gtest / 'CMakeLists.txt').read_text(), 'Require gtest 1.14.0')
        save(self.out / 'freeze.json', {
            'baseline': BASE, 'candidate': CANDIDATE,
            'harness_commit': self.a.harness_commit,
            'source_and_input_sha256': {str(p): sha(p) for p in paths},
            'argv': sys.argv, 'environment': {k: self.env.get(k) for k in
                 ['PATH', 'JAVA_HOME', 'AUTOCONF', 'LD_LIBRARY_PATH', 'LD_PRELOAD', 'ASAN_OPTIONS', 'CC', 'CXX']},
            'cpuinfo': Path('/proc/cpuinfo').read_text(), 'uname': list(os.uname()),
            'memory_max': self.context('/sys/fs/cgroup/memory.max'),
            'cpu_max': self.context('/sys/fs/cgroup/cpu.max'),
            'methods': METHODS, 'sources': SOURCES, 'tests': TESTS, 'flags': COMMON,
            'pairs': 8, 'order': 'BC,BB; CB,BB; repeated four times',
            'profile': 'bin/configure-dev: Serial/G1/ZGC; headless; native x86-64-v3',
            'stage_order': ['release-builds', 'correctness-benefit', 'performance',
                            'fastdebug-asan', 'analysis'],
            'max_seconds': 36000, 'max_output_bytes': 4 * 1024**3,
            'max_workload_threads': 256, 'minimum_free_gib':12,
            'storage_guard':'all writers admit/poll/finish; measured admit+256MiB and finish, no timed disk probes', 'bootstrap': None, 'pause_metric':'per-fork p99; paired log-ratio/delta t intervals',
            'storage_cleanup': self.a.storage_cleanup,
            'debug_asan_storage_peak': 'unmeasured; 12 GiB admission is a reservation, not a measured peak',
            'confidence': 'paired log Student-t, df=7, Bonferroni 72 intervals',
            'cancellation':'cooperative SIGTERM/SIGHUP/SIGINT; first request preserved during cleanup',
            'outer_owner_reference':self.a.outer_owner_reference,
            'uncatchable_controller_death_contained_here':False, 'inherited_core_limit_bytes':0,
            'individual_signalling':'held pidfd plus kernel direct-child ownership; no kill/killpg fallback',
            'new_launcher_runtime_qualified': False})
        if self.continuation is not None:
            save(self.out / 'continuation.json', {
                'witness_sha256': self.a.continuation_sha256,
                'witness': str(self.a.continuation), 'provenance': self.continuation,
                'remaining_stages': 'all; no previous correctness or samples consumed',
                'baseline_reused': False, 'matched_rebuild': True,
                'original_boot_evidence': None,
                'hard_deadline_monotonic': self.deadline})

    @staticmethod
    def context(path):
        try:
            return Path(path).read_text()
        except OSError:
            return None

    def begin(self, name, seconds):
        self.cancel.check()
        self.stage = name
        self.stage_end = min(self.deadline - 60, time.monotonic() + seconds)
        if name == 'release-builds' and self.continuation is not None:
            self.stage_end = min(self.stage_end, self.clock_guard.stage_deadline(self.continuation['release']))

    def check_budget(self):
        self.cancel.check()
        need(time.monotonic() < self.stage_end, 'Original stage deadline exhausted')
        if getattr(self, 'clock_guard', None) is not None:
            self.clock_guard.check()
            if self.stage == 'prepare':
                self.clock_guard.check_preparation()
            if self.stage == 'release-builds':
                need(time.time() < utc(self.continuation['release']['released_at_utc']) + 6600,
                     'Original release-build UTC stage cap exhausted')

    def verify_build_inputs(self, conf, phase):
        verify_toolchain(self.toolchain_inputs, self.check_budget)
        save(self.out / (conf + '-toolchain-' + phase + '.json'), {
            'verified': True, 'phase': phase, 'configuration': conf,
            'manifest_sha256': sha(self.out / 'matched-toolchain-inputs.json'),
            'verified_monotonic': time.monotonic(),
            'scope': 'prospective matched builds only; no retained-baseline identity claim'})

    def staging_operation(self, conf, action, operation):
        """Untimed and childless, inside the same original stage/owner budget."""
        self.staging_number += 1
        receipt_path = self.out / ('%s-staging-%03d-%s.json' % (conf, self.staging_number, action))
        end = min(self.stage_end, self.deadline - 60, time.monotonic() + staging.MAX_SECONDS)
        guard = StorageGuard([self.out, REPO, Path(tempfile.gettempdir())])
        receipt = {'configuration': conf, 'action': action, 'status': 'STARTING',
                   'deadline_monotonic': end, 'timed': False}
        failure = None
        def check():
            self.check_budget()
            need(time.monotonic() < end, 'Bounded staging deadline exhausted')
            guard.poll()
        def audit():
            require_no_children(self.backend)
        try:
            guard.admit()
            audit(); check()
            receipt['result'] = operation(check, audit)
            audit(); check()
            receipt['status'] = 'VERIFIED'
        except BaseException as exc:
            failure = exc
            receipt.update(status='HOLD', error=repr(exc))
        finally:
            try:
                receipt['storage'] = guard.finish()
                receipt['observed_net_free_change_bytes'] = {
                    path: free - receipt['storage']['before_free_bytes'][path]
                    for path, free in receipt['storage']['after_free_bytes'].items()}
            except BaseException as exc:
                receipt.update(status='HOLD', storage_error=repr(exc))
                if failure is None:
                    failure = exc
            staging.write_new(receipt_path, receipt)
        if failure is not None:
            raise failure
        return receipt['result']

    def seal_configuration(self, tag, conf):
        need(staging.CONFIGURATIONS.get(conf) == tag, 'Wrong configuration tag')
        def prepare(check, audit):
            sealed = staging.seal(self.out, conf, check, audit)
            plan = staging.make_plan(self.out, conf, sealed)
            staging.write_new(self.out / (conf + '-complete-seal.json'), sealed)
            staging.write_new(self.out / (conf + '-object-cleanup-plan.json'), plan)
            self.sealed[conf] = sealed
            self.staging_plans[conf] = plan
            self.discarded_objects[conf] = []
            return {'seal_sha256': staging.digest(sealed), 'plan_sha256': staging.digest(plan),
                    'objects': plan['object_count'],
                    'reclaimable_allocated_bytes': plan['reclaimable_allocated_bytes']}
        return self.staging_operation(conf, 'seal', prepare)

    def cleanup_configuration(self, conf):
        def cleanup(check, audit):
            sealed = staging.read_pinned(self.out / (conf + '-complete-seal.json'),
                                         staging.digest(self.sealed[conf]), check)
            plan = staging.read_pinned(self.out / (conf + '-object-cleanup-plan.json'),
                                       staging.digest(self.staging_plans[conf]), check)
            journal_path = self.out / (conf + '-object-cleanup-journal.jsonl')
            with journal_path.open('x') as stream:
                def journal(row):
                    stream.write(json.dumps(row, allow_nan=False) + '\n')
                    stream.flush()  # Intent and partial progress survive controller failure.
                result = staging.operate(self.out, conf, sealed, plan,
                    check=check, audit=audit,
                    apply=self.a.storage_cleanup == staging.POLICY,
                    approved_policy=self.a.storage_cleanup, journal=journal)
            self.discarded_objects[conf] = result['deleted']
            return result
        return self.staging_operation(conf, 'cleanup', cleanup)

    def verify_configuration(self, conf):
        def verify(check, audit):
            staging.read_pinned(self.out / (conf + '-complete-seal.json'),
                                staging.digest(self.sealed[conf]), check)
            staging.verify_retained(self.out, conf, self.sealed[conf],
                                    self.discarded_objects[conf], check, audit)
            return {'seal_sha256': staging.digest(self.sealed[conf]),
                    'discarded_objects': len(self.discarded_objects[conf])}
        return self.staging_operation(conf, 'verify', verify)

    def run(self, label, command, seconds=60, cwd=None, expected=0,
            lines=None, workload=False, measured=False, extra_env=None, build_stage=False):
        """Own every command, including Git/build/jcmd; no shell command expansion."""
        def check_limits():
            self.check_budget()
        check_limits()
        require_no_children(self.backend) if not getattr(self, 'nested', False) else None
        self.number += 1
        prefix = self.out / ('%04d-%s' % (self.number, label))
        previous_end = self.invocation_end
        end = min(self.deadline - 30, self.stage_end, previous_end - 2, time.monotonic() + seconds)
        need(not measured or workload, "Measured storage policy requires a bounded workload")
        need(not build_stage or (not measured and not workload and lines is None),
             'Natural shutdown grace is only for explicit untimed builds')
        storage = StorageGuard([self.out, REPO, Path(tempfile.gettempdir())], measured=measured)
        storage.admit()  # Before the process clock and any subprocess/log creation.
        self.invocation_end = end
        need(end - time.monotonic() >= 3, 'Deadline/cleanup reserve exhausted')
        scope = ChildScope(self.backend)
        proc = None
        selector = selectors.DefaultSelector()
        row = {'label': label, 'stage': self.stage, 'argv': list(map(str, command)),
               'cwd': str(cwd or REPO), 'expected_exit': expected,
               'extra_environment': extra_env or {}, 'measured': measured, 'build_stage': build_stage,
               'context_before': self.context('/sys/fs/cgroup/cpu.stat')}
        env = self.env.copy()
        env.update(extra_env or {})
        start = time.monotonic()
        failure = None
        text = b''
        pending = b''
        guard_at = start
        drain_attempted = False
        def read_output(wait):
            nonlocal text, pending
            for key, _ in selector.select(wait):
                block = os.read(key.fd, 65536)
                if not block:
                    selector.unregister(key.fileobj)
                    continue
                text += block
                need(len(text) < 48 * 1024**2, 'Invocation stdout cap')
                log.write(block)
                pending += block
                while b'\n' in pending:
                    raw, pending = pending.split(b'\n', 1)
                    if lines:
                        lines(raw.decode('utf-8', 'strict'), proc, prefix)
        try:
            with Path(str(prefix)+'.stdout').open('wb') as log, Path(str(prefix)+'.stderr').open('wb') as err:
                check_limits()
                proc = subprocess.Popen(list(map(str, command)), cwd=cwd or REPO,
                    env=env, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                    stderr=err, start_new_session=True)
                check_limits()  # A launch-time request is handled after proc assignment.
                os.set_blocking(proc.stdout.fileno(), False)
                selector.register(proc.stdout, selectors.EVENT_READ)
                while selector.get_map() or proc.poll() is None:
                    check_limits()
                    need(time.monotonic() < end - 2, 'Invocation/deadline exceeded')
                    need(Path(str(prefix)+'.stderr').stat().st_size + len(text) < 48 * 1024**2,
                         'Invocation output cap')
                    storage.poll()  # All writers; timed commands reserve space instead of probing here.
                    if build_stage and not drain_attempted and proc.poll() == 0:
                        drain_attempted = True
                        def check_drain():
                            check_limits()
                            read_output(0)
                            storage.poll()
                            need(Path(str(prefix)+'.stderr').stat().st_size + len(text) < 48 * 1024**2,
                                 'Build drain output cap')
                        row['build_drain'] = scope.drain(proc, end - 2, check_drain)
                        need(row['build_drain']['complete'], 'Build natural shutdown drain failed: ' +
                             repr(row['build_drain']['errors']))
                    if workload and proc.poll() is None and time.monotonic()>=guard_at:
                        guard_at=time.monotonic()+1
                        try:
                            stat = Path('/proc/%d/status' % proc.pid).read_text()
                            need(int(re.search(r'^Threads:\s+(\d+)', stat, re.M)[1]) <= 256,
                                 'Native JVM thread cap')
                        except FileNotFoundError:
                            pass
                    read_output(.05)
                left = end - 2 - time.monotonic()
                need(left > 0, 'No wait/cleanup reserve')
                code = proc.wait(timeout=left)
                if build_stage and not drain_attempted and code == 0:
                    drain_attempted = True
                    def check_drain():
                        check_limits()
                        read_output(0)
                        storage.poll()
                        need(Path(str(prefix)+'.stderr').stat().st_size + len(text) < 48 * 1024**2,
                             'Build drain output cap')
                    row['build_drain'] = scope.drain(proc, end - 2, check_drain)
                    need(row['build_drain']['complete'], 'Build natural shutdown drain failed: ' +
                         repr(row['build_drain']['errors']))
                row['exit'] = code
                row['process_wall_seconds'] = time.monotonic() - start
                log.flush()
                row['combined_output_bytes'] = (Path(str(prefix)+'.stdout').stat().st_size
                                                 + Path(str(prefix)+'.stderr').stat().st_size)
                need(row['combined_output_bytes'] < 48 * 1024**2, 'Final combined invocation output cap')
                need(code == expected, 'Unexpected exit: ' + str(code))
                if workload:
                    stderr_text = Path(str(prefix)+'.stderr').read_text()
                    need(not re.search(r'Unrecognized VM option|Ignoring option|AddressSanitizer:|runtime error:',stderr_text),
                         'Ignored/unknown flag or sanitizer report')
        except BaseException as exc:
            failure = repr(exc)
        finally:
            selector.close()
            self.invocation_end = previous_end
            row['cleanup'] = scope.close(proc, end)
            try:
                row['combined_output_bytes'] = (Path(str(prefix)+'.stdout').stat().st_size
                                                 + Path(str(prefix)+'.stderr').stat().st_size)
                need(row['combined_output_bytes'] < 48 * 1024**2, 'Final combined invocation output cap')
            except Exception as exc:
                failure = (failure + '; ' if failure else '') + repr(exc)
            try:
                row['storage'] = storage.finish()  # After process timing and cleanup.
            except Exception as exc:
                failure = (failure + '; ' if failure else '') + repr(exc)
            row['wall_seconds'] = time.monotonic() - start
            row['context_after'] = self.context('/sys/fs/cgroup/cpu.stat')
            if proc is not None:
                row['exit'] = proc.poll()
                for stream in [proc.stdin, proc.stdout]:
                    if stream:
                        stream.close()
            errors = cleanup_errors(row['cleanup'])
            if self.cancel.signum is not None:
                failure = (failure + '; ' if failure else '') + self.cancel.message()
            row['cancellation_signal'] = self.cancel.signum
            row['error'] = failure or ('; '.join(errors) if errors else None)
            row['stdout'] = str(Path(str(prefix)+'.stdout'))
            row['stderr'] = str(Path(str(prefix)+'.stderr'))
            self.records.append(row)
            save(self.out / 'commands.json', self.records)
        need(row['error'] is None, label + ': ' + str(row['error']))
        need(time.monotonic() < self.deadline - 30, 'Global cleanup reserve exhausted')
        # Bound aggregate logs, not build outputs/classes/images.
        total = sum(p.stat().st_size for p in self.out.iterdir() if p.is_file())
        need(total < 4 * 1024**3, 'Campaign log cap')
        return text.decode('utf-8', 'strict'), row

    def checkout(self):
        self.run('harness-git-revision',['git','rev-parse','HEAD'])
        framework,_=self.run('gtest-git-revision',['git','rev-parse','HEAD'],cwd=self.a.gtest)
        need(framework.strip()=='f8d7d77c06936315286eb55f8de22cd23c188571','Wrong pinned GoogleTest source')
        self.run('gtest-clean',['git','diff','--quiet','HEAD'],cwd=self.a.gtest)
        for tag, revision in [('B', BASE), ('C', CANDIDATE)]:
            self.run('checkout-' + tag,
                     ['git', 'worktree', 'add', '--detach', self.out / tag, revision], 60)
            actual, _ = self.run('revision-' + tag, ['git', 'rev-parse', 'HEAD'], cwd=self.out/tag)
            need(actual.strip() == revision, 'Wrong checkout')
            self.run('tree-' + tag, ['git', 'rev-parse', 'HEAD^{tree}'], cwd=self.out/tag)

    def build(self, tag, debug='release', asan=False):
        repo = self.out / tag
        conf = tag + '-' + debug + ('-asan' if asan else '')
        if self.toolchain_inputs is not None:
            self.verify_build_inputs(conf, 'before')
        cmd = ['bash', 'bin/configure-dev', '--with-conf-name=' + conf,
               '--with-debug-level=' + debug, '--with-jobs=4', '--disable-precompiled-headers',
               '--with-source-date=2026-10-16T21:13:34Z', '--with-version-opt=memory-decision',
               '--with-boot-jdk=' + str(self.a.boot), '--with-jtreg=' + str(self.a.jtreg),
               '--with-gtest=' + str(self.a.gtest)] + self.a.configure_option
        if asan:
            cmd.append('--enable-asan')
        self.run('configure-' + conf, cmd, 180, repo)
        # Validate configure's actual selections before make uses them. Every
        # new pair needs this prospective proof, including a fresh campaign.
        self.verify_matched_spec(repo, conf, asan)
        self.run('build-' + conf,
                 ['make', 'CONF=' + conf, 'JOBS=4', 'images', 'test-image-hotspot-gtest'],
                 4200 if debug == 'fastdebug' or asan else 3000, repo, build_stage=True)
        if self.toolchain_inputs is not None:
            self.verify_build_inputs(conf, 'after')
        image = self.image_receipt(repo, conf, asan)
        self.seal_configuration(tag, conf)
        return image

    def verify_matched_spec(self, repo, conf, asan):
        need(self.toolchain_inputs is not None, 'Missing prospective matched toolchain catalog')
        spec = repo / 'build' / conf / 'spec.gmk'
        configured = spec.read_text()
        previous_spec = (self.out / 'B/build/B-release/spec.gmk').read_text()
        for key in ['CC', 'CXX', 'CC_VERSION_NUMBER', 'CXX_VERSION_NUMBER',
                    'BOOT_JDK', 'JVM_FEATURES_server', 'ENABLE_DESKTOP', 'JVM_VARIANTS',
                    'ENABLE_JAVAC_SERVER']:
            pattern = r'^' + key + r'\s*:?=\s*(.*)$'
            old = re.findall(pattern, previous_spec, re.M)
            current = re.findall(pattern, configured, re.M)
            need(len(old) == len(current) == 1 and old == current,
                 'Matched baseline/candidate toolchain or profile differs: ' + key)
            if key in ('CC', 'CXX'):
                need(toolchain_covers(self.toolchain_inputs, current[0].strip()),
                     'Selected compiler is outside captured native input roots: ' + key)
            if key == 'BOOT_JDK':
                need(Path(current[0].strip()).resolve(strict=True) == Path(self.toolchain_inputs['boot']),
                     'Selected boot JDK is outside captured boot inputs')
        features = re.findall(r'^JVM_FEATURES_server\s*:=\s*(.*)$', configured, re.M)
        need(len(features) == 1, 'Missing server feature receipt')
        need(sorted(x for x in features[0].split() if x.endswith('gc')) == ['g1gc','serialgc','zgc'],
             'Repository collector profile mismatch')
        need(bool(re.search(r'^ASAN_ENABLED\s*:=\s*true$',configured,re.M)) == asan,
             'Unexpected ASan configuration')
        return configured

    def image_receipt(self, repo, conf, asan):
        # Recheck the same selections after make as well as before it.
        configured = self.verify_matched_spec(repo, conf, asan)
        image = repo / 'build' / conf / 'images/jdk'
        manifest = {str(p.relative_to(image)): sha(p) for p in image.rglob('*') if p.is_file()}
        save(self.out / (conf + '-image.json'), manifest)
        spec = repo / 'build' / conf / 'spec.gmk'
        save(self.out / (conf + '-spec.json'), {'sha256': sha(spec), 'contents': configured})
        return image

    def native(self, image, conf, asan=False):
        launcher = self.out/'C/build'/conf/'hotspot/variant-server/libjvm/gtest/gtestLauncher'
        save(self.out/(conf+'-native-artifacts.json'), {str(p):sha(p) for p in
             [launcher, launcher.parent/'libjvm.so']})
        for suite in ['Array.c_heap_allocation_size_vm',
                      'ParkEvent.natural_alignment_and_recycled_events_vm']:
            xml = self.out / (conf + '-' + suite + '.xml')
            env = {'ASAN_OPTIONS': 'allow_user_poisoning=1:detect_leaks=0',
                   'LD_PRELOAD': str(self.a.asan_runtime)} if asan else None
            _, native_row = self.run(conf + '-' + suite, ['taskset', '-c', '0-3', launcher, '-jdk', image,
                '--gtest_filter=' + suite, '--gtest_output=xml:' + str(xml),
                '-XX:NativeMemoryTracking=summary', '-Xmx256m', '-XX:ActiveProcessorCount=4'],
                workload=True, extra_env=env)
            need(not Path(native_row['stderr']).read_text(), 'Unexpected native-test stderr')
            tree = ET.parse(xml)
            cases=tree.findall('.//testcase')
            need(len(cases)==1 and cases[0].get('status')=='run' and cases[0].get('result')=='completed'
                 and not tree.findall('.//skipped') and not tree.findall('.//failure')
                 and not tree.findall('.//error') and tree.getroot().get('errors','0')=='0',
                 'Empty/skipped/failed native case')
            self.coverage.append({'kind':'gtest','case':suite,'configuration':conf,
                'executed':1,'skipped':0,'failures':0,'nmt':'summary','xml':str(xml),'xml_sha256':sha(xml)})
            save(self.out/'coverage.json',self.coverage)

    def old_control(self, image):
        """Independent inline negative control; never overwrite fixed objects."""
        g = self.out/'C/build/C-release/hotspot/variant-server/libjvm/gtest'
        out = self.out/'old-header'
        headers = out/'headers/oops'
        headers.mkdir(parents=True)
        old,_ = self.run('old-header-source', ['git','show',BASE+':src/hotspot/share/oops/array.inline.hpp'])
        (headers/'array.inline.hpp').write_text(old)
        args = shlex.split((g/'objs/test_array.o.cmdline').read_text())
        clean=[];i=0
        while i<len(args):
            if args[i] in ['-MF','-o']:
                i+=2;continue
            if args[i] in ['-MMD','-c']:
                i+=1;continue
            clean.append(args[i]);i+=1
        proof={}
        for name,prefix in [('fixed',[]),('old',['-I'+str(out/'headers')])]:
            path=out/(name+'.ii')
            self.run('preprocess-'+name,[clean[0]]+prefix+clean[1:]+['-E','-o',path],90,self.out/'C')
            text=path.read_text()
            start=text.index('inline void* Array<T>::operator new(size_t size, int length, MemTag flags)')
            body=text[start:text.index('\n}',start)+2]
            need(('AllocateHeap(size * BytesPerWord, flags)' in body)==(name=='old'),
                 'Wrong preprocessed inline allocator')
            proof[name]={'body':body,'preprocessed_sha256':sha(path)}
        obj=out/'test_array.o'
        self.run('compile-old-array',[clean[0],'-I'+str(out/'headers')]+clean[1:]+['-c','-o',obj],90,self.out/'C')
        link=shlex.split((g/'objs/BUILD_GTEST_LIBJVM_run_ld.cmdline').read_text())
        link[link.index('-o')+1]=str(out/'libjvm.so')
        replacements=0
        inputs={}
        for i,arg in enumerate(link):
            if arg.startswith('@'):
                content=Path(arg[1:]).read_text();target=str(g/'objs/test_array.o')
                need(content.count(target)==1,'Ambiguous old-control link input')
                inputs={p:sha(p) for p in shlex.split(content)}
                response=out/'objects.txt';response.write_text(content.replace(target,str(obj)))
                link[i]='@'+str(response);replacements+=1
        need(replacements==1,'Missing unique response file')
        self.run('link-old-array',link,120,self.out/'C')
        need(all(sha(p)==value for p,value in inputs.items()),'Shared link input changed')
        shutil.copy2(g/'gtestLauncher',out/'gtestLauncher')
        xml=out/'array.xml'
        _, old_row = self.run('old-array-negative',['taskset','-c','0-3',out/'gtestLauncher','-jdk',image,
            '--gtest_filter=Array.c_heap_allocation_size_vm','--gtest_output=xml:'+str(xml),
            '-XX:NativeMemoryTracking=summary','-Xmx256m','-XX:ActiveProcessorCount=4'],expected=2,workload=True)
        need(Path(old_row['stderr']).read_text()=='ERROR: RUN_ALL_TESTS() failed. Error 1\n',
             'Unexpected old-header control stderr')
        tree=ET.parse(xml);failures=tree.findall('.//failure')
        need(len(tree.findall('.//testcase'))==1 and not tree.findall('.//skipped') and len(failures)==12,
             'Old-header oracle selection/failure count')
        need(all('requested_size' in f.attrib['message'] and 'BytesPerWord' in f.attrib['message']
                 for f in failures),'Old-header failure outside requested size')
        save(out/'proof.json',{'preprocessing':proof,'shared_inputs':inputs,
             'old_object_sha256':sha(obj),'old_libjvm_sha256':sha(out/'libjvm.so'),
             'fixed_libjvm_sha256':sha(g/'libjvm.so'),'exit':2,'size_failures':12})

    def correctness(self, image, name, baseline=False):
        # Baseline does not run donor assertions that deliberately require the fix.
        tests = TESTS[2:3] + TESTS[4:] if baseline else TESTS
        for index, test in enumerate(tests):
            work = self.out / ('jtreg-%s-%d' % (name,index))
            options = '-Xmx256m'
            if 'AOTCodeTest' in test:
                options += ' -XX:+UnlockDiagnosticVMOptions -XX:+AOTVerifyTrainingData'
            self.run('jtreg-%s-%d' % (name,index), [self.a.boot/'bin/java', '-Xmx256m',
                '-jar', self.a.jtreg/'lib/jtreg.jar', '-jdk:' + str(image),
                '-conc:1', '-timeoutFactor:1', '-javaoptions:' + options,
                '-w:' + str(work/'work'), '-r:' + str(work/'report'), self.out/'C'/test], 600,
                self.out/'C')
            results = list((work/'work').rglob('*.jtr'))
            need(len(results) == 1, 'Absent/ambiguous jtreg result')
            status = re.search(r'^execStatus=(.*)$', results[0].read_text(), re.M)
            need(status and status[1].startswith('Passed.'), 'Skipped/failed jtreg case')
            self.coverage.append({'kind':'jtreg','test_id':test,'configuration':name,
                'status':status[1],'jtr':str(results[0]),'jtr_sha256':sha(results[0])})
            save(self.out/'coverage.json',self.coverage)

    def compile_sources(self):
        classes = self.out / 'classes'
        classes.mkdir()
        sources = [HERE/name for name in ['MemoryQualification.java','MemoryTargets.java','Hello.java']]
        sources += [self.out/'C/test/lib/jdk/test/whitebox'/name for name in
                    ['WhiteBox.java','parser/DiagnosticCommand.java']]
        sources += [self.out/'C/test/jdk/sun/nio/ch/TemporaryBufferCarrier.java',
                    self.out/'C/test/manual/jvm-memory/NioAlignedCacheLifecycleFixture.java']
        self.run('compile-fixtures', [self.a.boot/'bin/javac','-J-Xmx256m',
                  '--add-exports','java.base/sun.nio.ch=ALL-UNNAMED','-d',classes] + sources, 120)
        jars = [self.a.jmh/name for name in ['commons-math3-3.6.1.jar', 'jopt-simple-5.0.4.jar',
                'jmh-core-1.37.jar', 'jmh-generator-annprocess-1.37.jar']]
        cp = os.pathsep.join(map(str,jars))
        micro = self.out/'micro'
        micro.mkdir()
        benchmark_sources=[self.out/'C/test/micro'/p for p in SOURCES]
        benchmark_sources += [HERE/name for name in ['VerifiedJavac.java',
            'VerifiedFileChannelRead.java','VerifiedFileChannelWrite.java','FileChannelStateRegression.java']]
        self.run('compile-jmh', [self.a.boot/'bin/javac','-J-Xmx256m','-cp',cp,
                 '-processorpath',cp,'-processor','org.openjdk.jmh.generators.BenchmarkProcessor',
                 '-d',micro,'-s',self.out/'generated'] + benchmark_sources, 180)
        regression_cp=os.pathsep.join([str(micro),cp])
        regression,_=self.run('file-io-state-regression',[self.a.boot/'bin/java','-Xmx256m',
             '-cp',regression_cp,'org.openjdk.bench.memory.FileChannelStateRegression'])
        need('FILE_IO_STATE_OK sizes=1,3 iterations=2 positive_bytes=true' in regression,
             'Missing positive-byte EOF/iteration regression receipt')
        save(self.out/'class-hashes.json', {str(p.relative_to(self.out)):sha(p)
             for folder in [classes,micro] for p in folder.rglob('*') if p.is_file()})
        return os.pathsep.join([str(micro),cp])

    def flags(self, gc, nmt='off', log=None, heap32=False):
        flags = COMMON.copy()
        if heap32:
            flags[0] = '-Xms32m'
        flags += ['-XX:+Use' + gc + 'GC','-XX:NativeMemoryTracking=' + nmt]
        if log:
            flags += ['-Xlog:gc*=info,safepoint=info:file=' + str(log) + ':uptimemillis,level,tags:filecount=1,filesize=32m']
        return flags

    def memory(self, images):
        # Fresh public lifecycle protocol, not any consumed old NIO controller.
        nio = []
        scenarios = [('leak',None),('control',0),('control',65536),
                     ('control',69631),('control',69632)]
        for mode, threshold in scenarios:
            for tag in (['C','B'] if threshold == 0 else ['B','C']):
                stages = []
                snapshots = {}
                image = images[tag]
                def handshake(line, proc, prefix):
                    if not line.startswith('NIO '):
                        return
                    phase = 'READY' if line == 'NIO READY iterations=32 size=65536 alignment=4096' else 'POST_EXIT'
                    need((stages == [] and phase == 'READY') or
                         (stages == ['READY'] and phase == 'POST_EXIT'), 'NIO stage order')
                    self.nested = True
                    try:
                        text, nmt_row = self.run('nmt-' + tag + '-' + phase,
                            [image/'bin/jcmd','-J-Xmx64m','-J-XX:ActiveProcessorCount=1',
                             str(proc.pid),'VM.native_memory','detail','scale=1'], 10)
                    finally:
                        self.nested = False
                    need(not Path(nmt_row['stderr']).read_text(), 'Unexpected jcmd stderr')
                    need(text.startswith(str(proc.pid)+':\n'), 'NMT PID mismatch')
                    absolute=parse_other_snapshot(text)
                    if phase=='READY':
                        need(absolute['bytes']==0 and absolute['count']==0, 'NIO READY must be zero')
                    snapshots[phase] = text
                    stages.append(phase)
                    proc.stdin.write(b'\n');proc.stdin.flush()
                cmd = [image/'bin/java'] + self.flags('G1','detail',heap32=True)
                if threshold is not None:
                    cmd += ['-Djdk.nio.maxCachedBufferSize=' + str(threshold)]
                cmd += ['-Xshare:off','--add-exports=java.base/sun.nio.ch=ALL-UNNAMED',
                        '-cp',self.out/'classes','NioAlignedCacheLifecycleFixture',mode]
                text,row = self.run('nio-%s-%s-%s' % (tag,mode,threshold),
                    ['taskset','-c','0-3']+cmd, lines=handshake, workload=True)
                result = check_accounting({'variant':tag,'mode':mode,'threshold':threshold},
                    snapshots.get('READY'),snapshots.get('POST_EXIT'),text,row['exit'],stages,
                    Path(row['stderr']).read_text())
                nio.append({'variant':tag,'mode':mode,'threshold':threshold,**result})
                save(self.out/'nio-accounting.json',nio)
                need(not result['errors'], 'NIO accounting inconclusive: ' + repr(result['errors']))
                if mode=='leak':
                    need(result['after_other']['bytes'] == (2224128 if tag=='B' else 0),
                         'Meaningful retained requested-byte benefit absent')
        # Complete NMT snapshots and smaps at seven thread-phase acknowledgements.
        for tag in ['B','C']:
            stages = []
            def acknowledge(line, proc, prefix):
                if line.startswith('QSNAP_END\t'):
                    stages.append(line.split('\t')[1])
                    (self.out/('threads-'+tag+'-'+stages[-1]+'.smaps')).write_text(
                        Path('/proc/%d/smaps_rollup' % proc.pid).read_text())
                    proc.stdin.write(b'\n');proc.stdin.flush()
            _, thread_row = self.run('threads-'+tag, ['taskset','-c','0-3',images[tag]/'bin/java']+
                self.flags('G1','detail',heap32=True)+['-Dmemory.nmtDetail=true','-cp',
                    self.out/'classes','MemoryQualification','threads'],lines=acknowledge,workload=True)
            need(not Path(thread_row['stderr']).read_text(), 'Unexpected thread fixture stderr')
            need(stages == ['warm-retained','n64-live','n64-retained','n192-live',
                            'n192-retained','reuse192-live','reuse192-retained'], 'Thread phase mismatch')
        for gc in GCS:
            for tag in ['B','C']:
                text,code_row = self.run('code-'+gc+'-'+tag,
                    ['taskset','-c','0-3',images[tag]/'bin/java']+self.flags(gc)+[
                    '-Xbatch','-XX:+UnlockDiagnosticVMOptions','-XX:+WhiteBoxAPI',
                    '-Xbootclasspath/a:'+str(self.out/'classes'),
                    '-XX:CompileCommand=compileonly,MemoryTargets::*',
                    '-XX:ReservedCodeCacheSize=32m','-XX:InitialCodeCacheSize=8m',
                    '-cp',self.out/'classes','MemoryQualification','code'], workload=True)
                need(not Path(code_row['stderr']).read_text(), 'Unexpected code-cache fixture stderr')
                need('QDONE\tcode\t128' in text, 'Missing code-cache liveness receipt')
                found = re.search(r'QCODE\tafter-one-gc\t(\d+)\t(\d+)\t(\d+)\t(\d+)\t(\d+)\t(\d+)',text)
                need(found and int(found[5]) == 64, 'Code-cache live control lost')
                expected = 64 if tag == 'B' and gc in ['Serial','G1'] else 0
                need(int(found[4]) == expected, 'Unexpected first-GC reclaim behavior')
                reuse=re.search(r'QREUSE\t(\d+)\t(\d+)',text)
                need(reuse and int(reuse[1])==(0 if expected==64 else 64) and int(reuse[2])>0,
                     'Code-cache payload/address reuse oracle')
        # Required attributable benefit comes from the reconciled NIO default pair.
        # ParkEvent snapshots are retained for source attribution, not guessed from total Internal.
        save(self.out/'benefit.json', {'status':'requested-allocation-benefit',
              'default_baseline_bytes':2224128,'candidate_bytes':0,
              'rss_pss_gain_claimed':False,'park_event_attribution':'manual source review pending',
              'c2_peak_bytes':'unmeasured'})

    def performance(self, images, cp):
        for gc in GCS:
            for method in METHODS + ['threadwork','carrier-platform','carrier-virtual']:
                for pair in range(8):
                    primary = ['B','C'] if pair % 2 == 0 else ['C','B']
                    for control,tags in [(False,primary),(True,['B','B'])]:
                        for member,tag in enumerate(tags):
                            label = '%s-%s-%d-%s-%d' % (gc,method.replace('.', '_'),pair,
                                                       'BB' if control else 'BC',member)
                            result = self.out/(label+'.json')
                            gc_log = self.out/(label+'.gc')
                            flags = self.flags(gc, log=gc_log)
                            if method in METHODS:
                                cmd=[self.a.boot/'bin/java','--sun-misc-unsafe-memory-access=allow',
                                     '-Xmx128m','-XX:ActiveProcessorCount=1',
                                     '-Djmh.blackhole.autoDetect=false','-Djmh.compilerhints.mode=FORCE_ON',
                                     '-cp',cp,'org.openjdk.jmh.Main','^'+re.escape(method)+'$',
                                     '-f','1','-wf','0','-t','1','-wi','5','-i','7','-w','1s','-r','1s',
                                     '-foe','true','-rf','json','-rff',result,
                                     '-jvm',images[tag]/'bin/java','-jvmArgs',shlex.join(flags+[
                                         '--sun-misc-unsafe-memory-access=allow',
                                         '-Djmh.blackhole.autoDetect=false','-Djmh.compilerhints.mode=FORCE_ON'])]
                            else:
                                main=['MemoryQualification','threadwork'] if method=='threadwork' else [
                                      'TemporaryBufferCarrier',method.split('-')[1]]
                                cmd=[images[tag]/'bin/java']+flags+[
                                    '-Djdk.virtualThreadScheduler.parallelism=4',
                                    '-Djdk.virtualThreadScheduler.maxPoolSize=4',
                                    '-cp',self.out/'classes']+main
                            text,row=self.run(label,['taskset','-c','0-3']+cmd,workload=True,measured=True)
                            need(not Path(row['stderr']).read_text(), 'Unexpected timing workload stderr')
                            if method in METHODS:
                                need(not Path(row['stderr']).read_text(), 'Unexpected JMH coordinator stderr')
                                data=json.loads(result.read_text())
                                need(len(data)==1 and data[0]['benchmark']==method,'Wrong JMH selection')
                                if 'VerifiedFileChannel' in method:
                                    kind='READ' if 'Read' in method else 'WRITE'
                                    receipts=re.findall(r'^QUAL_IO_'+kind+r' operations=(\d+) bytes=(\d+) rewinds=(\d+)$',text,re.M)
                                    need(len(receipts)==12 and all(int(o)>0 and int(o)==int(b) for o,b,_ in receipts),
                                         'I/O benchmark did not prove positive bytes/work in every iteration')
                                    need(data[0].get('params',{}).get('fileSize')=='1000000','Wrong I/O file size')
                                pm=data[0]['primaryMetric'];score=pm['score']
                                unit=pm['scoreUnit']
                                need(math.isfinite(score) and score>0,'Invalid score')
                                value=1/score if unit.startswith('ops/') else score
                                need(data[0]['forks']==1 and data[0]['threads']==1 and data[0]['warmupIterations']==5
                                     and data[0]['measurementIterations']==7, 'Wrong JMH run shape')
                            else:
                                need(('QDONE\tthreadwork\t1536' in text) if method=='threadwork' else
                                    ('checksum=1627136' in text),'Fixed-work semantics missing')
                                value=row['process_wall_seconds']
                            need(not list(self.out.glob(gc_log.name+'.*')),
                                 'GC log rotated; complete pause data unavailable')
                            pauses=[float(x) for x in re.findall(r'\[gc(?:,[a-z]+)*\s*\].*?GC\(\d+\).*?Pause[^\n]*? ([0-9.]+)ms\s*$',
                                      gc_log.read_text(),re.M)]
                            self.samples.append({'gc':gc,'method':method,'pair':pair,
                                'control':control,'member':member,'tag':tag,'time_per_work':value,
                                'pauses_ms':pauses,'pause_scope':'whole fork including startup/warmup', 'command_label':row['label']})
                            save(self.out/'samples.json',self.samples)
        for gc in GCS:
            for mode in ['version','javac']:
                for pair in range(8):
                    for control,tags in [(False,['B','C'] if pair%2==0 else ['C','B']),(True,['B','B'])]:
                        for member,tag in enumerate(tags):
                            label='startup-%s-%s-%d-%s-%d'%(gc,mode,pair,control,member)
                            folder=self.out/label;folder.mkdir()
                            if mode=='version':
                                cmd=[images[tag]/'bin/java']+self.flags(gc,heap32=True)+['-version']
                            else:
                                cmd=[images[tag]/'bin/javac','-J-Xms32m','-J-Xmx256m',
                                     '-J-XX:ActiveProcessorCount=4','-J-XX:+Use'+gc+'GC',
                                     '-proc:none','-d',folder,HERE/'Hello.java']
                            _,row=self.run(label,['taskset','-c','0-3']+cmd,workload=True,measured=True)
                            if mode=='javac':
                                need(not Path(row['stderr']).read_text(), 'Unexpected startup javac stderr')
                                text,hello_row=self.run(label+'-semantic',[images[tag]/'bin/java','-Xmx256m',
                                    '-XX:ActiveProcessorCount=4','-cp',folder,'Hello'],workload=True)
                                need(text=='42\n' and not Path(hello_row['stderr']).read_text(),'Compiled startup source wrong')
                                checksum=sha(folder/'Hello.class')
                                need(self.hello_sha in [None,checksum],'Startup class bytes changed')
                                self.hello_sha=checksum
                                save(folder/'class-sha256.json',{'Hello.class':checksum})
                            self.samples.append({'gc':gc,'method':'startup-'+mode,'pair':pair,
                                'control':control,'member':member,'tag':tag,
                                'time_per_work':row['process_wall_seconds'],'pauses_ms':[]})
                            save(self.out/'samples.json',self.samples)

    def all(self):
        self.begin('release-builds',6600)
        from analyze import critical
        need(abs(critical(7,.05)-2.3646242516)<1e-8,'Student-t numerical preflight failed')
        self.run('offline-guard-regressions',[sys.executable,'-m','unittest','-v',
                 'test_guards','test_supervisor','test_continuation','test_deadline',
                 'test_staging'],120,HERE)
        self.checkout()
        images = {'B': self.build('B')}
        # B has no later compile/link consumer. Images/spec/symbols stay in place.
        self.cleanup_configuration('B-release')
        images['C'] = self.build('C')
        self.begin('correctness-benefit',5400)
        for conf in ['B-release', 'C-release']:
            self.verify_configuration(conf)
        self.run('profile-B',['bash','.github/scripts/check-dev-profile.sh',images['B'],
            self.out/'B/build/B-release/spec.gmk'],120,self.out/'B')
        self.run('profile-C',['bash','.github/scripts/check-dev-profile.sh',images['C'],
            self.out/'C/build/C-release/spec.gmk'],120,self.out/'C')
        self.native(images['C'],'C-release')
        self.old_control(images['C'])
        self.correctness(images['B'],'B',baseline=True)
        self.correctness(images['C'],'C')
        # old_control links both ordinary JVM and gtest objects. Never prune C
        # before its native/negative-control/correctness consumers have finished.
        self.cleanup_configuration('C-release')
        cp=self.compile_sources()
        self.memory(images)
        if self.a.stop_after=='benefit':
            return {'decision':'BENEFIT_ESTABLISHED_PERFORMANCE_PENDING','platform':'linux-x64'}
        self.begin('performance',14400)
        for conf in ['B-release', 'C-release']:
            self.verify_configuration(conf)
        self.performance(images,cp)
        from analyze import analyze
        decision=analyze(self.samples)
        save(self.out/'statistics.json',decision)
        if decision['decision']!='LOCAL_GO':
            return decision
        if self.a.stop_after=='performance':
            return {**decision,'decision':'WORTH_FURTHER_CORRECTNESS','asan_runtime':'pending'}
        if shutil.disk_usage(self.out).free<12*1024**3:
            return {**decision,'decision':'HOLD_DEBUG_STORAGE',
                    'required_next_stage_free_gib':12,'release_correctness_and_benefit':'passed',
                    'fastdebug_asan':'not launched'}
        self.begin('fastdebug-asan',8400)
        debug=self.build('C','fastdebug')
        self.native(debug,'C-fastdebug')
        self.correctness(debug,'C-fastdebug')
        self.cleanup_configuration('C-fastdebug')
        asan=self.build('C',asan=True)
        self.native(asan,'C-release-asan',asan=True)
        self.cleanup_configuration('C-release-asan')
        for conf in self.sealed:
            self.verify_configuration(conf)
        require_no_children(self.backend)
        return {**decision,'decision':'LOCAL_GO_FOR_REVIEW',
                'platform':'linux-x64','supported_platform_ci':'not run; separate integration approval',
                'architecture_specific_performance':'no claim for other architectures'}


def main():
    p=argparse.ArgumentParser(description=__doc__,allow_abbrev=False)
    p.add_argument('--execute',action='store_true',help='requires separate campaign authorization')
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--continuation',type=Path)
    p.add_argument('--continuation-sha256')
    p.add_argument('--matched-rebuild',action='store_true')
    p.add_argument('--harness-commit', required=True)
    p.add_argument('--toolchain-input-root',type=Path,action='append',default=[])
    p.add_argument('--storage-cleanup', choices=['dry-run', staging.POLICY], default='dry-run',
                   help='Explicit approval of the scoped object policy; default only validates manifests')
    p.add_argument('--boot',type=Path,required=True)
    p.add_argument('--jtreg',type=Path,required=True)
    p.add_argument('--gtest',type=Path,required=True)
    p.add_argument('--jmh',type=Path,required=True)
    p.add_argument('--asan-runtime',type=Path,required=True)
    p.add_argument('--configure-option',action='append',default=[])
    p.add_argument('--outer-owner-reference',required=True,
                   help='Approved outer job/cgroup owner and descendant deadline; recorded, not verified here')
    p.add_argument('--stop-after',choices=['benefit','performance','all'],default='all')
    args=p.parse_args()
    need(args.outer_owner_reference.strip(), 'Outer job owner reference must not be empty')
    if not args.execute:
        p.error('No execution authorized; review Git sources and obtain campaign approval first')
    campaign=None
    cancellation=Cancellation()
    cancellation.install()
    try:
        campaign=Campaign(args,cancellation)
        result=campaign.all()
    except BaseException as exc:
        result={'decision':'HOLD','error':repr(exc)}
        if campaign is None:
            cancellation.restore()
            raise
    finally:
        if campaign:
            # Includes report closure in the global budget. Never erase partial receipts.
            try:
                require_no_children(campaign.backend)
            except Exception as exc:
                cleanup=ChildScope(campaign.backend,protect_existing=False).close(None,campaign.deadline)
                save(campaign.out/'final-cleanup.json',cleanup)
                result={'decision':'HOLD','cleanup_error':repr(exc),'final_cleanup':cleanup}
            if time.monotonic()>=campaign.deadline:
                result={'decision':'HOLD','error':'Global closure deadline exceeded'}
            if cancellation.signum is not None:
                result={'decision':'CANCELLED','signal':cancellation.signum,'detail':cancellation.message(),
                        'preceding_result':result}
            save(campaign.out/'decision.json',result)
            if cancellation.signum is not None and result.get('decision')!='CANCELLED':
                result={'decision':'CANCELLED','signal':cancellation.signum,'detail':cancellation.message(),
                        'preceding_result':result}
                save(campaign.out/'decision.json',result)
            if time.monotonic()>=campaign.deadline:
                result={'decision':'HOLD','error':'Report closure crossed global deadline'}
                save(campaign.out/'decision.json',result)
        cancellation.restore()
    print(json.dumps(result,indent=2))
    if cancellation.signum is not None:
        return 128+cancellation.signum
    return 0 if result['decision']=='LOCAL_GO_FOR_REVIEW' else 2


if __name__=='__main__':
    sys.exit(main())
