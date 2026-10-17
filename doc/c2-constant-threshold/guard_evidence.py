#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Require the real rolling decoder's exact inlined sliceWidth guard scope."""
import re
from pathlib import Path


def attributes(tag):
    return dict(re.findall(r"([\w_]+)='([^']*)'", tag))


def bytecode_scopes(bits, decoder):
    match = re.search(r'public static long mask64\(int\);(.*?)(?=\n  \S|\n})', bits, re.S)
    if not match or 'descriptor: (I)J' not in match.group(1):
        raise ValueError('Bits.mask64 descriptor missing')
    branch = re.search(r'\d+: bipush\s+64\s*\n\s*(\d+): if_icmplt', match.group(1))
    if not branch:
        raise ValueError('Pinned mask64 threshold shape changed')
    match = re.search(r'private static int decodeSequencesRolling\([^\n]+\);(.*?)(?=\n  \S|\n})', decoder, re.S)
    if not match:
        raise ValueError('Rolling decoder bytecode not found')
    text = match.group(1)
    if 'descriptor: ([BIILdev/jzstd/internal/BlockDecoder$EntropyState;Ldev/jzstd/internal/Workspace;II)I' not in text:
        raise ValueError('Rolling decoder descriptor mismatch')
    lines = sorted((int(bci), int(line)) for line, bci in re.findall(r'line (\d+): (\d+)', text))
    def line_at(bci):
        return [line for start, line in lines if start <= bci][-1]
    mask_calls, first = [], []
    instructions = list(re.finditer(r'^\s*(\d+): (\w+)\s*(.*)$', text, re.M))
    for index, insn in enumerate(instructions):
        bci, opcode, rest = int(insn[1]), insn[2], insn[3]
        if opcode == 'invokestatic' and 'Bits.mask64:(I)J' in rest and line_at(bci) == 249:
            mask_calls.append(bci)
        if opcode.startswith('if_icmp') and line_at(bci) == 245:
            previous = instructions[index - 1]
            if previous[2] == 'bipush' and previous[3].strip() == '63':
                first.append(bci)
    if len(mask_calls) != 1 or len(first) != 1:
        raise ValueError('Cannot identify the exact sliceWidth<=63 / mask64(sliceWidth) bytecode pair')
    return dict(first_guard_bci=first[0], mask_call_bci=mask_calls[0], mask_guard_bci=int(branch[1]))


def parse_nodes(graph):
    result = {}
    for line in graph.splitlines():
        match = re.match(r'\s*(\d+)\s+(\w+)\s+===\s+(.*?)\s+\[\[(.*?)\]\](.*)', line)
        if match:
            result[match[1]] = dict(id=match[1], op=match[2], inputs=match[3].split(),
                                    annotation=match[5], line=line.strip())
    return result


def scoped_graph(graph, scopes):
    nodes = parse_nodes(graph)
    first_scope = re.compile(r'BlockDecoder::decodeSequencesRolling @ bci:' + str(scopes['first_guard_bci']) + r'\b')
    call_scope = re.compile(r'BlockDecoder::decodeSequencesRolling @ bci:' + str(scopes['mask_call_bci']) + r'\b')
    mask_scope = re.compile(r'Bits::mask64 @ bci:' + str(scopes['mask_guard_bci']) + r'\b')
    def cmps(scope, constant):
        selected = []
        for node in nodes.values():
            if node['op'] != 'CmpI' or not scope.search(node['annotation']):
                continue
            if any(x in nodes and re.search(r'#int:' + str(constant) + r'\b', nodes[x]['annotation']) for x in node['inputs']):
                selected.append(node)
        return selected
    first_cmp = cmps(first_scope, 63)
    inner_cmp = [n for n in cmps(call_scope, 64) if mask_scope.search(n['annotation'])]
    def branches(comparisons):
        ids = {n['id'] for n in comparisons}
        bools = {n['id'] for n in nodes.values() if n['op'] == 'Bool' and any(x in ids for x in n['inputs'])}
        return [n for n in nodes.values() if n['op'] == 'If' and any(x in bools for x in n['inputs'])]
    traps = [n for n in nodes.values() if n['op'] == 'CallStaticJava' and
             "uncommon_trap(reason='unstable_if'" in n['annotation'] and
             mask_scope.search(n['annotation']) and call_scope.search(n['annotation'])]
    inline = [n for n in nodes.values() if 'Bits::mask64 @ bci:' in n['annotation'] and
              call_scope.search(n['annotation']) and n['op'] in ('LShiftL', 'SubL', 'AndL', 'CmpI')]
    if not inline:
        raise ValueError('No surviving graph evidence that exact mask64(sliceWidth) call was inlined')
    return dict(first_guard_cmps=first_cmp, first_guard_ifs=branches(first_cmp),
                mask_guard_cmps=inner_cmp, mask_guard_ifs=branches(inner_cmp), mask_guard_traps=traps,
                inline_scope_nodes=inline)


def compilation(root, side, debug, method, scopes):
    xml = (root / 'results' / f'guard-{side}-{debug}.xml').read_text(errors='replace')
    rows = [attributes(t) for t in re.findall(r'<nmethod\b[^>]*>', xml)]
    selected = [t for t in rows if t.get('method') == method and t.get('compiler') == 'c2' and
                t.get('compile_kind') != 'osr']
    if not selected:
        raise ValueError('No regular C2 rolling decoder compilation: ' + side + '-' + debug)
    row = selected[-1]
    cid = row['compile_id']
    log = (root / 'logs' / f'guard-{side}-{debug}.log').read_text(errors='replace')
    section = None
    for block in log.split('============================= C2-compiled nmethod ==============================')[1:]:
        header = re.search(r'^Compiled method \(c2\)\s+\d+\s+' + cid + r'\s+[^\n]*BlockDecoder::decodeSequencesRolling\b', block, re.M)
        if header:
            section = block
            break
    if section is None:
        raise ValueError('No printed assembly for selected exact compilation: ' + cid)
    code = re.search(r'^ main code\s+.*= (\d+)\s*$', section, re.M)
    if code is None:
        raise ValueError('No main-code size for compilation: ' + cid)
    times = re.findall(r'C2 Compile Time:\s+([0-9.]+) s', log)
    result = dict(compile_id=cid, method=method, kind='regular C2', main_code_bytes=int(code[1]),
                  nmethod_total_bytes=int(row['size']), c2_seconds=float(times[-1]) if times else None)
    if not times:
        raise ValueError('Missing codec compiler-cost diagnostic timer')
    if debug == 'fastdebug':
        ideal = re.search(r"<ideal compile_id='" + cid + r"' compile_phase='PrintIdeal'>(.*?)</ideal>", xml, re.S)
        if not ideal:
            raise ValueError('No final PrintIdeal graph for exact decoder compilation: ' + cid)
        result['graph'] = scoped_graph(ideal[1], scopes)
    return result


def evaluate(root, method):
    scopes = bytecode_scopes((root / 'logs/javap-Bits.log').read_text(),
                             (root / 'logs/javap-BlockDecoder.log').read_text())
    result = dict(scopes=scopes, code_size_comparisons=[])
    for side in ('baseline', 'candidate'):
        result[side] = {debug:compilation(root, side, debug, method, scopes) for debug in ('release', 'fastdebug')}
    a = result['baseline']['fastdebug']['graph']
    b = result['candidate']['fastdebug']['graph']
    if any(len(g['first_guard_ifs']) != 1 for g in (a, b)):
        raise ValueError('Original sliceWidth<=63 guard was not identified and preserved')
    if len(a['mask_guard_ifs']) != 1 or len(a['mask_guard_traps']) != 1:
        raise ValueError('Lead not applicable: baseline lacks the exact redundant inline guard/trap')
    if b['mask_guard_ifs'] or b['mask_guard_cmps'] or b['mask_guard_traps']:
        raise ValueError('Candidate retains the exact redundant mask64(sliceWidth) guard/trap')
    # Baseline comparison is on the same graph value, not an unrelated cmp64 scope.
    outer = a['first_guard_cmps'][0]['inputs'][1]
    inner = a['mask_guard_cmps'][0]['inputs'][1]
    if outer != inner:
        raise ValueError('Baseline thresholds use different graph values; cannot claim applicability')
    for debug in ('release', 'fastdebug'):
        a, b = result['baseline'][debug], result['candidate'][debug]
        ratio = b['main_code_bytes'] / a['main_code_bytes']
        result['code_size_comparisons'].append(dict(debug_level=debug, main_code_ratio=ratio,
            nmethod_total_ratio=b['nmethod_total_bytes'] / a['nmethod_total_bytes'], investigate=ratio > 1.03,
            compiler_timer_ratio=b['c2_seconds'] / a['c2_seconds'] if a['c2_seconds'] else None,
            compiler_timer_note='One diagnostic pair; cost control is the separate three-pair RepeatCompilation screen.'))
    return result
