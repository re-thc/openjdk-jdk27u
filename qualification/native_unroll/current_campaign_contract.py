"""Immutable current-PR experiment contract; pure helpers execute no workloads."""
import itertools
import json
import math
from pathlib import Path
import statistics

from classifier_images import canonical,git,record,require
from run_release_causal import interval,HEADER

REFS={'master':'416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda',
      'candidate':'6b99b2d237904f78fa1b6933c56b2202d8323d83'}
HISTORICAL_REFS={'base87':'87edd79d3104ff502f7befec034716b081436f49',
                 'b3':'b3ce67e362c3b1678fcf3d18ee714182b2395c86'}
KERNELS=['conversion','rawBits','directBits','arithmetic']
CONTROL_CELLS=[('four','conversion'),('eight','conversion'),('legacy','rawBits'),
               ('four','rawBits'),('legacy','directBits'),('legacy','arithmetic')]
STAGES=['prepare','legacy-assembly','legacy','controls-assembly','controls']

def stage_caps(platform):
    return dict(prepare=9000,**{'legacy-assembly':600 if platform=='mac' else 1200,
        'legacy':900 if platform=='mac' else 1800,'controls-assembly':900 if platform=='mac' else 1800,
        'controls':2700 if platform=='mac' else 5400})

def comparisons(platform):
    result=[]
    for sve in (['0'] if platform=='mac' else ['default','0']):
        for header,kernel in [('legacy','conversion'),*CONTROL_CELLS]:
            result.append(dict(subject='candidate',reference='master',condition=[header,sve,'default',kernel],
                stage='legacy' if (header,kernel)==('legacy','conversion') else 'controls'))
    return result

def observed(platform,stage=None):
    require(stage in [None,'legacy-assembly','controls-assembly'],'Wrong diagnostic stage')
    specs=[s for s in comparisons(platform) if stage is None or s['stage']==stage.removesuffix('-assembly')]
    result=[(s['condition'],r) for s,r in itertools.product(specs,REFS)]
    if stage in [None,'legacy-assembly']:
        result += [(['legacy',s,'1','conversion'],r)
            for s,r in itertools.product(['0'] if platform=='mac' else ['default','0'],REFS)]
    return result

def verify_plan(plan):
    require(plan['schema']==2 and plan['experiment']=='pr14-current-decision-v2','Wrong current experiment')
    require(plan['refs']==REFS and plan['platform'] in ['mac','linux'],'Changed source/OS scope')
    require(plan['comparisons']==comparisons(plan['platform']),'Changed comparison matrix')
    require(plan['observed']==[[c,r] for c,r in observed(plan['platform'])],'Changed diagnostic matrix')
    require(plan['pairs']==12 and plan['windows']==5 and plan['calls']==100000,'Changed fixed workloads')
    require(plan['limits']==dict(ratio=1.02,allocation=0.01,bootstrap=20000),'Changed acceptance criteria')
    require(plan['stage_caps']==stage_caps(plan['platform']),'Changed stage budgets')
    require(plan['stages']==STAGES,'Changed stage order')
    require(plan['counts']==counts(plan['platform']),'Changed execution counts')
    require(plan['automatic_retry'] is False and plan['qualified'] is False,'Changed execution policy')
    require(plan['builds']=='two full release images, no module overlays','Changed image construction')
    require(plan['history']==dict(primer_kernel_calls=61001,zero_call_metadata_windows=1000,warmup_calls=10000,calibration_calls=1000),
        'Changed common process history')
    require((plan['affinity'] is None) if plan['platform']=='mac' else
        (isinstance(plan['affinity'],list) and bool(plan['affinity']) and
         plan['affinity']==sorted(set(plan['affinity'])) and all(type(n) is int and n>=0 for n in plan['affinity'])),
        'Invalid CPU affinity')
    require(plan['sha256']==canonical({k:v for k,v in plan.items() if k!='sha256'}),'Changed plan digest')
    return plan

def counts(platform):
    specs=comparisons(platform)
    return dict(comparisons=len(specs),timed_JVMs=len(specs)*24,observed_JVMs=len(observed(platform)),
        legacy_JVMs=sum(s['stage']=='legacy' for s in specs)*24,
        controls_JVMs=sum(s['stage']=='controls' for s in specs)*24,
        legacy_observed_JVMs=len(observed(platform,'legacy-assembly')),
        controls_observed_JVMs=len(observed(platform,'controls-assembly')))

def correctness(path,platform):
    value=json.loads(Path(path).read_text())
    source=value.get('source',value.get('source_head'))
    require(value.get('passed') is True and source==REFS['candidate'], 'Wrong correctness source/status')
    require(all(value[k]==source for k in ['source','source_head'] if k in value),'Conflicting correctness identities')
    require(value.get('scope')=='current-native-fastdebug-codegen' and value.get('UseSVE')==0,
            'Wrong correctness receipt scope')
    if platform=='linux':
        require(value.get('platform')=='linux' and value.get('sve_modes')==['default','0'],
                'Linux needs its own native default-SVE/NEON correctness receipt')
    if value.get('kind')=='user-reported-native-current-codegen-result':
        require(platform=='mac' and value.get('source_clean') is True and
            value.get('user_checked_raw_markers') is True and value.get('full_native_fastdebug_image') is True,
            'Incomplete or foreign user-attested correctness receipt')
    return dict(file=str(Path(path).resolve()),record=record(path),value=value)

def validate_windows(windows,kernel,diagnostic):
    require([r['phase'] for r in windows]==['measure'+str(i) for i in range(5)],'Fixed windows mismatch')
    for r in windows:
        require(r['kernel']==kernel and int(r['count'])==0 and
            int(r['calls'])==(1000 if diagnostic else 100000),'Fixed workload mismatch')
        require(int(r['nanoseconds'])>0 and int(r['allocated_bytes'])>=0,'Invalid time/allocation counter')
        int(r['checksum'])
        if diagnostic:
            require(int(r['normal_before'])==4 and int(r['normal_after'])==4,'Ordinary C2 absent')
        else:
            require(int(r['compilation_ms'])==0 and
                all(int(r[k])==-1 for k in ['normal_before','normal_after','osr_installed_before','osr_installed_after']),
                'Compilation or observation in timed window')
    require(len({r['checksum'] for r in windows})==1,'Window checksums differ')

def gate(paired,specs):
    summaries=[]
    require(len(paired)==len(specs)*12,'Incomplete paired process cohort')
    for spec in specs:
        group=[r for r in paired if r['comparison']==spec]
        require(sorted(r['pair'] for r in group)==list(range(12)),'Missing/duplicate pair')
        for row in group:
            expected=[spec['reference'],'candidate'] if row['pair']%2==0 else ['candidate',spec['reference']]
            require(row['order']==expected,'Unbalanced process order')
            require(set(row['results'])=={'candidate',spec['reference']},'Unexpected pair roles')
            require(row['results']['candidate']['checksum']==row['results'][spec['reference']]['checksum'],
                'Paired checksum differs')
            for result in row['results'].values():
                require(math.isfinite(result['ns_per_op']) and result['ns_per_op']>0 and
                    math.isfinite(result['B_per_op']) and result['B_per_op']>=0,'Invalid process counters')
        logs=[math.log(r['results']['candidate']['ns_per_op']/r['results'][spec['reference']]['ns_per_op']) for r in group]
        ci=interval(logs);allocation=max(r['results']['candidate']['B_per_op'] for r in group)
        passed=ci[1]<=1.02 and allocation<=.01
        verdict='pass' if passed else 'allocation_failure' if allocation>.01 else 'regression' if ci[0]>1.02 else 'inconclusive'
        summaries.append(dict(comparison=spec,pairs=12,ratio=math.exp(statistics.mean(logs)),
            paired_95_ratio=ci,maximum_B_per_call=allocation,passed=passed,verdict=verdict))
    return dict(passed=all(r['passed'] for r in summaries),qualified=False,summaries=summaries,
        interpretation='Separate process-pair bounds; no pooling or simultaneous zero-regression claim')

def require_clean(root,head):
    require(git(root,'rev-parse','HEAD')==head and not git(root,'status','--porcelain','--untracked-files=all'),
            'Source checkout changed: '+str(root))
