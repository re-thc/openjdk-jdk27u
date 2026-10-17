#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Unexecuted qualification helper: one fixed wall budget, no retry."""
import argparse, hashlib, json, os, re, shutil, signal, subprocess, sys, threading, time
from pathlib import Path

TOTAL_SECONDS=21600
VARIANTS=('baseline','cached','enabled','configured-off')
class LaunchHold(RuntimeError):pass

def fingerprint(path):
    path=Path(path).absolute()
    if not path.is_file():raise RuntimeError('required provenance file missing: '+str(path))
    value=hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda:stream.read(1024*1024),b''):value.update(block)
    return dict(path=str(path),resolved=str(path.resolve()),sha256=value.hexdigest())

def reject_encoded_rustflags():
    if 'CARGO_ENCODED_RUSTFLAGS' in os.environ:
        raise RuntimeError('unset CARGO_ENCODED_RUSTFLAGS before the entire packet')
    for name in ['RUSTC_WRAPPER','RUSTC_WORKSPACE_WRAPPER','CARGO_BUILD_RUSTC_WRAPPER']:
        if os.environ.get(name):raise RuntimeError('compiler wrapper must be unset: '+name)

def tool_environment():
    names=['PATH','CARGO_HOME','RUSTUP_HOME','RUSTUP_TOOLCHAIN','RUSTC','CARGO','RUSTC_WRAPPER','RUSTC_WORKSPACE_WRAPPER',
        'CARGO_BUILD_RUSTC_WRAPPER','CARGO_TARGET_DIR',
        'RUSTFLAGS','CARGO_BUILD_RUSTFLAGS','CARGO_BUILD_TARGET','CARGO_BUILD_RUSTC']
    names+=sorted(name for name in os.environ if name.startswith('CARGO_TARGET_')
        and name.endswith(('_LINKER','_RUSTFLAGS','_RUNNER')))
    return {name:os.environ.get(name) for name in names}

def validate_launch_audit(path,started,candidate_sha=None,root=None):
    if path is None:raise LaunchHold('HOLD: verified PID namespace, cgroup limits and filesystem ceiling are required')
    try:value=json.loads(Path(path).read_text())
    except (OSError,ValueError) as error:raise LaunchHold('HOLD: readable verified launch audit is missing') from error
    if not isinstance(value,dict):raise LaunchHold('HOLD: invalid launch audit')
    manager=value.get('manager',{});scratch=value.get('scratch',{})
    if not isinstance(manager,dict) or not isinstance(scratch,dict):raise LaunchHold('HOLD: invalid manager/scratch audit')
    valid=(value.get('schema')==1 and value.get('status')=='APPROVED'
        and value.get('started_monotonic')==started and value.get('total_seconds')==TOTAL_SECONDS
        and bool(value.get('audited_by')) and bool(value.get('candidate_sha'))
        and manager.get('kind')=='bubblewrap-pid1' and manager.get('verified') is True
        and manager.get('pid1') is True and bool(manager.get('pid_namespace'))
        and bool(manager.get('parent_pid_namespace'))
        and manager.get('pid_namespace')!=manager.get('parent_pid_namespace')
        and manager.get('cpu_max')=='400000 100000' and manager.get('memory_max')=='17179869184'
        and manager.get('cpu_max_path')=='/sys/fs/cgroup/cpu.max' and manager.get('memory_max_path')=='/sys/fs/cgroup/memory.max'
        and manager.get('timeout_total_seconds')==TOTAL_SECONDS and manager.get('kill_after_seconds')==10
        and scratch.get('verified') is True)
    if candidate_sha is not None:valid=valid and value.get('candidate_sha')==candidate_sha
    if root is not None:valid=valid and Path(value.get('root','')).resolve()==Path(root).resolve()
    try:
        capacity=os.statvfs(value['root']).f_blocks*os.statvfs(value['root']).f_frsize
        valid=(valid and os.readlink('/proc/self/ns/pid')==manager['pid_namespace']
            and os.readlink('/proc/1/ns/pid')==manager['pid_namespace']
            and Path(manager['cpu_max_path']).read_text().strip()==manager['cpu_max']
            and Path(manager['memory_max_path']).read_text().strip()==manager['memory_max']
            and os.stat(value['root']).st_dev==os.stat('/tmp').st_dev
            and capacity==scratch['capacity_bytes'] and 0<capacity<=80*1024**3)
    except (KeyError,OSError,AttributeError):valid=False
    if not valid:raise LaunchHold('HOLD: native PID namespace, cgroup limits and disk ceiling lack a matching launch audit')
    # The external wrapper must establish PID1 lifetime supervision before this check.
    # Merely writing APPROVED into a JSON file cannot create or qualify that supervisor.
    return value

def spec_values(path):
    return {match[1]:match[2].strip() for line in Path(path).read_text().splitlines()
        if (match:=re.match(r'^([A-Z][A-Z0-9_]*)\s*:=\s*(.*)$',line))}

def configured_path(value):
    value=value.strip()
    if not value or '$' in value or '\n' in value:
        raise RuntimeError('provenance requires a literal configured tool path: '+value)
    path=Path(value)
    if not path.is_absolute() or not path.is_file():
        raise RuntimeError('configured tool path is not a native absolute file: '+value)
    return path

def write_provenance(path,root,candidate_sha,started,pins,variants=VARIANTS):
    reject_encoded_rustflags();root=Path(root).resolve();files={};configs={}
    variants=list(variants)
    if len(set(variants))!=len(variants) or not {'enabled','configured-off'}.issubset(variants) or not set(variants).issubset(set(VARIANTS)|{'previous'}):
        raise RuntimeError('invalid provenance variant set')
    required={'make','cc','cxx','linker','boot-java','boot-javac','jtreg-jar','rustc-driver','rust-std','mold'}
    if not required.issubset(pins):raise RuntimeError('missing tool pins: '+','.join(sorted(required-set(pins))))
    for name,target in pins.items():files['tool:'+name]=fingerprint(target)
    for variant in variants:
        build=root/variant/'build/qualification';values=spec_values(build/'spec.gmk');configs[variant]=values
        if values.get('CONF_NAME')!='qualification' or values.get('DEBUG_LEVEL')!='release' or values.get('ENABLE_JAVAC_SERVER')!='false':
            raise RuntimeError('wrong normal build configuration: '+variant)
        expected_native='true' if variant in ['previous','enabled'] else 'false'
        if values.get('ENABLE_INSTANT_SPEEDATE','false')!=expected_native:
            raise RuntimeError('wrong native availability configuration: '+variant)
        for key,pin in [('MAKE','make'),('CC','cc'),('CXX','cxx'),('LD','linker')]:
            if configured_path(values.get(key,'')).resolve()!=Path(pins[pin]).resolve():
                raise RuntimeError(variant+': selected '+key+' differs from pinned '+pin)
        boot=configured_path(values.get('BOOT_JDK','')+'/bin/java'+('.exe' if os.name=='nt' else ''))
        javac=configured_path(values.get('BOOT_JDK','')+'/bin/javac'+('.exe' if os.name=='nt' else ''))
        jtreg=configured_path(values.get('JT_HOME','')+'/lib/jtreg.jar')
        for actual,pin in [(boot,'boot-java'),(javac,'boot-javac'),(jtreg,'jtreg-jar')]:
            if actual.resolve()!=Path(pins[pin]).resolve():raise RuntimeError(variant+': configured '+pin+' differs')
        for relative in ['spec.gmk','configure.log','configure-support/config.log']:
            files[variant+':'+relative]=fingerprint(build/relative)
        for relative in ['src/java.base/share/classes/java/time/Instant.java',
                'src/java.base/share/classes/java/time/format/DateTimeFormatterBuilder.java']:
            files[variant+':'+relative]=fingerprint(root/variant/relative)
    enabled=configs['enabled']
    if enabled.get('ENABLE_INSTANT_SPEEDATE')!='true' or configs['configured-off'].get('ENABLE_INSTANT_SPEEDATE')!='false':
        raise RuntimeError('wrong enabled/disabled native configuration')
    for key in ['CARGO_EXECUTABLE','RUSTC_EXECUTABLE']:
        files['tool:'+key]=fingerprint(configured_path(enabled.get(key,'')))
    license_path=Path(enabled['SPEEDATE_RUST_LICENSE'])
    files['tool:rust-license']=fingerprint(license_path)
    sysroot=license_path.parents[3]
    for tool in ['rustc','cargo']:
        files['tool:installed-'+tool]=fingerprint(sysroot/('bin/'+tool+('.exe' if os.name=='nt' else '')))
    env=shutil.which('env')
    if not env:raise RuntimeError('normal Cargo test command requires installed env')
    files['tool:env']=fingerprint(env)
    for variant in [name for name in variants if name in ['previous','enabled','configured-off']]:
        for relative in ['src/java.base/share/classes/java/time/Instant.java',
                'src/java.base/share/classes/java/time/InstantParser.java',
                'src/java.base/share/classes/java/time/InstantParserConfig.java.template',
                'src/java.base/share/native/libinstant/InstantParser.c',
                'src/java.base/share/native/libinstant/rust/Cargo.toml',
                'src/java.base/share/native/libinstant/rust/Cargo.lock',
                'src/java.base/share/native/libinstant/rust/src/lib.rs',
                'make/modules/java.base/lib/CoreLibraries.gmk','make/autoconf/lib-instant-speedate.m4']:
            files[variant+':'+relative]=fingerprint(root/variant/relative)
    revisions={name:('89885a6288e7aaabd01678a704a586272c0f96e3' if name in ['baseline','cached'] else
        '779753e390e43508372ac860fdf944a801c869c8' if name=='previous' else candidate_sha) for name in variants}
    value=dict(schema=1,root=str(root),candidate_sha=candidate_sha,started_monotonic=started,created_monotonic=time.monotonic(),
        variants=variants,source_roots={name:str(root/name) for name in variants},expected_source_revisions=revisions,
        total_seconds=TOTAL_SECONDS,files=files,configurations=configs,tool_environment=tool_environment(),
        rust=dict(cargo=enabled['CARGO_EXECUTABLE'],rustc=enabled['RUSTC_EXECUTABLE'],
            target=enabled['SPEEDATE_RUST_TARGET'],cpu=enabled['SPEEDATE_RUST_CPU']))
    path=Path(path)
    if path.exists():raise RuntimeError('refusing to replace provenance: '+str(path))
    path.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')

def validate_provenance(path,root=None,candidate_sha=None,started=None,variants=None):
    reject_encoded_rustflags();value=json.loads(Path(path).read_text())
    if value.get('schema')!=1 or value.get('total_seconds')!=TOTAL_SECONDS:
        raise RuntimeError('unsupported provenance manifest')
    if root is not None and Path(value['root']).resolve()!=Path(root).resolve():raise RuntimeError('provenance root differs')
    if candidate_sha is not None and value['candidate_sha']!=candidate_sha:raise RuntimeError('provenance candidate differs')
    if started is not None and value['started_monotonic']!=started:raise RuntimeError('provenance start differs')
    if variants is not None and set(value['variants'])!=set(variants):raise RuntimeError('provenance variant set differs')
    required_tools=['make','cc','cxx','linker','boot-java','boot-javac','jtreg-jar','rustc-driver','rust-std','mold',
        'CARGO_EXECUTABLE','RUSTC_EXECUTABLE','rust-license','installed-rustc','installed-cargo','env']
    if not all('tool:'+name in value['files'] for name in required_tools):raise RuntimeError('incomplete toolchain file pins')
    if value['tool_environment']!=tool_environment():raise RuntimeError('tool-selection environment changed since configure/build capture')
    for name,expected in value['files'].items():
        if fingerprint(expected['path'])!=expected:raise RuntimeError('provenance changed: '+name)
    for variant in value['variants']:
        if Path(value['source_roots'][variant]).resolve()!=(Path(value['root'])/variant).resolve():
            raise RuntimeError('provenance source root differs: '+variant)
        current=spec_values(Path(value['root'])/variant/'build/qualification/spec.gmk')
        if current!=value['configurations'][variant]:raise RuntimeError('configuration changed: '+variant)
        for relative in ['spec.gmk','configure.log','configure-support/config.log']:
            if variant+':'+relative not in value['files']:raise RuntimeError('incomplete configuration file pins: '+variant)
        if current.get('CONF_NAME')!='qualification' or current.get('DEBUG_LEVEL')!='release' or current.get('ENABLE_JAVAC_SERVER')!='false':
            raise RuntimeError('unsupported normal configuration: '+variant)
        expected_native='true' if variant in ['previous','enabled'] else 'false'
        if current.get('ENABLE_INSTANT_SPEEDATE','false')!=expected_native:
            raise RuntimeError('wrong native availability configuration: '+variant)
    enabled=value['configurations']['enabled']
    if value['rust']!={name:enabled[key] for name,key in [('cargo','CARGO_EXECUTABLE'),('rustc','RUSTC_EXECUTABLE'),
            ('target','SPEEDATE_RUST_TARGET'),('cpu','SPEEDATE_RUST_CPU')]}:
        raise RuntimeError('Cargo test configuration differs from normal production')
    return value

def image_files(cwd):
    home=Path(cwd)/'build/qualification/images/jdk';files={}
    for relative in ['release','lib/modules','bin/java','bin/java.exe',
            'lib/server/libjvm.so','lib/server/libjvm.dylib','bin/server/jvm.dll',
            'lib/libinstant.so','lib/libinstant.dylib','bin/instant.dll',
            'legal/java.base/speedate.md','legal/java.base/COPYRIGHT-library.html']:
        path=home/relative
        if path.is_file():files[relative]=fingerprint(path)
    if not all(name in files for name in ['release','lib/modules']):
        raise RuntimeError('normal image identity files missing: '+str(home))
    if not any(name in files for name in ['bin/java','bin/java.exe']) or not any(name in files for name in
            ['lib/server/libjvm.so','lib/server/libjvm.dylib','bin/server/jvm.dll']):
        raise RuntimeError('normal image launcher/JVM identity files missing: '+str(home))
    return files

def _validate_causal_report(path,candidate_sha):
    report=json.loads(Path(path).read_text())
    if (report.get('schema')!=1 or report.get('status')!='PASS' or report.get('completed') is not True
            or report.get('candidate_sha')!=candidate_sha or not report.get('evidence_files')):
        raise LaunchHold('HOLD: the fixed disabled-route comparison has not passed for this candidate')
    for expected in [*report['evidence_files'],report['provenance'],report['launch_audit']]:
        if fingerprint(expected['path'])!=expected:raise LaunchHold('HOLD: causal-comparison evidence changed')
    manifest=json.loads(Path(report['provenance']['path']).read_text())
    if (manifest.get('schema')!=1 or manifest.get('candidate_sha')!=candidate_sha
            or set(manifest.get('variants',[]))!={'previous','enabled','configured-off'}
            or manifest.get('expected_source_revisions',{}).get('previous')!='779753e390e43508372ac860fdf944a801c869c8'):
        raise LaunchHold('HOLD: causal source/provenance binding is incomplete')
    return report

def validate_causal_report(path,candidate_sha):
    try:return _validate_causal_report(path,candidate_sha)
    except LaunchHold:raise
    except (OSError,ValueError,KeyError,TypeError,RuntimeError) as error:
        raise LaunchHold('HOLD: causal-comparison evidence is missing, invalid or changed') from error

def execute(command, log, deadline, timeout, cwd=None,provenance=None,launch_audit=None,started=None):
    packet_started=started
    if packet_started is None or not 0<=time.monotonic()-packet_started<TOTAL_SECONDS:
        raise TimeoutError('invalid or expired monotonic packet start')
    deadline=min(deadline,packet_started+TOTAL_SECONDS)
    audit=validate_launch_audit(launch_audit,started)
    reject_encoded_rustflags()
    captured_provenance=validate_provenance(provenance) if provenance else None
    if captured_provenance and (captured_provenance['started_monotonic']!=started
            or captured_provenance['root']!=audit['root']
            or captured_provenance['candidate_sha']!=audit['candidate_sha']):
        raise RuntimeError('build provenance belongs to another audited packet')
    manifest_identity=fingerprint(provenance) if provenance else None
    audit_identity=fingerprint(launch_audit)
    command=[str(x) for x in command]
    check_image='run-test' in command
    build_image=command[-1:] == ['images']
    before_image=image_files(cwd) if check_image else None
    executable=shutil.which(command[0])
    if not executable:raise RuntimeError('command executable unavailable: '+command[0])
    executable_identity=fingerprint(executable)
    # Reserve bounded cleanup time inside both the command and packet ceilings.
    left=min(deadline-time.monotonic(),timeout)-10
    if left<=0:raise TimeoutError('qualification deadline reached')
    log=Path(log);log.parent.mkdir(parents=True,exist_ok=True)
    if log.exists():raise RuntimeError('refusing to replace an existing command log: '+str(log))
    with log.open('w') as stream:
        stream.write(repr([str(x) for x in command])+'\n');stream.flush()
        options={'creationflags':subprocess.CREATE_NEW_PROCESS_GROUP} if os.name=='nt' else {'start_new_session':True}
        started_epoch=time.time();started_monotonic=time.monotonic();begin=time.perf_counter_ns()
        process=subprocess.Popen(command,cwd=cwd,stdout=stream,stderr=subprocess.STDOUT,**options)
        done=threading.Event();completion={}
        def waiter():
            try:completion['status']=process.wait()
            except BaseException as error:completion['error']=repr(error)
            finally:completion['end_ns']=time.perf_counter_ns();done.set()
        threading.Thread(target=waiter,daemon=True).start()
        def cleanup():
            if os.name=='nt':
                result=subprocess.run(['taskkill','/PID',str(process.pid),'/T','/F'],stdout=stream,stderr=stream,check=False,timeout=5)
                # Tree certainty after an abnormal native Windows exit belongs to the job supervisor.
                if result.returncode:stream.write('\nCLEANUP_UNCERTAIN: Windows tree termination not confirmed\n')
            else:
                try:os.killpg(process.pid,signal.SIGKILL)
                except ProcessLookupError:pass
            if not done.wait(5):raise RuntimeError('CLEANUP_UNCERTAIN: '+str(log))
        old_term=None
        if threading.current_thread() is threading.main_thread():
            old_term=signal.getsignal(signal.SIGTERM)
            def interrupted(signum,frame):raise KeyboardInterrupt('qualification interrupted')
            signal.signal(signal.SIGTERM,interrupted)
        try:
            if not done.wait(left):raise TimeoutError('command deadline reached: '+str(log))
            if 'error' in completion:raise RuntimeError(completion['error'])
            status=completion['status']
            if status:raise RuntimeError('command exit '+str(status)+': '+str(log))
            if os.name!='nt':
                try:os.killpg(process.pid,0)
                except ProcessLookupError:pass
                else:raise RuntimeError('unexpected residual descendants: '+str(log))
        except BaseException as failure:
            stream.write('\nfailure='+repr(failure)+'\n');stream.flush()
            try:cleanup()
            except BaseException as error:
                stream.write('\nCLEANUP_UNCERTAIN: '+repr(error)+'\n');stream.flush()
                raise RuntimeError('cleanup uncertain; stop the entire native job: '+str(log)) from error
            stream.write('\nABNORMAL EXIT; no retry permitted\n');raise
        finally:
            if old_term is not None:signal.signal(signal.SIGTERM,old_term)
        wall=completion['end_ns']-begin
        stream.write('\nprocess_wall_ns='+str(wall)+'\n')
        if provenance:
            validate_provenance(provenance)
            if fingerprint(provenance)!=manifest_identity:raise RuntimeError('provenance manifest changed during command')
        if fingerprint(launch_audit)!=audit_identity:raise RuntimeError('launch audit changed during command')
        after_image=image_files(cwd) if check_image or build_image else None
        if check_image and before_image!=after_image:raise RuntimeError('test command changed the normal image')
        Path(str(log)+'.receipt.json').write_text(json.dumps(dict(command=[str(x) for x in command],
            cwd=str(Path(cwd or os.getcwd()).resolve()),started=started_epoch,packet_started_monotonic=packet_started,
            started_monotonic=started_monotonic,finished=time.time(),
            wall_ns=wall,exit_status=status,deadline=deadline,timeout_seconds=timeout,schema=2,
            provenance=manifest_identity,launch_audit=audit_identity,executable=executable_identity,
            capture_helper=fingerprint(__file__),
            image_before=before_image,image_after=after_image,
            cargo_encoded_rustflags=os.environ.get('CARGO_ENCODED_RUSTFLAGS')),
            indent=2)+'\n')
        if time.monotonic()>deadline:raise TimeoutError('qualification deadline reached after '+str(log))
    stdout=log.read_text().split('\n',1)[1].rsplit('\nprocess_wall_ns=',1)[0]
    return dict(stdout=stdout,wall_ns=wall)

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--started',type=float,required=True)
    p.add_argument('--max-seconds',type=int,choices=[120,300,600,1800])
    p.add_argument('--log',type=Path);p.add_argument('--cwd',type=Path)
    p.add_argument('--provenance',type=Path);p.add_argument('--launch-audit',type=Path)
    p.add_argument('--write-provenance',type=Path);p.add_argument('--root',type=Path)
    p.add_argument('--candidate-sha');p.add_argument('--pin',action='append',default=[])
    p.add_argument('--variants',nargs='+',default=list(VARIANTS),choices=list(VARIANTS)+['previous'])
    p.add_argument('command',nargs=argparse.REMAINDER);a=p.parse_args()
    command=a.command[1:] if a.command[:1]==['--'] else a.command
    if not 0<=time.monotonic()-a.started<TOTAL_SECONDS:raise SystemExit('invalid/expired monotonic packet start')
    if a.write_provenance:
        if not a.root or not a.candidate_sha:raise SystemExit('--write-provenance requires --root and --candidate-sha')
        pins={}
        for pin in a.pin:
            name,separator,path=pin.partition('=')
            if not separator or name in pins:raise SystemExit('invalid/duplicate --pin '+pin)
            pins[name]=path
        write_provenance(a.write_provenance,a.root,a.candidate_sha,a.started,pins,a.variants)
    else:
        if not a.max_seconds or not a.log or not command:raise SystemExit('command requires --max-seconds, --log and command')
        execute(command,a.log,a.started+TOTAL_SECONDS,a.max_seconds,a.cwd,
            provenance=a.provenance,launch_audit=a.launch_audit,started=a.started)
