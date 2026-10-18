function collectStringZilla(log, backend, job, manifest, source, base = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda", expectedReceipt) {
  // Receipt hashes come from the pinned Git blobs, and image hashes from the producer.
  const assert = (v, reason) => { if (!v) throw Error(backend + ": " + reason); };
  const object = v => v !== null && typeof v === "object" && !Array.isArray(v);
  const equal = (a, b) => JSON.stringify(a) === JSON.stringify(b);
  const hash = /^[0-9a-f]{64}$/;
  const controls = ["original", "enabled", "disabled"];
  const backendNumber = {serial: 0, avx2: 1, avx512: 2, neon: 4, msvc: 0};
  const tierFlags = {interpreter: ["-Xint"], c1: ["-XX:TieredStopAtLevel=1"], c2: ["-XX:-TieredCompilation"]};
  const paramsEqual = (a, b) => object(a) && object(b) &&
    Object.keys(a).length === Object.keys(b).length &&
    Object.entries(a).every(([key, value]) => b[key] === value);
  const checkHashes = (value, name) => {
    assert(object(value) && Object.keys(value).length > 0, "missing " + name);
    assert(Object.entries(value).every(([key, digest]) => key.length > 0 && typeof digest === "string" && hash.test(digest)),
      "invalid " + name);
  };
  assert(Object.hasOwn(backendNumber, backend), "unknown backend");
  assert(job && job.conclusion === "success", "job did not succeed");
  assert(object(expectedReceipt), "missing expected receipt");
  for (const name of ["manifest_sha256", "runner_sha256"]) {
    assert(typeof expectedReceipt[name] === "string" && hash.test(expectedReceipt[name]), "invalid expected " + name);
  }
  assert(/^[0-9a-f]{40}$/.test(source) && /^[0-9a-f]{40}$/.test(base), "invalid source revision");

  const rows = manifest.trim().split(/\r?\n/).map(line => line.split("\t"));
  const columns = rows.shift();
  assert(equal(columns, ["id", "benchmark", "length", "coder", "position", "needleLength", "shape", "backends", "tiers"]),
    "invalid manifest header");
  assert(rows.length > 0 && rows.every(row => row.length === columns.length), "invalid manifest rows");
  const cases = rows.map(row => Object.fromEntries(columns.map((key, i) => [key, row[i]])));
  const manifestIds = new Set();
  const physicalInputs = new Set();
  const expected = new Map();
  const manifestBackend = backend === "avx512" ? "avx2" : backend;
  const rowParams = row => row.shape !== "-" ?
    {length: row.length, needleLength: row.needleLength, shape: row.shape} :
    {length: row.length, needleLength: row.needleLength, coder: row.coder, position: row.position};
  const keyFor = (tier, id) => JSON.stringify([tier, id]);
  for (const row of cases) {
    assert(row.id.length > 0 && !manifestIds.has(row.id), "duplicate or empty manifest input");
    manifestIds.add(row.id);
    assert(/^StringZilla(?:Search|LongNeedle|TailSearch|UTF16Probe)\.[A-Za-z]+$/.test(row.benchmark), "invalid manifest benchmark");
    assert(/^\d+$/.test(row.length) && /^\d+$/.test(row.needleLength), "invalid manifest sizes");
    const backends = row.backends.split(","), tiers = row.tiers.split(",");
    assert(new Set(backends).size === backends.length &&
      backends.every(name => ["serial", "avx2", "neon", "msvc"].includes(name)), "invalid manifest backend list");
    assert(new Set(tiers).size === tiers.length && tiers.every(tier => Object.hasOwn(tierFlags, tier)), "invalid manifest tier list");
    for (const manifestControl of backends) for (const tier of tiers) {
      const physical = JSON.stringify([manifestControl, tier, row.benchmark, rowParams(row)]);
      assert(!physicalInputs.has(physical), "duplicate physical input: " + row.id);
      physicalInputs.add(physical);
      if (manifestControl === manifestBackend) expected.set(keyFor(tier, row.id), {row, tier, controls: {}});
    }
  }
  assert(expected.size > 0, "no applicable manifest inputs");

  const kinds = {};
  for (const line of log.split(/\r?\n/)) {
    const match = line.match(/STRINGZILLA_(PROVENANCE|RESULT|SUMMARY|COMPLETE|COMPILATION|MSVC_BASELINE) (\{.*\})$/);
    if (match) (kinds[match[1]] ??= []).push(JSON.parse(match[2]));
  }
  assert(kinds.PROVENANCE?.length === 1 && kinds.COMPLETE?.length === 1, "missing unique provenance/completion");
  const p = kinds.PROVENANCE[0], done = kinds.COMPLETE[0];
  assert(paramsEqual(p.sources, {original: base, fork: source}) && paramsEqual(done.sources, p.sources), "wrong source revisions");
  assert(done.images_unchanged === true && done.all_means_retained === true, "images changed or incomplete data");
  assert(paramsEqual(p.control_images, {original: "original", enabled: "fork", disabled: "fork"}), "wrong control images");
  assert(object(p.image_hashes), "missing complete-image hashes");
  for (const name of ["original", "fork"]) {
    assert(object(p.image_hashes[name]) && hash.test(p.image_hashes[name].tree_sha256) &&
      typeof p.image_hashes[name].root === "string" && p.image_hashes[name].root.length > 0, "invalid complete-image identity");
  }
  assert(p.image_hashes.original.tree_sha256 !== p.image_hashes.fork.tree_sha256, "original equals fork image");
  for (const name of ["manifest_sha256", "runner_sha256"]) {
    assert(p[name] === expectedReceipt[name], name + " differs from pinned receipt");
  }
  if (expectedReceipt.producer_image_hashes !== undefined) {
    assert(object(expectedReceipt.producer_image_hashes), "invalid expected producer images");
    for (const name of ["original", "fork"]) {
      const value = expectedReceipt.producer_image_hashes[name];
      const digest = typeof value === "string" ? value : value?.tree_sha256;
      assert(typeof digest === "string" && hash.test(digest), "invalid expected producer " + name + " image");
      assert(p.image_hashes[name].tree_sha256 === digest, "restored " + name + " image differs from producer");
    }
  }
  checkHashes(p.harness_sha256, "harness fingerprints");
  checkHashes(p.probe_sha256, "backend probe fingerprints");
  const requiredHarness = [
    "classes/org/openjdk/bench/java/lang/StringZillaSearch.class",
    "classes/org/openjdk/bench/java/lang/StringZillaLongNeedle.class",
    "classes/META-INF/BenchmarkList",
    "jmh-core-1.37.jar", "jmh-generator-annprocess-1.37.jar",
    "jopt-simple-5.0.4.jar", "commons-math3-3.6.1.jar"
  ];
  if (cases.some(row => row.benchmark.startsWith("StringZillaTailSearch."))) {
    requiredHarness.push("classes/org/openjdk/bench/java/lang/StringZillaTailSearch.class");
  }
  assert(cases.every(row => row.benchmark === "StringZillaUTF16Probe.lastIndexOf"), "wrong UTF16 probe fixture");
  requiredHarness.push("classes/org/openjdk/bench/java/lang/StringZillaUTF16Probe.class",
    "classes/org/openjdk/bench/java/lang/jmh_generated/StringZillaUTF16Probe_lastIndexOf_jmhTest.class");
  const extraSources = p.extra_benchmark_sources;
  assert(object(extraSources) && Object.keys(extraSources).length === 1, "missing or extra external fixture sources");
  const [[extraPath, extraHash]] = Object.entries(extraSources);
  assert(typeof extraPath === "string" && extraPath.endsWith("/.github/scripts/StringZillaUTF16Probe.java") &&
    hash.test(extraHash) && hash.test(expectedReceipt.extra_benchmark_source_sha256) &&
    extraHash === expectedReceipt.extra_benchmark_source_sha256, "wrong external UTF16 probe fixture source");
  assert(requiredHarness.every(name => Object.hasOwn(p.harness_sha256, name)), "incomplete harness fingerprints");
  assert(["BackendProbe.java", "BackendProbe.class"].every(name => Object.hasOwn(p.probe_sha256, name)), "incomplete backend probe fingerprints");
  assert(p.spec?.DEBUG_LEVEL === "release", "wrong build mode");
  const compilerVersion = backend === "msvc" ? /^19\.44\./ : /^16\./;
  assert(compilerVersion.test(p.spec.CXX_VERSION_NUMBER) && compilerVersion.test(p.spec.CC_VERSION_NUMBER), "unexpected compiler");
  assert(p.spec.TOOLCHAIN_TYPE === (backend === "msvc" ? "microsoft" : "gcc"), "wrong compiler type");
  assert(p.method?.forks === 2 && p.method.warmup === "3 x 500ms" &&
    p.method.measurement === "5 x 500ms" && p.method.gc === "Serial" && p.method.cds === "off", "wrong JMH method");
  const backendFlags = backend === "neon" ? [] :
    ["-XX:UseAVX=" + ({serial: 0, avx2: 2, avx512: 3, msvc: 2}[backend])];
  const baseFlags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", ...backendFlags];
  const flagsFor = (tier, control) => [
    ...baseFlags, ...tierFlags[tier],
    ...(control === "original" ? [] : ["-XX:" + (control === "enabled" ? "+" : "-") + "UseStringZillaIntrinsics"])
  ];
  assert(equal(p.backend_controls, [[backend, backendFlags]]), "wrong backend control");
  for (const control of ["enabled", "disabled"]) {
    const a = p.backend_attestation?.[control];
    const probeArgs = [...baseFlags, "-XX:" + (control === "enabled" ? "+" : "-") + "UseStringZillaIntrinsics"];
    assert(a?.backend === backendNumber[backend] && a.enabled === (control === "enabled") &&
      equal(a.jvmArgs, probeArgs), "backend/flag attestation failed");
  }

  const records = kinds.RESULT ?? [];
  assert(records.length === expected.size * 3 && done.measurements === records.length &&
    done.triplets === expected.size, "incomplete record count");
  for (const r of records) {
    const group = expected.get(keyFor(r.tier, r.case));
    assert(group && controls.includes(r.control), "unexpected measurement");
    assert(!Object.hasOwn(group.controls, r.control), "duplicate measurement");
    assert(r.backend_control === backend, "record backend mismatch");
    assert(r.source === (r.control === "original" ? base : source), "record source mismatch");
    const image = p.image_hashes[r.control === "original" ? "original" : "fork"];
    const normalize = value => backend === "msvc" ? value.replaceAll("\\", "/").toLowerCase() : value;
    assert(typeof r.java === "string" && normalize(r.java) ===
      normalize(image.root + "/bin/" + (backend === "msvc" ? "java.exe" : "java")), "wrong complete-image launcher");
    assert(equal(r.jvmArgs, flagsFor(r.tier, r.control)), "wrong JVM flags");
    assert(paramsEqual(r.params, rowParams(group.row)), "wrong input params");
    assert(r.benchmark === "org.openjdk.bench.java.lang." + group.row.benchmark, "wrong benchmark");
    assert(Number.isFinite(r.score) && r.score > 0 && Number.isFinite(r.error) && r.error >= 0, "bad metric");
    assert(Array.isArray(r.rawData) && r.rawData.length === 2 &&
      r.rawData.every(samples => Array.isArray(samples) && samples.length === 5 &&
        samples.every(value => Number.isFinite(value) && value > 0)), "bad raw samples");
    const samples = r.rawData.flat(), mean = samples.reduce((sum, value) => sum + value, 0) / 10;
    assert(Math.abs(r.score - mean) <= 1e-9 * Math.max(r.score, mean), "score differs from raw mean");
    const variance = samples.reduce((sum, value) => sum + (value - mean) ** 2, 0) / 9;
    const error = 4.78091258593355 * Math.sqrt(variance / 10);
    assert(Math.abs(r.error - error) <= 1e-8 * Math.max(r.error, error, 1e-12),
      "JMH error differs from 99.9% Student-t interval");
    assert(typeof r.json_sha256 === "string" && hash.test(r.json_sha256), "missing JMH result hash");
    group.controls[r.control] = r;
  }

  const summaries = kinds.SUMMARY ?? [];
  assert(summaries.length === expected.size, "incomplete summaries");
  const summaryMap = new Map();
  for (const s of summaries) {
    const key = keyFor(s.tier, s.case);
    assert(s.backend_control === backend && expected.has(key) && !summaryMap.has(key), "unexpected or duplicate summary");
    summaryMap.set(key, s);
  }
  const groups = [];
  for (const [key, group] of expected) {
    assert(Object.keys(group.controls).length === 3, "incomplete triplet");
    const en = group.controls.enabled, comparisons = {}, s = summaryMap.get(key);
    assert(s && object(s.comparisons), "missing summary");
    for (const control of ["original", "disabled"]) {
      const other = group.controls[control];
      const comparison = {speedup: other.score / en.score, slower_mean: en.score > other.score,
        intervals_overlap: Math.abs(en.score - other.score) <= en.error + other.error};
      const reported = s.comparisons[control];
      assert(reported && reported.enabled_ns === en.score && reported.control_ns === other.score &&
        reported.slower_mean === comparison.slower_mean && reported.intervals_overlap === comparison.intervals_overlap &&
        Number.isFinite(reported.speedup) && Math.abs(reported.speedup - comparison.speedup) < 1e-12, "summary mismatch");
      comparisons[control] = comparison;
    }
    groups.push({backend, tier: group.tier, case: group.row.id, controls: group.controls, comparisons});
  }

  const diagnosticCases = [
    ["mixed64", "lastIndexOf", "4096", "MIXED", "END", "64"],
    ["equals4096", "equals", "4096", "LATIN1", "EQUAL", "4"],
    ["latin255", "lastIndexOf", "255", "LATIN1", "MISS", "4"],
    ["utf16-127", "lastIndexOf", "127", "UTF16", "MISS", "4"],
    ["utf16-128", "lastIndexOf", "128", "UTF16", "MISS", "4"],
    ["utf16-511", "lastIndexOf", "511", "UTF16", "MISS", "4"],
    ["tiny-latin", "lastIndexOf", "4", "LATIN1", "MISS", "4"],
    ["tiny-utf16", "lastIndexOf", "4", "UTF16", "MISS", "4"],
    ["equals-utf16-4096", "equals", "4096", "UTF16", "EQUAL", "4"]
  ];
  const diagnosticExpected = new Map();
  for (const tier of ["c1", "c2"]) for (const control of controls) {
    const workloads = tier === "c1" ?
      [...diagnosticCases, ["utf16-128-end", "lastIndexOf", "128", "UTF16", "END", "4"]] : diagnosticCases;
    for (const [id, benchmark, length, coder, position, needleLength] of workloads) {
      const flags = [...flagsFor(tier, control), "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining"];
      if (id === "equals-utf16-4096") flags.push("-XX:+PrintIntrinsics",
        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_equals_jmhTest::equals_avgt_jmhStub",
        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.StringZillaSearch::equals");
      diagnosticExpected.set(JSON.stringify([tier, control, id]), {
        benchmark, params: {length, coder, position, needleLength}, jvmArgs: flags
      });
    }
  }
  const diagnostics = kinds.COMPILATION ?? [], diagnosticSeen = new Set();
  assert(diagnosticExpected.size === 57 && diagnostics.length === diagnosticExpected.size, "incomplete compilation diagnostics");
  for (const d of diagnostics) {
    const key = JSON.stringify([d.tier, d.control, d.case]), expected = diagnosticExpected.get(key);
    assert(expected && !diagnosticSeen.has(key), "unexpected or duplicate compilation diagnostic");
    diagnosticSeen.add(key);
    assert(d.timing_evidence === false && d.source === (d.control === "original" ? base : source), "invalid diagnostic source or timing marker");
    assert(d.benchmark === expected.benchmark && paramsEqual(d.params, expected.params) &&
      equal(d.jvmArgs, expected.jvmArgs), "diagnostic identity, params or JVM flags mismatch");
    assert(typeof d.log_sha256 === "string" && hash.test(d.log_sha256), "missing diagnostic log hash");
    assert(Array.isArray(d.selected_lines) && d.selected_lines.length <= 120 &&
      d.selected_lines.every(line => typeof line === "string") &&
      Number.isInteger(d.omitted_matching_lines) && d.omitted_matching_lines >= 0, "invalid diagnostic line extraction");
    assert(Array.isArray(d.printed_methods) && d.printed_methods.every(line => typeof line === "string") &&
      Array.isArray(d.machine_code) && d.machine_code.every(block => typeof block === "string"), "invalid diagnostic code extraction");
    assert(d.case === "equals-utf16-4096" || d.machine_code.length === 0, "unexpected diagnostic machine-code scope");
  }

  const msvc = kinds.MSVC_BASELINE ?? [];
  if (backend === "msvc") {
    assert(msvc.length === 1 && msvc[0].runtime_passed === true &&
      msvc[0].forbidden_instructions_absent === true, "MSVC baseline probe failed");
    checkHashes(msvc[0].files_sha256, "MSVC baseline fingerprints");
    const args = msvc[0].compiler_args;
    assert(Array.isArray(args) && args.every(arg => typeof arg === "string") &&
      args[0] === "cl.exe" && ["/std:c11", "/O2", "/c", "/FAs"].every(flag => args.includes(flag)) &&
      !args.some(arg => /^\/arch:/i.test(arg)), "wrong MSVC baseline compiler flags");
  } else {
    assert(msvc.length === 0, "unexpected MSVC baseline receipt");
  }
  // These traces are representative StringZillaSearch diagnostics, not proof for every timed workload.
  return {backend, job, provenance: p, complete: done, records, groups, diagnostics, msvc_baseline: msvc,
    diagnostic_scope: {class: "org.openjdk.bench.java.lang.StringZillaSearch",
      tiers: ["c1", "c2"], timing_evidence: false,
      c2_utf16_equality: diagnostics.filter(d => d.tier === "c2" && d.case === "equals-utf16-4096").map(d => ({
        control: d.control, machine_code_blocks: d.machine_code.length, printed_methods: d.printed_methods
      }))}};
}
