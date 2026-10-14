#!/usr/bin/env python3
"""Parse targeted fastdebug IR. Diagnostic output only; no timing comparison."""
import argparse
import collections
import csv
import json
import pathlib
import re
import xml.etree.ElementTree as ET

TARGET = 'PhaseVectorKernels conversion (I)J'

def parse_nodes(text):
    nodes = {}
    for line in text.splitlines():
        m = re.match(r'\s*(\d+)\s+(\w+)\s+===\s*(.*?)\s*\[\[', line)
        if m:
            nodes[m[1]] = {'op': m[2], 'inputs': m[3].split(), 'line': line}
    return nodes

def constant(nodes, node_id):
    node = nodes.get(node_id, {})
    if node.get('op') != 'ConI': return None
    m = re.search(r'#int:(-?\d+)(?:\s|$)', node['line'])
    return int(m[1]) if m else None

def loops(nodes):
    result = []
    for node_id, node in nodes.items():
        if node['op'] not in ('Loop', 'CountedLoop', 'OuterStripMinedLoop'): continue
        m = re.search(r'\bstride:\s*(-?\d+)', node['line'])
        role = re.search(r'\b(pre|main|post) of N(\d+)', node['line'])
        record = {'node': node_id, 'op': node['op'], 'line': node['line'],
                  'explicit_stride': int(m[1]) if m else None,
                  'role': role.group(1) if role else None, 'integer_phi_steps': []}
        for phi_id, phi in nodes.items():
            ins = phi['inputs']
            if phi['op'] != 'Phi' or len(ins) != 3 or ins[0] != node_id or '#int' not in phi['line']: continue
            step = nodes.get(ins[2], {})
            args = step.get('inputs', [])
            delta = None
            if len(args) == 3 and step.get('op') == 'AddI':
                if args[1] == phi_id: delta = constant(nodes, args[2])
                elif args[2] == phi_id: delta = constant(nodes, args[1])
            elif len(args) == 3 and step.get('op') == 'SubI' and args[1] == phi_id:
                value = constant(nodes, args[2])
                if value is not None: delta = -value
            if delta is not None:
                record['integer_phi_steps'].append({'phi': phi_id, 'step_node': ins[2], 'delta': delta,
                    'tripcount_tag': '#tripcount' in phi['line'], 'phi_line': phi['line'], 'step_line': step['line']})
        # Fixed128 array induction is 4 elements per source iteration. These ratios
        # remain candidates until a reviewer confirms the actual array-index Phi.
        stride = record['explicit_stride']
        record['candidate_factor_if_array_induction_confirmed'] = (
            stride // 4 if stride is not None and stride > 0 and stride % 4 == 0 else None)
        result.append(record)
    return result

def graph_record(graph):
    nodes = parse_nodes(graph.text or '')
    counts = dict(collections.Counter(n['op'] for n in nodes.values()))
    groups = {
        'loops': {k: v for k, v in counts.items() if 'Loop' in k},
        'casts': {k: v for k, v in counts.items() if k.startswith(('VectorCast', 'VectorReinterpret', 'Conv'))},
        'reductions': {k: v for k, v in counts.items() if 'Reduction' in k or k == 'AddF'},
        'allocation_and_boxes': {k: counts.get(k, 0) for k in
            ('Allocate', 'AllocateArray', 'VectorBoxAllocate', 'VectorBox', 'VectorUnbox', 'SafePointScalarObject')},
        'loads_stores': {k: v for k, v in counts.items() if k.startswith(('LoadVector', 'StoreVector'))},
    }
    calls = [n['line'] for n in nodes.values() if n['op'] == 'CallStaticJava' and 'uncommon_trap' not in n['line']]
    return {'phase': graph.get('compile_phase'), 'node_count': len(nodes), 'op_counts': counts,
            'groups': groups, 'loops': loops(nodes), 'ordinary_calls': calls}

def parse_log(path, target=TARGET):
    tree = ET.parse(path)
    nmethods = [n.attrib.copy() for n in tree.iter('nmethod') if n.get('method') == target]
    ids = {n['compile_id'] for n in nmethods}
    tasks = {n.get('compile_id'): n for n in tree.iter('task') if n.get('compile_id') in ids}
    records = []
    for n in nmethods:
        cid = n['compile_id']
        n['entry_kind'] = n.get('compile_kind', 'normal')
        n['main_code_bytes'] = int(n['stub_offset']) - int(n['insts_offset'])
        task = tasks.get(cid)
        record = {'nmethod': n, 'graphs': [], 'intrinsics': [], 'inline_failures': []}
        if task is not None:
            record['task'] = task.attrib.copy()
            record['intrinsics'] = [i.attrib for i in task.iter('intrinsic')]
            record['inline_failures'] = [i.attrib for i in task.iter('inline_fail')]
        record['make_not_entrant'] = [i.attrib for i in tree.iter('make_not_entrant') if i.get('compile_id') == cid]
        record['runtime_traps'] = [i.attrib for i in tree.iter('uncommon_trap') if i.get('compile_id') == cid]
        for graph in tree.iter('ideal'):
            if graph.get('compile_id') == cid:
                record['graphs'].append(graph_record(graph))
        records.append(record)
    return records

def probe_rows(path):
    rows = []
    for line in path.read_text().splitlines():
        if not line.startswith('conversion,'): continue
        fields = next(csv.reader([line]))
        if len(fields) != 13: continue  # Raw interleaved stdout is still retained.
        try: numbers = [int(x) for x in fields[2:]]
        except ValueError: continue
        # Deliberately omit elapsed/compilation times from the diagnostic report.
        rows.append({'phase': fields[1], 'calls': numbers[0], 'count': numbers[1],
            'start_uptime_ms': numbers[2], 'allocated_bytes': numbers[4], 'checksum': numbers[6],
            'normal_before': numbers[7], 'osr_before': numbers[8],
            'normal_after': numbers[9], 'osr_after': numbers[10]})
    return rows

def vm_flags(path):
    names = {'LoopMaxUnroll', 'LoopUnrollLimit', 'UseSVE', 'MaxVectorSize',
             'UseCompactObjectHeaders', 'UseFourByteObjectHeaders', 'TieredCompilation'}
    flags = {}
    for line in path.read_text().splitlines():
        m = re.match(r'\s*\w+\s+(\w+)\s+=\s+(\S+)', line)
        if m and m[1] in names: flags[m[1]] = m[2]
    return flags

def analyze(out):
    plan = json.loads((out / 'plan.json').read_text())
    # Artifact transfer can be unavailable; preserve identity and the usable
    # parser report in supported CI logs as well as output files.
    print('DIAGNOSTIC_INPUTS ' + json.dumps(plan['inputs'], sort_keys=True), flush=True)
    results = []
    errors = []
    table = ['| Case | Compile ID | Entry | Main code B | Total nmethod B | Phase | Loops | Casts | Reductions | Alloc/boxes | Strides |',
             '|---|---:|---|---:|---:|---|---|---|---|---|---|']
    for case in plan['cases']:
        label = case['label']
        raw = out / (label + '.out')
        xml = out / (label + '.xml')
        status_path = out / (label + '.status.json')
        try:
            status = json.loads(status_path.read_text())
            if status['exit_status'] != 0: raise ValueError('JVM exit ' + str(status['exit_status']))
            records = parse_log(xml)
            rows = probe_rows(raw)
            flags = vm_flags(raw)
            actual_unroll = int(flags['LoopMaxUnroll'])
            if case['loop_max_unroll'] == '1' and actual_unroll != 1:
                raise ValueError('LoopMaxUnroll=1 was not effective')
            if case['loop_max_unroll'] == 'default' and actual_unroll <= 1:
                raise ValueError('Default control already has LoopMaxUnroll <= 1')
            if case['sve'] == '0' and flags.get('UseSVE') != '0':
                raise ValueError('UseSVE=0 was not effective')
            steady = [row for row in rows if row['phase'].startswith('measure')]
            if len(steady) != 5: raise ValueError('Expected five complete steady records; inspect raw interleaving')
            if any(r['calls'] != plan['measure_calls'] or r['normal_before'] != 4 or r['normal_after'] != 4 for r in steady):
                raise ValueError('Fixed-call or actual ordinary C2 assertion failed')
            if len({(r['checksum'], r['calls']) for r in steady}) != 1: raise ValueError('Unstable checksum')
            normal = [r for r in records if r['nmethod']['entry_kind'] == 'normal' and r['nmethod']['compiler'] == 'c2']
            if not normal: raise ValueError('No installed ordinary C2 kernel nmethod')
            for r in normal:
                if not any(g['phase'] == 'BEFORE_MATCHING' and g['node_count'] for g in r['graphs']):
                    raise ValueError('Missing targeted BEFORE_MATCHING graph for normal C2 nmethod')
            first_measure = min(r['start_uptime_ms'] for r in steady) / 1000
            # Installed state, not proof of each invocation's machine PC. WhiteBox
            # plus -Xbatch provides the separate actual level assertion above.
            installed = [r for r in normal if float(r['nmethod']['stamp']) <= first_measure and
                not any(float(e['stamp']) <= first_measure for e in r['make_not_entrant'])]
            if not installed: raise ValueError('No entrant ordinary C2 record before steady window')
            selected = max(installed, key=lambda r: float(r['nmethod']['stamp']))['nmethod']['compile_id']
            result = {'case': case, 'status': status, 'compilations': records, 'probe_rows': rows,
                      'vm_flags': flags, 'normal_installed_before_first_measure': selected}
            results.append(result)
            print('DIAGNOSTIC_CASE ' + json.dumps({'label': label, 'vm_flags': flags,
                'normal_installed_before_first_measure': selected, 'steady_counter_rows': steady}, sort_keys=True), flush=True)
            for record in records:
                n = record['nmethod']
                print('DIAGNOSTIC_NMETHOD ' + json.dumps({'case': label, 'nmethod': n,
                    'intrinsic_counts': dict(collections.Counter(i['id'] for i in record['intrinsics'])),
                    'inline_failures': record['inline_failures'], 'make_not_entrant': record['make_not_entrant'],
                    'runtime_traps': record['runtime_traps']}, sort_keys=True), flush=True)
                for graph in record['graphs']:
                    if graph['phase'] not in ('AFTER_PARSING', 'INCREMENTAL_INLINE', 'ITER_GVN_AFTER_VECTOR', 'AFTER_EA', 'BEFORE_MATCHING'): continue
                    groups = graph['groups']
                    compact = lambda values: ', '.join(k + '=' + str(v) for k, v in values.items() if v) or '0'
                    strides = ', '.join(str(l['node']) + ':' + str(l['explicit_stride']) + '/' + str(l['role']) for l in graph['loops']) or '-'
                    print('DIAGNOSTIC_PHASE ' + json.dumps({'case': label, 'compile_id': n['compile_id'],
                        'entry_kind': n['entry_kind'], 'phase': graph['phase'], 'node_count': graph['node_count'],
                        'op_counts': graph['op_counts'], 'loops': graph['loops'],
                        'ordinary_calls': graph['ordinary_calls']}, sort_keys=True), flush=True)
                    table.append('| ' + ' | '.join([label, n['compile_id'], n['entry_kind'], str(n['main_code_bytes']),
                        n['size'], graph['phase'], compact(groups['loops']), compact(groups['casts']),
                        compact(groups['reductions']), compact(groups['allocation_and_boxes']), strides]) + ' |')
        except (ValueError, OSError, ET.ParseError, KeyError) as exc:
            errors.append({'case': label, 'error': str(exc)})
    (out / 'diagnostic-summary.json').write_text(json.dumps({'scope': 'IR diagnostics, not timed qualification',
        'results': results, 'errors': errors}, indent=2) + '\n')
    (out / 'diagnostic-table.md').write_text('No timing comparison. All nmethod entries are listed separately.\n\n' + '\n'.join(table) + '\n')
    print('\n'.join(table))
    if errors: raise ValueError(json.dumps(errors))
    return results

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=pathlib.Path, required=True)
    args = parser.parse_args()
    analyze(args.out.resolve())
