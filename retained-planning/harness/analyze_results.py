#!/usr/bin/env python3
"""Offline A/E/U paired whole-sort and sort-thread allocation analysis.

This module never imports the process controller and never launches children.
"""
from __future__ import annotations

import csv
import json
import math
import statistics
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROLES = {'A', 'E', 'U'}
PAIRS = (('E', 'A'), ('U', 'A'), ('U', 'E'))
HISTORIES = (0, 3, 4, 5)
MEASURED = 16
CONDITIONING = 8
WARMUPS = 20
CSV_HEADER = ['kind', 'phase', 'history', 'case_id', 'size', 'pattern', 'ordinal',
              'sort_ns', 'reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes']


def percentile(values, p):
    values = sorted(values)
    if not values:
        return None
    x = (len(values) - 1) * p
    lo, hi = math.floor(x), math.ceil(x)
    if lo == hi:
        return values[lo]
    return values[lo] * (hi - x) + values[hi] * (x - lo)


def case_schedule(history, cases):
    if len(cases) != 32:
        raise ValueError(f'expected 32 cases, got {len(cases)}')
    original = cases[:18]
    return [original[(i + 3 * history) % 18] for i in range(18)] + cases[18:]


def validate_records(rows, history, cases):
    expected = [(0, -1, 1048576, 'random', i) for i in range(WARMUPS)]
    for cid, (size, pattern) in enumerate(case_schedule(history, cases)):
        expected.extend((1, cid, size, pattern, i) for i in range(CONDITIONING))
        expected.extend((2, cid, size, pattern, i) for i in range(MEASURED))
    if len(rows) != len(expected):
        raise ValueError(f'expected {len(expected)} records, found {len(rows)}')
    for i, (row, want) in enumerate(zip(rows, expected)):
        actual = (int(row['phase']), int(row['case_id']), int(row['size']),
                  row['pattern'], int(row['ordinal']))
        if actual != want or int(row['history']) != history:
            raise ValueError(f'record {i}: identity {actual} != {want}')
        if row['kind'] != 'SORT':
            raise ValueError(f'record {i}: unexpected kind {row["kind"]!r}')
        for key in ('sort_ns', 'reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes'):
            value = int(row[key])
            if value < 0 or (key == 'sort_ns' and value == 0):
                raise ValueError(f'record {i}: invalid {key}={value}')
    return expected


def median_slot(rows, cases, history, strict=True):
    if strict:
        validate_records(rows, history, cases)
    measured = defaultdict(lambda: defaultdict(list))
    for row in rows:
        if int(row['phase']) != 2:
            continue
        key = (int(row['size']), row['pattern'])
        for field in ('sort_ns', 'reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes'):
            measured[key][field].append(int(row[field]))
    expected = set(cases)
    if set(measured) != expected:
        raise ValueError('measured case set differs from proposal')
    result = {}
    for key, metrics in measured.items():
        if any(len(metrics[f]) != MEASURED for f in metrics):
            raise ValueError(f'{key}: expected {MEASURED} measured samples')
        result[key] = {field: statistics.median(values) for field, values in metrics.items()}
        result[key]['total_alloc_bytes'] = sum(result[key][f] for f in
            ('reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes'))
    return result


def paired_contrasts(slots, per_slot, cases):
    by_triplet = defaultdict(dict)
    hist_by_triplet = {}
    for slot in slots:
        group = int(slot['group'])
        role = slot['role']
        if role not in ROLES or role in by_triplet[group]:
            raise ValueError(f'invalid/duplicate role {role} in triplet {group}')
        by_triplet[group][role] = per_slot[int(slot['slot'])]
        if group in hist_by_triplet and hist_by_triplet[group] != int(slot['history']):
            raise ValueError(f'triplet {group} mixes histories')
        hist_by_triplet[group] = int(slot['history'])
    if len(by_triplet) != 12:
        raise ValueError(f'expected 12 triplets, got {len(by_triplet)}')
    history_counts = Counter(hist_by_triplet.values())
    if set(history_counts) != set(HISTORIES) or any(
            history_counts[h] != 3 for h in HISTORIES):
        raise ValueError('expected three triplets per history')
    rows = []
    for group, roles in sorted(by_triplet.items()):
        if set(roles) != ROLES:
            raise ValueError(f'incomplete triplet {group}: {sorted(roles)}')
        for size, pattern in cases:
            key = (size, pattern)
            for num, den in PAIRS:
                a, b = roles[num][key], roles[den][key]
                ratio = a['sort_ns'] / b['sort_ns']
                row = {'triplet': group, 'history': hist_by_triplet[group],
                       'size': size, 'pattern': pattern, 'numerator': num,
                       'denominator': den, 'numerator_median_ns': a['sort_ns'],
                       'denominator_median_ns': b['sort_ns'], 'ratio': ratio,
                       'percent_delta': 100 * (ratio - 1),
                       'delta_ns': a['sort_ns'] - b['sort_ns']}
                for name in ('reset_alloc_bytes', 'sort_alloc_bytes',
                             'validation_alloc_bytes', 'total_alloc_bytes'):
                    row['numerator_' + name] = a[name]
                    row['denominator_' + name] = b[name]
                    row[name.replace('_bytes', '_delta_bytes')] = a[name] - b[name]
                rows.append(row)
    if len(rows) != 12 * len(cases) * len(PAIRS):
        raise ValueError('contrast count mismatch')
    return rows


def summarize(group):
    ratios = [r['ratio'] for r in group]
    pcts = [r['percent_delta'] for r in group]
    deltas = [r['delta_ns'] for r in group]
    result = {
        'n': len(group),
        'median_ratio': statistics.median(ratios),
        'geometric_mean_ratio': math.exp(statistics.mean(math.log(x) for x in ratios)),
        'ratio_iqr': percentile(ratios, .75) - percentile(ratios, .25),
        'median_percent_delta': statistics.median(pcts),
        'percent_delta_iqr': percentile(pcts, .75) - percentile(pcts, .25),
        'percent_delta_min': min(pcts), 'percent_delta_max': max(pcts),
        'median_delta_ns': statistics.median(deltas),
        'delta_iqr_ns': percentile(deltas, .75) - percentile(deltas, .25),
        'delta_min_ns': min(deltas), 'delta_max_ns': max(deltas),
        'faster_count': sum(x < 1 for x in ratios),
    }
    for field in ('reset_alloc_delta_bytes', 'sort_alloc_delta_bytes',
                  'validation_alloc_delta_bytes', 'total_alloc_delta_bytes'):
        xs = [r[field] for r in group]
        result['median_' + field] = statistics.median(xs)
        result[field + '_iqr'] = percentile(xs, .75) - percentile(xs, .25)
        result[field + '_min'] = min(xs)
        result[field + '_max'] = max(xs)
    return result


def build_summaries(rows):
    groups = defaultdict(list)
    for row in rows:
        pair = row['numerator'] + '/' + row['denominator']
        size, pattern, hist = row['size'], row['pattern'], row['history']
        groups[(pair, 'all', 'ALL', 'ALL')].append(row)
        groups[(pair, f'history-{hist}', 'ALL', 'ALL')].append(row)
        groups[(pair, 'all', size, pattern)].append(row)
        groups[(pair, f'history-{hist}', size, pattern)].append(row)
    out = []
    for (pair, scope, size, pattern), group in sorted(groups.items(), key=lambda x: tuple(map(str, x[0]))):
        out.append({'contrast': pair, 'scope': scope, 'size': size,
                    'pattern': pattern, **summarize(group)})
    return out


def read_collection(directory):
    directory = Path(directory)
    frozen = json.loads((directory / 'FROZEN.json').read_text())
    prepared = frozen['prepared']
    if frozen.get('proposal_sha256') != prepared.get('proposal_sha256'):
        raise ValueError('FROZEN proposal identity differs from prepared manifest')
    cases = [(int(c['longs']), c['pattern']) for c in prepared['cases']]
    slots = prepared['slots']
    if len(slots) != 36 or len(cases) != 32:
        raise ValueError('frozen collection has wrong slot/case count')
    current = json.loads((directory / 'CURRENT.json').read_text())
    if current.get('state') != 'finished':
        raise ValueError('collection lacks a finished terminal state')
    events = [json.loads(line) for line in (directory / 'events.jsonl').read_text().splitlines()]
    if len(events) != 2 * len(slots) + 1 or events[-1].get('state') != 'finished':
        raise ValueError('event journal is incomplete or not terminally finished')
    per_slot = {}
    for slot in slots:
        stem = directory / f"{int(slot['slot']):02d}-{slot['role']}"
        receipt_path = stem.with_suffix('.receipt.json')
        csv_path = stem.with_suffix('.csv')
        receipt = json.loads(receipt_path.read_text())
        if (receipt.get('state') != 'complete' or receipt.get('slot') != slot
                or receipt.get('exit_code') != 0 or receipt.get('protocol_stages') != 3
                or receipt.get('data', {}).get('valid') is not True):
            raise ValueError(f'incomplete or mismatched receipt: {receipt_path}')
        if receipt.get('data', {}).get('csv_sha256') != _sha(csv_path):
            raise ValueError(f'CSV hash mismatch: {csv_path}')
        with csv_path.open(newline='') as f:
            reader = csv.DictReader(f)
            if reader.fieldnames != CSV_HEADER:
                raise ValueError(f'unexpected CSV header: {csv_path}')
            rows = list(reader)
        per_slot[int(slot['slot'])] = median_slot(rows, cases, int(slot['history']))
    return frozen, slots, cases, per_slot


def _sha(path):
    import hashlib
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def analyze(directory, out):
    frozen, slots, cases, per_slot = read_collection(directory)
    prepared = frozen['prepared']
    rows = paired_contrasts(slots, per_slot, cases)
    out = Path(out)
    out.mkdir(parents=True, exist_ok=False)
    median_rows = []
    for slot in slots:
        for (size, pattern), metrics in sorted(per_slot[int(slot['slot'])].items()):
            median_rows.append({'slot': int(slot['slot']), 'triplet': int(slot['group']),
                                'history': int(slot['history']), 'role': slot['role'],
                                'size': size, 'pattern': pattern, **metrics})
    with (out / 'ALL-JVM-CASE-MEDIANS.csv').open('w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=list(median_rows[0]))
        writer.writeheader()
        writer.writerows(median_rows)
    with (out / 'ALL-PAIRED-CONTRASTS.csv').open('w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0]))
        writer.writeheader(); writer.writerows(rows)
    summaries = build_summaries(rows)
    with (out / 'ALL-SUMMARIES.csv').open('w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=list(summaries[0]))
        writer.writeheader(); writer.writerows(summaries)
    report = {
        'scope': 'New fixed 12-triplet A/E/U comparison; each pair uses per-JVM median of 16 measured complete public range calls.',
        'pairs': [a + '/' + b for a, b in PAIRS],
        'cases': len(cases), 'triplets': len({s['group'] for s in slots}),
        'contrast_rows': len(rows), 'summaries': summaries,
        'timer_scope': 'Arrays.sort(long[],low,high) call only; reset and independent signed-radix oracle checks are outside the timer.',
        'allocation_scope': 'Sort-thread reset, sort, and validation allocation counters are reported separately and summed per call; these are not process/native/worker peak allocation.',
        'system_effects': 'Resource observations are descriptive snapshots; they do not attribute RSS or latency changes to a particular component.',
        'role_identity': {
            role: {key: prepared['role_bindings'][role].get(key) for key in
                   ('source_commit', 'source_tree_sha256', 'backend',
                    'build_receipt_sha256', 'toolchain_sha256', 'configuration_sha256',
                    'java_hotspot_sha256', 'java_overlay_sha256', 'range_dso_path',
                    'range_dso_sha256')}
            for role in ('A', 'E', 'U')
        },
        'activation_limit': 'BOOT/READY/DONE maps show loaded mappings only; they do not prove a native entry executed for each measured call.',
        'ordinary_activation_review_sha256': prepared.get('activation_review_sha256'),
        'gc_limit': 'There is no explicit GC request. Natural GC may occur; this harness does not attribute pauses or claim a latency bound.',
        'no_pooling': 'Only this frozen collection is analyzed; prior Intel, AMD, Highway, Rust, snapshot and scalar records are not loaded or pooled.',
        'limitations': 'Three triplets per history are sparse. Descriptive contrasts do not establish all-platform adoption or latency bounds.',
        'collection_frozen_sha256': _sha(Path(directory) / 'FROZEN.json'),
    }
    (out / 'SUMMARY.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def self_test():
    cases = [(512 + i, 'random' if i % 2 == 0 else 'reverse') for i in range(32)]
    slots = []
    per = {}
    # Twelve triplets exercise real history balancing and all three matched
    # contrasts. Each role has sixteen synthetic samples whose median is exact.
    histories = [0, 3, 4, 5] * 3
    bases = {'A': (100, 1000), 'E': (120, 1080), 'U': (80, 920)}
    for group in range(12):
        history = histories[group]
        for position, role in enumerate(('A', 'E', 'U')):
            slot = {'slot': len(slots), 'group': group, 'history': histories[group],
                    'position': position, 'role': role}
            slots.append(slot)
            duration, alloc = bases[role]
            times = [duration] * 16
            per_case = {}
            for size, pattern in cases:
                per_case[(size, pattern)] = {
                    'sort_ns': statistics.median(times),
                    'reset_alloc_bytes': alloc // 4,
                    'sort_alloc_bytes': alloc // 4,
                    'validation_alloc_bytes': alloc // 2,
                    'total_alloc_bytes': alloc,
                }
            per[slot['slot']] = per_case
    rows = paired_contrasts(slots, per, cases)
    assert len(rows) == 12 * len(cases) * len(PAIRS)
    ea = [r for r in rows if r['numerator'] == 'E' and r['denominator'] == 'A']
    assert len(ea) == 12 * len(cases)
    assert all(round(r['ratio'], 6) == 1.2 for r in ea)
    assert all(r['delta_ns'] == 20 for r in ea)
    assert all(r['total_alloc_delta_bytes'] == 80 for r in ea)
    summary = summarize(ea)
    assert summary['n'] == 12 * len(cases) and summary['faster_count'] == 0
    assert summary['median_delta_ns'] == 20 and summary['delta_iqr_ns'] == 0
    assert summary['median_total_alloc_delta_bytes'] == 80
    assert summary['total_alloc_delta_bytes_iqr'] == 0
    # Introduce known per-triplet variation and verify spread is retained.
    varied = [dict(r) for r in ea]
    for i, r in enumerate(varied):
        if r['triplet'] == 0:
            r['delta_ns'] += 100
            r['percent_delta'] += 100
            r['ratio'] += 1
    assert summarize(varied)['delta_max_ns'] == 120
    # Parser rejection on phase/ordinal corruption is also process-free.
    fake = []
    for i in range(20):
        fake.append(dict(kind='SORT', phase='0', history='0', case_id='-1', size='1048576',
                         pattern='random', ordinal=str(i), sort_ns='10', reset_alloc_bytes='0',
                         sort_alloc_bytes='0', validation_alloc_bytes='0'))
    for cid, (size, pattern) in enumerate(cases):
        for phase, count in ((1, CONDITIONING), (2, MEASURED)):
            for i in range(count):
                fake.append(dict(kind='SORT', phase=str(phase), history='0', case_id=str(cid),
                                 size=str(size), pattern=pattern, ordinal=str(i), sort_ns='10',
                                 reset_alloc_bytes='0', sort_alloc_bytes='0', validation_alloc_bytes='0'))
    validate_records(fake, 0, cases)
    corrupted = list(fake)
    corrupted[-1] = dict(corrupted[-1], ordinal='999')
    try:
        validate_records(corrupted, 0, cases)
    except ValueError:
        pass
    else:
        raise AssertionError('corrupt sample accepted')
    # Bad history balance and incomplete triplets must also fail closed.
    bad_slots = [dict(s) for s in slots]
    bad_slots[-1]['history'] = 0
    try:
        paired_contrasts(bad_slots, per, cases)
    except ValueError:
        pass
    else:
        raise AssertionError('unbalanced history accepted')
    print('PASS offline 12-triplet medians, matched ratios/deltas, allocation scopes, spread, and corruption rejection')


if __name__ == '__main__':
    if sys.argv[1:] == ['--self-test']:
        self_test()
    elif len(sys.argv) == 3:
        analyze(sys.argv[1], sys.argv[2])
    else:
        raise SystemExit('usage: analyze_results.py COLLECTION_DIR NEW_ANALYSIS_DIR | --self-test')
