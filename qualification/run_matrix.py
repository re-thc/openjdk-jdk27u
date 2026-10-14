#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
# This code is distributed without any warranty; see the LICENSE file.
"""Balanced matched-image phase measurements; exact raw windows and compiler logs."""
import argparse, gzip, hashlib, json, os, pathlib, random, subprocess, time
p=argparse.ArgumentParser()
p.add_argument('--base',required=True);p.add_argument('--patched',required=True)
p.add_argument('--classes',required=True);p.add_argument('--whitebox',required=True)
p.add_argument('--out',required=True);p.add_argument('--cohort',choices=['cold','tiers','osr','signatures','wide','observer'],required=True)
p.add_argument('--pairs',type=int,default=12);p.add_argument('--cpu',type=int)
p.add_argument('--native-arm',action='store_true')
p.add_argument('--observed-cold',action='store_true')
p.add_argument('--unlogged',action='store_true')
a=p.parse_args();out=pathlib.Path(a.out);out.mkdir(parents=True,exist_ok=True)
cpu=a.cpu if a.cpu is not None else min(os.sched_getaffinity(0))
headers={'four':[],'eight':['-XX:-UseFourByteObjectHeaders'],'legacy':['-XX:-UseCompactObjectHeaders']}
configs=[]
if a.cohort=='cold':
 configs=[(h,128,'cold',k,a.observed_cold,[]) for h in headers for k in ['conversion','rawBits']]
elif a.cohort=='tiers':
 configs=[(h,128,t,k,obs,[]) for h in headers for t in ['int','c1','c2'] for k in ['conversion','rawBits','directBits','arithmetic'] for obs in [False,True]]
elif a.cohort=='osr':
 configs=[(h,128,'osr',k,True,[]) for h in headers for k in ['osrAccumulator','osrTransient','osrArray','osrScalar']]
elif a.cohort=='observer':
 configs=[('four',128,'osr','osrAccumulator',obs,[]) for obs in [False,True]]
elif a.cohort=='signatures':
 configs=[('four',128,'c2',k,True,f) for k in ['signatureArgs','signatureReturn','signatureArray','signatureArrayReturn'] for f in [[],['-XX:CompileCommand=inline,PhaseVectorKernels::vectorArguments','-XX:CompileCommand=inline,PhaseVectorKernels::vectorReturn'],['-XX:CompileCommand=dontinline,PhaseVectorKernels::arrayArguments','-XX:CompileCommand=dontinline,PhaseVectorKernels::arrayReturn']]]
else:
 flags=['-XX:UseSVE=0'] if a.native_arm else ['-XX:UseAVX=2']
 configs=[(h,bits,t,k,obs,flags) for h in headers for bits in [128,512] for t in ['c1','c2'] for k in ['conversion','rawBits'] for obs in [False,True]]
images={'base':pathlib.Path(a.base),'patched':pathlib.Path(a.patched)}
metadata={'cohort':a.cohort,'pairs':a.pairs,'cpu':cpu,'native_arm':a.native_arm,'uname':os.uname()._asdict() if hasattr(os.uname(),'_asdict') else list(os.uname()),'images':{},'driver_files':{}}
for name,root in images.items():
 metadata['images'][name]={}
 for rel in ['bin/java','lib/modules','lib/server/libjvm.so','lib/server/classes_fourbyte.jsa','release']:
  file=root/rel
  if file.is_file():metadata['images'][name][rel]={'bytes':file.stat().st_size,'sha256':hashlib.file_digest(file.open('rb'),'sha256').hexdigest()}
 for tag,cmd in [('version',[str(root/'bin/java'),'-version']),('flags',[str(root/'bin/java'),'-XX:+PrintFlagsFinal','-version'])]:
  r=subprocess.run(cmd,capture_output=True,check=True)
  (out/(name+'-'+tag+'.txt')).write_bytes(r.stdout+r.stderr)
for directory in [pathlib.Path(a.classes),pathlib.Path(a.whitebox)]:
 for file in directory.rglob('*.class'):metadata['driver_files'][str(file)]={'bytes':file.stat().st_size,'sha256':hashlib.file_digest(file.open('rb'),'sha256').hexdigest()}
for name,cmd in [('cpu',['lscpu']),('limits',['sh','-c','cat /sys/fs/cgroup/cpu.max /sys/fs/cgroup/memory.max'])]:
 r=subprocess.run(cmd,capture_output=True);(out/(name+'.txt')).write_bytes(r.stdout+r.stderr)
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
# Each repetition contains matched adjacent images. Twelve pairs alternate
# AB/BA equally within every condition; shuffled condition order is fixed.
orders=[(r,c) for r in range(a.pairs) for c in configs];rng=random.Random(8392004);rng.shuffle(orders)
entries=['conversion','rawBits','directBits','arithmetic','osrAccumulator','osrTransient','osrArray','osrScalar','signatureArgs','signatureReturn','signatureArray','signatureArrayReturn']
for rep,(header,bits,mode,kernel,observed,extra) in orders:
 order=['base','patched'] if rep%2==0 else ['patched','base']
 for name in order:
  label=f'{name}-{header}-{bits}-{mode}-{kernel}-obs{int(observed)}-extra{hashlib.sha256('|'.join(extra).encode()).hexdigest()[:8]}-r{rep}'
  target=out/label
  if target.with_suffix('.stdout').exists():raise SystemExit('Refusing to overwrite '+str(target))
  cmd=['taskset','-c',str(cpu),str(images[name]/'bin/java'),'-Xms256m','-Xmx512m','-XX:ActiveProcessorCount=2','--add-modules=jdk.incubator.vector','-DvectorBits='+str(bits),'-DobserveCompilation='+str(observed).lower(),'-XX:+UnlockDiagnosticVMOptions',]
  if not a.unlogged:cmd+=['-XX:+LogCompilation','-XX:LogFile='+str(target)+'.xml']
  if observed:cmd+=['-XX:+WhiteBoxAPI','-Xbootclasspath/a:'+str(pathlib.Path(a.whitebox).resolve())]
  cmd+=headers[header]+extra
  if mode=='int':cmd+=['-Xint']
  elif mode=='c1':cmd+=['-Xbatch','-XX:TieredStopAtLevel=1']
  elif mode=='c2':cmd+=['-Xbatch','-XX:-TieredCompilation']
  cmd+=['-XX:CompileCommand=dontinline,PhaseVectorKernels::'+method for method in entries]
  cmd+=['-XX:CompileCommand=dontinline,PhaseVectorProbe::invoke','-cp',str(pathlib.Path(a.classes).resolve())+os.pathsep+str(pathlib.Path(a.whitebox).resolve()),'PhaseVectorProbe',kernel,mode]
  start=time.time()
  try:
   r=subprocess.run(cmd,capture_output=True,timeout=180)
   status='completed';returncode=r.returncode;stdout=r.stdout;stderr=r.stderr
  except subprocess.TimeoutExpired as exc:
   status='timeout';returncode=None;stdout=exc.stdout or b'';stderr=exc.stderr or b''
  target.with_suffix('.stdout').write_bytes(stdout);target.with_suffix('.stderr').write_bytes(stderr)
  record={'label':label,'rep':rep,'image':name,'header':header,'bits':bits,'mode':mode,'kernel':kernel,'observed':observed,'extra':extra,'command':cmd,'returncode':returncode,'status':status,'start':start,'elapsed':time.time()-start}
  with (out/'commands.jsonl').open('a') as f:f.write(json.dumps(record)+'\n')
  log=target.with_suffix('.xml')
  if log.exists():
   with log.open('rb') as src,gzip.GzipFile(filename=str(log)+'.gz',mode='wb',mtime=0) as dest:
    while chunk:=src.read(1024*1024):dest.write(chunk)
   log.unlink()
  print(label,returncode,status,flush=True)
  if status!='completed' or returncode:raise SystemExit('Failed '+label+'; inspect retained partial output and command')
