"""Small native fastdebug semantics/IR gate, without release images or benchmarks."""
import json
from pathlib import Path
import re

from classifier_images import record, require
from run_classifier83_preflight import verify_control_reports

SEMANTICS=['TestFloatRoundTripReduction','TestFloatRoundTripReductionEdges','TestZeroSeedFPReduction']
IR=['TestZeroSeedFPReductionIR','TestZeroSeedFPReductionStrictIR']


def verify_neon_rules(text,test):
    # A successful enabled framework run is silent on matching success. Guard
    # applicability for the essential rules, not absence of all disable notices:
    # SVE-only rules are legitimately disabled on NEON.
    required={'TestFloatRoundTripReduction':{'carried128':[1]},
              'TestFloatRoundTripReductionEdges':{'reversed':[1]},
              'TestZeroSeedFPReductionIR':{'float64':[1,2],'float128':[1,2],'double128':[1,2],
                  'carriedFloat128':[1],'carriedDouble128':[1],
                  'independentFloat128':[1],'independentDouble128':[1],
                  'strictFloat':[1],'strictDouble':[1]},
              'TestZeroSeedFPReductionStrictIR':{'strictFloat':[5,6],'strictDouble':[5,6]}}
    required_ids={rule for rules in required.get(test,{}).values() for rule in rules}
    # The framework's unsupported-node notice omits the method name. An ID
    # overlapping a required rule is ambiguous and cannot certify coverage.
    for skipped in re.findall(r'\bSkip Rule (\d+):',text):
        require(int(skipped) not in required_ids,
                'Unattributed unsupported-node Skip Rule overlaps required NEON rule: '+test+'/'+skipped)
    for method,rules in required.get(test,{}).items():
        for rule in rules:
            require(not re.search(r'Disabling IR matching for rule '+str(rule)+r' of \d+ in '+method+':',text),
                    'Required NEON matcher/IR assertion skipped: '+test+'/'+method+'/'+str(rule))



def verify_reports(work,candidate,neon=True):
    chosen=SEMANTICS+(IR if candidate else [])
    reports={p.stem:p for p in Path(work).rglob('*.jtr')}
    require(set(reports)==set(chosen),'Missing/extra focused report')
    for test,path in reports.items():
        text=path.read_text()
        require('test result: Passed.' in text,'Focused test did not pass: '+test)
        if candidate and test!='TestZeroSeedFPReduction':
            require('-DShouldDoIRVerification=true' in text and 'IR verification disabled' not in text,
                    'Candidate IR did not execute: '+test)
            require('-DVerifyIR=false' not in text and '-DShouldDoIRVerification=false' not in text,
                    'Contradictory candidate IR command: '+test)
            if neon:
                require('-XX:UseSVE=0' in text,'NEON test VM command missing: '+test)
                verify_neon_rules(text,test)
    verify_control_reports(reports)
    return {name:record(path) for name,path in reports.items()}


def run(c,control,candidate):
    out=c.out/'focused';out.mkdir()
    result=dict(passed=False,platform=c.target,scope='focused',full_suites=False,
                release_assembly=False,timings=False,historical_linux_recovery_claim=False,
                source_head=c.builds['candidate-fastdebug']['source_head'],configurations=[])
    for sve in (['0'] if c.target=='mac' else ['default','0']):
        flags=[] if sve=='default' else ['-XX:UseSVE=0']
        for role,image in [('control',control),('candidate',candidate)]:
            name='focused-'+role+'-sve'+sve
            c.run(name+'-flags',[image/'bin/java',*flags,'-XX:+PrintFlagsFinal','-version'])
            text=(c.out/(name+'-flags.log')).read_text()
            if sve=='0':
                require(re.search(r'\bUseSVE\s*:?=\s*0\b',text) and
                        re.search(r'\bMaxVectorSize\s*:?=\s*(16|32|64|128|256)\b',text),'NEON positive configuration missing')
            chosen=SEMANTICS+(IR if role=='candidate' else [])
            options=flags+(['-DVerifyIR=false'] if role=='control' else [])
            work=out/(name+'-work')
            argv=[c.boot/'bin/java','-XX:ActiveProcessorCount=2','-Xmx512m','-jar',c.jtreg/'lib/jtreg.jar',
                  '-jdk:'+str(image),'-othervm','-concurrency:1','-timeoutFactor:2','-verbose:summary',
                  '-w:'+str(work),'-r:'+str(out/(name+'-report'))]
            if options:argv+=['-javaoptions:'+' '.join(options)]
            argv+=[c.root/('test/hotspot/jtreg/compiler/vectorapi/'+test+'.java') for test in chosen]
            c.run(name,argv)
            result['configurations'].append(dict(role=role,sve=sve,reports=verify_reports(work,role=='candidate',sve=='0')))
            (out/'gate.json').write_text(json.dumps(result,indent=2)+'\n')
    c.invariant();result['passed']=True
    (out/'gate.json').write_text(json.dumps(result,indent=2)+'\n')
    return result
