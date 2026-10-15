"""Validate observational evidence. Delivered mappings are not activation proof."""
import argparse
import collections
from decimal import Decimal
import hashlib
import json
from pathlib import Path
import xml.etree.ElementTree as ET

PHASES = ['init', 'library', 'link_unbound', 'link_bound', 'mxbean',
          'warm_set', 'warm', 'sample_outer', 'output', 'capture', 'main_end', 'begin']
LOSSES = ['event_loss', 'code_loss', 'map_loss', 'pc_loss', 'malformed', 'metadata_errors']

class Invalid(ValueError):
    pass

def require(condition, message):
    if not condition:
        raise Invalid(message)

def clock_origin(marks):
    anchors = [e for e in marks if e['uptime_ms'] >= 0]
    require(anchors, 'no Java uptime/monotonic anchors')
    lower, upper = 0, 2**63
    for e in anchors:
        a, b, u = e['java0'], e['java1'], e['uptime_ms']
        require(a <= b <= e['mono0'] <= e['mono1'], 'Java/native monotonic clock mismatch')
        # Uptime floors to ms, while XML stamps round to 3 decimal places.
        lower = max(lower, a - (u + 1)*1_000_000)
        upper = min(upper, b - u*1_000_000)
    require(lower <= upper, 'disjoint VM origin bounds')
    return [lower, upper]

def xml_bounds(stamp, origin):
    ns = int(Decimal(stamp)*1_000_000_000)
    return [origin[0]+ns-500_000, origin[1]+ns+500_000]

def phase_pairs(marks):
    pending, pairs = {}, {}
    for e in marks:
        require(0 <= e['phase'] < len(PHASES), 'unknown phase')
        key = (e['phase'], e['index'])
        if e['edge'] == 0:
            require(key not in pending and key not in pairs, 'duplicate boundary')
            pending[key] = e
        else:
            require(e['edge'] == 1, 'bad boundary edge')
            if key == (10, -1):
                continue
            require(key in pending, 'missing start boundary')
            a = pending.pop(key)
            require(a['mono1'] <= e['mono0'], 'reversed boundaries')
            require(a['tid'] == e['tid'], 'main thread changed')
            for k in ('cpu_ns', 'user_us', 'system_us', 'nvcsw', 'nivcsw'):
                require(e[k] >= a[k] >= 0, 'passive counter regressed: '+k)
            pairs[key] = (a, e)
    require(not pending, 'missing end boundary')
    return pairs

def code_ranges(events):
    """Keep versions/reuse; repeated GenerateEvents snapshots add observations.

    Start is callback completion, NOT code activation. Unload delivery only
    bounds address reuse; a PC before delivery cannot prove code still live.
    """
    ranges, active = [], {}
    for e in events:
        if e['kind'] == 5:
            for key, r in list(active.items()):
                if r['addr'] == int(e['addr'],16) and r['method'] == e['method']:
                    r['end_delivery'] = e['mono0']
                    active.pop(key)
        if e['kind'] not in (4,6) or not e['size']:
            continue
        key = (e['kind'], e['addr'], e['size'], e['method'], e['name'])
        if key in active and (e['phase'] == 1 or e['kind'] == 6):
            active[key]['observations'].append(e['seq'])
            continue
        r = dict(addr=int(e['addr'],16), size=e['size'], method=e['method'],
                 name=e['class']+'.'+e['name'], kind=e['kind'],
                 start_delivery=e['mono1'], end_delivery=2**63,
                 observations=[e['seq']], snapshot_only=e['phase'] == 1)
        # A duplicate/reused range remains in the history and can be ambiguous.
        ranges.append(r)
        active[key] = r
    return ranges

def classify_pc(pc, ranges):
    ip, time = int(pc['ip'],16), pc['time']
    matches = [r for r in ranges if r['addr'] <= ip < r['addr']+r['size']
               and r['start_delivery'] <= time < r['end_delivery']]
    if len(matches) != 1:
        return 'unknown_or_overlapping', None
    r = matches[0]
    return 'delivered_mapping_candidate', r['name']

def pmu_delta(a, b):
    x, y = a['counts'], b['counts']
    require(x[0] == y[0] == 3, 'PMU group incomplete')
    delta = [y[i]-x[i] for i in range(1,6)]
    require(all(v >= 0 for v in delta), 'PMU group regressed')
    require(delta[0] == delta[1] and all(v > 0 for v in delta),
            'PMU group zero, multiplexed, or not running')
    return dict(enabled_ns=delta[0], running_ns=delta[1], cycles=delta[2],
                instructions=delta[3], ref_cycles=delta[4],
                interval='outer native boundary reads, wider than timer ROI')

def verify_sample_windows(samples, pairs, expected_samples, expected_sum, timed):
    require([e['index'] for e in samples]==list(range(expected_samples)), 'sample coverage missing')
    for s in samples:
        require(s['timed']==timed and s['checksum']==expected_sum, 'sample mode/checksum mismatch')
        a,b=pairs[(7,s['index'])]
        if timed:
            require(a['mono1']<=s['wall0']<s['wall1']<=b['java0'], 'ROI outside boundaries')
            require(s['cpu0']<s['cpu1'], 'thread CPU ROI missing')
        else:
            require(not any(s[k] for k in ('wall0','wall1','cpu0','cpu1')), 'untimed probe recorded ROI')

def perf_stream(header, end, pcs, controls):
    """Version 1 silently discarded controls; never infer their absence there."""
    require(header['version'] in (1,2), 'unsupported perf stream version')
    if header['version']==1:
        require(not controls, 'controls in legacy stream')
        return False
    require(header['throttle_records_preserved'] is True, 'throttle capture metadata missing')
    require(header['control_loss']==0, 'throttle record loss')
    require(len(controls)==end['controls'], 'throttle count mismatch')
    require([c['seq'] for c in controls]==list(range(1,len(controls)+1)), 'throttle sequence missing')
    require(all(c['type'] in (5,6) and c['time']>0 for c in controls), 'bad throttle record')
    require(sorted(r['stream_seq'] for r in pcs+controls)==list(range(1,end['perf_records']+1)), 'perf ring sequence missing')
    return True

def throttle_window(start, end, controls, preserved, selected):
    if not selected or not preserved:
        return dict(records_available=False, status='not_selected' if not selected else 'not_preserved_in_legacy_stream',
                    transitions=[], reported_throttled_spans=[], reported_throttled_ns=None,
                    state_at_start='unknown', open_throttle_at_end=None)
    ordered=sorted(controls,key=lambda c:(c['time'],c['stream_seq']))
    active=None;spans=[];anomalies=[];state='no_reported_throttle'
    for c in ordered:
        t=c['time']
        if t<=start:state='reported_throttled' if c['type']==5 else 'reported_unthrottled'
        if c['type']==5:
            if active is not None:anomalies.append('repeated_throttle')
            else:active=t
        elif active is None:
            anomalies.append('unmatched_unthrottle')
            if start<t:state='unknown_prefix'
        else:
            if active<end and t>start:spans.append([max(start,active),min(end,t)])
            active=None
    if active is not None and active<end:spans.append([max(start,active),end])
    before_end=[c for c in ordered if c['time']<end]
    return dict(records_available=True,status='reported_controls_only',state_at_start=state,
                transitions=[c for c in ordered if start<=c['time']<end],
                reported_throttled_spans=spans,reported_throttled_ns=sum(b-a for a,b in spans),
                open_throttle_at_end=bool(before_end and before_end[-1]['type']==5),
                sequence_anomalies=sorted(set(anomalies)))

def pc_window(start, end, pcs, controls, ranges, selected, preserved):
    """All intervals are half-open CLOCK_MONOTONIC wall-time intervals.

    These gaps are unobserved spans, not measured sampler downtime: CPU-clock
    sampling has no promise of a regular wall-time cadence.
    """
    require(start<=end, 'reversed PC window')
    samples=[p for p in pcs if start<=p['time']<end]
    times=sorted(p['time'] for p in samples)
    gaps=[b-a for a,b in zip([start]+times,times+[end])]
    candidates=collections.Counter()
    for p in samples:
        category,name=classify_pc(p,ranges)
        candidates[category+(':'+name if name else '')]+=1
    return dict(mono_bounds=[start,end],samples=len(samples),
                availability='not_selected' if not selected else ('observed_samples' if samples else 'zero_samples_uncertain'),
                first_sample_ns=times[0] if times else None,last_sample_ns=times[-1] if times else None,
                leading_gap_ns=times[0]-start if times else end-start,
                trailing_gap_ns=end-times[-1] if times else end-start,
                max_inter_sample_gap_ns=max((b-a for a,b in zip(times,times[1:])),default=None),
                max_sample_free_span_ns=max(gaps),spans_over_nominal_period=sum(g>1_000_000 for g in gaps),
                nominal_cpu_clock_period_ns=1_000_000,
                mapping_candidates=dict(candidates.most_common(12)),
                throttling=throttle_window(start,end,controls,preserved,selected),
                uninterrupted_sampler_usability_proven=False,continuous_executed_bytes_proven=False)

def sample_pc_windows(samples, pairs, pcs, controls, ranges, selected, preserved):
    windows=[]
    for s in samples:
        a,b=pairs[(7,s['index'])]
        outer=pc_window(a['mono1'],b['mono0'],pcs,controls,ranges,selected,preserved)
        roi=pc_window(s['wall0'],s['wall1'],pcs,controls,ranges,selected,preserved) if s['timed'] else None
        windows.append(dict(index=s['index'],timed=s['timed'],outer=outer,roi=roi,
                            roi_status='saved_timer_endpoints' if s['timed'] else 'not_recorded_untimed'))
    return windows

def verify(directory, expected_count, expected_warm=30, expected_samples=10,
           timed=False, pc=False, pmu=False):
    directory = Path(directory)
    data = [json.loads(line) for line in (directory/'events.jsonl').read_text().splitlines()]
    require(data and data[0]['record']=='header' and data[-1]['record']=='end', 'incomplete stream')
    header, end = data[0], data[-1]
    require(header['pc_selected'] == pc and header['pmu_selected'] == pmu, 'selected modes changed')
    require(not any(header[k] for k in LOSSES), 'loss/truncation invalidates complete attribution')
    require(end['write_errno']==0, 'agent write error')
    events = [e for e in data if e['record']=='event']
    pcs = [e for e in data if e['record']=='pc']
    controls = [e for e in data if e['record']=='perf_control']
    controls_preserved=perf_stream(header,end,pcs,controls)
    code = (directory/'events.jsonl.code.bin').read_bytes()
    require(len(events)==end['events'] and len(pcs)==end['pcs'] and len(code)==end['code_bytes'], 'stream count mismatch')
    require([e['seq'] for e in events]==list(range(1,len(events)+1)), 'event sequence missing')
    require([e['seq'] for e in pcs]==list(range(1,len(pcs)+1)), 'PC sequence missing')
    require([e['mono0'] for e in events]==sorted(e['mono0'] for e in events), 'event clock regressed')
    require(all(e['mono0']<=e['mono1'] and not e['error'] for e in events), 'event clock/error')
    require(sum(e['kind']==1 for e in events)==sum(e['kind']==2 for e in events)==sum(e['kind']==3 for e in events)==1, 'missing lifecycle')
    features = [e for e in events if e['kind']==9]
    require(len(features)==1 and features[0]['phase']==int(pc) and features[0]['edge']==int(pmu), 'chosen feature init missing')
    marks = [e for e in events if e['kind']==7]
    pairs = phase_pairs(marks)
    require(len(marks)==2*expected_warm+2*expected_samples+19, 'unexpected boundary count')
    for phase in (0,1,2,3,4,5,8,9,11):
        require((phase,-1) in pairs, 'missing phase '+PHASES[phase])
    for phase,n in ((6,expected_warm),(7,expected_samples)):
        require({index for p,index in pairs if p==phase}==set(range(n)), 'iteration coverage missing')
    require(len({e['tid'] for e in marks})==1, 'boundary TID mismatch')
    origin = clock_origin(marks)
    samples = [e for e in events if e['kind']==8]
    expected_sum = expected_count*(expected_count-1)//2
    verify_sample_windows(samples,pairs,expected_samples,expected_sum,timed)
    output = json.loads((directory/'stdout.txt').read_text().strip())
    require(output['timed']==timed and output['mode']=='unbound' and output['count']==expected_count and output['warm']==expected_warm and output['samples']==expected_samples and output['sink']==expected_sum, 'harness output mismatch')
    for metric,k0,k1 in (('wall_ns','wall0','wall1'),('cpu_ns','cpu0','cpu1')):
        require(output[metric]==[s[k1]-s[k0] for s in samples], 'saved endpoints disagree')
    copied = []
    for e in events:
        if e['code_size']:
            a,b=e['code_offset'], e['code_offset']+e['code_size']
            require(0<=a<b<=len(code) and e['code_size']==e['size'], 'code copy out of range')
            require(all(int(e['addr'],16)<=int(v[0],16)<int(e['addr'],16)+e['size'] for v in e['locations']), 'BCI map outside code range')
            copied.append(dict(seq=e['seq'], kind=e['kind'], name=e['class']+'.'+e['name'],
                               address=e['addr'], size=e['size'], snapshot=e['phase']==1,
                               sha256=hashlib.sha256(code[a:b]).hexdigest()))
    require(any(e['kind']==4 and e['class']=='LSteady;' and e['name']=='callsUnbound' and e['code_size'] and e['phase']==0 for e in events), 'no root load/code')
    require(any(e['kind']==6 and e['name']=='nep_invoker_blob' and e['code_size'] for e in events), 'no NEP code')
    require(any(e['kind']==4 and 'LambdaForm$' in e['class'] and e['name']=='invoke' and e['code_size'] for e in events), 'no wrapper code')
    xml = ET.parse(directory/'hotspot.xml').getroot()
    xml_events=[]
    for e in xml.iter():
        if e.tag in ('nmethod','make_not_entrant','uncommon_trap') and 'stamp' in e.attrib:
            xml_events.append(dict(tag=e.tag, attributes=e.attrib, mono_bounds=xml_bounds(e.attrib['stamp'],origin)))
    roots=[e for e in xml_events if e['tag']=='nmethod' and e['attributes'].get('method')=='Steady callsUnbound (I)J']
    require(roots and all(e['attributes'].get('compiler')=='c2' for e in roots), 'C2 root XML missing')
    load_addresses={int(e['addr'],16) for e in events if e['kind']==4 and e['class']=='LSteady;' and e['name']=='callsUnbound'}
    require(all(int(e['attributes']['entry'],16) in load_addresses for e in roots), 'XML root / JVMTI entry mismatch')
    ranges=code_ranges(events)
    require(not pcs or pc, 'unexpected PCs')
    if pc:
        require(all(p['ip']!='0x0' and p['tid']==marks[0]['tid'] for p in pcs), 'invalid/non-main PC samples')
        require([p['time'] for p in pcs]==sorted(p['time'] for p in pcs), 'PC clock regressed')
        require(all(features[0]['mono0']<=p['time']<=pairs[(9,-1)][1]['mono1'] for p in pcs), 'PC clock outside enabled lifetime')
        require(all(features[0]['mono0']<=c['time']<=pairs[(9,-1)][1]['mono1'] for c in controls), 'throttle clock outside enabled lifetime')
    else:
        require(not controls, 'unexpected throttle records')
    budgets=[]
    for (phase,index),(a,b) in sorted(pairs.items()):
        row=dict(phase=PHASES[phase], index=index, wall_outer_ns=b['mono0']-a['mono1'],
                 mono_bounds=[a['mono1'],b['mono0']], tid=a['tid'],
                 cpu_outer_ns=b['cpu_ns']-a['cpu_ns'],
                 user_us=b['user_us']-a['user_us'], system_us=b['system_us']-a['system_us'],
                 nvcsw=b['nvcsw']-a['nvcsw'], nivcsw=b['nivcsw']-a['nivcsw'],
                 boundary_cpus=[a['cpu'],b['cpu']], boundary_migration_count_proven=False)
        if pmu and phase in (5,6,7,8):
            row['pmu']=pmu_delta(a,b)
        row['sampling']=pc_window(a['mono1'],b['mono0'],pcs,controls,ranges,pc,controls_preserved)
        row['pc_samples']=row['sampling']['samples']
        row['pc_candidates']=row['sampling']['mapping_candidates']
        budgets.append(row)
    symbol=int(output['symbol'],16)
    modules=[]
    for stage in ('begin','end'):
        matches=[]
        for line in (directory/('events.jsonl.maps.'+stage)).read_text().splitlines():
            fields=line.split(maxsplit=5); lo,hi=(int(v,16) for v in fields[0].split('-'))
            if lo<=symbol<hi:
                matches.append(dict(range=fields[0], permissions=fields[1], file_offset=fields[2],
                                    device=fields[3],inode=fields[4],path=fields[5] if len(fields)>5 else '',
                                    symbol_file_offset=hex(symbol-lo+int(fields[2],16))))
        require(len(matches)==1 and 'x' in matches[0]['permissions'], 'symbol mapping unavailable')
        modules.append(matches[0])
    require(modules[0]==modules[1], 'symbol mapping changed')
    identity_path=directory/'native-identity.json'
    if identity_path.exists():
        identity=json.loads(identity_path.read_text())
        require(identity['path']==modules[0]['path'] and int(identity['symbol_offset'],16)==int(modules[0]['symbol_file_offset'],16), 'saved ELF identity/mapping mismatch')
    return dict(valid=True, timed=timed, selected_modes=dict(pc=pc,pmu=pmu,perf_scheduling=False),
                origin_bounds=origin, losses={k:header[k] for k in LOSSES}, event_count=len(events),
                pc_count=len(pcs), code_bytes=len(code), copied_code=copied, symbol_mapping=modules[0],
                perf_controls=controls,throttle_records_preserved=controls_preserved,
                sampling_windows=sample_pc_windows(samples,pairs,pcs,controls,ranges,pc,controls_preserved),
                sampling_limit='Per-window PCs are sparse mapping candidates. Zero samples and sample-free spans are uncertainty. CPU-clock sampling has no guaranteed wall-time cadence. Neither positive lifetime samples nor no reported throttle prove uninterrupted sampler usability or continuously executed bytes.',
                phases=budgets, root_compilation_events=roots, xml_events=xml_events,
                sample_endpoints=[{k:s[k] for k in ('index','timed','wall0','wall1','cpu0','cpu1','checksum')} for s in samples],
                attribution_limit='Candidates from delivered mappings only; snapshots, gaps, unload delivery and code patches do not prove all executed bytes. PMU intervals enclose wider work than timer ROI. Boundary CPU equality does not prove no migration.')

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('directory');p.add_argument('--count',type=int,required=True)
    p.add_argument('--timed',action='store_true');p.add_argument('--pc',action='store_true');p.add_argument('--pmu',action='store_true')
    args=p.parse_args()
    try:
        result=verify(args.directory,args.count,timed=args.timed,pc=args.pc,pmu=args.pmu)
        target=Path(args.directory)/'verified.json'
        with target.open('x') as f:json.dump(result,f,indent=2);f.write('\n')
        print(json.dumps({k:result[k] for k in ('valid','timed','selected_modes','origin_bounds','event_count','pc_count','code_bytes','losses')}))
    except (OSError,ValueError,KeyError,ET.ParseError) as exc:
        print(json.dumps(dict(valid=False,error=str(exc))));raise SystemExit(1)
