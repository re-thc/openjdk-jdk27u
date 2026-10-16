# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Synthetic fixed-file replay; no workload, child process or live procfs scan."""
import json
from pathlib import Path
import tempfile
import time
from diagnostic import output_size
from observer import BoundSampler, Costs
from test_observer import fixture


def replay(count=600):
    with tempfile.TemporaryDirectory() as directory:
        root = Path(directory)
        proc, cg, coordinator, fork, thread = fixture(root)
        # Representative text sizes, deliberately synthetic (no host dump).
        (proc / 'stat').write_text('cpu  10 0 1 100 0 0 0 0 0 0\n' + '# synthetic context\n' * 75)
        sched = proc / '20/task/21/sched'
        sched.write_text(sched.read_text() + 'synthetic.other : 0\n' * 100)
        sampler = BoundSampler(coordinator, fork, thread, proc, cg)
        # Disk writes match the controller (buffered); no per-tick fsync.
        path = root / 'samples.jsonl'
        capped = [path] + [root / name for name in ('stdout', 'stderr', 'result.json', 'hotspot_pid20.xml', 'gc_20.log', 'binding.txt')]
        for file in capped[1:]:
            file.write_text('synthetic output')
        costs = Costs()
        cpu, wall = time.process_time_ns(), time.monotonic_ns()
        try:
            with path.open('w') as stream:
                for _ in range(count):
                    sample = costs.measure('bound_reads', sampler.sample)
                    costs.measure('encode_write', lambda: stream.write(json.dumps(sample) + '\n'))
                    costs.measure('output_cap', output_size, capped)
        finally:
            sampler.close()
        elapsed_cpu, elapsed_wall = time.process_time_ns() - cpu, time.monotonic_ns() - wall
        return {'kind': 'synthetic filesystem replay, not runtime qualification',
                'samples': count, 'nominal_50Hz_duration_ns': count * 20_000_000,
                'cpu_ns': elapsed_cpu, 'wall_ns': elapsed_wall,
                'cpu_fraction_of_nominal_50Hz': elapsed_cpu / (count * 20_000_000),
                'stages': costs.stages,
                'limits': 'Synthetic files do not reproduce procfs kernel cost, scheduling delay, resource contention, or timer wakeup overhead.'}


if __name__ == '__main__':
    print(json.dumps(replay(), indent=2))
