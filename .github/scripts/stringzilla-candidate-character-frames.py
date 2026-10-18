#!/usr/bin/env python3
"""Read existing C1 character nmethods; no image restoration or JVM execution."""
import hashlib, io, json, pathlib, re, subprocess, zipfile
RUN=39145136082
HEAD="f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"
SOURCE="e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE="416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
OUT=pathlib.Path("character-frame-evidence")
OUT.mkdir()
bindings=[
 {"backend":"avx2","artifact":12144507617,"digest":"bcb8f7dce1855e6ecf4ac45e9302de578fd5a47ab5a8b6e7fb75bc56b64eff1e","job":117733444034,
  "cases":[["reverse","LATIN1",4096],["reverse","UTF16",4096]]},
 {"backend":"neon","artifact":12144699305,"digest":"f466fecd3f7ea297e07a2afff66a90974bf63f45f3ff8c5f4424c8cc1255a550","job":117733444047,
  "cases":[["forward","UTF16",128]]}
]
def sha(raw):return hashlib.sha256(raw).hexdigest()
def api(path):return json.loads(subprocess.check_output(["gh","api","repos/re-thc/openjdk-jdk27u/"+path],text=True))

# A failed dependency download is recorded separately from unsupported hardware.
failure_binding = {"run":39152364859,"head":"5eb741f73bc6cce9478793ba2101d719a40d3fc7",
 "job":117751315857,"artifact":12146739652,
 "digest":"0c36c86bdd01aa0be77ffdf68d3c3b2caf1c1096ff5015bea44f0f9f169d073a"}
metadata=api("actions/artifacts/"+str(failure_binding["artifact"]))
job=api("actions/jobs/"+str(failure_binding["job"]))
assert metadata["id"]==failure_binding["artifact"] and metadata["digest"]=="sha256:"+failure_binding["digest"] and not metadata["expired"]
assert metadata["name"]=="stringzilla-candidate-losses-serial-c1-"+failure_binding["head"]+"-attempt1"
assert metadata["workflow_run"]["id"]==failure_binding["run"] and metadata["workflow_run"]["head_sha"]==failure_binding["head"]
assert job["id"]==failure_binding["job"] and job["run_id"]==failure_binding["run"] and job["head_sha"]==failure_binding["head"]
assert job["status"]=="completed" and job["conclusion"]=="failure" and job["run_attempt"]==1
steps={step["name"]:step["conclusion"] for step in job["steps"]}
assert steps["Restore only validated complete pilot images and attest runtime"]=="success"
assert steps["Measure only the disjoint original enabled and disabled triplets"]=="failure"
raw=subprocess.check_output(["gh","api","repos/re-thc/openjdk-jdk27u/actions/artifacts/"+str(failure_binding["artifact"])+"/zip"])
assert sha(raw)==failure_binding["digest"]
archive=zipfile.ZipFile(io.BytesIO(raw))
names=archive.namelist()
assert len(names)==17 and len(names)==len(set(names))
assert not any(name.startswith("classes/") or name.endswith("-jmh.json") for name in names)
assert [name for name in names if name.endswith(".class")]==["runtime-probe/RuntimeProbe.class"]
pair=json.loads(archive.read("pair-receipt.json"))
assert pair["sources"]=={"original":BASE,"fork":SOURCE} and pair["backend"]=="serial"
assert pair["producer_run"]==str(RUN) and pair["producer_head"]==HEAD
receipt=json.loads(archive.read("shard-receipt.json"))
assert receipt["source"]==SOURCE and receipt["base"]==BASE and receipt["backend"]=="serial" and receipt["tier"]=="c1" and receipt["triplets"]==7
assert receipt["pair_receipt_sha256"]==sha(archive.read("pair-receipt.json"))
assert receipt["manifest_sha256"]==sha(archive.read("shard-cases.tsv"))
assert receipt["producer_image_hashes"]==pair["image_hashes"]
assert receipt["producer"]["job"]["id"]==117733444162
assert receipt["producer"]["artifact"]["id"]==12145506718
assert receipt["producer"]["artifact"]["digest"]=="sha256:f452b3221e10716664eb7aa0ceffc2dba78d621d222c78c4b6cb210bd49aaea0"
assert json.loads(archive.read("runtime-attestation.json"))["available"] is True
rawlog=archive.read("experiment.log")
text=rawlog.decode("utf-8")
assert text.startswith("Traceback (most recent call last):")
assert "jars = download_jmh(args.output / \"jmh\")" in text and "in download_jmh" in text
assert "ssl.SSLEOFError: [SSL: UNEXPECTED_EOF_WHILE_READING]" in text and "urllib.error.URLError:" in text
assert not any(marker in text for marker in ("STRINGZILLA_", "# JMH version:", "# Warmup", "Iteration   1:"))
folder=OUT/"serial-c1-dependency-failure"
folder.mkdir()
(folder/"experiment.log").write_bytes(rawlog)
zero={"binding":failure_binding,"source":SOURCE,"base":BASE,"backend":"serial","tier":"c1",
 "kind":"transient-dependency-download-failure","unsupported_hardware":False,
 "timing_evidence":False,"timed_records":0,"new_measurements":0,
 "reason":"Frozen run() downloads all JMH dependencies before benchmark classes.mkdir/JMH javac or entering its benchmark loop.",
 "raw_log_sha256":sha(rawlog),"raw_log":text,"shard_receipt":receipt,
 "inventory":{name:sha(archive.read(name)) for name in sorted(names)}}
(folder/"receipt.json").write_text(json.dumps(zero,indent=2)+"\n")
print("STRINGZILLA_SAVED_DOWNLOAD_ZERO "+json.dumps(zero,separators=(",",":")),flush=True)

all_records=[]
for binding in bindings:
 metadata=api("actions/artifacts/"+str(binding["artifact"]))
 job=api("actions/jobs/"+str(binding["job"]))
 assert metadata["id"]==binding["artifact"] and metadata["digest"]=="sha256:"+binding["digest"] and not metadata["expired"]
 assert metadata["name"]=="stringzilla-candidate-pilot-build-"+binding["backend"]+"-"+HEAD
 assert metadata["workflow_run"]["id"]==RUN and metadata["workflow_run"]["head_sha"]==HEAD
 assert job["id"]==binding["job"] and job["run_id"]==RUN and job["head_sha"]==HEAD
 assert job["status"]=="completed" and job["conclusion"]=="success" and job["run_attempt"]==1
 steps={s["name"]:s["conclusion"] for s in job["steps"]}
 assert all(steps[name]=="success" for name in ("Verify and archive matched complete pair","Publish complete images before tests","Run profiles, jtreg and native contract checks"))
 raw=subprocess.check_output(["gh","api","repos/re-thc/openjdk-jdk27u/actions/artifacts/"+str(binding["artifact"])+"/zip"])
 assert sha(raw)==binding["digest"]
 archive=zipfile.ZipFile(io.BytesIO(raw))
 assert len(archive.namelist())==len(set(archive.namelist()))
 pair=json.loads(archive.read("pair-receipt.json"))
 assert pair["sources"]=={"original":BASE,"fork":SOURCE} and pair["backend"]==binding["backend"]
 assert str(pair["producer_run"])==str(RUN) and pair["producer_head"]==HEAD
 receipt=json.loads(archive.read("character-diagnostics.json"))
 assert receipt["source"]==SOURCE and receipt["baseline"]==BASE and receipt["backend"]==binding["backend"]
 assert receipt["timing_evidence"] is False and receipt["compiled_once_with"]=="original"
 assert receipt["application_sha256"]["StringZillaCharInlining.java"]=="add8823a1e3d31406cc200c22d935989041ab726ed02018c34456b8d4d172563"
 for relative,digest in receipt["application_sha256"].items():
  assert sha(archive.read("character-diagnostics/"+relative))==digest
 for direction,coder,length in binding["cases"]:
  runs=receipt["reverse_runs"] if direction=="reverse" else receipt["runs"]
  selected=[r for r in runs if r["coder"]==coder and r["length"]==length]
  assert len(selected)==3 and {r["control"] for r in selected}=={"original","enabled","disabled"}
  for record in selected:
   control=record["control"]
   assert record["tier"]=="c1" and record["timing_evidence"] is False and record["returncode"]==0
   assert record["source"]==(BASE if control=="original" else SOURCE)
   assert "-XX:TieredStopAtLevel=1" in record["jvmArgs"] and "-Xbatch" in record["jvmArgs"]
   if direction=="reverse":assert record["fromIndex"]==length-1 and record["expected"]==length-4
   rawlog=archive.read(record["path"])
   assert sha(rawlog)==record["sha256"]
   text=rawlog.decode("utf-8")
   assert "Compiled method (c1)" in text and "Compiled method (c2)" not in text
   blocks=[]
   for match in re.finditer(r"(?m)^Compiled method \(c1\)[^\r\n]*(?:StringZillaCharInlining::search(?:Reverse)?|java\.lang\.String(?:UTF16|Latin1)::(?:lastIndexOf|indexOfChar0))[^\r\n]*",text):
    end=text.find("[/MachCode]",match.end())
    assert end>=0
    block=text[match.start():end+len("[/MachCode]")]
    frames=re.findall(r"(?m)^\s*#\s*\[sp\+0x([0-9a-fA-F]+)\][^\r\n]*",block)
    blocks.append({"title":match[0],"block_sha256":sha(block.encode("utf-8")),
      "stack_caller_offsets":[int(value,16) for value in frames],
      "code":block})
   assert blocks
   folder=OUT/binding["backend"]
   folder.mkdir(exist_ok=True)
   path=folder/pathlib.PurePosixPath(record["path"]).name
   path.write_bytes(rawlog)
   evidence={"binding":binding,"image_hashes":pair["image_hashes"],"source":record["source"],"control":control,
    "direction":direction,"coder":coder,"length":length,"timing_evidence":False,
    "scope":"Existing validation application C1 graph; not a timed JMH caller graph.",
    "saved_record":record,"raw_log":str(path),"raw_log_sha256":sha(rawlog),"compiled_blocks":blocks,
    "targeted_inlining":[line for line in text.splitlines() if not line.lstrip().startswith(";") and
      re.search(r"(?:String(?:UTF16|Latin1|Zilla)?|StringZillaCharInlining)::(?:lastIndexOf|indexOf|search|useChar)",line) and
      re.search(r"inline|intrinsic|\(\d+ bytes\)",line)]}
   all_records.append(evidence)
   print("STRINGZILLA_SAVED_CHARACTER_C1 "+json.dumps(evidence,separators=(",",":")),flush=True)
 assert len([r for r in all_records if r["binding"]["backend"]==binding["backend"]])==3*len(binding["cases"])
assert len(all_records)==9
(OUT/"receipt.json").write_text(json.dumps({"source":SOURCE,"baseline":BASE,"records":all_records,
 "new_jvm_executions":0,"new_measurements":0,"new_builds":0,"new_compilations":0},indent=2)+"\n")
