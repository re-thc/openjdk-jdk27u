#!/usr/bin/env python3
"""Audit text packaging for binary files and credential patterns, without disclosure."""
import json, os, re, sys
from pathlib import Path
root=Path(sys.argv[1]).resolve()
patterns={
    'github-token':rb'\b(?:gh[pousr]_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{30,})\b',
    'private-key':rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----'}
secrets={key:value.encode() for key,value in os.environ.items()
         if len(value)>=16 and re.search(r'TOKEN|PASSWORD|SECRET|API_KEY|ACCESS_KEY|PRIVATE_KEY|AUTH',key)}
files=0; size=0; flags=[]
for path in sorted(root.rglob('*')):
    if not path.is_file() or '.git' in path.relative_to(root).parts:
        continue
    data=path.read_bytes(); files+=1; size+=len(data)
    if b'\0' in data: flags.append(dict(path=str(path.relative_to(root)),kind='binary/NUL'))
    for name,pattern in patterns.items():
        if re.search(pattern,data): flags.append(dict(path=str(path.relative_to(root)),kind=name))
    for key,value in secrets.items():
        if value in data: flags.append(dict(path=str(path.relative_to(root)),kind='environment:'+key))
print(json.dumps(dict(text_files=files,bytes=size,flags=flags),indent=2))
if flags: raise SystemExit('Evidence audit flagged files; do not publish before resolving')
