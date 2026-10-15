"""Same-VM capability selection, then baseline-only build. No measurements here."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess

BASE='02324e6bd026411407983df06284cd79460c33f6'
PAYLOAD=Path(__file__).resolve().parent

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def save(path,value):
    with Path(path).open('x') as f:json.dump(value,f,indent=2);f.write('\n')

def native_hashes(image):
    return {str(p.relative_to(image)):sha(p) for p in sorted(Path(image).rglob('*'))
            if p.is_file() and ('.so' in p.name or p.name=='java')}

def context():
    return dict(boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
                hostname=platform.node(),uid=os.getuid(),pid_namespace=os.readlink('/proc/self/ns/pid'),
                github_run_id=os.environ.get('GITHUB_RUN_ID'),
                github_run_attempt=os.environ.get('GITHUB_RUN_ATTEMPT'))

def choose_modes(probe):
    events={e['name']:e for e in probe['events']}
    pc=events['software_cpu_clock_ip_samples']
    group=events['pinned_cycles_instructions_ref_cycles_group']
    return dict(pc=bool(pc.get('usable_requested_mode') and pc.get('nonzero_ip_samples',0)>0
                        and pc.get('first_monotonic_time',0)>0
                        and pc.get('last_monotonic_time',0)>=pc.get('first_monotonic_time',0)
                        and not pc.get('lost_records') and not pc.get('malformed') and not pc.get('operation_errno')),
                pmu=bool(group.get('usable_unmultiplexed') and group.get('nr')==3
                         and group.get('time_enabled',0)>0 and group.get('time_enabled')==group.get('time_running')
                         and len(group.get('counts',[]))==3 and all(v>0 for v in group.get('counts',[]))
                         and not group.get('operation_errno')),
                perf_scheduling=False,
                perf_scheduling_reason='Omitted: passive RUSAGE_THREAD/thread CPU/boundary CPU always required; zero perf counts do not validate increments')

def run(command,out,label,cwd=None):
    save(out/(label+'.argv.json'),command)
    with (out/(label+'.log')).open('x') as f:
        r=subprocess.run(command,cwd=cwd,stdout=f,stderr=subprocess.STDOUT,check=False)
    if r.returncode:raise RuntimeError(label+' failed; stop, preserve evidence, no retry')

def preflight(out):
    out.mkdir()
    require_native()
    save(out/'context.json',context())
    run(['gcc','-std=gnu11','-O2','-Wall','-Wextra','-Werror',str(PAYLOAD/'probe_perf_capabilities.c'),'-o',str(out/'probe')],out,'compile-preflight')
    run(['taskset','-c','0','python3',str(PAYLOAD/'probe_driver.py'),str(out/'probe'),str(out/'capabilities.json')],out,'preflight')
    metadata=json.loads((out/'capabilities.json').read_text())
    if metadata['returncode']:raise RuntimeError('mandatory preflight failed')
    selected=choose_modes(metadata['probe'])
    selected.update(context=context(),capabilities_sha256=sha(out/'capabilities.json'),
                    selected_once=True, unavailable_policy='No per-fork downgrade or retry')
    save(out/'modes.json',selected)
    save(out/'protocol.json',json.loads((PAYLOAD/'protocol.json').read_text()))
    print(json.dumps(dict(stage='preflight',modes=selected,
                         cpu_model=metadata['cpu'].get('model name'),cpu_vendor=metadata['cpu'].get('vendor_id'),
                         kernel=metadata['uname'],perf_event_paranoid=metadata['perf_event_paranoid'],
                         capability_events=metadata['probe']['events'])),flush=True)

def require_native():
    if platform.system()!='Linux' or platform.machine()!='x86_64' or os.getuid()==0 or 0 not in os.sched_getaffinity(0):
        raise RuntimeError('Requires ordinary-user native Linux x86_64 with CPU0; do not hunt/retry')
    cpu=Path('/proc/cpuinfo').read_text()
    if 'GenuineIntel' not in cpu and 'AuthenticAMD' not in cpu:
        raise RuntimeError('Reviewed runner scope is AMD/Intel x86_64')

def check_context(out):
    require_native()
    modes=json.loads((out/'modes.json').read_text())
    if modes['context']!=context() or modes['capabilities_sha256']!=sha(out/'capabilities.json'):
        raise RuntimeError('Preflight VM/context changed')
    return modes

def normalized_root(jdk,classes):
    text=subprocess.check_output([str(jdk/'bin/javap'),'-c','-p','-classpath',str(classes),'Steady'],text=True)
    body=text.split('static long callsUnbound(int)',1)[1].split('static long callsJava(int)',1)[0]
    return re.sub(r'#\d+','#CP',body).strip()

def compile_payload(jdk,out):
    (out/'classes').mkdir()
    run([str(jdk/'bin/javac'),'-d',str(out/'classes'),str(PAYLOAD/'Trace.java'),str(PAYLOAD/'Steady.java')],out,'compile-harness')
    original=out/'original';original.mkdir()
    shutil.copy2(PAYLOAD/'original-Steady.java',original/'Steady.java')
    run([str(jdk/'bin/javac'),'-d',str(original),str(original/'Steady.java')],out,'compile-original-harness')
    before,after=normalized_root(jdk,original),normalized_root(jdk,out/'classes')
    save(out/'root-bytecode.json',dict(equal=before==after,normalization='javap resolved instructions; constant-pool slot numbers replaced',
                                     before=before,after=after,sha256=hashlib.sha256(after.encode()).hexdigest()))
    if before!=after:raise RuntimeError('Resolved root bytecode changed')
    common=['gcc','-std=gnu11','-O2','-Wall','-Wextra','-Werror','-fPIC','-shared','-pthread']
    run([*common,'-I'+str(jdk/'include'),'-I'+str(jdk/'include/linux'),str(PAYLOAD/'trace_agent.c'),'-o',str(out/'libtrace_agent.so')],out,'compile-agent')
    run(['gcc','-O2','-fPIC','-shared','-pthread',str(PAYLOAD/'native.c'),'-o',str(out/'libprobe.so')],out,'compile-native-harness')
    run(['nm','-S','--defined-only',str(out/'libprobe.so')],out,'native-symbols')
    run(['objdump','-d','--disassemble=id_i',str(out/'libprobe.so')],out,'native-leaf-disassembly')
    save(out/'payload-hashes.json',{p.name:sha(p) for p in sorted(PAYLOAD.iterdir()) if p.is_file()})

def build(repo,out):
    check_context(out)
    if subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()!=BASE or subprocess.check_output(['git','status','--porcelain'],cwd=repo,text=True).strip():
        raise RuntimeError('Build must start at clean pinned baseline')
    run(['make','CONF=ffm-diagnostic','images'],out,'build-baseline',repo)
    image=repo/'build/ffm-diagnostic/images/jdk'
    native=native_hashes(image)
    if len(native)!=39:raise RuntimeError('Reviewed full desktop profile requires 39 native file hashes')
    (out/'images').mkdir();jdk=out/'images/base';shutil.copytree(image,jdk,symlinks=True)
    save(out/'image.json',dict(source=BASE,native_hashes=native,modules_sha256=sha(jdk/'lib/modules'),
                              release=(jdk/'release').read_text()))
    compile_payload(jdk,out)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('action',choices=['preflight','build']);p.add_argument('--output',required=True);p.add_argument('--repo')
    args=p.parse_args();out=Path(args.output).resolve()
    if args.action=='preflight':preflight(out)
    else:
        if not args.repo:p.error('--repo required for build')
        build(Path(args.repo).resolve(),out)
