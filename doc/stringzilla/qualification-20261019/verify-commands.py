#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Check actual MSVC compilation recipes for all three debug configurations."""
import json
from pathlib import Path
import re

rows=[]
for name,expected in [('perf','-O2'),('flags-fastdebug','-O2'),('flags-slowdebug','-Od')]:
    if name=='perf':
        files=list((Path('build')/name).rglob('StringZillaKernels.obj.cmdline'))
        assert len(files)==1,files
        command=files[0].read_text()
    else:
        records=[]
        for p in (Path('build')/name/'make-support/compile-commands').glob('*.json'):
            record=json.loads(p.read_text().rstrip().rstrip(','))
            if record['file'].replace('\\','/').endswith('/StringZillaKernels.c'):records.append(record)
        assert len(records)==1,(name,len(records))
        command=records[0]['command']
    opts=re.findall(r'(?<!\S)[-/]O(?:[0123d]|s)(?!\S)',command)
    assert opts==[expected],(name,opts,command)
    rows.append({'configuration':name,'optimization':expected,'command':command})
Path('pair/actual-optimization-commands.json').write_text(json.dumps(rows,indent=2)+'\n')
