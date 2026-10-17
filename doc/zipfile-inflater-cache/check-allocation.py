#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Check retained containers and native reuse before uninstrumented timing."""
import json
from pathlib import Path
import re
import sys

if not __debug__:
    raise RuntimeError('Run without Python -O: allocation gates use assertions')

root = Path(sys.argv[1])
summary = []
for gc in ('Serial', 'G1', 'Z'):
    footprint = {}
    for policy in ('base', 'candidate'):
        rows = [json.loads(line) for line in (root / f'{policy}-{gc}-footprint.log')
                .read_text().splitlines() if line.startswith('{')]
        assert len(rows) == 3, 'Incomplete footprint output'
        footprint[policy] = {row['case']: row for row in rows}
        assert set(footprint[policy]) == {'unused', 'serial', 'overlap8'}
    for case in ('unused', 'serial', 'overlap8'):
        before, after = footprint['base'][case], footprint['candidate'][case]
        expected_inflaters = {'unused': 0, 'serial': 32, 'overlap8': 256}[case]
        assert before['files'] == after['files'] == 32
        assert before['resourceBytes'] == after['resourceBytes'], 'Resource object grew'
        assert before['inflaters'] == after['inflaters'] == expected_inflaters, 'Inflater reuse changed'
        assert before['idle'] == after['idle'] == expected_inflaters, 'Retained inflater count changed'
        assert before['retainedContainers'] == (32 if case == 'unused' else 64)
        assert before['retainedContainerBytes'] > 0, 'Baseline saving was not demonstrated'
        if case == 'overlap8':
            for key in ('retainedContainers', 'retainedContainerBytes', 'observedContainers'):
                assert before[key] == after[key], 'Promoted storage changed'
        else:
            assert after['retainedContainers'] == after['retainedContainerBytes'] == 0
            assert after['observedContainers'] == 0, 'Transient singleton container'
        summary.append(dict(gc=gc, case=case, before=before, after=after))
    for width in (1, 32):
        samples = {}
        for policy in ('base', 'candidate'):
            output = (root / f'{policy}-{gc}-native{width}.log').read_text()
            assert re.search(r'\bcreated=0\b', output), 'Native replacement churn'
            stages = {}
            for stage, opened, requested, blocks in re.findall(
                    r'^(\S+) open=(\d+) native-requested=(\d+) diagnostic-usable=\d+ allocations=(\d+)$',
                    output, re.MULTILINE):
                stages[stage] = tuple(map(int, (opened, requested, blocks)))
            assert set(stages) == {'unread', 'read', 'idle', 'repeated-idle', 'zip-closed'}
            assert stages['zip-closed'] == (0, 0, 0), 'Native state survived close'
            for stage in ('unread', 'read', 'idle', 'repeated-idle'):
                assert stages[stage][0] == width, 'Inflater was discarded'
            assert stages['read'] == stages['idle'] == stages['repeated-idle']
            samples[policy] = stages
        assert samples['base'] == samples['candidate'], 'Native retention changed'
        summary.append(dict(gc=gc, width=width, native=samples))
(root / 'allocation-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Container and native reuse gates passed')
