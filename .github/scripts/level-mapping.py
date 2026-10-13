import csv,hashlib,io,json,os,subprocess
from pathlib import Path
ROOT=Path.cwd()
OUT=ROOT/'validation/levels'
OUT.mkdir(parents=True,exist_ok=True)
stock=ROOT/'src/java.base/share/native/libzip/zlib'
objs=[]
def run(args,cwd=ROOT,env=None):
    subprocess.run([str(x) for x in args],cwd=cwd,env=env,check=True)
for src in sorted(stock.glob('*.c')):
    if src.name.startswith('gz'):continue
    obj=OUT/(src.stem+'.o')
    run(['gcc-14','-O2','-fPIC','-DZ_HAVE_UNISTD_H','-I',stock,'-c',src,'-o',obj])
    objs.append(obj)
run(['ar','rcs',OUT/'stock.a',*objs])
ng=OUT/'ng';ng.mkdir(exist_ok=True)
env=dict(os.environ,CC='gcc-14',AR='ar',CFLAGS='-O2 -fPIC')
run(['bash',ROOT/'src/java.base/share/native/libzip/zlib-ng/configure',
     '--static','--zlib-compat','--sprefix=jdk_ng_'],ng,env)
run(['make','-j2','libz.a'],ng)
run(['gcc-14','-O2','-Wall','-Wextra','-I',stock,
     ROOT/'../diagnostic/.github/scripts/level-mapping.c',OUT/'stock.a',ng/'libz.a',
     '-o',OUT/'compare'])
os.sched_setaffinity(0,{max(os.sched_getaffinity(0))})
patterns={'java':'src/java.base/share/classes/java/util/*.java',
          'hotspot':'src/hotspot/share/runtime/*.cpp','documentation':'doc/*.md'}
corpora=ROOT/'../corpora'
all_rows=[]
for name,pattern in patterns.items():
    files=sorted(corpora.glob(pattern))
    data=b''.join(p.read_bytes() for p in files)
    if not data:raise RuntimeError(name)
    print('CORPUS',name,len(data),hashlib.sha256(data).hexdigest(),flush=True)
    source=OUT/(name+'.bin');source.write_bytes(data)
    for batch in range(6):
        text=subprocess.check_output([str(OUT/'compare'),str(source),str(batch%2)],text=True)
        (OUT/(name+'-'+str(batch)+'.csv')).write_text(text)
        for row in csv.DictReader(io.StringIO(text)):
            row.update(corpus=name,batch=batch)
            all_rows.append(row)
            print('LEVEL_SCORE',json.dumps(row),flush=True)
(OUT/'scores.json').write_text(json.dumps(all_rows))
