#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
from pathlib import Path
import hashlib,io,json,sys,tarfile,zipfile
import argparse
parser=argparse.ArgumentParser(description='Verify every file in a retained native master/candidate image against its sealed inventory')
parser.add_argument('--backend',choices=['neon','msvc'],required=True)
parser.add_argument('--candidate-source',required=True)
parser.add_argument('--archive',type=Path,required=True)
parser.add_argument('--output',type=Path,required=True)
a=parser.parse_args();backend=a.backend;p=a.archive;out=a.output;out.mkdir(parents=True,exist_ok=True)

def sha(b):return hashlib.sha256(b).hexdigest()
def stream_hash(f):
 h=hashlib.sha256()
 while b:=f.read(1024*1024):h.update(b)
 return h.hexdigest()
def payload_row(name,f):
 h=hashlib.sha256();size=0
 while b:=f.read(1024*1024):h.update(b);size+=len(b)
 return [name,size,h.hexdigest()]
with zipfile.ZipFile(p) as z:
 assert len(z.namelist())==len(set(z.namelist()))
 assert all(not Path(n).is_absolute() and '..' not in Path(n).parts and chr(92) not in n and ':' not in n for n in z.namelist())
 prefix='' if backend=='neon' else 'candidate-retained/'
 for n in z.namelist():
  if n.startswith(prefix) and n[len(prefix):].count('/')==0 and not n.endswith('/') and Path(n).suffix in ['.json','.gmk','.log','.sha256']:
   (out/Path(n).name).write_bytes(z.read(n))
 pair=json.loads(z.read(prefix+'pair-receipt.json'));inventory=json.loads(z.read(prefix+'pair-inventories.json'));master=json.loads(z.read(prefix+'master-inventory.json'))
 assert pair['sources']['fork']==a.candidate_source;assert pair['rebuild']['checkout_clean'] and pair['rebuild']['shipped_class_matches_build_output']
 expected={'fork':inventory['fork'],'master':master};verified={}
 for name,v in expected.items():
  rows=[]
  if backend=='neon':
   n=prefix+('fork-jdk.tar.gz' if name=='fork' else 'master-jdk.tar.gz');raw=z.read(n);assert sha(raw)==z.read(n+'.sha256').decode().split()[0]
   with tarfile.open(fileobj=io.BytesIO(raw),mode='r:gz') as t:
    names=t.getnames();assert len(names)==len(set(names));assert all(n==name or n.startswith(name+'/') for n in names)
    for f in t.getmembers():
     if f.isdir():continue
     path=f.name[len(name)+1:];assert path and '..' not in Path(path).parts
     if f.issym():rows.append([path,'link',f.linkname])
     else:
      assert f.isfile() or f.islnk();g=t.extractfile(f);assert g is not None;rows.append(payload_row(path,g))
   del raw
  else:
   start='build/perf/images/jdk/' if name=='fork' else 'pair/master/'
   for info in z.infolist():
    if info.filename.startswith(start) and not info.is_dir():
     path=info.filename[len(start):]
     with z.open(info) as f:rows.append(payload_row(path,f))
  actual={row[0]:row for row in rows};expected_rows={row[0]:row for row in v['files']};assert len(actual)==len(rows);assert actual==expected_rows,(backend,name,[(p,actual.get(p),expected_rows.get(p)) for p in sorted(set(actual)|set(expected_rows)) if actual.get(p)!=expected_rows.get(p)][:10]);rows=[actual[row[0]] for row in v['files']];tree=sha(json.dumps(rows,separators=(',',':')).encode());assert tree==v['tree_sha256'];verified[name]={'tree_sha256':tree,'files':len(rows),'all_payload_files_verified':True}
 receipt={'backend':backend,'source':pair['sources']['fork'],'archive':p.name,'archive_bytes':p.stat().st_size,'archive_sha256':stream_hash(p.open('rb')),'images':verified,'kernel_compile_command':pair['rebuild']['kernel_compile_command'],'shipped_classes_sha256':pair['rebuild']['shipped_classes_sha256'],'independent_payload_hash_verification':True}
 (out/'independent-verification.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps({k:v for k,v in receipt.items() if k not in ['kernel_compile_command','shipped_classes_sha256']},indent=2))
