import hashlib, json, os, pathlib, platform, subprocess
def record(path):
    p=pathlib.Path(path)
    return {"path":str(p),"bytes":p.stat().st_size,"sha256":hashlib.sha256(p.read_bytes()).hexdigest()}
data={"platform":platform.platform(),"machine":platform.machine(),"affinity":sorted(os.sched_getaffinity(0)),
      "cpuinfo":pathlib.Path("/proc/cpuinfo").read_text(),"lscpu":subprocess.check_output(["lscpu"],text=True),
      "bundles":[record(p) for p in sorted(pathlib.Path(".").glob("*-bundles/*.tar.gz"))]}
pathlib.Path("native-ir-host.json").write_text(json.dumps(data,indent=2)+"\n")
print("NATIVE_HOST_JSON="+json.dumps(data))

