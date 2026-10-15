"""One native rebuild diagnostic; fixed protocol, no restart or score-based extension."""
import argparse
import ctypes
import datetime
import json
import os
from pathlib import Path
import signal
import subprocess
import time

from common import (HERE, PLAN_SHA, classpath, execute_protocol, flags, image,
                    plan, save, schedule, sha, timing_command)
from preflight import check_elf, host_metadata, require_host, verify_native
from stats import calibration


class Driver:
    def __init__(self, output, seconds=3000):
        self.output = Path(output)
        self.started = time.monotonic()
        self.deadline = self.started + seconds
        self.records = []
        self.active = None

    def invoke(self, command, log, limit, **metadata):
        remaining = self.deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError('50-minute execution budget exhausted')
        record = dict(metadata, command=command, started_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
                      budget_remaining_start_s=remaining, log=str(log))
        self.records.append(record)
        save(self.output / 'commands.json', self.records)
        started = time.monotonic()
        with Path(log).open('w') as stream:
            self.active = subprocess.Popen(command, stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
            record['owned_process_group'] = self.active.pid
            save(self.output / 'commands.json', self.records)
            try:
                record['exit'] = self.active.wait(timeout=min(limit, remaining))
            except BaseException:
                try:
                    os.killpg(self.active.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                self.active.wait()
                raise
            finally:
                self.active = None
        record['elapsed_s_budget_only'] = time.monotonic() - started
        save(self.output / 'commands.json', self.records)
        while True:
            try:
                pid, status = os.waitpid(-1, os.WNOHANG)
            except ChildProcessError:
                break
            if pid == 0:
                # Only descendants of this driver can be its children/subreaped children.
                os.killpg(record['owned_process_group'], signal.SIGKILL)
                raise RuntimeError('Owned descendant still alive; HOLD, no next invocation')
        if record['exit']:
            raise RuntimeError('Invocation failed; no retry: ' + str(log))
        return Path(log).read_text()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--payload', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=False)
    for name in ['timing', 'diagnostics', 'preflight']:
        (args.output / name).mkdir()
    driver = Driver(args.output)
    (args.output / 'frozen-plan.json').write_bytes((HERE / 'frozen-plan.json').read_bytes())
    rows = schedule()
    save(args.output / 'fixed-schedule.json', rows)
    save(args.output / 'execution-budget.json', {'seconds': 3000, 'max_timing_forks': 196,
         'max_compiler_probes': 15, 'plan_sha256': PLAN_SHA, 'no_retry_or_extension': True,
         'experiment': 'matched-native-rebuild-v1', 'runner_sha256': sha(HERE / 'run.py')})
    completed = 0
    diagnostic_count = 0
    summary = {'status': 'HOLD: incomplete'}

    def interrupted(number, frame):
        raise InterruptedError('Signal ' + str(number) + '; no retry')
    signal.signal(signal.SIGTERM, interrupted)
    signal.signal(signal.SIGINT, interrupted)
    try:
        libc = ctypes.CDLL(None, use_errno=True)
        if libc.prctl(36, 1, 0, 0, 0):
            raise OSError(ctypes.get_errno(), 'owned subreaper setup failed')
        native = verify_native(args.payload)
        save(args.output / 'native-image-identity.json', native)
        metadata_count = 0
        def metadata_command(command, timeout):
            nonlocal metadata_count
            metadata_count += 1
            return driver.invoke(command, args.output / 'preflight' / f'host-{metadata_count:02}.log', timeout,
                                 phase='readiness', kind='host-metadata')
        metadata = host_metadata(metadata_command)
        save(args.output / 'preflight/host.json', metadata)
        require_host(metadata)
        cpu = metadata['affinity'][-1]  # Fixed before any score; no CPU selection by results.
        save(args.output / 'cpu-binding.json', {'CPU': cpu, 'ActiveProcessorCount': 2,
             'mapping': 'Highest allowed CPU, selected before scores; not an isolation claim'})
        counter = 0
        def capture(command, timeout):
            nonlocal counter
            counter += 1
            return driver.invoke(command, args.output / 'preflight' / f'elf-{counter:04}.log', timeout,
                                 phase='readiness', kind='ELF')
        check_elf(args.payload, args.output / 'preflight', capture)
        for arm in ['before', 'current', 'repair']:
            command = ['taskset', '-c', str(cpu), str(image(args.payload, arm) / 'bin/java'),
                       '-Xshare:off', '-Xmx64m', '-XX:ActiveProcessorCount=2', '-XX:+UseG1GC',
                       '-XX:+UnlockExperimentalVMOptions', '-XX:+UseFourByteObjectHeaders', '-cp',
                       str(args.payload / 'readiness'), 'ThreadProbe']
            text = driver.invoke(command, args.output / 'preflight' / (arm + '-threads.log'), 20,
                                 phase='readiness', arm=arm)
            if 'FOUR_THREADS_PASS' not in text:
                raise ValueError('Missing four-thread JVM readiness proof')
        save(args.output / 'preflight/PASS.json', {'exact_payload_verified': True,
             'ELF_resolution': 'PASS', 'three_JVM_four_thread_checks': 'PASS'})

        def timing(row):
            nonlocal completed
            command = timing_command(row, args.payload, args.output, cpu)
            driver.invoke(command, args.output / 'timing' / (row['tag'] + '.log'), 60, **row)
            data = json.loads((args.output / 'timing' / (row['tag'] + '.json')).read_text())
            expected = plan()['inputs'][row['input']]
            assert len(data) == 1
            item = data[0]
            assert item['benchmark'] == expected['benchmark'] and item.get('params', {}) == expected['params']
            assert item['forks'] == item['threads'] == 1
            assert len(item['primaryMetric']['rawData']) == 1
            assert len(item['primaryMetric']['rawData'][0]) == (3 if row['historical'] else 5)
            assert 'gc.alloc.rate.norm' in item['secondaryMetrics']
            completed += 1
            save(args.output / 'progress.json', {'completed_timing_forks': completed, 'maximum': 196,
                 'last_completed': row['tag'], 'budget_remaining_s': driver.deadline - time.monotonic()})

        def gate():
            cohorts = {arm: [] for arm in ['current', 'calibration']}
            for row in rows[:32]:
                if row['arm'] in cohorts:
                    data = json.loads((args.output / 'timing' / (row['tag'] + '.json')).read_text())[0]
                    cohorts[row['arm']].append(data['primaryMetric']['score'])
            result = calibration(cohorts['current'], cohorts['calibration'])
            result['scope'] = 'Only calibration/current inspected at this gate; no repair/original contrast.'
            save(args.output / 'phase-A-calibration.json', result)
            return result['pass']

        def diagnostic(row):
            nonlocal diagnostic_count
            case, input_name, mode, route, arm = row
            tag = 'diag-' + case + '-' + arm
            destination = args.output / 'diagnostics' / tag
            destination.mkdir()
            holder, method = plan()['inputs'][input_name]['benchmark'].rsplit('.', 1)
            support = args.payload / 'support'
            options = flags(mode, route).split() + ['-DcompilerBlackholesEnabled=true',
                '-XX:+UnlockDiagnosticVMOptions', '-XX:+WhiteBoxAPI', '-Xbootclasspath/a:' + str(support / 'whitebox'),
                '-XX:+LogCompilation', '-XX:LogFile=' + str(destination / 'compilation.xml'),
                '-XX:+PrintCompilation', '-XX:+PrintInlining', '-XX:CompileCommandFile=' + str(support / 'compiler-hints.txt'),
                '-XX:CompileCommand=print,' + holder + '::' + method,
                '-XX:CompileCommand=print,java.math.BigDecimal::valueOf',
                '-XX:CompileCommand=print,jdk.internal.math.FormattedFPDecimal::valueForDoubleToString']
            command = ['taskset', '-c', str(cpu), str(image(args.payload, arm) / 'bin/java')] + options
            command += ['-cp', str(support / 'probe-classes') + ':' + str(support / 'whitebox') + ':' + classpath(args.payload),
                        'CodeInputsProbe', input_name, '1' if mode == 'c1' else '4']
            text = driver.invoke(command, destination / 'output.log', 40, phase='diagnostic', tag=tag)
            assert 'DIAG_PASS' in text
            assert 'DIAG_ROOT_INSTALLED input=' + input_name + ' level=' + ('1' if mode == 'c1' else '4') in text
            diagnostic_count += 1
        count, probes = execute_protocol(timing, gate, diagnostic)
        if time.monotonic() > driver.deadline:
            raise TimeoutError('50-minute execution budget exhausted')
        summary['status'] = ('HOLD: long unchanged-image calibration failed; remaining runtime phases stopped as frozen'
                             if count == 32 else 'Completed all fixed observations; qualification pending offline analysis')
        summary['all_executed_exit_zero'] = True
    except BaseException as error:
        summary['error'] = repr(error)
        raise
    finally:
        summary.update(timing_forks=completed, maximum=196, diagnostic_processes=diagnostic_count,
                       elapsed_execution_s=time.monotonic() - driver.started, cap_seconds=3000,
                       unexecuted_fixed_forks=196 - completed, no_retry_or_extension=True)
        save(args.output / 'completion.json', summary)


if __name__ == '__main__':
    main()
