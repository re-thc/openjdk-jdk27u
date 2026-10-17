"""Inert controller repair draft: pure functions, no host reads or launches.

This is separate from the approved v35 collector. Diagnostics do not change
any historical classification, timing record or statistical gate.
"""
import re
from fractions import Fraction
from pathlib import PurePosixPath

class Unverified(ValueError): pass

def _path(value):
    if type(value) is not str or '\x00' in value:
        raise Unverified('INVALID_PATH_DATA')
    if re.search(r'\\(?![0-7]{3})',value):
        raise Unverified('MALFORMED_PATH_ESCAPE')
    value=re.sub(r'\\([0-7]{3})',lambda m:chr(int(m[1],8)),value)
    if '\x00' in value: raise Unverified('INVALID_PATH_DATA')
    if not value.startswith('/') or '..' in value.split('/'):
        raise Unverified('PATH_OUTSIDE_NAMESPACE_ROOT')
    return PurePosixPath(value)

def resolve_leaf_candidate(membership_text, mountinfo_text):
    """Resolve within an already visible matching mount; never climb /.. .

    The returned path is a candidate, not proof of membership or an effective
    quota. A caller must verify the target PID in the same PID namespace and
    distinguish leaf limits from applicable ancestor limits.
    """
    if type(membership_text) is not str or type(mountinfo_text) is not str:
        raise Unverified('INVALID_MEMBERSHIP_OR_MOUNTINFO')
    unified=[line.split(':',2)[2] for line in membership_text.splitlines()
             if line.startswith('0::')]
    if len(unified)!=1: raise Unverified('UNIFIED_MEMBERSHIP_NOT_UNIQUE')
    member=_path(unified[0]); candidates=[]
    for line in mountinfo_text.splitlines():
        fields=line.split()
        if not fields: continue
        if '-' not in fields: raise Unverified('MALFORMED_MOUNTINFO')
        separator=fields.index('-')
        if separator<6 or separator+3>=len(fields): raise Unverified('MALFORMED_MOUNTINFO')
        if fields[separator+1]!='cgroup2': continue
        root,point=_path(fields[3]),_path(fields[4])
        try:
            suffix=member.relative_to(root)
        except ValueError:
            continue
        candidates.append((len(root.parts),str(point),dict(path=str(point/suffix),
            mount_root=str(root),mountpoint=str(point),device=fields[2],
            membership=str(member),leaf_membership_verified=False)))
    if not candidates: raise Unverified('CGROUP_MOUNT_SCOPE_UNVERIFIED')
    # Prefer the most specific visible root. Do not construct an outside path.
    return sorted(candidates,key=lambda x:(-x[0],x[1]))[0][2]

def verify_direct_membership(candidate, pid, cgroup_procs_text):
    if type(pid) is not int or pid<=0: raise Unverified('INVALID_NAMESPACE_PID')
    try: members={int(value) for value in cgroup_procs_text.split()}
    except ValueError as exc: raise Unverified('INVALID_CGROUP_PROCS') from exc
    if pid not in members: raise Unverified('DIRECT_MEMBERSHIP_UNVERIFIED')
    return dict(candidate,leaf_membership_verified=True,verified_pid=pid)

def _record(value):
    if type(value) is not dict: raise Unverified('INVALID_RECORD_CONTAINER')
    return value

def _integer(record, key):
    value=record.get(key)
    if type(value) is not int or value<0: raise Unverified('INVALID_OR_MISSING_'+key)
    return value

def diagnose_saved_fork(row, pre, post, hz):
    """Nominal arithmetic under a same-CPU/same-interval assumption only.

    /proc counters can have asynchronous updates; this arithmetic cannot
    independently establish their provenance or become a performance gate.
    """
    if type(hz) is not int or hz<=0: raise Unverified('CLOCK_TICK_UNITS_UNKNOWN')
    row,pre,post=(_record(value) for value in [row,pre,post])
    cpu_index=_integer(row,'cpu')
    start,end,process_cpu=(_integer(row,key) for key in ['start_monotonic_ns','end_monotonic_ns','process_cpu_ns'])
    a,b=(_record(value.get('capture')) for value in [pre,post])
    for capture in [a,b]:
        for key in ['monotonic_start_ns','monotonic_end_ns']: _integer(capture,key)
    if not a['monotonic_start_ns']<=a['monotonic_end_ns']<=start<=end<=b['monotonic_start_ns']<=b['monotonic_end_ns']:
        raise Unverified('UNORDERED_CLOCK_BOUNDS')
    cpu='cpu'+str(cpu_index)
    maps=[_record(_record(value.get('proc_stat')).get('cpu_counters')) for value in [pre,post]]
    first,last=(value.get(cpu) for value in maps)
    if type(first) is not list or type(last) is not list: raise Unverified('INVALID_CPU_COUNTER_CONTAINER')
    if len(first)<8 or len(last)<8: raise Unverified('PRIMARY_CPU_COUNTERS_MISSING')
    if any(type(value) is not int or value<0 for value in first+last): raise Unverified('INVALID_CPU_COUNTER')
    delta=[v-u for u,v in zip(first[:8],last[:8])]
    if any(value<0 for value in delta): raise Unverified('CPU_COUNTER_DECREASE')
    span=b['monotonic_end_ns']-a['monotonic_start_ns']
    steal=Fraction(delta[7]*1_000_000_000,hz)
    busy=Fraction(sum(delta[i] for i in [0,1,2,5,6])*1_000_000_000,hz)
    total=Fraction(process_cpu)+steal
    encode=lambda value:dict(numerator=value.numerator,denominator=value.denominator)
    return dict(enclosing_span_ns=span,child_cpu_ns=process_cpu,
        nominal_steal_ns=encode(steal),nominal_guest_busy_ns=encode(busy),
        nominal_child_plus_steal_ns=encode(total),nominal_excess_over_span_ns=encode(total-span),
        prelaunch_gap_after_snapshot_ns=start-a['monotonic_end_ns'],
        post_timer_envelope_ns=b['monotonic_end_ns']-end,
        actual_child_affinity_verified=False,proc_cpu_mapping_verified=False,
        child_delay_attribution_supported=False,performance_qualified=False,
        modifies_historical_gates=False)
