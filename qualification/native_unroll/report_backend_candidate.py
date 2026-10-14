"""Export process evidence and decode separately attributed ordinary-entry code."""
import collections
import hashlib
import importlib.metadata
import json
import pathlib
import re
import sys


def decode_ordinary(text, nmethod):
    import capstone
    pieces = re.split(r'(?=Compiled method \(c2\))', text)
    selected = []
    for piece in pieces:
        header = piece.split('\n')[0]
        match = re.match(r'^Compiled method \(c2\)\s+\S+\s+(\d+)\s+', header)
        if match and match.group(1) == nmethod['compile_id'] and '%' not in header:
            selected.append(piece)
    if len(selected) != 1:
        raise RuntimeError('Unique ordinary-entry assembly missing: ' + nmethod['compile_id'])
    piece = selected[0]
    match = re.search(r'main code\s+\[0x([0-9a-f]+),0x([0-9a-f]+)\]\s*=\s*(\d+)', piece)
    if not match:
        raise RuntimeError('Main code range missing')
    start, end, size = int(match[1], 16), int(match[2], 16), int(match[3])
    if end - start != size or size % 4 or int(nmethod['entry'], 16) != start:
        raise RuntimeError('Ordinary nmethod entry/main range mismatch')
    code = {}
    for line in piece.splitlines():
        match = re.match(r'^\s*0x([0-9a-f]+):\s*([0-9a-f| \t]+)', line)
        if not match:
            continue
        address = int(match[1], 16)
        tokens = match[2].replace('|', ' ').split()
        if not tokens or any(len(t) not in [4, 8] for t in tokens):
            continue
        data = bytes.fromhex(''.join(tokens))
        for offset, value in enumerate(data):
            if start <= address + offset < end:
                if address + offset in code and code[address + offset] != value:
                    raise RuntimeError('Conflicting machine bytes')
                code[address + offset] = value
    if set(code) != set(range(start, end)):
        raise RuntimeError('Incomplete raw ordinary-entry machine bytes')
    data = bytes(code[a] for a in range(start, end))
    decoder = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM)
    instructions = []
    for offset in range(0, size, 4):
        word, address = data[offset:offset + 4], start + offset
        decoded = list(decoder.disasm(word, address))
        if len(decoded) != 1 or decoded[0].size != 4:
            raise RuntimeError('Undecoded instruction at ' + hex(address))
        instruction = decoded[0]
        instructions.append({'address': address, 'bytes': word.hex(),
                             'mnemonic': instruction.mnemonic, 'operands': instruction.op_str})
    return {'compile_id': nmethod['compile_id'], 'ordinary_entry_nmethod': nmethod,
            'main_code_start': start, 'main_code_end': end, 'main_code_bytes': size,
            'machine_code_sha256': hashlib.sha256(data).hexdigest(),
            'instruction_counts': dict(collections.Counter(i['mnemonic'] for i in instructions)),
            'scalar_or_vector_fadd_instructions': [i for i in instructions if i['mnemonic'] == 'fadd'],
            'instructions': instructions,
            'decoder': {'distribution': importlib.metadata.version('capstone'),
                        'binding_api': capstone.__version__, 'engine': capstone.cs_version()}}


def main():
    p = pathlib.Path(sys.argv[1])
    p.mkdir(parents=True, exist_ok=True)
    for name in ['plan.json', 'summary.json', 'initial-gate.json', 'assembly-index.json', 'assembly-run-status.json']:
        path = p / name
        if path.exists():
            print('BACKEND_' + name.replace('.json', '').replace('-', '_').upper() + '_JSON=' +
                  json.dumps(json.loads(path.read_text())), flush=True)
        else:
            print('MISSING_BACKEND_FILE=' + str(path), flush=True)
    paired = []
    pair_file = p / 'pairs.jsonl'
    if pair_file.exists():
        for line in pair_file.read_text().splitlines():
            if line.strip():
                row = json.loads(line)
                paired.append(row)
                print('BACKEND_PROCESS_PAIR_JSON=' + json.dumps(row), flush=True)
    statuses = []
    for path in sorted(p.glob('*.status.json')):
        status = json.loads(path.read_text())
        statuses.append(status)
        print('BACKEND_PROCESS_STATUS_JSON=' + json.dumps(status), flush=True)
    for path in sorted(p.glob('assembly-*.out')):
        for piece in re.split(r'(?=Compiled method \(c2\))', path.read_text()):
            if piece.startswith('Compiled method') and 'PhaseVectorKernels::' in piece.split('\n')[0]:
                piece = piece.split('kernel,phase,')[0]
                piece = re.split(r'^(conversion|rawBits|directBits|arithmetic),', piece, 1, flags=re.M)[0]
                print('BACKEND_ASSEMBLY_TEXT_JSON=' + json.dumps({'file': path.name, 'text': piece}), flush=True)
    plan_file = p / 'plan.json'
    plan = json.loads(plan_file.read_text()) if plan_file.exists() else {}
    mode = plan.get('mode')
    run_status = {'mode': mode, 'completed_pairs': len(paired), 'recorded_process_statuses': len(statuses),
                  'complete': (p / 'initial-gate.json').exists() if mode == 'timing' else False,
                  'candidate_qualified': False}
    decode_failed = False
    if mode == 'assembly':
        index_path = p / 'assembly-index.json'
        index = json.loads(index_path.read_text()) if index_path.exists() else []
        decoded = []
        errors = []
        for entry in index:
            try:
                path = p / (entry['name'] + '.out')
                if hashlib.sha256(path.read_bytes()).hexdigest() != entry['output']['sha256']:
                    raise RuntimeError('Raw assembly file hash mismatch')
                for nmethod in entry['ordinary_entry_nmethods']:
                    result = decode_ordinary(path.read_text(), nmethod)
                    result.update(name=entry['name'], image=entry['image'], condition=entry['condition'],
                                  raw_assembly_sha256=entry['output']['sha256'])
                    decoded.append(result)
                    lines = [hex(i['address']) + ': ' + i['bytes'] + ' ' + i['mnemonic'] + ' ' + i['operands']
                             for i in result['instructions']]
                    (p / (entry['name'] + '-id' + nmethod['compile_id'] + '.decoded.txt')).write_text('\n'.join(lines) + '\n')
                    print('BACKEND_ORDINARY_DECODED_JSON=' + json.dumps(result), flush=True)
            except Exception as error:
                errors.append({'name': entry['name'], 'error': str(error)})
        (p / 'ordinary-entry-decoded.json').write_text(json.dumps(decoded, indent=2) + '\n')
        assembly_status_path = p / 'assembly-run-status.json'
        assembly_status = json.loads(assembly_status_path.read_text()) if assembly_status_path.exists() else {}
        complete = assembly_status.get('complete', False) and not errors and bool(decoded)
        review = {'status': 'pending explicit decoded ordinary-entry review', 'candidate_qualified': False,
                  'decode_complete': complete, 'decode_errors': errors,
                  'required_evidence': [
                      'Same-toolchain candidate/rebuilt-b3 compile IDs, main ranges and machine byte hashes',
                      'Addressed instruction/dataflow proof that the reduction zero-add disappeared',
                      'Addressed instruction/dataflow proof that loop-carried scalar accumulator addition remains',
                      'Default-SVE and UseSVE=0 factors and raw/control shape comparison',
                      'Focused native semantics and actual IR verification passed',
                      'Rebuilt/archived b3 drift assessment; archived contrast alone is not patch causality'],
                  'wide_SVE': 'N2 wide fallback is not native wider-than-128-bit SVE qualification'}
        (p / 'assembly-review-required.json').write_text(json.dumps(review, indent=2) + '\n')
        print('BACKEND_ASSEMBLY_REVIEW_REQUIRED_JSON=' + json.dumps(review), flush=True)
        run_status.update(complete=complete, decoded_ordinary_methods=len(decoded), decode_errors=errors)
        decode_failed = not complete
    (p / 'run-completion.json').write_text(json.dumps(run_status, indent=2) + '\n')
    print('BACKEND_RUN_COMPLETION_JSON=' + json.dumps(run_status), flush=True)
    if decode_failed:
        raise SystemExit(3)


if __name__ == '__main__':
    main()
