function collectStringZilla(log, backend, job, manifest, source, base = "e206bae32b2a6cc1fa9464ad34d75f2df4b347e9") {
  const assert = (v, reason) => { if (!v) throw Error(backend + ": " + reason); };
  assert(job.conclusion === "success", "job did not succeed");
  const rows = manifest.trim().split(/\r?\n/).map(x=>x.split("\t"));
  const keys=rows.shift();
  const cases=rows.map(v=>Object.fromEntries(keys.map((k,i)=>[k,v[i]])));
  assert(new Set(cases.map(c=>c.id)).size===cases.length,"duplicate manifest input");
  const kinds={};
  for(const line of log.split(/\r?\n/)) {
    const m=line.match(/STRINGZILLA_(PROVENANCE|RESULT|SUMMARY|COMPLETE|COMPILATION|MSVC_BASELINE) (\{.*\})$/);
    if(m)(kinds[m[1]]??=[]).push(JSON.parse(m[2]));
  }
  assert(kinds.PROVENANCE?.length===1&&kinds.COMPLETE?.length===1,"missing unique provenance/completion");
  const p=kinds.PROVENANCE[0],done=kinds.COMPLETE[0];
  assert(p.sources.original===base&&p.sources.fork===source,"wrong source revisions");
  assert(JSON.stringify(done.sources)===JSON.stringify(p.sources),"completion source mismatch");
  assert(done.images_unchanged===true&&done.all_means_retained===true,"images changed or incomplete data");
  assert(p.control_images.original==="original"&&p.control_images.enabled==="fork"&&p.control_images.disabled==="fork","wrong control images");
  const hash=/^[0-9a-f]{64}$/;
  assert(hash.test(p.image_hashes.original.tree_sha256)&&hash.test(p.image_hashes.fork.tree_sha256),"missing complete-image hashes");
  assert(p.image_hashes.original.tree_sha256!==p.image_hashes.fork.tree_sha256,"original equals fork image");
  for(const name of ["manifest_sha256","runner_sha256"])assert(hash.test(p[name]),"missing "+name);
  assert(p.spec.DEBUG_LEVEL==="release","wrong build mode");
  assert((backend==="msvc"?/^19\.44\./:/^16\./).test(p.spec.CXX_VERSION_NUMBER),"unexpected C++ compiler");
  assert(p.spec.TOOLCHAIN_TYPE===(backend==="msvc"?"microsoft":"gcc"),"wrong compiler type");
  assert((backend==="msvc"?/^19\.44\./:/^16\./).test(p.spec.CC_VERSION_NUMBER),"unexpected compiler");
  assert(p.method.forks===2&&p.method.warmup==="3 x 500ms"&&p.method.measurement==="5 x 500ms"&&p.method.gc==="Serial"&&p.method.cds==="off","wrong JMH method");
  const selected={serial:0,avx2:1,avx512:2,neon:4,msvc:0}[backend];
  const backendFlags=backend==="neon"?[]:["-XX:UseAVX="+({serial:0,avx2:2,avx512:3,msvc:2}[backend])];
  assert(p.backend_controls.length===1&&p.backend_controls[0][0]===backend&&JSON.stringify(p.backend_controls[0][1])===JSON.stringify(backendFlags),"wrong backend control");
  for(const control of ["enabled","disabled"]){
    const a=p.backend_attestation[control];
    assert(a.backend===selected&&a.enabled===(control==="enabled"),"backend/flag attestation failed");
  }
  const manifestBackend=backend==="avx512"?"avx2":backend;
  const expected=new Map();
  for(const row of cases)if(row.backends.split(",").includes(manifestBackend))for(const tier of row.tiers.split(","))expected.set(tier+"|"+row.id,{row,controls:{}});
  const records=kinds.RESULT??[];
  assert(records.length===expected.size*3&&done.measurements===records.length&&done.triplets===expected.size,"incomplete record count");
  for(const r of records){
    const group=expected.get(r.tier+"|"+r.case);
    assert(group&&["original","enabled","disabled"].includes(r.control),"unexpected measurement");
    assert(!group.controls[r.control],"duplicate measurement");
    assert(r.backend_control===backend,"record backend mismatch");
    assert(r.source===(r.control==="original"?base:source),"record source mismatch");
    const image=p.image_hashes[r.control==="original"?"original":"fork"];
    assert(typeof r.java==="string","missing java path");
    const normalize=x=>x.replaceAll("\\","/").toLowerCase();
    const java=normalize(image.root+"/bin/"+(backend==="msvc"?"java.exe":"java"));
    assert(normalize(r.java)===java,"wrong complete-image launcher");
    const flags=["-XX:ActiveProcessorCount=1","-XX:+UseSerialGC","-Xshare:off",...backendFlags,
      ...({interpreter:["-Xint"],c1:["-XX:TieredStopAtLevel=1"],c2:["-XX:-TieredCompilation"]}[r.tier])];
    if(r.control!=="original")flags.push("-XX:"+(r.control==="enabled"?"+":"-")+"UseStringZillaIntrinsics");
    assert(JSON.stringify(r.jvmArgs)===JSON.stringify(flags),"wrong JVM flags");
    const row=group.row,params={length:row.length,needleLength:row.needleLength};
    if(row.shape!=="-")params.shape=row.shape;else{params.coder=row.coder;params.position=row.position;}
    assert(Object.keys(params).length===Object.keys(r.params).length&&Object.entries(params).every(([k,v])=>r.params[k]===v),"wrong input params");
    assert(r.benchmark.endsWith("."+row.benchmark),"wrong benchmark");
    assert(Number.isFinite(r.score)&&r.score>0&&Number.isFinite(r.error)&&r.error>=0,"bad metric");
    assert(Array.isArray(r.rawData)&&r.rawData.length===2&&r.rawData.every(a=>a.length===5&&a.every(x=>Number.isFinite(x)&&x>0)),"bad raw samples");
    const mean=r.rawData.flat().reduce((a,b)=>a+b,0)/10;
    assert(Math.abs(r.score-mean)<=1e-9*Math.max(r.score,mean),"score differs from raw mean");
    assert(hash.test(r.json_sha256),"missing JMH result hash");
    group.controls[r.control]=r;
  }
  assert(kinds.SUMMARY?.length===expected.size,"incomplete summaries");
  const groups=[];
  for(const [key,g]of expected){
    assert(Object.keys(g.controls).length===3,"incomplete triplet");
    const [tier,caseId]=key.split("|"),en=g.controls.enabled,comparisons={};
    for(const control of ["original","disabled"]){
      const c=g.controls[control];
      comparisons[control]={speedup:c.score/en.score,slower_mean:en.score>c.score,
        intervals_overlap:Math.abs(en.score-c.score)<=en.error+c.error};
    }
    const s=kinds.SUMMARY.find(s=>s.case===caseId&&s.tier===tier&&s.backend_control===backend);
    assert(s&&["original","disabled"].every(c=>s.comparisons[c].slower_mean===comparisons[c].slower_mean&&s.comparisons[c].intervals_overlap===comparisons[c].intervals_overlap&&Math.abs(s.comparisons[c].speedup-comparisons[c].speedup)<1e-12),"summary mismatch");
    groups.push({backend,tier,case:caseId,controls:g.controls,comparisons});
  }
  if(backend==="msvc")assert(kinds.MSVC_BASELINE?.length===1&&kinds.MSVC_BASELINE[0].runtime_passed&&kinds.MSVC_BASELINE[0].forbidden_instructions_absent,"MSVC baseline probe failed");
  const diagnostics=kinds.COMPILATION??[];
  assert(diagnostics.every(d=>d.timing_evidence===false&&d.source===(d.control==="original"?base:source)),"invalid diagnostic source or timing marker");
  return {backend,job,provenance:p,complete:done,records,groups,diagnostics,msvc_baseline:kinds.MSVC_BASELINE??[]};
}
