function collectNativeScreen2(log, job, expected) {
  const assert = (v, why) => { if (!v) throw Error("Native screen2: " + why); };
  const obj = x => x && typeof x === "object" && !Array.isArray(x);
  const hash = x => typeof x === "string" && /^[0-9a-f]{64}$/.test(x);
  const eq = (a,b) => JSON.stringify(a) === JSON.stringify(b);
  const sameMap = (a,b) => obj(a) && obj(b) && Object.keys(a).length === Object.keys(b).length &&
    Object.entries(b).every(([k,v]) => JSON.stringify(a[k]) === JSON.stringify(v));
  const close = (a,b) => Number.isFinite(a) && Number.isFinite(b) &&
    Math.abs(a-b) <= 1e-10 * Math.max(1,Math.abs(a),Math.abs(b));
  const hashes = (x,why) => assert(obj(x) && Object.keys(x).length && Object.values(x).every(hash),why);
  const variants = ["long","short","combined"], controls = ["baseline",...variants];
  const backends={serial:[0,0],avx2:[1,32],avx512:[2,64],neon:[4,16]};
  assert(Object.hasOwn(backends,expected.backend),"unknown backend");
  const [caps,vectorBytes]=backends[expected.backend], arm=expected.backend==="neon";
  assert(job.id === expected.job && job.run_id === expected.run && job.conclusion === "success","wrong or unsuccessful job");
  const read = name => [...log.matchAll(new RegExp("STRINGZILLA_NATIVE_SCREEN2_"+name+" (\\{[^\\r\\n]*\\})","g"))].map(x=>JSON.parse(x[1]));
  const provenance = read("PROVENANCE"), rows = read("RESULT");
  assert(provenance.length === 1 && rows.length === 441,"partial, duplicate or absent evidence");
  const p=provenance[0];
  assert(p.production_source===expected.source && p.auxiliary_head===expected.head &&
    p.candidate_status==="unpromoted-isolated-native-copy","wrong source or candidate status");
  assert(p.runner_sha256===expected.runner_sha256 && p.harness_sha256===expected.harness_sha256,"wrong runner/harness");
  assert(p.source_trees===expected.source_trees && sameMap(p.header_generation,expected.header),"wrong source trees/header");
  assert(sameMap(p.input_blobs,expected.input_blobs),"wrong source/test blob bindings");
  assert(p.fixture_input_map_sha256==="27c6004491c0120db2c0ca94a23a034a760428ad0b5763b53e8c7f53b3738a9f","wrong legacy fixture pin");
  assert(sameMap(p.inputs_sha256,expected.inputs_sha256) && Object.keys(p.inputs_sha256).length===298,"changed or absent fixture bytes");
  assert(p.eligible_cases_per_variant===147 && p.cases_per_variant===149 && p.outside_bound_cases_not_timed_per_variant===2 &&
    p.comparisons===441 && p.native_contracts_all_passed===true,"wrong counts or native contracts");
  assert(typeof p.compiler==="string" && p.compiler.includes("16.") && /^16\./.test(p.compiler_fullversion),"wrong compiler");
  assert(p.historical_compiler_package==="16-20260322-1ubuntu1" &&
    p.matches_historical_compiler_package===p.compiler.includes(p.historical_compiler_package),"compiler package comparison mismatch");
  assert(p.backend===expected.backend && p.expected_capabilities===caps && typeof p.cpuinfo==="string","wrong selected backend");
  if(arm) {
    assert(Number.isSafeInteger(p.hwcap) && (p.hwcap & 2)!==0 && /aarch64|arm/i.test(p.machine),"wrong ARM host");
    const old=p.historical_assembly;
    assert(old?.artifact_id===12140157714 && old.artifact_digest==="sha256:05f832c9076972fdb8ccaedd469760ddbdf58620a51d036abde103659b4a2cb7" &&
      old.producer_run===39136165574 && old.producer_head==="0e49ebb7b5f8c65c7f02d55f0fc0f284b77e4557" &&
      old.production_source===expected.source && old.timed_records===0,"wrong saved assembly source");
    assert(old.assembly?.file_sha256==="43da8bc381eab9d4fa6d9c4b872c29e6fa59fbc33bb4698122743e701982dd68" &&
      old.assembly.symbols.filter(s=>s.symbol.startsWith("neon_rfind_latin1")).length>=2,"missing saved baseline/candidate callbacks");
    assert(p.current_long_assembly?.file_sha256===p.builds?.long_assembly?.log_sha256 &&
      p.current_long_assembly.symbols.filter(s=>s.symbol.startsWith("neon_rfind_latin1")).length>=2,"missing new callback assembly");
  } else {
    assert(p.hwcap===null && /x86_64|amd64/i.test(p.machine) && p.physical_cpu?.v3===1 &&
      (expected.backend!=="avx512" || p.physical_cpu.skylake===1),"unsupported x86 ISA");
    hashes(p.cpu_probe_sha256,"missing baseline ISA probe hashes");
    const probe=p.builds?.cpu_probe;
    assert(hash(probe?.log_sha256) && probe.command.includes("-march=x86-64") &&
      !probe.command.includes("-march=x86-64-v3"),"unsafe baseline CPU probe");
  }
  assert(p.timing_scope.includes("no JVM") && p.timing_scope.includes("original-Java") &&
    p.input_scope_labels.includes("not proof a helper executed"),"missing component-only/label scope");
  const flags=["gcc-16","-std=c11","-O3",arm?"-march=armv8.2-a":"-march=x86-64-v3","-DSZ_USE_SVE=0","-fno-lto","-fno-omit-frame-pointer",
    "-Wall","-Wextra","-Wno-unknown-pragmas"];
  assert(Array.isArray(p.flags) && eq(p.flags.slice(0,flags.length),flags) && p.flags.length===18 &&
    p.flags.slice(flags.length).every(x=>typeof x==="string"&&x.startsWith("-I/")),"wrong compiler flags");
  hashes(p.binaries_sha256,"absent binary hashes"); hashes(p.generated_sources_sha256,"absent generated sources");
  hashes(p.raw_timings_sha256,"absent raw log hashes");
  assert(Object.keys(p.binaries_sha256).length===18 && Object.keys(p.generated_sources_sha256).length===16 &&
    eq(Object.keys(p.raw_timings_sha256),variants),"wrong binary/source/raw-log inventory");
  assert(obj(p.native_contracts) && eq(Object.keys(p.native_contracts),controls) && obj(p.builds),"missing contracts/builds");
  for (const control of controls) {
    const pins=expected.input_blobs[control];
    assert(p.generated_sources_sha256[control+"/StringZillaKernels.c"]===pins.kernel_sha256 &&
      p.generated_sources_sha256[control+"/native-tests.c"]===pins.tests_sha256,"wrong copied source/test");
    const contract=p.native_contracts[control];
    assert(hash(contract.log_sha256) && contract.log===control+"/contract.log" && contract.command.length===1 &&
      contract.command[0].endsWith("/"+control+"/native-contract"),"invalid native contract receipt");
    for(const suffix of ["_sanitized","_contract"]) {
      const b=p.builds[control+suffix];
      assert(hash(b?.log_sha256) && b.command.includes("-fsanitize=address,undefined,alignment") &&
        b.command.includes("-fno-sanitize-recover=all"),"contract/object sanitizer missing");
    }
  }
  const eligible = new Map(Object.values(expected.cases).filter(x=>{
    const factor=x.u?2:1; return x.h*factor<=65536 && (x.op===3 || x.h*x.n*factor*factor<=4194304);
  }).map(x=>[x.id,x]));
  assert(Object.keys(expected.cases).length===149 && eligible.size===147,"bad collector fixture model");
  const seen=new Set(), counts=Object.fromEntries(variants.map(x=>[x,0]));
  for(const v of variants) {
    const host=p.hosts?.[v], execution=p.builds[v+"_execution"], correctness=p.builds[v+"_correctness"];
    assert(host?.available===true && host.vector_bytes===vectorBytes && host.backend===expected.backend && host.capabilities===caps && host.endianness==="little" && host.check_only===false &&
      host.timing_evidence==="component-only" && Number.isInteger(host.cpu),"invalid actual host");
    assert(host.cpu===p.hosts.long.cpu && host.compiler===p.hosts.long.compiler,"host/compiler changed between variants");
    assert(hash(execution?.log_sha256) && execution.log===v+"-timings.jsonl" && execution.command.length===2 && execution.command[1]===expected.backend &&
      execution.command[0].endsWith("/"+v+"-screen"),"invalid unsanitized timing receipt");
    assert(hash(correctness?.log_sha256) && correctness.command.length===3 && correctness.command[1]===expected.backend && correctness.command[2]==="--check-only" &&
      correctness.command[0].endsWith("/"+v+"-correctness"),"missing sanitizer fixture check");
    const link=p.builds[v+"_link"], sanitized=p.builds[v+"_sanitized_link"];
    assert(hash(link?.log_sha256) && !link.command.some(x=>x.startsWith("-fsanitize")) &&
      link.command.some(x=>x.endsWith("/baseline/kernel.o")) &&
      link.command.some(x=>x.endsWith("/"+v+"/kernel.o")),"wrong paired object linkage");
    assert(hash(sanitized?.log_sha256) && sanitized.command.includes("-fsanitize=address,undefined,alignment"),"missing sanitized fixture linkage");
  }
  for(const r of rows) {
    const c=eligible.get(r.case), key=JSON.stringify([r.variant,r.case]);
    assert(variants.includes(r.variant) && c && r.backend===expected.backend && !seen.has(key),"unexpected, outside-bound or duplicate row");
    seen.add(key); counts[r.variant]++;
    const factor=c.u?2:1;
    assert(r.operation===c.op && r.coder===(c.u?"UTF16-native-endian":"LATIN1") &&
      r.haystack_units===c.h && r.needle_units===c.n && r.haystack_bytes===c.h*factor &&
      r.needle_bytes===c.n*factor && r.source_mod64===factor && r.target_mod64===0,"fixture dimensions/alignment differ");
    assert(r.timing_evidence==="component-only" && r.samples_per_backend===15 && r.warmups_per_backend===3 &&
      Number.isSafeInteger(r.iterations_per_sample) && r.iterations_per_sample>=128 && r.iterations_per_sample<=4194304,"wrong sampling protocol");
    assert(obj(r.raw_batch_ns) && eq(Object.keys(r.raw_batch_ns),["baseline","candidate"]),"wrong raw sample controls");
    const computed={};
    for(const control of ["baseline","candidate"]) {
      const samples=r.raw_batch_ns[control];
      assert(Array.isArray(samples)&&samples.length===15&&samples.every(x=>Number.isSafeInteger(x)&&x>0),"bad raw sample");
      const values=samples.map(x=>x/r.iterations_per_sample), mean=values.reduce((a,b)=>a+b,0)/15;
      const sem=Math.sqrt(values.reduce((a,b)=>a+(b-mean)**2,0)/14)/Math.sqrt(15);
      assert(close(mean,r.mean_ns?.[control])&&close(sem,r.sem_ns?.[control]),"mean/SEM differs from raw samples");
      computed[control]=mean;
    }
    assert(close(r.baseline_over_candidate,computed.baseline/computed.candidate) &&
      r.higher_candidate_mean===(r.mean_ns.candidate>r.mean_ns.baseline),"ratio/higher-mean mismatch");
    const long=["long","combined"].includes(r.variant)&&c.op===0&&r.haystack_bytes>r.needle_bytes&&r.needle_bytes>256 &&
      (arm || (c.u===1 && (expected.backend==="serial" ||
        (expected.backend==="avx2"&&r.haystack_bytes-r.needle_bytes>=64) ||
        (expected.backend==="avx512"&&r.haystack_bytes-r.needle_bytes>2))));
    const short=arm&&["short","combined"].includes(r.variant)&&c.op===0&&c.u===1&&c.h>c.n&&c.n>=3&&c.n<=32;
    assert(r.unchanged_operation_control===(c.op!==0) && r.long_unit_probe_input_scope===long &&
      r.short_adjacent_probe_input_scope===short,"incorrect input-scope labels");
  }
  assert(variants.every(v=>counts[v]===147) && seen.size===441,"incomplete variant matrix");
  return {scope:"component-only; unpromoted native candidates; not JMH or original-Java controls",job,
    provenance:p,rows,counts,higher_means:rows.filter(r=>r.higher_candidate_mean)};
}