#!/usr/bin/env python3
"""Reconstruct complete nmethod main-code bytes and account for transport."""
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, '/workspace/work/spill-sharing/deps/python')
import capstone as cs
from capstone import x86_const as x86

source = Path(sys.argv[1])
output = Path(sys.argv[2])
output.mkdir(parents=True, exist_ok=True)
content = source.read_text()
headers = list(re.finditer(r'(?m)^Compiled method \((\w+)\)[^\n]*$', content))
results = []
decoder = cs.Cs(cs.CS_ARCH_X86, cs.CS_MODE_64)
decoder.detail = True
decoder.skipdata = True


def transport(instructions):
    counts = dict(instructions=0, nonpadding_instructions=0, stack_memory_instructions=0,
                  stack_loads=0, stack_stores=0, stack_bangs=0, register_moves=0,
                  gpr_vector_moves=0, calls=0, push_pop=0, undecoded_bytes=0,
                  stack_load_bytes=0, stack_store_bytes=0, unknown_stack_widths=0)
    for instruction in instructions:
        if instruction.id == 0:
            counts['undecoded_bytes'] += instruction.size
            continue
        counts['instructions'] += 1
        if instruction.mnemonic not in ('nop', 'hlt', 'int3'):
            counts['nonpadding_instructions'] += 1
        if instruction.group(cs.CS_GRP_CALL): counts['calls'] += 1
        if instruction.mnemonic in ('push', 'pop'): counts['push_pop'] += 1
        memory = [op for op in instruction.operands if op.type == x86.X86_OP_MEM and
                  op.mem.base == x86.X86_REG_RSP]
        if memory and instruction.id != x86.X86_INS_LEA:
            if any(op.mem.disp < -4096 for op in memory) and instruction.mnemonic == 'mov':
                counts['stack_bangs'] += 1
            else:
                counts['stack_memory_instructions'] += 1
                counts['stack_loads'] += int(any(op.access & cs.CS_AC_READ for op in memory))
                counts['stack_stores'] += int(any(op.access & cs.CS_AC_WRITE for op in memory))
                counts['stack_load_bytes'] += sum(op.size for op in memory if op.access & cs.CS_AC_READ)
                counts['stack_store_bytes'] += sum(op.size for op in memory if op.access & cs.CS_AC_WRITE)
                counts['unknown_stack_widths'] += sum(op.size == 0 for op in memory)
        operands = instruction.operands
        if instruction.mnemonic.startswith(('mov', 'vmov')) and len(operands) == 2 and all(
                op.type == x86.X86_OP_REG for op in operands):
            counts['register_moves'] += 1
            vector = [instruction.reg_name(op.reg).startswith(('xmm', 'ymm', 'zmm')) for op in operands]
            if vector[0] != vector[1]: counts['gpr_vector_moves'] += 1
    return counts


for number, match in enumerate(headers):
    if match[1] != "c2": continue # C1 is outside this C2 experiment.
    section = content[match.end():headers[number+1].start() if number+1<len(headers) else len(content)]
    bounds = re.search(r'main code\s+\[(0x[0-9a-f]+),(0x[0-9a-f]+)\] = (\d+)', section)
    if not bounds: continue
    start, end = int(bounds[1], 16), int(bounds[2], 16)
    assert end-start == int(bounds[3])
    captured = {}
    for address, encoded in re.findall(r'(?m)^\s*(0x[0-9a-f]+):\s+code=([0-9a-f]+)', section):
        address = int(address, 16)
        for offset, byte in enumerate(bytes.fromhex(encoded)):
            pc = address+offset
            if start <= pc < end:
                assert pc not in captured or captured[pc] == byte
                captured[pc] = byte
    if not captured: continue
    missing = [pc for pc in range(start, end) if pc not in captured]
    assert not missing, (match[0], 'missing bytes', len(missing))
    code = bytes(captured[pc] for pc in range(start, end))
    instructions = list(decoder.disasm(code, start))
    assert sum(instruction.size for instruction in instructions) == len(code)
    compilation = re.search(r'\)\s+\d+\s+(\d+)', match[0])[1]
    method = re.search(r'[\w.$/]+::[\w$<>]+', match[0])[0]
    stem = f'{number:02d}-{method.replace("::", "-")}-{compilation}'
    (output / (stem+'.bin')).write_bytes(code)
    (output / (stem+'.asm')).write_text(''.join(
        f'{instruction.address-start:05x} {instruction.bytes.hex():30} {instruction.mnemonic:10} {instruction.op_str}\n'
        for instruction in instructions))
    frame = re.search(r'\[sp\+(0x[0-9a-f]+)\][^\n]*\(sp of caller\)', section)
    loops = []
    for instruction in instructions:
        if instruction.id and instruction.group(cs.CS_GRP_JUMP):
            for operand in instruction.operands:
                if operand.type == x86.X86_OP_IMM and start <= operand.imm <= instruction.address:
                    body = [i for i in instructions if operand.imm <= i.address <= instruction.address]
                    loops.append(dict(start=operand.imm-start, end=instruction.address-start,
                                      branch=instruction.mnemonic, **transport(body)))
    results.append(dict(header=match[0], method=method, compilation=compilation,
                        compiler=match[1], osr='%' in match[0], main_bytes=len(code),
                        main_start=hex(start), main_end=hex(end),
                        frame_bytes=int(frame[1], 16) if frame else None,
                        **transport(instructions), backward_branch_intervals=loops,
                        binary=str(output/(stem+'.bin')), assembly=str(output/(stem+'.asm'))))

assert results or not headers, 'Target nmethods were printed without complete code bytes'
(output/'accounting.json').write_text(json.dumps(results, indent=2)+'\n')
print(json.dumps([{k:v for k,v in result.items() if k not in ('backward_branch_intervals',)}
                  for result in results], indent=2))
