#!/usr/bin/env python3
"""Link live patched C2 calls, return-PC oop maps and saved-RBP frame slots."""
import json
import argparse
from pathlib import Path
import re
import sys

sys.path.insert(0, '/workspace/work/spill-sharing/deps/python')
import capstone as cs
from capstone import x86_const as x86

root = Path('/workspace/work/spill-sharing/code')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--output', type=Path, default=root/'master-gc-linked-frame-proof.json')
parser.add_argument('arms', nargs='+')
args = parser.parse_args()
results = []
for arm in args.arms:
    log = (root / f'{arm}-gc-state.log').read_text()
    metadata = {}
    for match in re.finditer(r'GC_NMETHOD label=(\S+) compiled=true level=(\d+) id=(\d+) begin=(0x[0-9a-f]+) entry=(0x[0-9a-f]+) bytes=(\d+)', log):
        label, level, number, begin, entry, size = match.groups()
        metadata[label] = dict(level=int(level), id=int(number), begin=int(begin,16),
                               entry=int(entry,16), bytes=int(size))
    caller, callee = metadata['pre1-caller'], metadata['pre1-outer']
    assert caller == metadata['post1-caller']
    assert callee == metadata['post1-outer']
    assert caller['level'] == callee['level'] == 4
    accounting = json.loads((root / f'{arm}-gc-accounting/accounting.json').read_text())
    def allocated(name, meta):
        return next(row for row in accounting if row['method'].endswith('::'+name)
                    and int(row['compilation']) == meta['id'])
    caller_alloc = allocated('caller', caller)
    callee_alloc = allocated('outer', callee)
    assert int(caller_alloc['main_start'],16) == caller['begin']
    frame = callee_alloc['frame_bytes']
    decoder = cs.Cs(cs.CS_ARCH_X86, cs.CS_MODE_64)
    decoder.detail = True
    decoder.skipdata = True
    live = root / f'{arm}-gc-live'
    outer_instructions = list(decoder.disasm((live/'pre1-outer.bin').read_bytes(), callee['begin']))
    assert any(i.mnemonic == 'push' and i.op_str == 'rbp' for i in outer_instructions[:10])
    assert any(i.mnemonic == 'sub' and i.op_str == f'rsp, 0x{frame-16:x}' for i in outer_instructions[:12])
    header_at = log.index(caller_alloc['header'])
    next_header = log.find('Compiled method (', header_at + len(caller_alloc['header']))
    section = log[header_at:next_header if next_header >= 0 else len(log)]
    maps = [(content, [int(n) for n in offsets.split()]) for content, offsets in
            re.findall(r'ImmutableOopMap \{([^}]*)\} pc offsets: ([\d ]+)', section)]
    calls = []
    for instruction in decoder.disasm((live/'pre1-caller.bin').read_bytes(),caller['begin']):
        if instruction.id and instruction.group(cs.CS_GRP_CALL):
            for op in instruction.operands:
                if op.type == x86.X86_OP_IMM and op.imm == callee['entry']:
                    offset = instruction.address + instruction.size - caller['begin']
                    oop = next(content for content, offsets in maps if offset in offsets)
                    assert 'rbp=Oop' in oop
                    calls.append(dict(call_pc=hex(instruction.address), return_offset=offset,
                                      target=hex(op.imm), oop_map=oop))
    assert calls, 'No live direct caller-to-callee C2 call with matching RBP oop map'
    movement = re.findall(r'GC_ROOT_MOVEMENT action=1 roots_array=(\w+) seeds_array=(\w+) boxes=(\d+)',log)
    assert movement == [('true','true','3')]
    assert 'GC/deoptimization state checks=4 forcedGC=3 activeDeopt=2' in log
    results.append(dict(arm=arm, caller=caller, callee=callee, calls=calls,
                        callee_frame_bytes=frame, saved_rbp_offset_from_callee_sp=frame-16,
                        full_gc_moved_roots_array=True, full_gc_moved_seeds_array=True,
                        full_gc_moved_boxes=3,
                        actions=re.findall(r'^GC_ACTION .+$',log,re.M)))
args.output.write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results,indent=2))
