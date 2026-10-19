// Copyright (c) 2026, re-thc. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only
// Independent offline projection model; no API, JVM or benchmark execution.
function deriveNormalScope(stock, periodic, negative) {
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
if(typeof module!=="undefined") {
  module.exports=deriveNormalScope;
  if(require.main===module) {
    const fs=require("fs"),crypto=require("crypto");
    if(process.argv.length!==6)throw Error("Usage: node MODEL STOCK_TSV ABC_TSV NEGATIVE_TSV SCOPE_JSON");
    const result=deriveNormalScope(...process.argv.slice(2,5).map(p=>fs.readFileSync(p,"utf8")));
    const expected=JSON.parse(fs.readFileSync(process.argv[5],"utf8"));
    if(JSON.stringify(result.normal)!==JSON.stringify(expected.physical_keys)||
       JSON.stringify(result.excluded_sky)!==JSON.stringify(expected.excluded_sky_physical_keys))throw Error("Scope receipt mismatch");
    console.log(JSON.stringify({triplets:result.normal.length,records:result.normal.length*3,
      excluded_sky:result.excluded_sky.length,groups:result.logical_groups,phases:result.phases,
      physical_key_sha256:crypto.createHash("sha256").update(JSON.stringify(result.normal)).digest("hex")},null,2));
  }
}
