#!/usr/bin/env python3
"""C2 profile-frequency estimates on captured final allocated instructions.

Frequencies are compiler CFG estimates, not hardware event measurements.
Unattributed entry code is reported separately rather than assigned a frequency.
"""
import bisect
import argparse
import json
from pathlib import Path
import re
import sys
sys.path.insert(0, '/workspace/work/spill-sharing/deps/python')
import capstone as cs
from capstone import x86_const as x86

root = Path('/workspace/work/spill-sharing/code')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--prefix', default='master')
parser.add_argument('--output', type=Path, default=root/'final-frequency-accounting.json')
args = parser.parse_args()
decoder = cs.Cs(cs.CS_ARCH_X86, cs.CS_MODE_64)
decoder.detail = True
decoder.skipdata = True
results = []
for kind in ('source','repetitive','dense','long-offset','random'):
    for arm in ('baseline','candidate'):
        label = f'{args.prefix}-{arm}-fastdebug-{kind}'
        text = (root / (label+'.log')).read_text()
        rows = json.loads((root / (label+'-accounting/accounting.json')).read_text())
        release = json.loads((root / f'{args.prefix}-{arm}-release-{kind}-accounting/accounting.json').read_text())
        for method in ('executeSequencesDirect','decodeSequencesRolling'):
            matches = [r for r in rows if r['compiler']=='c2' and not r['osr']
                       and r['method'].endswith('::'+method)]
            if not matches: continue
            row = matches[-1]
            begin,end = int(row['main_start'],16),int(row['main_end'],16)
            at = text.index(row['header'])
            next_at = text.find('Compiled method (',at+len(row['header']))
            section = text[at:next_at if next_at>=0 else len(text)]
            blocks = {}
            for match in re.finditer(r'(?m)^\s*;; B(\d+):[^\n]*Freq: ([\d.eE+-]+)',section):
                instruction = re.search(r'(?m)^\s*(0x[0-9a-f]+):\s+code=',section[match.end():])
                if instruction:
                    address = int(instruction[1],16)
                    if begin<=address<end:
                        blocks[address] = dict(block=int(match[1]),start=address-begin,
                                               frequency=float(match[2]))
            assert blocks, label
            starts = sorted(blocks)
            keys = ('nonpadding_instructions','stack_loads','stack_stores','register_moves')
            weighted = dict.fromkeys(keys,0.0)
            unattributed = dict.fromkeys(keys,0)
            for block in blocks.values(): block['counts']=dict.fromkeys(keys,0)
            for instruction in decoder.disasm(Path(row['binary']).read_bytes(),begin):
                counts = dict.fromkeys(keys,0)
                if instruction.id == 0: continue
                counts['nonpadding_instructions'] = int(instruction.mnemonic not in ('nop','hlt','int3'))
                memory = [op for op in instruction.operands if op.type==x86.X86_OP_MEM
                          and op.mem.base==x86.X86_REG_RSP]
                bang = instruction.mnemonic=='mov' and any(op.mem.disp < -4096 for op in memory)
                if memory and not bang and instruction.id!=x86.X86_INS_LEA:
                    counts['stack_loads']=int(any(op.access&cs.CS_AC_READ for op in memory))
                    counts['stack_stores']=int(any(op.access&cs.CS_AC_WRITE for op in memory))
                counts['register_moves']=int(instruction.mnemonic.startswith(('mov','vmov'))
                    and len(instruction.operands)==2
                    and all(op.type==x86.X86_OP_REG for op in instruction.operands))
                index=bisect.bisect_right(starts,instruction.address)-1
                if index<0:
                    for key in keys: unattributed[key]+=counts[key]
                else:
                    block=blocks[starts[index]]
                    for key in keys:
                        block['counts'][key]+=counts[key]
                        weighted[key]+=counts[key]*block['frequency']
            release_row=[r for r in release if r['compiler']=='c2' and not r['osr']
                         and r['method'].endswith('::'+method)][-1]
            same=all(row[key]==release_row[key] for key in (*keys,'frame_bytes','main_bytes'))
            for key in keys:
                assert unattributed[key]+sum(b['counts'][key] for b in blocks.values())==row[key]
            result=dict(corpus=kind,arm=arm,method=method,compilation=row['compilation'],
                        estimate='C2 CFG profile frequencies relative to entry',
                        release_same_transport_and_size=same,weighted=weighted,
                        unattributed=unattributed,blocks=[blocks[k] for k in starts])
            results.append(result)
            print(kind,arm,method,'same release metrics',same,'weighted',weighted)
args.output.write_text(json.dumps(results,indent=2)+'\n')
