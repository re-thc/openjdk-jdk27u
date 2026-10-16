#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Decode byte-order-preserved installed AArch64 code with an existing LLVM tool."""
import argparse,re,shutil,subprocess,sys
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--hex',required=True,help='actual bytes, e.g. "20 84 0c 0f", in increasing address order');p.add_argument('--llvm-mc');a=p.parse_args()
tokens=re.findall(r'(?:0x)?([0-9a-fA-F]{2})',a.hex)
if not tokens or len(tokens)%4:raise SystemExit('Supply complete 4-byte AArch64 instructions in actual byte order, not printed integer words.')
tool=a.llvm_mc or shutil.which('llvm-mc')
if not tool:
    for path in ('/opt/homebrew/opt/llvm/bin/llvm-mc','/usr/local/opt/llvm/bin/llvm-mc'):
        if Path(path).is_file():tool=path;break
if not tool:raise SystemExit('No existing llvm-mc found. Retain raw code and mark decode pending, or install the ordinary optional llvm tool separately.')
data=' '.join('0x'+v for v in tokens)+'\n'
result=subprocess.run([tool,'--disassemble','--triple=aarch64'],input=data,text=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
print(result.stdout,end='');print(result.stderr,end='',file=sys.stderr);raise SystemExit(result.returncode)
