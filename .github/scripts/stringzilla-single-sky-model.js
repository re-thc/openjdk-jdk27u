// Copyright (c) 2026, re-thc. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only
// Independent offline projection model; no API, JVM or benchmark execution.
function deriveAllScope(stock, periodic, negative) {
  const columns = ["id","benchmark","length","coder","position","needleLength","shape","backends","tiers"];
  const backends = ["serial","avx2","neon","msvc","avx512"], tiers = ["interpreter","c1","c2"];
  function parse(tsv) {
    const lines = tsv.trimEnd().split(/\r?\n/), names = lines.shift().split("\t");
    if (JSON.stringify(names)!==JSON.stringify(columns)) throw Error("Wrong manifest columns");
    return lines.map(line => {
      const values=line.split("\t");
      if(values.length!==columns.length)throw Error("Wrong TSV field count");
      return Object.fromEntries(columns.map((name,i)=>[name,values[i]]));
    });
  }
  const result = {normal:[],excluded_sky:[],phases:{},logical_groups:{}};
  for (const [phase,text] of [["stock",stock],["periodic",periodic],["utf16-probe",negative]]) {
    const normal=[],sky=[];
    for(const row of parse(text)) for(const backend of backends) for(const tier of tiers) {
      const alias=backend==="avx512"?"avx2":backend;
      if(!row.backends.split(",").includes(alias)||!row.tiers.split(",").includes(tier))continue;
      const values={length:row.length,needleLength:row.needleLength,
        ...(row.shape!=="-"?{shape:row.shape}:{coder:row.coder,position:row.position})};
      const sorted=Object.fromEntries(Object.keys(values).sort().map(k=>[k,values[k]]));
      const key=JSON.stringify([backend,tier,"org.openjdk.bench.java.lang."+row.benchmark,sorted]);
      if(backend==="avx512")sky.push(key);else {
        normal.push(key);
        const group=backend+"/"+tier;
        result.logical_groups[group]=(result.logical_groups[group]||0)+1;
      }
    }
    if(new Set(normal).size!==normal.length||new Set(sky).size!==sky.length)throw Error("Duplicate phase keys");
    result.phases[phase]={normal:normal.length,excluded_sky:sky.length};
    result.normal.push(...normal);result.excluded_sky.push(...sky);
  }
  result.normal.sort();result.excluded_sky.sort();
  if(result.normal.length!==1500||new Set(result.normal).size!==1500||
     result.excluded_sky.length!==386||new Set(result.excluded_sky).size!==386||
     result.normal.some(k=>result.excluded_sky.includes(k))||
     Object.keys(result.logical_groups).length!==12)throw Error("Wrong or overlapping normal-only scope");
  return result;
}

function deriveSingleSkyScope(stock, periodic, negative, proof) {
  const all=deriveAllScope(stock,periodic,negative),tiers=proof.missing_tiers;
  if(!Array.isArray(tiers)||!tiers.length||new Set(tiers).size!==tiers.length||
     JSON.stringify(tiers)!==JSON.stringify(["interpreter","c1","c2"].filter(t=>tiers.includes(t))))
    throw Error("Invalid explicit missing tuple");
  const keys=all.excluded_sky.filter(k=>tiers.includes(JSON.parse(k)[1]));
  const expected={interpreter:136,c1:126,c2:124};
  if(keys.length!==tiers.reduce((n,t)=>n+expected[t],0)||new Set(keys).size!==keys.length||
     keys.some(k=>all.normal.includes(k))||proof.triplets!==keys.length||proof.records!==keys.length*3)
    throw Error("Invalid missing-only scope");
  const phases={stock:0,periodic:0,"utf16-probe":0};
  for(const key of keys)phases[key.includes("StringZillaPeriodicSearch.")?"periodic":"stock"]++;
  if(phases.periodic!==tiers.length*2||JSON.stringify(phases)!==JSON.stringify(proof.phase_counts))
    throw Error("Invalid per-phase scope");
  return {physical_keys:keys,triplets:keys.length,records:keys.length*3,phases,
          excluded_normal:all.normal.length,excluded_sky:386-keys.length,tiers};
}
if(typeof module!=="undefined"){
  module.exports=deriveSingleSkyScope;
  if(require.main===module){
    const fs=require("fs"),crypto=require("crypto");
    if(process.argv.length!==6)throw Error("Usage: node MODEL STOCK_TSV ABC_TSV NEGATIVE_TSV MISSING_PROOF");
    const inputs=process.argv.slice(2,5).map(p=>fs.readFileSync(p,"utf8")),
      proof=JSON.parse(fs.readFileSync(process.argv[5],"utf8"));
    const result=deriveSingleSkyScope(...inputs,proof);
    const hash=crypto.createHash("sha256").update(JSON.stringify(result.physical_keys)+"\n").digest("hex");
    if(hash!==proof.scope_sha256)throw Error("Actual missing proof scope mismatch");
    let rejected=0;
    for(const change of [{missing_tiers:[]},{missing_tiers:["c1","interpreter"]},
      {missing_tiers:["interpreter","interpreter"]},{triplets:proof.triplets+1},
      {records:1},{phase_counts:{stock:0,periodic:0,"utf16-probe":0}}]){
      try{deriveSingleSkyScope(...inputs,{...proof,...change});}catch(e){rejected++;continue;}
      throw Error("Malformed model accepted");
    }
    console.log(JSON.stringify({schema:"stringzilla-single-sky-independent-model-v1",
      triplets:result.triplets,records:result.records,phases:result.phases,tiers:result.tiers,
      excluded_normal:result.excluded_normal,excluded_sky:result.excluded_sky,
      scope_sha256:hash,negative_cases_rejected:rejected},null,2));
  }
}
