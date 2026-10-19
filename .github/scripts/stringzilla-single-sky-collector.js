function collectFinalQualification(log, backend, tier, job, artifact, producer, expected, collectors, split) {
  const assert=(v,s)=>{if(!v)throw Error("Final qualification "+backend+"/"+tier+": "+s);};
  const same=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
  assert(["serial","avx2","neon","msvc","avx512"].includes(backend)&&["interpreter","c1","c2"].includes(tier),"wrong backend/tier");
  const alias=backend==="avx512"?"avx2":backend, windows=backend==="msvc";
  const singleMode=expected.sky_mode==="single-host-v1";
  assert(!singleMode||backend==="avx512","single-host mode requires SKY");
  let execution=job;
  const producerRun=expected.producer_run??expected.run,producerHead=expected.producer_head??expected.head;
  const normalizePath=p=>windows?p.replace(/\\/g,"/").toLowerCase():p.replace(/\\/g,"/");
  const attempt=(actual,snapshot)=>{
    if(actual.run_attempt===1)return true;
    return actual.run_attempt>1&&snapshot?.run_attempt===1&&snapshot.id===actual.id&&
      snapshot.run_id===actual.run_id&&snapshot.head_sha===actual.head_sha&&snapshot.name===actual.name&&
      snapshot.created_at===actual.created_at;
  };
  const consumerName=singleMode?job.name==="Single host missing SKY controls":backend==="avx512"?
    new RegExp("^avx512_controls \\("+tier+"\\) / Final SKY "+tier+" slot [0-3] on ubuntu-(?:22|24|26)\\.04$").test(job.name):
    job.name.endsWith("/ "+backend+"-"+tier+" controls");
  assert(job.run_id===expected.run&&job.head_sha===expected.head&&attempt(job,expected.job_snapshot)&&
    job.status==="completed"&&(singleMode||job.conclusion==="success")&&consumerName,"wrong/failed consumer job");
  const name="stringzilla-final-results-"+backend+"-"+tier+"-"+expected.head+"-attempt1";
  assert(artifact?.name===name&&artifact.expired===false&&/^sha256:[a-f0-9]{64}$/.test(artifact.digest)&&
    artifact.workflow_run?.id===expected.run&&artifact.workflow_run.head_sha===expected.head,"wrong result artifact binding");
  assert(producer.job.run_id===producerRun&&producer.job.head_sha===producerHead&&attempt(producer.job,producer.job_snapshot)&&producer.job.conclusion==="success"&&
    producer.job.name.endsWith("/ "+alias+" validated pair"),"producer did not validate");
  assert(producer.artifact.id===producer.expected_id&&producer.artifact.digest===producer.expected_digest&&
    producer.artifact.name==="stringzilla-final-pair-"+alias+"-"+producerHead&&
    producer.artifact.workflow_run?.id===producerRun&&producer.artifact.workflow_run.head_sha===producerHead&&
    producer.artifact.expired===false,"wrong validated image pair");
  const steps=new Map((producer.job.steps??[]).map(s=>[s.name,s.conclusion]));
  for(const name of["Verify and archive matched complete pair","Publish complete images before tests","Run profiles, jtreg and native contract checks"])assert(steps.get(name)==="success","producer step absent/failed: "+name);
  const lines=log.split(/\r?\n/).map(x=>x.replace(/^\uFEFF(?=\d{4}-\d\d-\d\dT[\d:.]+Z )/,"").replace(/^\d{4}-\d\d-\d\dT[\d:.]+Z /,"")),images={};
  for(const[control,name]of[["original","ORIGINAL_HASH"],["fork","FORK_HASH"]]){
    const values=[...new Set(lines.map(x=>x.match(new RegExp("^\\s*"+name+":\\s*([a-f0-9]{64})\\s*$"))?.[1]).filter(Boolean))];
    assert(values.length===1,"missing/ambiguous producer-output "+name);images[control]=values[0];
  }
  assert(same(images,producer.image_hashes),"consumer flags differ from independently recorded producer-output image hashes");

  if(singleMode){
    const rows=lines.filter(line=>line.startsWith("STRINGZILLA_SINGLE_HOST_ATTESTATION "))
      .map(line=>JSON.parse(line.slice("STRINGZILLA_SINGLE_HOST_ATTESTATION ".length)));
    assert(rows.length===1,"missing/duplicate single-host attestation");
    const a=rows[0],trusted=expected.single_host,b=trusted?.binding,f=a.fact;
    assert(trusted&&b?.schema==="stringzilla-single-host-tier-v1"&&b.complete===true&&b.tier===tier&&
      b.source===expected.source&&b.base===expected.base&&b.run_id===expected.run&&b.head===expected.head&&b.attempt===1,
      "wrong single-host tier receipt");
    assert(a.schema==="stringzilla-single-host-attestation-v1"&&a.tier===tier&&
      same(f,b.fact)&&same(a.fact_binding,b.fact_binding)&&same(a.ready,b.ready),"single-host log/artifact mismatch");
    assert(f.schema==="stringzilla-single-host-fact-v1"&&f.mode==="single-host-v1"&&
      f.run_id===expected.run&&f.head===expected.head&&f.attempt===1&&f.source===expected.source&&
      f.base===expected.base&&f.source_tree===expected.source_tree&&same(f.tiers,expected.sky_missing_tiers)&&
      f.timed_records===0&&f.images_restored===false&&f.module_sha256===expected.sky_single_module_sha256&&
      f.job_id===job.id&&f.job_name===job.name&&f.runner_id===job.runner_id&&f.runner_id>0&&
      f.runner_name===job.runner_name&&f.available===true&&f.native_execution===true&&
      /^[a-f0-9]{32}$/.test(f.nonce)&&Number.isSafeInteger(f.cpu)&&f.cpu>=0&&
      f.container_image===expected.sky_container_image,"wrong single-host identity/CPU");
    const flags=new Set(f.fields?.flags?.split(/\s+/)),required=["avx","avx2","bmi1","bmi2","f16c","fma",
      "movbe","popcnt","sse4_1","sse4_2","ssse3","cx16","avx512f","avx512bw","avx512vl"];
    assert(required.every(x=>flags.has(x))&&(flags.has("abm")||flags.has("lzcnt"))&&
      /^(x86_64|amd64)$/i.test(f.machine)&&same(f.missing,[])&&
      /^[a-f0-9]{64}$/.test(f.os_release_sha256)&&/^[a-f0-9]{64}$/.test(f.libc_sha256),
      "single-host lacks required executable profile");
    const inputs=f.inputs;
    assert(inputs.source===expected.source&&inputs.base===expected.base&&inputs.source_tree===expected.source_tree&&
      same(inputs.tiers,expected.sky_missing_tiers)&&inputs.tiers.includes(tier)&&
      inputs.missing_proof_sha256===expected.sky_missing_proof_sha256&&
      inputs.driver_sha256===expected.sky_single_driver_sha256&&inputs.module_sha256===expected.sky_single_module_sha256&&
      inputs.helper_sha256===expected.projections[tier].stock.receipt.runner_sha256&&
      inputs.manifest_sha256===expected.sky_manifest_sha256&&
      inputs.producer_run===producerRun&&inputs.producer_head===producerHead&&
      inputs.pair_artifact_id===producer.artifact.id&&inputs.pair_artifact_digest===producer.artifact.digest&&
      inputs.python_auth_tests_passed===true&&inputs.independent_scope_model_passed===true,"wrong single-host input pins");
    const factArtifact=trusted.fact_artifact,prepArtifact=trusted.preparation_artifact;
    assert(factArtifact?.id===b.fact_binding.artifact_id&&factArtifact.digest===b.fact_binding.artifact_digest&&
      factArtifact.name==="stringzilla-single-sky-fact-"+expected.head&&factArtifact.expired===false&&
      factArtifact.workflow_run?.id===expected.run&&factArtifact.workflow_run.head_sha===expected.head&&
      prepArtifact?.id===f.preparation.artifact_id&&prepArtifact.digest===f.preparation.artifact_digest&&
      prepArtifact.name==="stringzilla-single-sky-preparation-"+expected.head&&prepArtifact.expired===false&&
      prepArtifact.workflow_run?.id===expected.run&&prepArtifact.workflow_run.head_sha===expected.head,
      "wrong single-host raw fact/preparation artifacts");
    const measured=(job.steps??[]).filter(s=>s.name==="Measure missing SKY "+tier+" controls");
    const uploaded=(job.steps??[]).filter(s=>s.name==="Retain completed SKY "+tier+" raw results");
    assert(measured.length===1&&measured[0].status==="completed"&&measured[0].conclusion==="success"&&
      uploaded.length===1&&uploaded[0].status==="completed"&&uploaded[0].conclusion==="success",
      "single-host tier step/upload did not succeed");
    execution=measured[0]; // Real API step; the actual parent job remains unchanged.
    const events=lines.filter(line=>line.startsWith("STRINGZILLA_SINGLE_HOST_PHASE_AUTH "))
      .map(line=>JSON.parse(line.slice("STRINGZILLA_SINGLE_HOST_PHASE_AUTH ".length)));
    assert(same(events,b.authorizations)&&same(events.map(e=>e.phase),["restore","measure","periodic","utf16-probe"])&&
      events.every(e=>e.tier===tier&&e.job_id===job.id&&e.runner_id===job.runner_id&&e.nonce===f.nonce&&
        e.cpu===f.cpu&&same(e.fact,b.fact_binding)),"single-host changed between phases");
    const rt=trusted.runtime,native=trusted.native;
    assert(rt?.available===true&&rt.backend==="avx512"&&rt.tier===tier&&rt.source===expected.source&&
      rt.timed_records===0&&native?.passed===true&&trusted.native_log.includes("requested=2 selected=2 executable=1"),
      "single-host runtime/native unavailable");
    for(const[control,value]of Object.entries({original:"3",enabled:"3:2:true",disabled:"3:2:false"})){
      const x=rt.observations?.[control];assert(x&&x.returncode===0&&x.actual===value&&x.expected===value,
        "wrong actual single-host VM/backend control");
    }
  }else if(backend==="avx512"){
    const values=lines.filter(line=>line.startsWith("STRINGZILLA_SKY_ALLFOUR_SELECTION ")).map(line=>JSON.parse(line.slice(34)));
    assert(values.length===1,"missing/duplicate SKY election selection");
    const selection=values[0],slots={"0":"ubuntu-22.04","1":"ubuntu-24.04","2":"ubuntu-26.04","3":"ubuntu-26.04"};
    assert(selection.schema==="stringzilla-sky-allfour-selection-v1"&&selection.source===expected.source&&selection.base===expected.base&&
      selection.run_id===expected.run&&selection.head===expected.head&&selection.attempt===1&&selection.tier===tier&&
      selection.algorithm_sha256===expected.sky_algorithm_sha256,"wrong SKY source/algorithm/namespace");
    assert(same(Object.keys(selection.facts).sort(),["0","1","2","3"]),"incomplete SKY fact set");
    const nonces=new Set(),ids=new Set(),eligible=[];
    for(const slot of Object.keys(slots)){
      const fact=selection.facts[slot],fullName="avx512_controls ("+tier+") / Final SKY "+tier+" slot "+slot+" on "+slots[slot];
      const actual=expected.sky_jobs.find(value=>value.id===fact.job_id);
      const artifact=expected.sky_artifacts.find(value=>value.id===fact.artifact_id);
      assert(actual&&actual.name===fullName&&actual.head_sha===expected.head&&actual.run_id===expected.run&&actual.status==="completed"&&
        actual.run_attempt===1&&actual.runner_id===fact.runner_id&&fact.runner_id>0&&fact.job_name===fullName&&
        fact.host_runner_label===slots[slot],"wrong SKY worker identity");
      assert(artifact&&artifact.name==="stringzilla-final-sky-fact-"+expected.run+"-"+tier+"-"+slot+"-attempt1"&&
        artifact.digest===fact.artifact_digest&&artifact.expired===false&&artifact.workflow_run?.id===expected.run&&
        artifact.workflow_run.head_sha===expected.head,"wrong SKY fact artifact");
      const published=(actual.steps??[]).filter(value=>value.name==="Publish this slot's immutable eligibility fact");
      const timed=(actual.steps??[]).filter(value=>value.name==="Measure final SKY "+tier+" original enabled and disabled controls");
      assert(published.length===1&&published[0].conclusion==="success"&&timed.length===1,"missing SKY publish/timing step");
      assert(timed[0].conclusion===(slot===selection.selected_slot?"success":"skipped"),"competing/missing SKY timings");
      assert(typeof fact.available==="boolean"&&/^[a-f0-9]{32}$/.test(fact.nonce)&&
        /^[a-f0-9]{64}$/.test(fact.proof_sha256)&&/^sha256:[a-f0-9]{64}$/.test(fact.artifact_digest),"invalid SKY immutable fact");
      nonces.add(fact.nonce);ids.add(fact.job_id);if(fact.available)eligible.push(slot);
    }
    assert(nonces.size===4&&ids.size===4&&eligible.length>0&&selection.selected_slot===eligible.sort()[0]&&
      selection.selected_job_id===job.id&&selection.selected_job_name===job.name,"SKY selection is not MIN eligible");
  }
  const phases=split(log,expected.definitions),projection=expected.projections[tier],results={};
  const required=Object.entries(projection).filter(([,x])=>x.triplets>0).map(([k])=>k);
  assert(same(Object.keys(phases),Object.keys(projection).filter(k=>projection[k].triplets>0)),"missing/unexpected/out-of-order measurement phase");
  for(const[kind,value]of Object.entries(phases)){
    const plan=projection[kind],receipt={...plan.receipt,producer_image_hashes:images};
    const parsed=collectors[kind](value.log,backend,execution,plan.manifest,expected.source,expected.base,receipt);
    const host=parsed.provenance.machine;
    assert(host&&typeof host.system==="string"&&typeof host.machine==="string"&&
      (backend==="neon"?/aarch64|arm64/i:/x86_64|amd64/i).test(host.machine)&&
      (windows?/^Windows/i:/^Linux/i).test(host.system)&&
      (windows?host.affinity?.method==="SetProcessAffinityMask"&&Number.isSafeInteger(host.affinity.mask)&&
        host.affinity.mask>0&&Number.isInteger(Math.log2(host.affinity.mask)):
       host.affinity?.method==="sched_setaffinity"&&Number.isSafeInteger(host.affinity.cpu)&&host.affinity.cpu>=0),
      "missing native one-CPU affinity receipt");
    if(singleMode)assert(host.affinity.cpu===expected.single_host.binding.fact.cpu,"timing CPU differs from leased CPU");
    if(results.stock)assert(same(host.affinity,results.stock.provenance.machine.affinity)&&
      host.system===results.stock.provenance.machine.system,"host/CPU changed between phases");
    assert(parsed.groups.length===plan.triplets&&parsed.records.length===plan.triplets*3,"wrong projected matrix");
    assert(parsed.groups.every(g=>g.tier===tier),"unexpected tier inside shard");
    results[kind]=parsed;
  }
  const extras={};
  for(const[kind,prefix,count]of[["uniform","STRINGZILLA_AUX_UNIFORM_COMPILATION",6],["positive","STRINGZILLA_AUX_POSITIVE_SEARCH_COMPILATION",9]]){
    const rows=lines.filter(x=>x.startsWith(prefix+" ")).map(x=>JSON.parse(x.slice(prefix.length+1)));
    assert(rows.length===(tier==="c2"?count:0),"wrong extra diagnostic count");
    const seen=new Set();
    for(const r of rows){
      assert(r.tier==="c2"&&r.timing_evidence===false&&r.returncode===0&&
        r.source===(r.control==="original"?expected.base:expected.source),"invalid extra diagnostic source/status");
      assert(["original","enabled","disabled"].includes(r.control)&&/^[0-9a-f]{64}$/.test(r.sha256),"invalid extra diagnostic identity/hash");
      const key=JSON.stringify([r.control,kind==="uniform"?r.params?.length:r.case]);
      assert(!seen.has(key),"duplicate extra diagnostic");seen.add(key);
      assert(Array.isArray(r.jvmArgs)&&Array.isArray(r.command)&&Array.isArray(r.machine_code)&&
        Array.isArray(r.printed_methods)&&Array.isArray(r.selected_lines)&&r.selected_lines.length<=100,"invalid extra diagnostic extraction");
      const base=["-XX:ActiveProcessorCount=1","-XX:+UseSerialGC","-Xshare:off",
        ...(backend==="neon"?[]:["-XX:UseAVX="+(backend==="serial"?"0":backend==="avx512"?"3":"2")]),"-XX:-TieredCompilation",
        ...(r.control==="original"?[]:["-XX:"+(r.control==="enabled"?"+":"-")+"UseStringZillaIntrinsics"])];
      const commands=kind==="uniform"?[
        "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
        "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOfJava",
        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaTailSearch_lastIndexOf_jmhTest::lastIndexOf_avgt_jmhStub"]:[
        "-XX:+PrintFlagsFinal","-XX:CompileCommand=print,java.lang.String::lastIndexOf",
        "-XX:CompileCommand=print,java.lang.StringLatin1::lastIndexOf",
        "-XX:CompileCommand=print,java.lang.StringZilla::lastIndexOfLatin1JavaC2",
        "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
        "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOfJava",
        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_lastIndexOf_jmhTest::lastIndexOf_avgt_jmhStub"];
      const flags=[...base,"-Xbatch","-XX:+UnlockDiagnosticVMOptions","-XX:+PrintCompilation","-XX:+PrintInlining",...commands];
      assert(same(r.jvmArgs,flags),"wrong extra diagnostic JVM flags");
      const image=normalizePath(results.stock.provenance.image_hashes[r.control==="original"?"original":"fork"].root);
      const forkRoot=normalizePath(results.stock.provenance.image_hashes.fork.root);
      const outRoot=forkRoot.replace(/\/perf-images\/fork$/,"/perf-output");
      assert(outRoot!==forkRoot,"unexpected image/output layout");
      const cp=[outRoot+"/classes",...["jmh-core-1.37.jar","jopt-simple-5.0.4.jar","commons-math3-3.6.1.jar"].map(j=>outRoot+"/jmh/"+j)].join(windows?";":":");
      const params=kind==="uniform"?["-p","length="+r.params.length,"-p","needleLength=129","-p","shape=UTF16_UNIFORM_END"]:
        ["-p","length="+r.params.length,"-p","needleLength="+r.params.needleLength,"-p","coder="+r.params.coder,"-p","position=END"];
      const java=image+"/bin/java"+(windows?".exe":"");
      const cmd=[java,...base,"-cp",cp,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang."+(kind==="uniform"?"StringZillaTailSearch":"StringZillaSearch")+".lastIndexOf$",
        ...params,"-f","1","-wi","1","-w","500ms","-i","1","-r","500ms","-foe","true","-jvm",java,"-jvmArgs",flags.join(" ")];
      const actual=r.command.slice();
      actual[0]=normalizePath(actual[0]);
      actual[actual.indexOf("-cp")+1]=actual[actual.indexOf("-cp")+1].split(windows?";":":").map(normalizePath).join(windows?";":":");
      actual[actual.indexOf("-jvm")+1]=normalizePath(actual[actual.indexOf("-jvm")+1]);
      assert(same(actual,cmd),"wrong extra diagnostic command or complete image");
      assert(r.path===(kind==="uniform"?"uniform-diagnostics/"+r.control+"-"+r.params.length:
        "positive-search-diagnostics/"+r.control+"-"+r.case)+".log","wrong extra diagnostic log path");
      assert(r.machine_code.every(x=>typeof x==="string")&&r.printed_methods.every(x=>typeof x==="string")&&
        r.selected_lines.every(x=>typeof x==="string"),"invalid diagnostic extraction types");
      if(kind==="uniform")assert(["129","130"].includes(r.params?.length)&&r.params?.needleLength==="129"&&
        r.params?.shape==="UTF16_UNIFORM_END"&&Object.keys(r.params).length===3,"wrong uniform diagnostic params");
      else{
        const cases={"utf16-4096-64-end":["4096","64","UTF16"],"latin1-4096-4-end":["4096","4","LATIN1"],"utf16-127-4-end":["127","4","UTF16"]},values=cases[r.case];
        assert(values&&r.params?.length===values[0]&&r.params?.needleLength===values[1]&&r.params?.coder===values[2]&&
          r.params?.position==="END"&&Object.keys(r.params).length===4,"wrong positive diagnostic params");
      }
    }
    extras[kind]=rows;
  }
  const groups=Object.values(results).flatMap(x=>x.groups),higher=groups.filter(g=>g.comparisons.original.slower_mean||g.comparisons.disabled.slower_mean);
  const nonoverlap=higher.filter(g=>["original","disabled"].some(c=>g.comparisons[c].slower_mean&&!g.comparisons[c].intervals_overlap));
  return{schema:"stringzilla-final-qualification-evidence-v1",scope:"Complete matched original/enabled/disabled images; two forks and original fixed protocol",backend,tier,job,execution_kind:singleMode?"github-step":"github-job",execution,parent_job:singleMode?job:undefined,artifact,producer,producer_image_hashes:images,phases:results,extra_diagnostics:extras,groups,higher_means:higher,nonoverlap_losses:nonoverlap};
}
