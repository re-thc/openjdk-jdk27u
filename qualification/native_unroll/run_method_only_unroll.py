"""Small observed unroll/codegen diagnostic; no performance qualification claim."""
import argparse, csv, hashlib, itertools, json, os, pathlib, subprocess

PIN='6d8363d0e452a50a8f5254c9ca4c0c7dbef208dd'
CLASS_SHA={'PhaseVectorKernels.class':'ae574d88e5a124ae3c10e8dc7980454621b34fa836c079275f3604272e79f71c',
           'PhaseVectorProbe.class':'d73b7723df01c54660c8e3f8336f4bec83fa2126a2278b3d5b9d39c43b1a3675'}
CONTROLLER_SHA={'FixedVectorProbe.class':'5945f0e3503b90e58884d9ceb5dd7c9368177f8136fe89b66b9b6d784dc67499',
                'ProbeControllerPrimer.class':'4291318c4e190947894cbe0bd8fe64a95d83483812dd6a81f1a9898370a564c4'}

def sha(p):
    with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()

def main():
    p=argparse.ArgumentParser(description=__doc__)
    for name in ['base','rebuilt-b3','candidate']:p.add_argument('--'+name+'-jdk',type=pathlib.Path,required=True)
    p.add_argument('--frozen',type=pathlib.Path,required=True)
    p.add_argument('--classes',type=pathlib.Path,required=True)
    p.add_argument('--timing-root',type=pathlib.Path,required=True)
    p.add_argument('--out',type=pathlib.Path,required=True)
    p.add_argument('--execute',action='store_true')
    a=p.parse_args();out=a.out.resolve()
    if out.exists() and any(out.iterdir()):p.error('Refusing to overwrite results')
    out.mkdir(parents=True,exist_ok=True)
    images={'base87':a.base_jdk.resolve(),'rebuilt_b3':a.rebuilt_b3_jdk.resolve(),'candidate':a.candidate_jdk.resolve()}
    frozen=a.frozen.resolve();classes=a.classes.resolve();cpu=min(os.sched_getaffinity(0))
    plan={'scope':'Observed causal codegen diagnostic; original failed2% gate unchanged, no qualification from these timings',
          'source_pin':PIN,'processes':12,'new_builds':0,'headers':['legacy'],'bits':128,
          'method_intervention':'Prime at default16; recompile only kernel at2 or16; restore16 before all measured-pass calls; hold both caller compilation IDs',
          'assembly':'WB raw code snapshots outside all windows, before/after; print/hash only after measured pass',
          'steady_calls_per_window':100000,'windows':5,'paired_uncertainty_or_nonregression_claim':False,'commands':[]}
    for sve,cap,image in itertools.product(['default','0'],[16,2],images):
        name=image+'-sve'+sve+'-kernelcap'+str(cap);dump=out/name
        cmd=['taskset','-c',str(cpu),str(images[image]/'bin/java'),'-Xshare:off','-Xms256m','-Xmx512m',
             '-XX:ActiveProcessorCount=2','--add-modules=jdk.incubator.vector','-Xbatch','-XX:-TieredCompilation',
             '-XX:-UseCompactObjectHeaders','-XX:+UnlockDiagnosticVMOptions','-XX:+WhiteBoxAPI',
             '-Xbootclasspath/a:'+str(frozen/'qualification/whitebox'),'-DobserveCompilation=true',
             '-DvectorBits=128','-DmeasureCalls=100000','-XX:CompileCommand=dontinline,FixedVectorProbe::invoke',
             '-XX:CompileCommand=dontinline,PhaseVectorKernels::conversion']
        if sve=='0':cmd+=['-XX:UseSVE=0']
        cmd+=['-cp',str(classes)+os.pathsep+str(frozen/'qualification/classes'),
              'MethodOnlyUnrollDiagnostic',str(cap),str(dump)]
        plan['commands'].append({'name':name,'image':image,'sve':sve,'cap':cap,'argv':cmd})
    (out/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
    print('METHOD_ONLY_PLAN_JSON='+json.dumps(plan),flush=True)
    if not a.execute:return
    if os.uname().machine!='aarch64':p.error('Native AArch64 required')
    for tree in ['src','test','make','bin']:
        if subprocess.check_output(['git','rev-parse','HEAD:'+tree])!=subprocess.check_output(['git','rev-parse',PIN+':'+tree]):
            raise RuntimeError('Dirty/different product/test tree: '+tree)
    if subprocess.check_output(['git','status','--porcelain','--','src','test','make','bin']):raise RuntimeError('Dirty source')
    for directory,expected in [(frozen/'qualification/classes',CLASS_SHA),(classes,CONTROLLER_SHA)]:
        for name,digest in expected.items():
            if sha(directory/name)!=digest:raise RuntimeError('Frozen class mismatch: '+name)
    plans=[]
    for path in a.timing_root.rglob('plan.json'):
        d=json.loads(path.read_text())
        if d.get('mode')=='timing' and d.get('candidate_commit')==PIN:plans.append(d)
    if len(plans)!=1:raise RuntimeError('Unique pinned original timing plan required')
    original=plans[0]
    for image,jdk in images.items():
        for rel in ['bin/java','lib/modules','lib/server/libjvm.so','release']:
            if sha(jdk/rel)!=original['images'][image][rel]['sha256']:raise RuntimeError('Wrong image: '+image+'/'+rel)
    results=[]
    for entry in plan['commands']:
        log=out/(entry['name']+'.log')
        with log.open('w') as f:r=subprocess.run(entry['argv'],stdout=f,stderr=subprocess.STDOUT,timeout=300)
        text=log.read_text();record={**entry,'exit_status':r.returncode,'stdout_sha256':sha(log)}
        if r.returncode:
            print('METHOD_ONLY_FAILED_PROCESS_JSON='+json.dumps({**record,'stdout':text}),flush=True)
            raise RuntimeError('Observed protocol failed: '+entry['name'])
        measured=text.split('METHOD_ONLY_MEASURED_PASS_BEGIN\n')
        if len(measured)!=2:raise RuntimeError('Measured pass marker missing')
        rows=list(csv.DictReader(s for s in measured[1].splitlines() if s.startswith(('kernel,','conversion,'))))
        windows=[x for x in rows if x['phase'].startswith('measure')]
        if len(windows)!=5 or any(int(x['calls'])!=100000 or int(x['compilation_ms'])!=0
                or int(x['normal_before'])!=4 or int(x['normal_after'])!=4 for x in windows):
            raise RuntimeError('Level/compilation/workload safeguard failed')
        codes=[json.loads(line.split('=',1)[1]) for line in text.splitlines() if line.startswith('METHOD_ONLY_CODE_JSON=')]
        for code in codes:
            data=bytes.fromhex(code['hex'])
            if len(data)!=code['bytes'] or hashlib.sha256(data).hexdigest()!=code['sha256']:
                raise RuntimeError('Code snapshot hash mismatch')
        if len(codes)!=9 or 'METHOD_ONLY_PASS' not in text or 'global_restored=16' not in text:
            raise RuntimeError('Protocol/code evidence incomplete')
        record.update(rows=rows,codes=codes,protocol='passed',candidate_qualified=False)
        results.append(record)
        print('METHOD_ONLY_PROCESS_JSON='+json.dumps(record),flush=True)
        (out/'results.json').write_text(json.dumps(results,indent=2)+'\n')
    print('METHOD_ONLY_COMPLETE_JSON='+json.dumps({'processes':len(results),'candidate_qualified':False,
          'next':'Explicit captured-kernel and caller instruction/address review; no old gate overridden'}),flush=True)

if __name__=='__main__':main()
