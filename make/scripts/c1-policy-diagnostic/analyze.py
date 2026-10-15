#!/usr/bin/env python3
import argparse,hashlib,json,math,re,statistics,xml.etree.ElementTree as ET
from collections import Counter
from pathlib import Path
from stats import contrast,calibration,allocation

parser=argparse.ArgumentParser(description='Offline analysis; never starts a JVM')
parser.add_argument('output',type=Path)
R=parser.parse_args().output
PLAN=json.loads((R/'frozen-plan.json').read_text())
assert hashlib.sha256((R/'frozen-plan.json').read_bytes()).hexdigest()=='61c3b051bae7ad9bbdd52a7ae6a70635ee2fe04e178b1d159d237f163a84ace5'
completion=json.loads((R/'completion.json').read_text())
schedule=json.loads((R/'fixed-schedule.json').read_text())
groups={};forks=[];missing=[]
for spec in schedule:
    p=R/'timing'/(spec['tag']+'.json')
    if not p.exists() or not p.stat().st_size:
        missing.append(spec['tag']);continue
    data=json.loads(p.read_text());assert len(data)==1
    row=data[0];metric=row['primaryMetric'];alloc=row['secondaryMetrics']['gc.alloc.rate.norm']
    assert metric['scoreUnit']=='ns/op' and alloc['scoreUnit']=='B/op'
    assert len(metric['rawData'])==len(alloc['rawData'])==1
    assert len(metric['rawData'][0])==len(alloc['rawData'][0])==(3 if spec['historical'] else 5)
    assert math.isclose(statistics.mean(metric['rawData'][0]),metric['score'],rel_tol=1e-12)
    log=(R/'timing'/(spec['tag']+'.log')).read_text()
    mode=re.findall(r'^# Blackhole mode: (.+)$',log,re.M);assert len(mode)==1
    f={'tag':spec['tag'],'case':spec['case'],'arm':spec['arm'],'round':spec['round'],
       'ns_op':metric['score'],'B_op':alloc['score'],'measurement_ns_op':metric['rawData'][0],
       'measurement_B_op':alloc['rawData'][0],'blackhole_mode':mode[0],'jvmArgs':row['jvmArgs'],
       'gc_count':row['secondaryMetrics'].get('gc.count'),'gc_time':row['secondaryMetrics'].get('gc.time'),
       'json_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),
       'log_sha256':hashlib.sha256((R/'timing'/(spec['tag']+'.log')).read_bytes()).hexdigest()}
    cell=groups.setdefault(spec['case'],{}).setdefault(spec['round'],{})
    assert spec['arm'] not in cell;cell[spec['arm']]=f;forks.append(f)

def values(case,arm,metric='ns_op'):
    return [groups[case][r][arm][metric] for r in sorted(groups[case]) if arm in groups[case][r]]

primary=[]
for endpoint in PLAN['primary_endpoints']:
    case=endpoint['case'];num,den=endpoint['ratio'].split('/')
    expected=8 if case in ['long-c1-optout-ordinary','historical-c1-optout-ordinary'] else 6
    a=values(case,num) if case in groups else []
    b=values(case,den) if case in groups else []
    if len(a)!=expected or len(b)!=expected:
        primary.append(dict(endpoint,status='NOT EXECUTED OR INCOMPLETE',pass_gate=False));continue
    result=contrast(a,b);result.update(endpoint)
    result['primary_upper_pass']=result['familywise_95_upper_percent']<endpoint['upper_percent_below']
    result['regression_guards_pass']=not any(result[k] for k in ['established_loss_veto','consistent_positive_loss_hold','sign_loss_veto'])
    result['pass_gate']=result['primary_upper_pass'] and result['regression_guards_pass']
    result['status']='PASS' if result['pass_gate'] else 'HOLD'
    primary.append(result)

calibrations={}
for case in ['long-c1-optout-ordinary','historical-c1-optout-ordinary']:
    if case in groups and len(values(case,'current'))==len(values(case,'calibration'))==8:
        calibrations[case]=calibration(values(case,'current'),values(case,'calibration'))
    else:calibrations[case]={'status':'NOT EXECUTED OR INCOMPLETE','pass':False}
allocation_results=[];blackholes={}
for case,rounds in groups.items():
    for den in ['current','before']:
        a=values(case,'repair','B_op');b=values(case,den,'B_op')
        if len(a)==len(b) and len(a)>1:
            item=allocation(a,b);item.update({'case':case,'ratio':'repair/'+den});allocation_results.append(item)
    modes=sorted({f['blackhole_mode'] for arms in rounds.values() for f in arms.values()})
    blackholes[case]={'modes':modes,'matched':len(modes)==1}

diagnostics=[]
for d in sorted((R/'diagnostics').iterdir()):
    if not d.is_dir():continue
    log=(d/'output.log').read_text();matches=re.findall(r'DIAG_ROOT_INSTALLED input=(\S+) level=(\d)',log)
    if len(matches)!=1 or 'DIAG_PASS' not in log:
        diagnostics.append({'case':d.name,'pass':False,'reason':'missing explicit root proof'});continue
    tree=ET.parse(d/'compilation.xml');tasks=list(tree.iter('task'))
    input,level=matches[0];target=PLAN['inputs'][input]['benchmark'];holder,name=target.rsplit('.',1)
    method_name=holder+' '+name+' (Lorg/openjdk/jmh/infra/Blackhole;)V'
    targets=[t for t in tasks if t.get('method')==method_name]
    assert targets,(d,method_name)
    task=targets[-1]
    installed=[dict(e.attrib) for e in tree.iter('nmethod') if e.get('compile_id')==task.get('compile_id')]
    assert len(installed)==1 and installed[0].get('level','4')==level,(d,installed)
    klass={e.get('id'):e.get('name') for e in task.iter('klass')}
    methods={e.get('id'):klass.get(e.get('holder'),'')+'::'+e.get('name','') for e in task.iter('method')}
    events=[]
    for parent in task.iter():
        last=None
        for child in parent:
            if child.tag=='call':last=child.attrib
            elif child.tag in ['inline_fail','inline_success'] and last:
                method=methods.get(last.get('method'),'')
                if method in ['java.math.BigDecimal::valueOf','jdk.internal.math.FormattedFPDecimal::valueForDoubleToString']:
                    events.append({'method':method,'decision':child.tag,'reason':child.get('reason'),'call':dict(last)})
    big=[e for e in events if e['method']=='java.math.BigDecimal::valueOf']
    assert big,(d,events)
    # Root's first BigDecimal.valueOf call is its exact double overload.
    event=big[0];optout='-optout-' in d.name;repair=d.name.endswith('-repair');before=d.name.endswith('-before')
    expected_inline=level=='4' or not optout or not (repair or before)
    expected_reason='force inline by annotation' if expected_inline else 'callee is too large'
    passed=event['decision']==('inline_success' if expected_inline else 'inline_fail') and event['reason']==expected_reason
    diagnostics.append({'case':d.name,'input':input,'root_level':int(level),'root_nmethod':installed[0],
                        'events':events,'expected_double_factory_reason':expected_reason,'pass':passed})

executed_complete=(len(forks)==196 and not missing and completion.get('all_executed_exit_zero'))
diag_complete=len(diagnostics)==15 and all(d['pass'] for d in diagnostics)
accepted=(executed_complete and diag_complete and all(v['pass_gate'] for v in primary)
          and all(v['pass'] for v in calibrations.values()) and len(allocation_results)==16
          and all(v['pass'] for v in allocation_results) and all(v['matched'] for v in blackholes.values()))
result={'status':'ACCEPT MATCHED REBUILD DIAGNOSTIC ONLY; NO PROMOTION' if accepted else 'HOLD: not qualified',
        'local_screen_accept':bool(accepted),'plan_sha256':hashlib.sha256((R/'frozen-plan.json').read_bytes()).hexdigest(),
        'completion':completion,'executed_forks':len(forks),'fixed_maximum_forks':196,'missing_fixed_forks':missing,
        'primary_endpoints':primary,'calibrations':calibrations,'allocation_gates':allocation_results,
        'compile_evidence':diagnostics,'compile_evidence_complete':diag_complete,'blackhole_consistency':blackholes,
        'all_forks':forks,'experiment':'matched-native-rebuild-v1','limits':['Fresh matched Linuxx64 rebuild experiment; distinct from the historical local images.','Control and repair use identical Java/JNI files, fresh HotSpot builds, source manifests and unchanged tool inputs.']+PLAN['limits'][2:],'all_observations_retained':True,
        'previous_original_C1_regression':'Historical+2.394%,95%[1.367,3.431] remains separate; no old/new pooling.'}
(R/'results.json').write_text(json.dumps(result,indent=2)+'\n')
print(result['status'],'EXECUTED',len(forks),'OF196')
for row in primary:
    if 'geometric_percent' in row:
        print(row['case'],row['ratio'],'point%',round(row['geometric_percent'],4),'nominal95',[round(v,4) for v in row['nominal_paired_95_percent']],
              'familyUpper%',round(row['familywise_95_upper_percent'],4),'slower',str(row['slower_pairs'])+'/'+str(row['n']),'PASS',row['pass_gate'])
    else:print(row['case'],row['ratio'],row['status'])
for case,row in calibrations.items():print('CALIBRATION',case,row)
print('ALLOCATION_ALL_PASS',all(v['pass'] for v in allocation_results),'GATES_EXECUTED',len(allocation_results))
print('COMPILER_PROBES_PASS',diag_complete,'EXECUTED',len(diagnostics))
