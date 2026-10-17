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

"""Extract compile-identified, address-free threshold evidence from saved logs."""
import argparse
import hashlib
import json
from pathlib import Path
import re

METHOD = 'compiler.c2.irTests.TestIfConstantThreshold testMask (IJ)J'


def attributes(tag):
    return dict(re.findall(r"([\w_]+)='([^']*)'", tag))


def ideal_evidence(path):
    text = path.read_text()
    methods = [attributes(t) for t in re.findall(r'<nmethod\b[^>]*>', text)]
    methods = [t for t in methods if t.get('method') == METHOD and t.get('compiler') == 'c2'
               and t.get('compile_kind') != 'osr']
    if not methods:
        raise ValueError(f'No regular C2 compilation of {METHOD}: {path}')
    cid = methods[-1]['compile_id']
    match = re.search(r"<ideal compile_id='" + cid + r"' compile_phase='PrintIdeal'>(.*?)</ideal>",
                      text, re.S)
    if not match:
        raise ValueError(f'No PrintIdeal for compile {cid}: {path}')
    graph = match.group(1)
    # Publish just the relevant nodes, not raw metadata or process addresses.
    nodes = [line for line in graph.splitlines()
             if re.match(r'\s*\d+\s+(ConI|CmpI|Bool|If|IfTrue|IfFalse)\s+===', line)]
    return {'method': METHOD, 'compiler': 'c2', 'compile_id': cid, 'phase': 'PrintIdeal',
            'cmp_i': len(re.findall(r'^\s*\d+\s+CmpI\s+===', graph, re.M)),
            'if': len(re.findall(r'^\s*\d+\s+If\s+===', graph, re.M)), 'nodes': nodes}


def assembly_evidence(path, method):
    text = path.read_text()
    for section in text.split('============================= C2-compiled nmethod ==============================')[1:]:
        match = re.search(r'^Compiled method \(c2\)\s+\d+\s+(\d+)\s+ThresholdProbe::' + method +
                          r' \(17 bytes\)', section, re.M)
        if not match:
            continue
        code_size = int(re.search(r'^ main code\s+.*= (\d+)$', section, re.M).group(1))
        opto = section.split('OptoAssembly for Compile_id = ', 1)[1].split('----------------------------------- Assembly', 1)[0]
        lines = [l.strip() for l in opto.splitlines()
                 if re.search(r'\bcmpl\b|\bjg,s\b|\bjge,s\b|uncommon_trap\(', l)]
        return {'method': f'ThresholdProbe::{method}(IJ)J', 'compiler': 'c2',
                'compile_id': match.group(1), 'main_code_bytes': code_size,
                'trap_count': opto.count("uncommon_trap(reason='unstable_if'"), 'opto_assembly': lines}
    raise ValueError(f'No matching C2 compilation: {path}, {method}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('baseline_ir', 'candidate_ir', 'baseline_asm', 'candidate_asm'):
        parser.add_argument('--' + name.replace('_', '-'), type=Path, required=True)
    args = parser.parse_args()
    result = {}
    for side in ('baseline', 'candidate'):
        ir = getattr(args, side + '_ir')
        asm = getattr(args, side + '_asm')
        result[side] = {'ir_log_sha256': hashlib.sha256(ir.read_bytes()).hexdigest(),
                        'assembly_log_sha256': hashlib.sha256(asm.read_bytes()).hexdigest(),
                        'test_mask': ideal_evidence(ir),
                        'direct': assembly_evidence(asm, 'direct'),
                        'normalized': assembly_evidence(asm, 'normalized')}
    assert result['baseline']['test_mask']['cmp_i'] == 2
    assert result['baseline']['test_mask']['if'] == 2
    assert result['candidate']['test_mask']['cmp_i'] == 1
    assert result['candidate']['test_mask']['if'] == 1
    assert result['baseline']['direct']['trap_count'] == 1
    assert result['candidate']['direct']['trap_count'] == 0
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
