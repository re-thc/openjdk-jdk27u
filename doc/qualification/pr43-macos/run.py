#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Reproducible local macOS/arm64 PR43 builds and qualification. No CI actions."""
import argparse,hashlib,json,os,platform,re,shutil,subprocess,sys,time
from pathlib import Path
import xml.etree.ElementTree as ET
from audit import applicability,baseline
HERE=Path(__file__).resolve().parent
MANIFEST=json.loads((HERE/'manifest.json').read_text())
REPO=Path(subprocess.check_output(['git','-C',str(HERE),'rev-parse','--show-toplevel'],text=True).strip())

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as f:
        for part in iter(lambda:f.read(1024*1024),b''):h.update(part)
    return h.hexdigest()

def write(path,data):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(data,indent=2)+'\n')

def command(args,cwd=None,log=None,accept=False,timeout=None):
    args=list(map(str,args));print('+', ' '.join(args),flush=True)
    try:
        if log:
            Path(log).parent.mkdir(parents=True,exist_ok=True)
            with Path(log).open('w') as f:
                f.write('argv='+json.dumps(args)+'\ncwd='+str(cwd)+'\n');f.flush()
                p=subprocess.run(args,cwd=cwd,stdout=f,stderr=subprocess.STDOUT,timeout=timeout)
            text=Path(log).read_text(errors='replace')
        else:
            p=subprocess.run(args,cwd=cwd,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=timeout);text=p.stdout
    except subprocess.TimeoutExpired:raise RuntimeError('Timed out; no automatic retry. '+str(log or args[0]))
    if p.returncode and not accept:raise RuntimeError('Command failed ('+str(p.returncode)+'). '+(str(log) if log else text[-2500:]))
    return p.returncode,text

def probe(work):
    checks={};missing=[]
    if platform.system()!='Darwin' or platform.machine() not in ('arm64','aarch64'):
        raise RuntimeError('Requires native macOS arm64; Linux/Intel/Rosetta is not an accepted qualification host.')
    for tool in ('git','python3','bash','curl','shasum','autoconf','gmake','m4','xcrun','file','tar','zip','unzip'):
        checks[tool]=shutil.which(tool)
        if not checks[tool]:missing.append(tool)
    for key in ('hw.model','hw.machine','hw.optional.neon','sysctl.proc_translated','kern.osproductversion'):
        checks[key]=command(['sysctl','-n',key],accept=True)[1].strip()
    if checks['sysctl.proc_translated']=='1':raise RuntimeError('Rosetta process detected: start a native arm64 agent/shell.')
    checks['sw_vers']=command(['sw_vers'],accept=True)[1]
    for name,args in [('compiler',['xcrun','clang','--version']),('SDK',['xcrun','--sdk','macosx','--show-sdk-path']),('Xcode',['xcodebuild','-version'])]:
        if shutil.which(args[0]):
            rc,text=command(args,accept=True);checks[name]=text
            if rc and name!='Xcode':missing.append(name)
    checks['disk_free_GiB']=round(shutil.disk_usage(work).free/(1024**3),1)
    checks['SVE']='Uncovered: this JDK macOS AArch64 port does not implement SVE vector-length operations; never force UseSVE=1/2 here.'
    checks['missing_prerequisites']=missing;write(work/'host.json',checks)
    if missing:raise RuntimeError('Missing standard prerequisites: '+', '.join(missing)+'. See committed README; no dependency installation is attempted by this runner.')
    return checks

def checkout(work,name,commit):
    dest=work/name
    if not command(['git','-C',REPO,'cat-file','-e',commit+'^{commit}'],accept=True)[0]==0:
        command(['git','-C',REPO,'fetch','--no-tags','origin',commit])
    if dest.exists():
        actual=command(['git','-C',dest,'rev-parse','HEAD'])[1].strip()
        if actual!=commit:raise RuntimeError('Existing source directory has the wrong commit: '+str(dest))
        if command(['git','-C',dest,'diff','HEAD','--name-only'])[1].strip():raise RuntimeError('Tracked edits in source directory: '+str(dest))
    else:command(['git','-C',REPO,'worktree','add','--detach',dest,commit])
    return dest

def image_probe(jdk,expected,level,log):
    jdk=Path(jdk);java=jdk/'bin/java';lib=jdk/'lib/server/libjvm.dylib'
    if not java.is_file() or not lib.is_file():raise RuntimeError('Missing macOS JDK/libjvm.dylib: '+str(jdk))
    kind=command(['file',java])[1]
    if 'Mach-O' not in kind or 'arm64' not in kind:raise RuntimeError('Refusing a Linux/Intel/non-Mach-O JDK: '+kind)
    release=(jdk/'release').read_text()
    if expected not in release:raise RuntimeError('JDK release metadata does not identify pinned source '+expected)
    _,info=command([java,'-XX:+UnlockDiagnosticVMOptions','-XX:+PrintFlagsFinal','-XshowSettings:properties','-version'],log=log)
    if not re.search(r'os.arch\s*=\s*aarch64',info):raise RuntimeError('JDK is not running as native aarch64')
    if level=='fastdebug' and not re.search(r'jdk.debug\s*=\s*fastdebug',info):raise RuntimeError('Fastdebug JDK required for active IR')
    if not re.search(r'UseSVE\s*=\s*0\b',info):raise RuntimeError('Unexpected SVE mode on macOS; stop rather than mislabel SVE coverage')
    return {'jdk':str(jdk),'actual_build_source':expected,'debug_level':level,'java_sha256':sha(java),'libjvm_sha256':sha(lib),'release_sha256':sha(jdk/'release'),'probe':str(log)}

def build(work,side,commit,level,deps,jobs):
    tree=checkout(work,'source-'+side,commit);conf='pr43-'+level;out=tree/'build'/conf
    jdk=out/'images/jdk';receipt=work/'builds'/(side+'-'+level+'.json')
    fingerprint={'commit':commit,'level':level,'deps':deps,'compiler':command(['xcrun','clang','--version'])[1],'SDK':command(['xcrun','--sdk','macosx','--show-sdk-path'])[1]}
    prior=json.loads(receipt.read_text()) if receipt.exists() else {}
    cached=prior.get('fingerprint')==fingerprint and (jdk/'bin/java').exists()
    if cached:
        print('Reusing exact local build:',side,level)
    else:
        cfg=['bash','bin/configure-dev','--with-conf-name='+conf,'--with-debug-level='+level,'--with-boot-jdk='+deps['boot_jdk'],'--with-jtreg='+deps['jtreg'],'--with-gtest='+deps['gtest'],'--with-version-opt=pr43-'+commit,'--with-native-debug-symbols-level=1']
        command(cfg,cwd=tree,log=work/'builds'/(side+'-'+level+'-configure.log'))
        command(['gmake','CONF='+conf,'JOBS='+str(jobs),'images','test-image-hotspot-gtest'],cwd=tree,log=work/'builds'/(side+'-'+level+'-build.log'))
    info=image_probe(jdk,commit,level,work/'builds'/(side+'-'+level+'-probe.log'))
    if cached and info['libjvm_sha256']!=prior.get('libjvm_sha256'):raise RuntimeError('Cached image bytes changed; stop instead of silently accepting them')
    info.update(fingerprint=fingerprint,test_image=str(out/'images/test'),source=str(tree))
    write(receipt,info);return info

def phase_inventory(workdir,fqcn):
    phases={};compiled=set();logs=[]
    for path in workdir.rglob('hotspot_pid*.log'):
        logs.append({'path':str(path),'sha256':sha(path)});ids={}
        for line in path.read_text(errors='replace').splitlines():
            match=re.search(r"compile_id='(\d+)'.*method='"+re.escape(fqcn)+r" (\w+)",line)
            if match:ids[match.group(1)]=match.group(2)
            if '<nmethod' in line and "compiler='c2'" in line:
                m=re.search(r"method='"+re.escape(fqcn)+r" (\w+)",line)
                if m:compiled.add(m.group(1))
            if '<ideal' in line:
                a=re.search(r"compile_id='(\d+)'",line);b=re.search(r"compile_phase='([^']+)'",line)
                if a and b and a.group(1) in ids:phases.setdefault(ids[a.group(1)],set()).add(b.group(1))
    return {'logs':logs,'phases':{k:sorted(v) for k,v in phases.items()},'C2_methods':sorted(compiled)}

def run_test(work,tests,vm,spec,side,level,jtreg):
    name=Path(spec['path']).stem;dest=work/'tests'/(side+'-'+level+'-'+name);dest.mkdir(parents=True,exist_ok=True)
    file=tests/spec['path'];fqcn='.'.join(Path(spec['path']).parts[3:-1])+'.'+name
    # parts begin test/hotspot/jtreg; package begins compiler.
    opts=['-DReportStdout=true','-DVerbose=true','-DPrintApplicableIRRules=true','-DPrintRuleMatchingTime=true','-DVerifyIR=true','-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation','-XX:UseSVE=0']
    args=[Path(vm['jdk'])/'bin/java','-jar',Path(jtreg)/'lib/jtreg.jar','-jdk:'+vm['jdk'],'-conc:1','-retain:all','-verbose:all','-w:'+str(dest/'work'),'-r:'+str(dest/'report')]+['-javaoption:'+o for o in opts]+[file]
    rc,_=command(args,cwd=dest,log=dest/'launcher.log',accept=True,timeout=600)
    jtrs=list((dest/'work').rglob(name+'.jtr'))
    text='\n'.join(p.read_text(errors='replace') for p in jtrs);errors=[]
    expected_negative=side=='baseline' and level=='fastdebug' and spec['label']!='C1'
    if not jtrs:errors.append('Missing JTR')
    if expected_negative:
        if rc==0:errors.append('Baseline unexpectedly passed: negative controls did not fire')
        errors.extend(baseline(text,spec['positive_matching']))
    elif rc or not re.search(r'test result:\s*Passed',text,re.I):errors.append('Test did not pass')
    inventory=phase_inventory(dest/'work',fqcn)
    missing_c2=set(spec['C2_methods'])-set(inventory['C2_methods'])
    if missing_c2:errors.append('Missing logged C2 compilations: '+repr(sorted(missing_c2)))
    if level=='fastdebug':
        if 'IR verification disabled' in text or 'Disabling IR matching for rule' in text:errors.append('IR verification/rule disabled')
        missing=applicability(text,spec['applicable_methods'])
        if missing:errors.append('Missing applicable IR rules: '+repr(missing))
        if not inventory['logs']:errors.append('No retained HotSpot phase logs')
        if spec['label']!='C1':
            for method in spec['applicable_methods']:
                p=inventory['phases'].get(method,[])
                if 'After Matching' not in p:errors.append('Missing MATCHING phase for '+method)
            # Input-phase requirement is method-specific, derived from the pinned source.
            source=file.read_text()
            for block in re.split(r'(?=    @Test\()',source):
                m=re.search(r'public static \w+ (\w+)\(',block)
                if m and 'CompilePhase.BEFORE_MATCHING' in block and 'Before Matching' not in inventory['phases'].get(m.group(1),[]):errors.append('Missing BEFORE_MATCHING phase for '+m.group(1))
    # Explicit amended-test assertions remain authoritative; retain compiled method inventory too.
    result={'side':side,'level':level,'test':spec['path'],'returncode':rc,'intended_negative':expected_negative,'errors':errors,'accepted':not errors,'libjvm_sha256':vm['libjvm_sha256'],'test_source_sha256':sha(file),'JTR':[{'path':str(p),'sha256':sha(p)} for p in jtrs],**inventory}
    write(dest/'result.json',result);return result

def assembler(work,vm,side,level):
    dest=work/'assembler'/(side+'-'+level);dest.mkdir(parents=True,exist_ok=True);xml=dest/'results.xml'
    launcher=Path(vm['test_image'])/'hotspot/gtest/server/gtestLauncher'
    rc,_=command([launcher,'-jdk',vm['jdk'],'--gtest_filter=AssemblerAArch64.*','--gtest_output=xml:'+str(xml),'--gtest_catch_exceptions=0'],cwd=dest,log=dest/'assembler.log',accept=True,timeout=300)
    names=[];errors=[]
    if rc or not xml.exists():errors.append('Assembler group failed or XML missing')
    else:
        cases=ET.parse(xml).findall('.//testcase');names=[c.attrib.get('name','') for c in cases]
        if not any('validate' in n for n in names):errors.append('validate test missing')
        if side=='candidate' and not any('shrn' in n for n in names):errors.append('SHRN test missing')
        if any(c.find('failure') is not None or c.find('skipped') is not None for c in cases):errors.append('Failed/skipped assembler case')
    result={'side':side,'level':level,'libjvm_sha256':vm['libjvm_sha256'],'tests':names,'errors':errors,'accepted':not errors};write(dest/'result.json',result);return result

def instructions(work,tests,vm,side,jtreg):
    target=tests/'test/hotspot/jtreg/compiler/c2/aarch64/PR43InstructionCapture.java'
    shutil.copy2(HERE/'PR43InstructionCapture.java',target)
    dest=work/'instructions'/side;dest.mkdir(parents=True,exist_ok=True)
    rc,_=command([Path(vm['jdk'])/'bin/java','-jar',Path(jtreg)/'lib/jtreg.jar','-jdk:'+vm['jdk'],'-conc:1','-retain:all','-verbose:all','-javaoption:-DReportStdout=true','-w:'+str(dest/'work'),'-r:'+str(dest/'report'),target],cwd=dest,log=dest/'launcher.log',accept=True,timeout=900)
    result={'side':side,'libjvm_sha256':vm['libjvm_sha256'],'driver_sha256':sha(HERE/'PR43InstructionCapture.java'),'returncode':rc,'logs':str(dest),'semantic_capture_passed':rc==0,'installed_instruction_review':'REQUIRED: inspect actual nmethod bytes/decoded instructions, not matcher-format strings or timing','performance_credit':False};write(dest/'result.json',result);return result

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('phase',choices=['probe','build','test','instructions','all']);ap.add_argument('--deps',type=Path,help='setup.sh output dependencies.json');ap.add_argument('--work',type=Path,default=REPO.parent/'pr43-macos-work');ap.add_argument('--jobs',type=int,default=2)
    a=ap.parse_args();work=a.work.resolve();work.mkdir(parents=True,exist_ok=True)
    host=probe(work)
    if a.phase=='probe':return
    if not a.deps:raise RuntimeError('--deps is required; run the committed setup.sh or provide equivalent standard tools in dependencies.json')
    deps=json.loads(a.deps.read_text())
    for key,rel in [('boot_jdk','bin/java'),('jtreg','lib/jtreg.jar'),('gtest','CMakeLists.txt')]:
        deps[key]=str(Path(deps[key]).resolve())
        if not (Path(deps[key])/rel).exists():raise RuntimeError('Missing standard dependency '+key+': '+deps[key])
    boot_kind=command(['file',Path(deps['boot_jdk'])/'bin/java'])[1]
    if 'Mach-O' not in boot_kind or 'arm64' not in boot_kind:raise RuntimeError('Boot JDK must be macOS arm64, never a Linux binary')
    boot_version=command([Path(deps['boot_jdk'])/'bin/java','-version'])[1]
    if not re.search(r'version "(?:26|27)(?:[.+"-])',boot_version):raise RuntimeError('Boot JDK must be 26 or 27')
    deps['hashes']={'boot_java':sha(Path(deps['boot_jdk'])/'bin/java'),'boot_javac':sha(Path(deps['boot_jdk'])/'bin/javac'),'jtreg_jar':sha(Path(deps['jtreg'])/'lib/jtreg.jar'),'gtest_HEAD':command(['git','-C',deps['gtest'],'rev-parse','HEAD'])[1].strip()}
    write(work/'identities.json',{'manifest':MANIFEST,'host':host,'dependencies':deps,'boot_version':boot_version,'runner_sha256':sha(__file__),'audit_sha256':sha(HERE/'audit.py')})
    images={}
    for side,commit in [('baseline',MANIFEST['baseline_with_C1']),('candidate',MANIFEST['candidate'])]:
        for level in ('fastdebug','release'):
            key=side+'-'+level
            if a.phase in ('all','build'):images[key]=build(work,side,commit,level,deps,a.jobs)
            else:
                path=work/'builds'/(key+'.json')
                if not path.exists():raise RuntimeError('Missing exact local build; run phase build/all: '+key)
                images[key]=json.loads(path.read_text());image_probe(images[key]['jdk'],commit,level,work/'builds'/(key+'-reprobe.log'))
    if a.phase=='build':return
    tests=checkout(work,'test-source',MANIFEST['test_source_commit'])
    for spec in MANIFEST['tests']:
        if spec.get('source_sha256') and sha(tests/spec['path'])!=spec['source_sha256']:raise RuntimeError('Regression source hash mismatch: '+spec['path'])
    results=[]
    if a.phase in ('all','test'):
        for side in ('candidate','baseline'):
            for level in ('fastdebug','release'):
                vm=images[side+'-'+level]
                for spec in MANIFEST['tests']:results.append(run_test(work,tests,vm,spec,side,level,deps['jtreg']))
                results.append(assembler(work,vm,side,level))
    captures=[]
    if a.phase in ('all','instructions'):
        for side in ('candidate','baseline'):captures.append(instructions(work,tests,images[side+'-release'],side,deps['jtreg']))
    # Resume only identity-matching receipts; never pool results from changed binaries.
    if not results:
        for group in ('tests','assembler'):
            for path in (work/group).glob('*/result.json'):
                r=json.loads(path.read_text());key=r['side']+'-'+r['level']
                if key in images and r.get('libjvm_sha256')==images[key]['libjvm_sha256']:results.append(r)
    if not captures:
        for path in (work/'instructions').glob('*/result.json'):
            r=json.loads(path.read_text());key=r['side']+'-release'
            if r.get('libjvm_sha256')==images[key]['libjvm_sha256'] and r.get('driver_sha256')==sha(HERE/'PR43InstructionCapture.java'):captures.append(r)
    matrix_complete=len(results)==24 # 20 class runs and four assembler groups
    summary={'source':MANIFEST['candidate'],'baseline_with_C1':MANIFEST['baseline_with_C1'],'results':results,'instruction_captures':captures,'matrix_complete':matrix_complete,'semantic_IR_assembler_accepted':matrix_complete and all(r.get('accepted',False) for r in results),'installed_instruction_review':'PENDING until local agent inspects captured code','SVE':'NOT COVERED by this macOS port; not a prerequisite for scalar/NEON qualification','stress':'NOT RUN; optional separately reviewed scope','performance':'NOT MEASURED; no old pooled timing or codec claim','PR_changes_or_CI_actions':False}
    write(work/'summary.json',summary)
    print('Evidence:',work/'summary.json')
    if any(r.get('errors') for r in results) or any(c['returncode'] for c in captures):raise RuntimeError('Qualification evidence includes failures; inspect result.json/logs. Do not report a blanket pass.')
if __name__=='__main__':
    try:main()
    except (RuntimeError,OSError,ValueError) as e:print('BLOCKED:',e,file=sys.stderr);sys.exit(2)
