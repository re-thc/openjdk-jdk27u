import json,os,subprocess,sys
from pathlib import Path
out=Path("results");out.mkdir(exist_ok=True)
work=Path("work/native-930");work.mkdir(parents=True,exist_ok=True)
environment=os.environ.copy()
for name in ("AMALGAMATE_SOURCE_PATH","AMALGAMATE_INCLUDE_PATH","AMALGAMATE_OUTPUT_PATH"):
    environment.pop(name,None)
versions=[("old","v9.2.1","dc3f7a8fa291f2ce793c7b0ddd458f4e67542f14",0),
          ("new","v9.3.0","bb77e7bb98fe0c2296e7cf9f324c56fcd704885a",1)]
executables={}
for mode,tag,sha,has930 in versions:
    checkout=work/(mode+"-upstream")
    subprocess.run(["git","clone","--quiet","--depth","1","--branch",tag,"https://github.com/simdutf/simdutf.git",str(checkout)],check=True)
    assert subprocess.check_output(["git","-C",str(checkout),"rev-parse","HEAD"],text=True).strip()==sha
    generated=(work/mode).resolve();generated.mkdir()
    subprocess.run([sys.executable,str((checkout/"singleheader/amalgamate.py").resolve()),
       "--source-dir",str((checkout/"src").resolve()),"--include-dir",str((checkout/"include").resolve()),
       "--output-dir",str(generated),"--no-zip","--no-readme","--with-utf8","--with-utf16",
       "--with-utf32","--with-base64","--with-ascii","--with-latin1"],env=environment,check=True)
    executable=(work/(mode+"-bench")).resolve()
    command=["g++-16","-O3","-std=c++17","-DNDEBUG","-DHAS930="+str(has930),
       "-I"+str(generated),str(generated/"simdutf.cpp"),"make/scripts/simdutf930-native.cpp","-o",str(executable)]
    subprocess.run(command,check=True)
    executables[mode]=executable
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
digests=set()
for fork in range(4):
    for mode in (("old","new") if fork%2==0 else ("new","old")):
        path=out/(mode+"-"+str(fork)+".log")
        result=subprocess.run([str(executables[mode])],text=True,capture_output=True)
        path.write_text(result.stdout+result.stderr)
        if result.returncode:
            print(path.read_text()[-16000:],flush=True)
            raise SystemExit(result.returncode)
        assert "NATIVE_COMPLETE" in result.stdout
        for line in result.stdout.splitlines():
            if line.startswith("NATIVE_SEMANTICS "):digests.add(line.split()[1])
            elif line.startswith("NATIVE_RESULT "):
                record=json.loads(line[len("NATIVE_RESULT "):]);record.update(mode=mode,fork=fork)
                print("UPGRADE_RESULT",json.dumps(record),flush=True)
            elif line.startswith(("NATIVE_META","REPLACEMENT_POLICY")):print(line,flush=True)
assert len(digests)==1,digests
print("UPGRADE_NATIVE_COMPLETE_NOT_FINAL_IMAGE",flush=True)
