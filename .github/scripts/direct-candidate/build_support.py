"""Build adapters used only in explicitly authorized preparation; never time code."""
from pathlib import Path
import os,shutil,subprocess,json
import direct_protocol as P

def verification_source(public,destination):
    shutil.copytree(public,destination,dirs_exist_ok=True);p=destination/'deflate.c';s=p.read_text()
    s=s.replace('static int clear_small_hash(deflate_state *s) {','unsigned long Z_EXPORT jdk_ng_test_sparse_resets, jdk_ng_test_full_resets;\nstatic int clear_small_hash(deflate_state *s) {')
    mark='''        s->head[hash] = 0;
    }
    return 1;''';P.require(s.count(mark)==1,'sparse proof insertion');s=s.replace(mark,'''        s->head[hash] = 0;
    }
    jdk_ng_test_sparse_resets++;
    for(uint32_t i=0;i<HASH_SIZE;i++) if(s->head[i]) abort();
    return 1;''')
    mark='if (clear_head && !HASHLESS(s->level, s->strategy)) {\n        CLEAR_HASH(s);';P.require(s.count(mark)==1,'full proof insertion');s=s.replace(mark,'if (clear_head && !HASHLESS(s->level, s->strategy)) {\n        jdk_ng_test_full_resets++;\n        CLEAR_HASH(s);')
    s+='''
unsigned long Z_EXPORT jdk_ng_test_head_nonzero(PREFIX3(stream)*strm){if(deflateStateCheck(strm))abort();unsigned long n=0;for(uint32_t i=0;i<HASH_SIZE;i++)n+=strm->state->head[i]!=0;return n;}
unsigned long Z_EXPORT jdk_ng_test_prev_nonzero(PREFIX3(stream)*strm){if(deflateStateCheck(strm))abort();unsigned long n=0;for(uint32_t i=0;i<strm->state->w_size;i++)n+=strm->state->prev[i]!=0;return n;}
int Z_EXPORT jdk_ng_test_reset_safe(PREFIX3(stream)*strm){return deflateStateCheck(strm)?-1:strm->state->small_reset_safe;}
''';p.write_text(s)

def boundary_source(legacy,destination):
    """Untimed extension only: 0..80 and255/256/257, output caps1/2/7."""
    s=Path(legacy).read_text()
    old='for(unsigned n=0;n<=65;n++){tag="all-short-boundaries";unsigned char shortdata[66];for(unsigned j=0;j<66;j++)'
    new='for(unsigned n=0;n<=257;n++)if(n<=80||n>=255)for(unsigned cap=1;cap<=7;cap=cap==1?2:7){tag="extended-short-boundaries";unsigned char shortdata[258];for(unsigned j=0;j<258;j++)'
    P.require(s.count(old)==1,'boundary source marker');s=s.replace(old,new)
    old='feed(&p,shortdata,n);finish(&p,1);check_plain(&p,shortdata,n,NULL,0);reset_pair(&p,n<=64);close_pair(&p);}'
    new='feed(&p,shortdata,n);finish(&p,cap);check_plain(&p,shortdata,n,NULL,0);reset_pair(&p,n<=64);close_pair(&p);if(cap==7)break;}'
    P.require(s.count(old)==1,'boundary cap marker');Path(destination).write_text(s.replace(old,new))

def boundary_checks(out,here,run,stock,lib,sanenv):
    source=out/'extended-boundaries.c';boundary_source(here.parent/'reset-only/reset-invariants.c',source)
    manifest=json.loads((out/'manifest.json').read_text());input_=manifest['inputs'][132]
    (out/'boundary-input.tsv').write_text(f"132\tbank-0\t{input_['path']}\n")
    for san in [False,True]:
        suffix='-asan' if san else '';binary=out/'build'/('extended-boundaries'+suffix)
        flags=['-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined'] if san else ['-O2']
        run(['gcc-14',*flags,'-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stock,source,lib,'-ldl','-o',binary],'extended-boundaries'+suffix+'-build.log')
        run([binary,out/f"build/{'NA' if san else 'N'}/ng.so",out/f"build/{'VAD' if san else 'VD'}/ng.so",out/('extended-boundaries'+suffix+'.csv'),out/('extended-boundaries'+suffix+'.bin'),out/'boundary-input.tsv',out/'quality.csv',out/'quality.bin','1'],'extended-boundaries'+suffix+'.log',env=sanenv if san else None)

def complete(out,here):
    """Called AFTER legacy build/correctness preparation; never its coordinator."""
    out=Path(out);commands=[]
    def run(argv,log,cwd=None,env=None):
        commands.append(dict(argv=list(map(str,argv)),cwd=str(cwd or out),flags={k:env.get(k) for k in ['CC','CFLAGS','LDFLAGS','ASAN_OPTIONS','UBSAN_OPTIONS']} if env else None));P.dump(out/'direct-build-commands.json',commands)
        with (out/log).open('w') as f:subprocess.run(list(map(str,argv)),cwd=cwd or out,env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
    src=out/'candidate/src/java.base/share/native/libzip/zlib-ng';vsrc=out/'direct-verification-source';verification_source(src,vsrc)
    # Public S is the shipping archive, WITHOUT the old test-control object.
    run(['gcc-14','-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',out/'build/S/libz.a','-Wl,--no-whole-archive','-o',out/'build/S/ng.so'],'direct-public-S-link.log')
    for name,source,san in [('SA',src,True),('VD',vsrc,False),('VAD',vsrc,True)]:
        b=out/'build'/name;b.mkdir();flags='-O1 -g -fPIC -fno-omit-frame-pointer -fsanitize=address,undefined' if san else '-O2 -fPIC';env=dict(os.environ,CC='gcc-14',AR='ar',CFLAGS=flags,LDFLAGS='-fsanitize=address,undefined' if san else '')
        run(['bash',source/'configure','--static','--zlib-compat','--sprefix=jdk_ng_'],name+'-configure.log',b,env);run(['make','-j2','libz.a'],name+'-make.log',b)
        run(['gcc-14',*(['-fsanitize=address,undefined'] if san else []),'-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',b/'libz.a','-Wl,--no-whole-archive','-o',b/'ng.so'],name+'-link.log')
    stock=out/'baseline/src/java.base/share/native/libzip/zlib';lib=out/'build/stock/libz.a'
    for name,source in [('direct-driver','direct_driver.c'),('reset-proof','reset_proof.c')]:
        common=['gcc-14','-Wall','-Wextra','-Werror','-Wno-misleading-indentation','-I',stock,here/source,lib,'-ldl']
        run([*common,'-O2','-o',out/'build'/name],name+'-build.log')
        run([*common,'-O1','-g','-fno-omit-frame-pointer','-fsanitize=address,undefined','-o',out/'build'/(name+'-asan')],name+'-asan-build.log')
    sanenv=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    for name,n,s,v,san in [('second-reset-proof','N','S','VD',False),('second-reset-proof-asan','NA','SA','VAD',True)]:
        run([out/'build'/('reset-proof-asan' if san else 'reset-proof'),out/f'build/{n}/ng.so',out/f'build/{s}/ng.so',out/f'build/{v}/ng.so',out/(name+'.json')],name+'.log',env=sanenv if san else None)
    boundary_checks(out,here,run,stock,lib,sanenv)
    base=[str(out/'build/direct-driver'),str(out/'build/N/ng.so'),str(out/'build/S/ng.so'),*[str(out/n) for n in ['inputs.tsv','profiles.tsv','episodes.tsv','commands.tsv']],str(out)]
    for w in range(8):
        tmp=out/f'direct-untimed-{w}';tmp.mkdir();(tmp/'compressed').mkdir();cmd=base.copy();cmd[7]=str(tmp)
        run([*cmd,str(w),P.VERSION,'--untimed-only'],f'direct-untimed-{w}.log')
    tmp=out/'direct-untimed-asan';tmp.mkdir();(tmp/'compressed').mkdir();cmd=base.copy();cmd[0]=str(out/'build/direct-driver-asan');cmd[1]=str(out/'build/NA/ng.so');cmd[2]=str(out/'build/SA/ng.so');cmd[7]=str(tmp)
    run([*cmd,'0',P.VERSION,'--untimed-only'],'direct-untimed-asan.log',env=sanenv)
    for v in ['N','S','SA']:
        symbols=subprocess.check_output(['nm','-D',out/f'build/{v}/ng.so'],text=True);P.require('jdk_ng_test_' not in symbols and 'reset_control' not in symbols,'public library instrumentation');(out/f'public-symbols-{v}.txt').write_text(symbols)
    P.dump(out/'launch.json',dict(basecmd=base))
