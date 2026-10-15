"""Untimed source/object/archive/library binding for the reviewed reset delta."""
from pathlib import Path
import hashlib,json,shlex,subprocess
import direct_protocol as P
HERE=Path(__file__).resolve().parent
PREFIX=Path('src/java.base/share/native/libzip/zlib-ng')
DELTA='7fa722b61fbbfc91854e7075915b6fc4f34897b31208cd654b6c925821c42a92'
OLD='40334ef085efccedf0ba77f71e6a9b96f1ded7dcd8c77fe1bbb66f33b952f40e'
CORRECTED='bbbddff990c2500c8f176f978fd1debe5a114354f1b1bf2a2a922f832d85f9ba'
HEADER='acb687285dce452f88de7d2463c10e0f5a01f822395179468034765da19b485f'
LEGACY_VERIFY='d414f4289a70f19a33bc52a1df5d11b0909a62f46dd060e5b73a8eed4238e605'
DIRECT_VERIFY='2d69b8088adbb3c303dbfd33212c49b8ee11c9c298af382d1f9b6b9f34f98713'
PREVIOUS=dict(run_id=38775899129,commit='9c43fcf27d5d3b4ca27e96630764e89629791dab',artifact_id=11997303679,artifact_bytes=85298666,artifact_sha256='f989b0cafe725a388aeda4cbc5366a1a9d131fa97c0344d2d25b562d264368f8',score_sha256='1deff50e943d2ca30a32c5e0feba1f87bae5b6ab6ca60cbcc3229b87ff5c1b8f',library_file_id='libfile_ef290cae0e2081918c20fd0cce617db9',library_version=1,calibration_failed_cells=17,calibration_total_cells=64,guards_unresolved=40,qualified=False,unchanged_control_bursts='Unresolved qualification risk. This source repair does not fix calibration; preserve100ns gate and all rows.')
VARIANTS=dict(N=('baseline',None),S=('candidate',CORRECTED),V=('verify',LEGACY_VERIFY),NM=('baseline',None),VM=('verify',LEGACY_VERIFY),NA=('baseline',None),VA=('verify',LEGACY_VERIFY),SA=('candidate',CORRECTED),VD=('direct-verification-source',DIRECT_VERIFY),VAD=('direct-verification-source',DIRECT_VERIFY))

def source_path(out,kind):return Path(out)/kind/(PREFIX if kind!='direct-verification-source' else '')
def pinned_hashes():
    pins=json.loads((HERE.parent/'reset-only/source-pins.json').read_text());expected={x['path']:x['sha256'] for x in pins['ng_files']};P.require(len(expected)==215,'source pin count');return expected

def source_state(out,include_verifiers=True):
    expected=pinned_hashes();result={}
    kinds={'baseline':None,'candidate':CORRECTED}
    if include_verifiers:kinds.update(verify=LEGACY_VERIFY,**{'direct-verification-source':DIRECT_VERIFY})
    for kind,c_hash in kinds.items():
        root=source_path(out,kind);want=dict(expected)
        if c_hash:want.update({'deflate.c':c_hash,'deflate.h':HEADER})
        actual={str(p.relative_to(root)):P.sha(p) for p in root.rglob('*') if p.is_file()}
        P.require(actual==want,'exact '+kind+' source inventory');result[kind]=actual
    return result

def apply(out):
    """Legacy callback: MUST run before verifier copies or any native build."""
    out=Path(out);P.require(not any((out/'build').iterdir()),'repair must precede every archive build')
    patch=HERE/'remove-duplicate-reset-check.patch';P.require(P.sha(patch)==DELTA,'reviewed repair delta')
    candidate=source_path(out,'candidate');P.require(P.sha(candidate/'deflate.c')==OLD and P.sha(candidate/'deflate.h')==HEADER,'reviewed original tiny-reset source')
    P.require(not (out/'repair-source-before-build.json').exists(),'repair callback once')
    args=['git','apply','--directory=candidate',str(patch)]
    subprocess.run([*args[:2],'--check',*args[2:]],cwd=out,check=True,capture_output=True)
    subprocess.run(args,cwd=out,check=True,capture_output=True)
    state=source_state(out,False)
    P.dump(out/'repair-source-before-build.json',dict(before_any_archive=True,pin=P.PIN,ng=P.NG,base_patch=P.PATCH,delta=DELTA,old_deflate=OLD,corrected_deflate=CORRECTED,sources=state))
    P.dump(out/'previous-results.json',PREVIOUS)

def compile_command(make_log,build,source,sanitized=False,no_medium=False):
    choices=[]
    for line in Path(make_log).read_text().splitlines():
        if 'deflate.c' not in line:continue
        try:a=shlex.split(line)
        except ValueError:continue
        if '-c' not in a or '-o' not in a:continue
        if Path(a[-1]).resolve()!=Path(source).resolve():continue
        if (Path(build)/a[a.index('-o')+1]).resolve()!=(Path(build)/'deflate.o').resolve():continue
        choices.append(a)
    P.require(len(choices)==1,'one exact deflate compile command');a=choices[0]
    P.require(Path(a[0]).name=='gcc-14' and '-fPIC' in a and '-DZLIB_COMPAT' in a,'fixed compiler/compat flags')
    opts=[x for x in a if x in ['-O0','-O1','-O2','-O3','-Os','-Og','-Oz','-Ofast']]
    # configure prepends-O2; the existing sanitized builds append effective-O1.
    P.require(opts and opts[-1]==('-O1' if sanitized else '-O2') and set(opts)<=({'-O2','-O1'} if sanitized else {'-O2'}),'fixed optimization flags')
    P.require(('-fsanitize=address,undefined' in a)==sanitized and ('-DNO_MEDIUM_STRATEGY' in a)==no_medium,'fixed variant flags')
    return a

def bind(out,name,source,make_log,link,run):
    """Recompile onlydeflate.o and relink identical inputs; never execute them."""
    out=Path(out);b=out/'build'/name;target=b/'ng.so';proof=out/'build/repair-preflight';proof.mkdir(exist_ok=True)
    obj=proof/(name+'-deflate.o');so=proof/(name+'-ng.so');P.require(not obj.exists() and not so.exists(),'binding once')
    sanitized=name in ['NA','VA','SA','VAD'];a=compile_command(make_log,b,source,sanitized,name in ['NM','VM'])
    fresh=list(a);fresh[fresh.index('-o')+1]=str(obj);run(fresh,'repair-'+name+'-compile.log',b)
    rebuilt=obj.read_bytes();original=(b/'deflate.o').read_bytes();member=subprocess.check_output(['ar','p',b/'libz.a','deflate.o'])
    P.require(rebuilt==original==member,'stale '+name+' deflate object/archive')
    P.require(link[0]=='gcc-14' and '-shared' in link and '-Wl,-Bsymbolic' in link and '-Wl,--whole-archive' in link and '-Wl,--no-whole-archive' in link,'fixed shared linkage')
    P.require(link[link.index('-o')+1]==str(target) and str(b/'libz.a') in link,'bound '+name+' link inputs')
    expected=['gcc-14',*(['-fsanitize=address,undefined'] if sanitized else []),'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',str(b/'libz.a'),'-Wl,--no-whole-archive',*([str(b/'reset-control.o')] if name=='V' else []),'-o',str(target)]
    P.require(link==expected,'exact '+name+' link recipe')
    again=list(link);again[again.index('-o')+1]=str(so);run(again,'repair-'+name+'-link.log',out)
    P.require(so.read_bytes()==target.read_bytes(),'stale '+name+' shared library')
    paths=[Path(source),b/'Makefile',Path(make_log),b/'deflate.o',b/'libz.a',target,obj,so]
    if name=='V':paths.append(b/'reset-control.o')
    return dict(compile_argv=a,link_argv=link,files={str(p.relative_to(out)):dict(bytes=p.stat().st_size,sha256=P.sha(p)) for p in paths},object_recompiled_equal=True,archive_member_equal=True,shared_relinked_equal=True)

def run(out):
    out=Path(out);before=json.loads((out/'repair-source-before-build.json').read_text());sources=source_state(out)
    P.require(before['before_any_archive'] is True and before['sources']=={k:sources[k] for k in ['baseline','candidate']} and before['delta']==DELTA and before['corrected_deflate']==CORRECTED,'source-before-build proof')
    records=json.loads((out/'build-commands.json').read_text())+json.loads((out/'direct-build-commands.json').read_text());commands=[]
    def command(a,log,cwd):
        commands.append(dict(argv=list(map(str,a)),cwd=str(cwd),native_execution=False));P.dump(out/'repair-preflight-commands.json',commands)
        with (out/log).open('w') as f:subprocess.run(a,cwd=cwd,stdout=f,stderr=subprocess.STDOUT,check=True)
    bindings={}
    for name,(kind,unused) in VARIANTS.items():
        b=out/'build'/name;source=source_path(out,kind)/'deflate.c';make_log=b/'make.log'
        if not make_log.exists():make_log=out/(name+'-make.log')
        links=[x['argv'] for x in records if '-shared' in x['argv'] and '-o' in x['argv'] and x['argv'][x['argv'].index('-o')+1]==str(b/'ng.so')]
        P.require(links,'recorded '+name+' library link');bindings[name]=bind(out,name,source,make_log,links[-1],command)
    P.dump(out/'repair-preflight.json',dict(before_measurement=True,native_execution=False,source_before_build=P.sha(out/'repair-source-before-build.json'),sources=sources,bindings=bindings,commands_sha256=P.sha(out/'repair-preflight-commands.json'),normal32case_counter_test='Previously completed and reviewed; normal only. Not claimed under ASan/UBSan. See libfile_a1510042f1148191966a412495d23336 version0.'))
    verify(out)

def verify(out):
    """Read-only provenance check before/after the campaign; no compiler rerun."""
    out=Path(out);proof=json.loads((out/'repair-preflight.json').read_text())
    P.require(proof['before_measurement'] is True and proof['native_execution'] is False,'untimed repair preflight')
    P.require(proof['source_before_build']==P.sha(out/'repair-source-before-build.json') and proof['sources']==source_state(out),'corrected source binding')
    P.require(proof['commands_sha256']==P.sha(out/'repair-preflight-commands.json'),'preflight command binding')
    P.require(set(proof['bindings'])==set(VARIANTS),'all native variants bound')
    for name,b in proof['bindings'].items():
        P.require(all(b[k] is True for k in ['object_recompiled_equal','archive_member_equal','shared_relinked_equal']),'complete '+name+' binding')
        for rel,x in b['files'].items():
            p=out/rel;P.require(not Path(rel).is_absolute() and '..' not in Path(rel).parts and not p.is_symlink() and dict(bytes=p.stat().st_size,sha256=P.sha(p))==x,'changed '+name+' source/build binding')
    P.require(json.loads((out/'previous-results.json').read_text())==PREVIOUS,'previous results retained')
    return {n:P.sha(out/n) for n in ['repair-source-before-build.json','repair-preflight.json','repair-preflight-commands.json','previous-results.json']}
