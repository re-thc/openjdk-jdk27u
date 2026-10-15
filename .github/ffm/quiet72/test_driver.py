"""Offline outcome/protocol fixtures. No JVM/native execution."""
import copy
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import driver


class QuietFixtures(unittest.TestCase):
    def rows(self, cost=0.99):
        value = driver.plan()
        rows = []
        for slot in value['slots']:
            count = value['calls_per_batch'][slot['tier']]
            duration = round(count * 100 * (cost if slot['label'] == 'a' else 1))
            rows.append(dict(slot, returncode=0, metrics=dict(mode='unbound', count=count, warm=30,
                        sink=count*(count-1)//2, wall_ns=[duration]*10, cpu_ns=[duration]*10)))
        return rows

    def test_fixed_72_slots(self):
        self.assertEqual(len(driver.plan()['slots']), 72)

    def test_rerun_or_injected_options_rejected(self):
        for env in ({'GITHUB_RUN_ATTEMPT': '2'}, {'JAVA_TOOL_OPTIONS': '-Xint'}, {'LD_PRELOAD': '/unexpected'}):
            with self.subTest(env=env), patch.object(driver.platform, 'system', return_value='Linux'), \
                    patch.object(driver.platform, 'machine', return_value='x86_64'), \
                    patch.object(driver.os, 'getuid', return_value=1001), \
                    patch.object(driver.os, 'sched_getaffinity', return_value={0}), \
                    patch.object(Path, 'read_text', return_value='GenuineIntel'), \
                    patch.dict(driver.os.environ, env, clear=True):
                with self.assertRaises(ValueError): driver.native()

    def test_even_half_percent_slowdown_holds(self):
        report = driver.assess(self.rows(1.005), driver.plan())
        self.assertEqual(report['status'], 'HELD_CANDIDATE_SLOWDOWN')
        self.assertEqual(len(report['consistent_slowdown_signals']), 4)
        self.assertFalse(report['shipping_qualified'])

    def test_sign_rule_holds_despite_fast_outlier(self):
        rows = self.rows(1)
        for row in rows:
            if row['label'] == 'a':
                cost = 1.001 if row['block'] < 9 else 0.9
                for name in ('wall_ns', 'cpu_ns'):
                    row['metrics'][name] = [round(x*cost) for x in row['metrics'][name]]
        report = driver.assess(rows, driver.plan())
        self.assertEqual(report['status'], 'HELD_CANDIDATE_SLOWDOWN')
        self.assertTrue(all(len(s['jointly_slower_blocks']) == 9 for s in report['consistent_slowdown_signals']))

    def test_control_failure_takes_priority(self):
        rows = self.rows(1.005)
        for row in rows:
            if row['label'] == 'control':
                for name in ('wall_ns', 'cpu_ns'):
                    row['metrics'][name] = [round(x*1.11) for x in row['metrics'][name]]
        self.assertEqual(driver.assess(rows, driver.plan())['status'], 'STOPPED_CONTROL_FAILURE')

    def test_negative_uncertain_result_is_not_equivalence(self):
        rows = self.rows(1)
        for row in rows:
            if row['label'] == 'a':
                cost = 1.01 if row['block'] < 8 else 0.99
                for name in ('wall_ns', 'cpu_ns'):
                    row['metrics'][name] = [round(x*cost) for x in row['metrics'][name]]
        self.assertEqual(driver.assess(rows, driver.plan())['status'], 'INCONCLUSIVE_REVIEW_REQUIRED')

    def test_improvement_still_cannot_qualify_shipping(self):
        report = driver.assess(self.rows(), driver.plan())
        self.assertEqual(report['status'], 'CONTROLS_PASSED_REVIEW_REQUIRED')
        self.assertFalse(report['shipping_qualified'])

    def test_invalid_or_partial_observations_rejected(self):
        for mutation in ('missing', 'duplicate', 'failed', 'checksum', 'samples', 'nan'):
            with self.subTest(mutation=mutation):
                rows = self.rows()
                if mutation == 'missing': rows.pop()
                if mutation == 'duplicate': rows[5] = copy.deepcopy(rows[4])
                if mutation == 'failed': rows[0]['returncode'] = 1
                if mutation == 'checksum': rows[0]['metrics']['sink'] = 0
                if mutation == 'samples': rows[0]['metrics']['cpu_ns'].pop()
                if mutation == 'nan': rows[0]['metrics']['wall_ns'][0] = float('nan')
                with self.assertRaises(ValueError): driver.assess(rows, driver.plan())

    def collection(self, failure):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        out = Path(temp.name)/'output'
        with patch.object(driver, 'native'), patch.object(driver, 'verify_inputs', return_value={}):
            driver.preflight(out)
            records = {}
            for label in ('base', 'a'):
                image = out/'images'/label
                (image/'bin').mkdir(parents=True); (image/'lib').mkdir()
                header = bytearray(20); header[:6] = b'\x7fELF\x02\x01'; header[18] = 62
                (image/'bin/java').write_bytes(header)
                (image/'lib/modules').write_bytes(label.encode())
                for i in range(38): (image/'lib'/('lib%d.so'%i)).write_bytes(b'native')
                native = {str(p.relative_to(image)): driver.sha(p) for p in image.rglob('*')
                          if p.is_file() and (p.name=='java' or '.so' in p.name)}
                records[label] = dict(native_hashes=native, modules_sha256=driver.sha(image/'lib/modules'))
            driver.save(out/'images.json', records)
            (out/'classes').mkdir()
            for name in ('Steady.java', 'native.c', 'libprobe.so', 'classes/Steady.class'):
                (out/name).write_bytes(b'fixture')
            calls = []
            def fake(command, **kwargs):
                index = len(calls); calls.append(command)
                if index == 5 and failure == 'timeout':
                    raise subprocess.TimeoutExpired(command, 180, output=b'partial out', stderr=b'partial err')
                row = self.rows()[index]
                return subprocess.CompletedProcess(command, 7 if index==5 and failure=='exit' else 0,
                       json.dumps(row['metrics'])+'\n', 'saved stderr')
            with patch.object(driver.subprocess, 'run', side_effect=fake), patch('builtins.print'):
                if failure:
                    with self.assertRaises(RuntimeError): driver.collect(out)
                    self.assertEqual(len(calls), 6)
                    self.assertEqual(len((out/'quiet72/retained.jsonl').read_text().splitlines()), 6)
                    saved=json.loads(next((out/'quiet72').glob('05-*/result.json')).read_text())
                    self.assertIn('partial' if failure=='timeout' else 'saved', saved['stderr'])
                    self.assertFalse((out/'quiet72/status.json').exists())
                else:
                    driver.collect(out)
                    self.assertEqual(len(calls), 72)
                    self.assertTrue((out/'quiet72/status.json').exists())

    def test_complete_simulated_workflow_preserves_72(self): self.collection(None)
    def test_failed_fork_stops_without_retry(self): self.collection('exit')
    def test_timeout_retains_partial_output_without_retry(self): self.collection('timeout')


if __name__ == '__main__': unittest.main(verbosity=2)
