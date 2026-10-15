"""Fail closed on missing installed native idiom; separate diagnostic processes only."""
import json
import pathlib
import re
import sys
import xml.etree.ElementTree as ET

from report_backend_candidate import decode_ordinary


def cluster(instructions):
    matches = []
    for i in range(len(instructions) - 4):
        part = instructions[i:i + 5]
        if [x['mnemonic'] for x in part] != ['fcvtzs', 'scvtf', 'faddp', 'faddp', 'fadd']:
            continue
        m = re.fullmatch(r'(v\d+)\.4s, (v\d+)\.4s', part[0]['operands'])
        if not m:
            continue
        tmp = m.group(1)
        scalar = 's' + tmp[1:]
        if part[1]['operands'] != f'{tmp}.4s, {tmp}.4s':
            continue
        if part[2]['operands'] != f'{tmp}.4s, {tmp}.4s, {tmp}.4s':
            continue
        if part[3]['operands'] != f'{scalar}, {tmp}.2s':
            continue
        add = re.fullmatch(r'(s\d+), (s\d+), (s\d+)', part[4]['operands'])
        if not add or add.group(3) != scalar or add.group(2) == scalar:
            continue
        matches.append(dict(address=part[0]['address'], end=part[-1]['address'],
                            accumulator_in=add.group(2), accumulator_out=add.group(1)))
    return matches


def loops(code):
    result = []
    for insn in code['instructions']:
        if not insn['mnemonic'].startswith('b.'):
            continue
        m = re.fullmatch(r'#0x([0-9a-f]+)', insn['operands'])
        if not m:
            continue
        target = int(m.group(1), 16)
        if code['main_code_start'] <= target < insn['address']:
            body = [x for x in code['instructions'] if target <= x['address'] <= insn['address']]
            result.append(dict(start=target, end=insn['address'], instructions=body,
                               clusters=cluster(body), bytes=''.join(x['bytes'] for x in body)))
    return result


def check_conversion_loop(bodies, name):
    converted = [x for x in bodies if any(i['mnemonic'] == 'fcvtzs' for i in x['instructions'])]
    if not converted:
        raise RuntimeError('Missing installed conversion loop: ' + name)
    # Select independently of the pattern, so a good pre-loop cannot hide a fallback main loop.
    body = max(converted, key=lambda x: (sum(i['mnemonic'] == 'fcvtzs' for i in x['instructions']), len(x['instructions'])))
    casts = sum(i['mnemonic'] == 'fcvtzs' for i in body['instructions'])
    if casts != len(body['clusters']) or any(i['mnemonic'] in ['bl', 'blr'] for i in body['instructions']):
        raise RuntimeError('Main loop has ungrouped conversions or calls: ' + name)
    carried = body['clusters']
    if any(previous['accumulator_out'] != following['accumulator_in']
           for previous, following in zip(carried, carried[1:] + carried[:1])):
        raise RuntimeError('Strict carried accumulator not retained: ' + name)
    return body


def main():
    root = pathlib.Path(sys.argv[1])
    index = json.loads((root / 'assembly-index.json').read_text())
    if len(index) != 36:
        raise RuntimeError('Incomplete assembly cohort')
    evidence = []
    raw = {}
    for entry in index:
        name = entry['name']
        text = (root / (name + '.out')).read_text()
        method = entry['ordinary_entry_nmethods'][-1]
        tree = ET.parse(root / (name + '.xml'))
        if any(n.get('compile_id') == method['compile_id'] for n in tree.findall('.//make_not_entrant')):
            raise RuntimeError('Selected last ordinary entry is not live')
        code = decode_ordinary(text, method)
        header, sve, unroll, kernel = entry['condition']
        bodies = loops(code)
        applicable = sve == '0' or re.search(r'\bMaxVectorSize\s*:?=\s*16\b', text)
        if entry['image'] == 'candidate' and kernel == 'conversion' and applicable:
            body = check_conversion_loop(bodies, name)
        else:
            body = max(bodies, key=lambda x: len(x['instructions']), default=None)
        if kernel == 'rawBits':
            if body is None:
                raise RuntimeError('Raw control loop missing')
            raw[(header, sve, entry['image'])] = body['bytes']
        evidence.append(dict(name=name, ordinary=method, decoded=code, selected_loop=body,
                              positive_required=bool(entry['image'] == 'candidate' and kernel == 'conversion' and applicable)))
    for header in ['legacy', 'four', 'eight']:
        for sve in ['default', '0']:
            if raw[(header, sve, 'candidate')] != raw[(header, sve, 'rebuilt_b3')]:
                raise RuntimeError('Raw control loop changed; review required before timing')
    result = dict(passed=True, qualified=False, methods=evidence,
                  scope='Installed release code from separate observed JVMs; never substituted for code from timed JVMs. Clean native fastdebug positive matching is independently mandatory.')
    (root / 'installed-assembly-gate.json').write_text(json.dumps(result, indent=2) + '\n')
    print('ROUNDTRIP_INSTALLED_ASSEMBLY_GATE_JSON=' + json.dumps(dict(passed=True, ordinary_methods=36)), flush=True)


if __name__ == '__main__':
    main()
