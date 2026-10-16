# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
import unittest
from diagnostic import WORKER, log_pid, stat_identity, window_bounds, analyze


def sample(t, cpu=None, wait=None):
    return {'before_ns': t, 'after_ns': t + 1000, 'tid': 7, 'start': 50,
            'runtime_ns': t // 2 if cpu is None else cpu,
            'wait_ns': t // 4 if wait is None else wait, 'timeslices': t // 1000000,
            'se.nr_migrations': 0, 'nr_switches': t // 1000000,
            'nr_voluntary_switches': 0, 'nr_involuntary_switches': t // 1000000}


class BoundsTests(unittest.TestCase):
    def setUp(self):
        self.samples = [sample(x * 20_000_000) for x in range(10)]

    def test_conservative_deltas(self):
        b = window_bounds(self.samples, 35_000_000, 145_000_000)
        self.assertEqual(b['runtime_ns'], [50_000_000, 70_000_000])
        self.assertEqual(b['wait_ns'], [25_000_000, 35_000_000])

    def test_gap(self):
        with self.assertRaisesRegex(ValueError, 'gap'):
            window_bounds(self.samples[:4] + self.samples[5:], 35_000_000, 145_000_000)

    def test_reset(self):
        self.samples[4]['runtime_ns'] = 0
        with self.assertRaisesRegex(ValueError, 'reset'):
            window_bounds(self.samples, 35_000_000, 145_000_000)

    def test_reuse(self):
        self.samples[4]['start'] = 51
        with self.assertRaisesRegex(ValueError, 'recycled'):
            window_bounds(self.samples, 35_000_000, 145_000_000)

    def test_slow_acquisition(self):
        self.samples[4]['after_ns'] += 6_000_000
        with self.assertRaisesRegex(ValueError, 'acquisition'):
            window_bounds(self.samples, 35_000_000, 145_000_000)

    def test_unbracketed(self):
        with self.assertRaisesRegex(ValueError, 'unbracketed'):
            window_bounds(self.samples, -1, 145_000_000)

    def test_pid_formats(self):
        self.assertEqual(log_pid('hotspot_pid752198.xml', 'gc_752198.log'), 752198)
        for xml, gc in [('hotspot_752198.xml', 'gc_752198.log'),
                        ('hotspot_pid752198.xml', 'gc_pid752198.log'),
                        ('hotspot_pid0.xml', 'gc_0.log'),
                        ('hotspot_pid１２.xml', 'gc_１２.log')]:
            with self.assertRaises(ValueError):
                log_pid(xml, gc)

    def test_framing_and_measurement_brackets(self):
        prefix = 'org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit'
        rows = ['NIO_WINDOWS_BEGIN benchmark=' + prefix + ' count=12']
        samples = [sample(x * 20_000_000) for x in range(700)]
        for i in range(12):
            start = 100_000_000 + i * 1_100_000_000
            stop = start + 1_000_000_000
            rows.append(f'NIO_WINDOW benchmark={prefix} iteration={i} uptime_before_ms={start//1000000} nano_before={start} compiler_before_ms=0 gc_before=0 nano_after={stop} uptime_after_ms={stop//1000000} compiler_after_ms=0 gc_after=0')
        rows.append('NIO_WINDOWS_END benchmark=' + prefix + ' count=12')
        self.assertEqual(len(analyze('\n'.join(rows), samples)), 12)
        with self.assertRaises(ValueError):
            analyze('\n'.join(rows[:-1]), samples)
        with self.assertRaises(ValueError):
            analyze('\n'.join(rows), samples[:500])

    def test_linux_worker_name(self):
        name = 'org.openjdk.bench.nioqual.NioCachePaths.ordinaryHit-jmh-worker-1'
        self.assertEqual(name[:7] + '..' + name[-6:], WORKER)

    def test_stat_with_parentheses(self):
        fields = ['S'] + ['0'] * 36
        fields[19] = '123'
        fields[36] = '4'
        self.assertEqual(stat_identity('7 (has ) parentheses) ' + ' '.join(fields)),
                         {'start': 123, 'cpu': 4, 'state': 'S'})


if __name__ == '__main__':
    unittest.main()
