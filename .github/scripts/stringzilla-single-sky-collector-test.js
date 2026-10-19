// Copyright (c) 2026, re-thc. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only
// Authentication-only fixtures; no scores, images, API or JVM execution.
function testSingleHostAuthorization(source) {
  const mark="  const phases=split(log,expected.definitions)";
  if(source.split(mark).length!==2)throw Error("Collector checkpoint changed");
  const check=Function("return ("+source.slice(0,source.indexOf(mark))+
    "return {execution,parent_job:job};\n})")();
  const clone=x=>JSON.parse(JSON.stringify(x)),h=c=>c.repeat(64),head="b".repeat(40);
  function fixture() {
    const expected={run:17,head,source:"9".repeat(40),source_tree:"a".repeat(40),base:"4".repeat(40),
      producer_run:11,producer_head:"c".repeat(40),sky_mode:"single-host-v1",
      sky_missing_tiers:["interpreter"],sky_missing_proof_sha256:h("d"),sky_manifest_sha256:h("4"),
      sky_single_module_sha256:h("e"),sky_single_driver_sha256:h("f"),
      sky_container_image:"ubuntu@sha256:"+h("1"),
      projections:{interpreter:{stock:{receipt:{runner_sha256:h("2")}}}}};
    const job={id:100,run_id:17,head_sha:head,run_attempt:1,name:"Single host missing SKY controls",
      runner_id:200,runner_name:"fixture-runner",status:"completed",conclusion:"failure",
      steps:[{name:"Measure missing SKY interpreter controls",number:10,status:"completed",conclusion:"success"},
        {name:"Retain completed SKY interpreter raw results",number:11,status:"completed",conclusion:"success"}]};
    const artifact={id:500,name:"stringzilla-final-results-avx512-interpreter-"+head+"-attempt1",
      expired:false,digest:"sha256:"+h("3"),workflow_run:{id:17,head_sha:head}};
    const producer={expected_id:300,expected_digest:"sha256:"+h("5"),
      job:{run_id:11,head_sha:expected.producer_head,run_attempt:1,conclusion:"success",
        name:"producer / avx2 validated pair",steps:["Verify and archive matched complete pair",
          "Publish complete images before tests","Run profiles, jtreg and native contract checks"]
          .map(name=>({name,conclusion:"success"}))},
      artifact:{id:300,name:"stringzilla-final-pair-avx2-"+expected.producer_head,expired:false,
        digest:"sha256:"+h("5"),workflow_run:{id:11,head_sha:expected.producer_head}},
      image_hashes:{original:h("6"),fork:h("7")}};
    const fact={schema:"stringzilla-single-host-fact-v1",mode:"single-host-v1",run_id:17,head,attempt:1,
      source:expected.source,source_tree:expected.source_tree,base:expected.base,
      module_sha256:expected.sky_single_module_sha256,job_id:100,job_name:job.name,
      runner_id:200,runner_name:job.runner_name,available:true,native_execution:true,nonce:"8".repeat(32),
      cpu:0,container_image:expected.sky_container_image,machine:"x86_64",missing:[],
      tiers:["interpreter"],timed_records:0,images_restored:false,
      fields:{flags:"avx avx2 bmi1 bmi2 f16c fma movbe popcnt sse4_1 sse4_2 ssse3 cx16 avx512f avx512bw avx512vl abm"},
      os_release_sha256:h("9"),libc_sha256:h("a"),preparation:{artifact_id:402,artifact_digest:"sha256:"+h("b")},
      inputs:{source:expected.source,source_tree:expected.source_tree,base:expected.base,
        tiers:["interpreter"],missing_proof_sha256:expected.sky_missing_proof_sha256,
        driver_sha256:expected.sky_single_driver_sha256,module_sha256:expected.sky_single_module_sha256,
        helper_sha256:h("2"),manifest_sha256:expected.sky_manifest_sha256,producer_run:11,producer_head:expected.producer_head,
        pair_artifact_id:300,pair_artifact_digest:producer.artifact.digest,python_auth_tests_passed:true,independent_scope_model_passed:true}};
    const binding={artifact_id:401,artifact_digest:"sha256:"+h("c"),proof_sha256:h("d")};
    const ready={schema:"stringzilla-single-host-ready-v1",tier:"interpreter",job_id:100,nonce:fact.nonce};
    const events=["restore","measure","periodic","utf16-probe"].map(phase=>({
      tier:"interpreter",phase,job_id:100,runner_id:200,nonce:fact.nonce,cpu:0,fact:binding}));
    const b={schema:"stringzilla-single-host-tier-v1",complete:true,tier:"interpreter",
      source:expected.source,base:expected.base,run_id:17,head,attempt:1,fact,fact_binding:binding,
      ready,authorizations:events};
    expected.single_host={binding:b,
      fact_artifact:{id:401,digest:binding.artifact_digest,name:"stringzilla-single-sky-fact-"+head,
        expired:false,workflow_run:{id:17,head_sha:head}},
      preparation_artifact:{id:402,digest:fact.preparation.artifact_digest,
        name:"stringzilla-single-sky-preparation-"+head,expired:false,workflow_run:{id:17,head_sha:head}},
      runtime:{available:true,backend:"avx512",tier:"interpreter",source:expected.source,timed_records:0,
        observations:Object.fromEntries(Object.entries({original:"3",enabled:"3:2:true",disabled:"3:2:false"})
          .map(([k,value])=>[k,{returncode:0,actual:value,expected:value}]))},
      native:{passed:true},native_log:"requested=2 selected=2 executable=1\n"};
    const att={schema:"stringzilla-single-host-attestation-v1",tier:"interpreter",fact,
      fact_binding:binding,ready};
    return {job,artifact,producer,expected,att,events};
  }
  function log(f){return ["ORIGINAL_HASH: "+f.producer.image_hashes.original,
    "FORK_HASH: "+f.producer.image_hashes.fork,"STRINGZILLA_SINGLE_HOST_ATTESTATION "+JSON.stringify(f.att),
    ...f.events.map(e=>"STRINGZILLA_SINGLE_HOST_PHASE_AUTH "+JSON.stringify(e))].join("\n");}
  function run(f){return check(log(f),"avx512","interpreter",f.job,f.artifact,f.producer,f.expected);}
  let f=fixture(), result=run(f);
  if(result.execution!==f.job.steps[0]||result.parent_job!==f.job||result.parent_job.conclusion!=="failure")
    throw Error("Real step/parent identity was not retained");
  f.job.conclusion="success";run(f);
  const changes=[
    f=>{f.job.steps[0].conclusion="failure";},f=>{f.job.steps[0].status="in_progress";},
    f=>{f.job.steps[0].name="wrong";},f=>{f.job.steps.push(clone(f.job.steps[0]));},
    f=>{f.job.steps[1].conclusion="failure";},f=>{f.job.steps[1].name="wrong";},
    f=>{f.job.id++;},f=>{f.job.head_sha="0".repeat(40);},f=>{f.job.runner_id++;},
    f=>{f.job.runner_name="other";},f=>{f.job.status="in_progress";},
    f=>{f.artifact.workflow_run.id++;},f=>{f.artifact.name="wrong";},
    f=>{f.expected.single_host.binding.complete=false;},
    f=>{f.expected.single_host.binding.tier="c1";},
    f=>{f.att.fact.nonce="bad";},f=>{f.att.fact.available=false;},
    f=>{f.att.fact.fields.flags=f.att.fact.fields.flags.replace("avx512f","");},
    f=>{f.att.fact.container_image="wrong";},f=>{f.att.fact.module_sha256=h("0");},
    f=>{f.att.fact.inputs.missing_proof_sha256=h("0");},
    f=>{f.att.fact.inputs.producer_head="0".repeat(40);},
    f=>{f.att.fact.inputs.driver_sha256=h("0");},
    f=>{f.att.fact.source_tree="0".repeat(40);},f=>{f.att.fact.timed_records=1;},
    f=>{f.att.fact.inputs.independent_scope_model_passed=false;},
    f=>{f.att.fact.inputs.manifest_sha256=h("0");},
    f=>{f.expected.single_host.fact_artifact.workflow_run.id++;},
    f=>{f.expected.single_host.preparation_artifact.expired=true;},
    f=>{f.events[1].nonce="0".repeat(32);},f=>{f.events[1].cpu=1;},
    f=>{f.events[1].phase="restore";},
    f=>{f.expected.single_host.runtime.observations.enabled.actual="2:1:true";},
    f=>{f.expected.single_host.native.passed=false;},
    f=>{f.expected.single_host.native_log="requested=2 selected=1 executable=1";}
  ];
  let rejected=0;
  for(const change of changes){
    f=fixture();change(f);
    try{run(f);}catch(e){rejected++;continue;}
    throw Error("Malformed single-host authentication accepted: "+change.toString());
  }
  return {schema:"stringzilla-single-host-collector-auth-model-v1",positive_contexts:2,
    rejected,real_api_step_identity:true,parent_failure_preserved:true,timing_evidence:false};
}
if(typeof module!=="undefined"){
  module.exports=testSingleHostAuthorization;
  if(require.main===module){
    const fs=require("fs");
    if(process.argv.length!==3)throw Error("Usage: node TEST ACTUAL_COLLECTOR");
    console.log(JSON.stringify(testSingleHostAuthorization(fs.readFileSync(process.argv[2],"utf8")),null,2));
  }
}
