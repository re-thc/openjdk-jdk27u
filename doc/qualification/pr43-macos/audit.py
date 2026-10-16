# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Conservative auditors: never count an arbitrary baseline failure as success."""
import re

def applicability(text, expected):
    actual={}
    for name,ids in re.findall(r'^\s*- (\w+):\s*([\d, ]+)\s*$',text,re.M):
        actual.setdefault(name,set()).update(map(int,re.findall(r'\d+',ids)))
    missing={name:list(range(1,count+1)) for name,count in expected.items() if actual.get(name)!=set(range(1,count+1))}
    return missing

def failures(text):
    marker=r'\d+\) Method "[^"\n]+::(\w+)" - \[Failed IR rules: \d+\]:'
    chunks=[]
    for group in text.split('>>> Check stdout for compilation output')[0:1]:
        matches=list(re.finditer(marker,group))
        for i,m in enumerate(matches):chunks.append((m.group(1),group[m.end():matches[i+1].start() if i+1<len(matches) else len(group)]))
    return chunks

def baseline(text, positives):
    chunks=failures(text); names={name for name,_ in chunks};errors=[]
    if names!=set(positives):errors.append('Failed methods differ from exact expected positives: '+repr(sorted(names)))
    for name,node in positives.items():
        sections=[part for method,part in chunks if method==name]
        ok=False
        for part in sections:
            for constraint in re.split(r'(?=\* Constraint \d+:)',part):
                if node in constraint and re.search(r'\[found\]\s+0\s+[^\n]+\s+1\s+\[given\]',constraint):ok=True
        if not ok:errors.append(name+': no intended zero-node count failure for '+node)
    if any('> Phase "Before Matching"' in part for _,part in chunks):errors.append('Unexpected BEFORE_MATCHING failure')
    if re.search(r'Method was not compiled|NO compilation output found|Test VM exited with code|assertEQ failed|must be C2 compiled',text):errors.append('Compilation/semantic/output failure, not a clean missing-node control')
    if 'IRViolationException' not in text:errors.append('No IRViolationException')
    return errors
