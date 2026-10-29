import collections
import csv
import gzip
import json
from pathlib import Path
import statistics
import xml.etree.ElementTree as ET

out = Path(__file__).resolve().parent
forks = json.loads((out / 'forks.json').read_text())
assert [(r['policy'], r['variant']) for r in forks] == [
    ('normal', 'A'), ('normal', 'B'), ('control', 'B'), ('control', 'A'),
    ('normal', 'B'), ('normal', 'A'), ('control', 'A'), ('control', 'B')]
logs = {p.name.removesuffix('.gz') for p in (out / 'compilation').glob('*.xml*')}
assert len(forks) == len(logs) == 8
observations = []
for fork in forks:
    path = out / fork['compilation']
    if path.exists():
        root = ET.parse(path).getroot()
    else:
        with gzip.open(str(path) + '.gz', 'rb') as compressed:
            root = ET.fromstring(compressed.read())
    assert root.get('process') == fork['pid']
    nmethods = {e.get('compile_id'): e for e in root.iter('nmethod')}
    item = {'name': fork['name'], 'pid': fork['pid'], 'policy': fork['policy'],
            'variant': fork['variant'], 'allocation_events': [], 'lock_events': [],
            'header_inlining': [], 'gzip_c2_nmethods': [], 'inflate_intrinsic_records': 0,
            'global_elimination_tags': dict(collections.Counter(e.tag for e in root.iter()
                if e.tag.startswith('eliminate_')))}
    for task in root.iter('task'):
        definitions = {e.get('id'): e for e in task.iter() if e.tag in ['klass', 'type', 'method']}
        def method_name(method_id):
            method = definitions.get(method_id)
            if method is None:
                return '?' + str(method_id)
            holder = definitions.get(method.get('holder'))
            return (holder.get('name') if holder is not None else '?') + '::' + method.get('name', '?')
        def scopes(event):
            return [{'method': method_name(e.get('method')), 'bci': e.get('bci')}
                    for e in event.iter('jvms')]
        for event in task.iter():
            if event.tag == 'eliminate_allocation':
                cls = definitions.get(event.get('type'))
                item['allocation_events'].append({'compile_id': task.get('compile_id'),
                    'task': task.get('method'), 'class': cls.get('name') if cls is not None else event.get('type'),
                    'scopes': scopes(event)})
            if event.tag.startswith('eliminate_lock'):
                item['lock_events'].append({'compile_id': task.get('compile_id'),
                    'task': task.get('method'), 'tag': event.tag, 'attributes': event.attrib,
                    'scopes': scopes(event)})
            if event.tag == 'intrinsic' and event.get('id') == '_inflateBytesBytes':
                item['inflate_intrinsic_records'] += 1
        def visit(parent):
            last = ''
            for child in parent:
                if child.tag == 'call':
                    last = method_name(child.get('method'))
                if child.tag in ['inline_success', 'inline_fail'] and last.endswith('GZIPInputStream::readHeader'):
                    item['header_inlining'].append({'compile_id': task.get('compile_id'),
                        'caller': task.get('method'), 'decision': child.tag, 'reason': child.get('reason')})
                visit(child)
        visit(task)
    for method in nmethods.values():
        name = method.get('method', '')
        if method.get('compiler') == 'c2' and any(term in name for term in
            ['GZIPLifecycle gzip ', 'GZIPInputStream readHeader ', 'GZIPInputStream read ',
             'InflaterInputStream read ', 'Inflater inflate ']):
            item['gzip_c2_nmethods'].append({key: method.get(key) for key in
                ['compile_id', 'compile_kind', 'method', 'stamp', 'size']})
    observations.append(item)
(out / 'compiler-observations.json').write_text(json.dumps(observations, indent=2) + '\n')

with (out / 'per-fork.csv').open('w') as file:
    writer = csv.writer(file, lineterminator='\n')
    writer.writerow(['sequence', 'pair', 'policy', 'variant', 'pid', 'fork_median_ns', 'jmh_mean_ns',
                     'compiler_log', 'allocation_events', 'lock_events', 'inflate_intrinsic_records'])
    for fork, obs in zip(forks, observations):
        writer.writerow([fork[k] for k in ['sequence', 'pair', 'policy', 'variant', 'pid',
            'fork_median_ns', 'jmh_mean_ns', 'compilation']] +
            [len(obs['allocation_events']), len(obs['lock_events']), obs['inflate_intrinsic_records']])

pairs = []
for pair in range(4):
    these = [r for r in forks if r['pair'] == pair]
    a, = [r for r in these if r['variant'] == 'A']
    b, = [r for r in these if r['variant'] == 'B']
    pairs.append({'pair': pair, 'policy': a['policy'],
        'order': ''.join(r['variant'] for r in these),
        'A_ns': a['fork_median_ns'], 'B_ns': b['fork_median_ns'],
        'B_minus_A_ns': b['fork_median_ns'] - a['fork_median_ns'],
        'B_time_change_pct': (b['fork_median_ns'] / a['fork_median_ns'] - 1) * 100})
(out / 'pairs.json').write_text(json.dumps(pairs, indent=2) + '\n')
summary = []
for policy in ['normal', 'control']:
    values = {v: [r['fork_median_ns'] for r in forks if r['policy'] == policy and r['variant'] == v]
              for v in ['A', 'B']}
    a, b = [statistics.median(values[v]) for v in ['A', 'B']]
    summary.append({'policy': policy, 'forks_per_variant': 2, 'A_median_ns': a, 'B_median_ns': b,
        'B_minus_A_ns': b - a, 'B_time_change_pct': (b / a - 1) * 100})
(out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Per-fork timings and exact-fork compiler records:')
print((out / 'per-fork.csv').read_text())
print('Pair and policy comparisons:')
print(json.dumps({'pairs': pairs, 'summary': summary}, indent=2))
for obs in observations:
    print(obs['name'], 'elimination_tags=', obs['global_elimination_tags'])
    for header in obs['header_inlining']:
        if 'GZIPLifecycle gzip ' in header['caller']:
            print('  gzip caller -> readHeader:', header)
