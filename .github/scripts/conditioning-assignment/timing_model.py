"""Timestamp algebra and proposed diagnostic plan only. No native execution."""
from fractions import Fraction
import math
import statistics as S

CONDITIONS=('balanced','A_extra','B_extra')
BASE_GAP_NS=40_000_000
HALF_SKEW_NS=2_200_000
DELIVERY_LATE_NS=50_000
# NEW diagnostic only: four intervals, df7, two-sided Bonferroni alpha=.05.
# scipy.stats.t.ppf(1-.05/(2*4),7), independently reproducible; no install.
DIAGNOSTIC_T=3.3352949398170826
RESOLUTION_PP=1

def contrast(rows, field):
    a=[r[field] for r in rows if r['label']==0]
    b=[r[field] for r in rows if r['label']==1]
    assert len(a)==len(b)==2
    return (sum(a)-sum(b))/2

def centers(rows):
    """Exact rational nanoseconds, preserving timestamps' integer precision."""
    assert [r['position'] for r in rows]==[0,1,2,3]
    assert [r['label'] for r in rows] in ([0,1,1,0],[1,0,0,1])
    sign=1 if rows[0]['label']==0 else -1
    d=[r['end_ns']-r['begin_ns'] for r in rows]
    g=[rows[i+1]['begin_ns']-rows[i]['end_ns'] for i in range(3)]
    assert min(d)>0 and min(g)>=0
    direct=Fraction(sum((1 if r['label']==0 else -1)*(r['begin_ns']+r['end_ns']) for r in rows),4)
    gap=Fraction(sign*(g[2]-g[0]),2)
    duration=Fraction(sign*(-d[0]-d[1]+d[2]+d[3]),4)
    warm=Fraction(sign*(rows[3]['warm_wall_ns']-rows[1]['warm_wall_ns']),2)
    assert direct==gap+duration
    return dict(center_ns=direct,gap_term_ns=gap,duration_term_ns=duration,
                warm_term_ns=warm,other_gap_term_ns=gap-warm)

def synthetic(order, gaps_by_arm, durations_by_arm, warm_by_arm=None, origin=10**18, offsets=None, operations=64):
    """Stable arm durations: three subsequent gaps depend on incoming arm."""
    labels=[0,1,1,0] if order==0 else [1,0,0,1]
    rows=[];t=origin
    for pos,arm in enumerate(labels):
        if pos:t+=gaps_by_arm[arm]
        duration=durations_by_arm[arm]+(offsets or [0]*4)[pos]
        rows.append(dict(position=pos,label=arm,arm=arm,begin_ns=t,end_ns=t+duration,
                         warm_wall_ns=(warm_by_arm or gaps_by_arm)[arm],operations=operations))
        t+=duration
    return rows

def assigned_gap(condition, slot, role_swap):
    assert condition in CONDITIONS and slot in (0,1) and role_swap in (0,1)
    role=slot^role_swap
    signed=(1 if role==0 else -1)*({'balanced':0,'A_extra':1,'B_extra':-1}[condition])
    return BASE_GAP_NS+signed*HALF_SKEW_NS

def target_start(previous_end_ns, condition, slot, role_swap):
    """Every row: padding ends at previous timed end + assigned gap.

    Caller must finish fixed warm/prep before the target. Never skip warm/prep
    or discard an overrun; record target/actual/overrun and mark fidelity false.
    This function never reads clocks, waits, runs native work, or changes rows.
    Row0 uses quartet-entry anchor in place of previous_end_ns. Its gap is
    also assigned by role, so ALL FOUR target-gap budgets total160ms in every
    condition/order. Actual residual busy-wait time is measured, not assumed.
    """
    return previous_end_ns+assigned_gap(condition,slot,role_swap)

def delivery(rows, anchor, condition, role_swap):
    """Delivery uses assigned gap/start adherence, NEVER outcome duration/center.

    Each row must record slot,target_start_ns,fixed_work_end_ns,begin_ns,end_ns.
    Keep ALL rows when false; no shortening, exclusion, compensation or retry.
    """
    assert len(rows)==4
    expected=[];errors=[];valid=True;previous=anchor
    for r in rows:
        target=target_start(previous,condition,r['slot'],role_swap)
        late=r['begin_ns']-target
        valid &= (r['target_start_ns']==target and 0<=late<=DELIVERY_LATE_NS
                  and r['fixed_work_end_ns']<=target)
        expected.append(target-previous);errors.append(late);previous=r['end_ns']
    return dict(valid=bool(valid),assigned_gaps_ns=expected,start_errors_ns=errors)

def ns_per_op_rows(rows):
    return [dict(r,y=Fraction(r['end_ns']-r['begin_ns'],r['operations'])) for r in rows]

def normalized_block(condition_orders):
    """One block: three conditions, each two quartets; common 24-row reference.

    No separate condition denominator: the same strictly positive T_b converts
    all three contrasts to pp. All rates derive from actual timed durations.
    """
    assert set(condition_orders)==set(CONDITIONS)
    all_rates=[];raw={}
    for c in CONDITIONS:
        orders=condition_orders[c];assert len(orders)==2
        assert {q[0]['label'] for q in orders}=={0,1}
        rates=[ns_per_op_rows(q) for q in orders]
        for q in rates:
            assert len(q)==4 and {r['operations'] for r in q}=={64}
        raw[c]=sum(contrast(q,'y') for q in rates)/2
        all_rates.extend(r['y'] for q in rates for r in q)
    reference=sum(all_rates)/24;assert reference>0
    return dict(reference_ns_per_op=reference,raw_ns_per_op=raw,
                pp={c:100*raw[c]/reference for c in CONDITIONS})

def interval(values):
    assert len(values)==8 and all(math.isfinite(v) for v in values)
    mean=S.mean(values);half=DIAGNOSTIC_T*S.stdev(values)/math.sqrt(8)
    return dict(mean=mean,half=half,lo=mean-half,hi=mean+half,
                precision=half<=RESOLUTION_PP,bounded=abs(mean)+half<=RESOLUTION_PP,
                observed_signed=mean-half>0 or mean+half<0,
                absolute_mean_exceeds=abs(mean)>RESOLUTION_PP)

def outcomes(condition_blocks,delivery_valid=True,telemetry_valid=True):
    """New unchanged-code diagnostic only. Values are fixed normalized pp.

    Four intervals: D_balanced,D_Aextra,D_Bextra,H=(D_Aextra-D_Bextra)/2.
    Flags are independent: assignment response and residual instability may
    coexist; insufficient H precision remains indeterminate, even if signed.
    """
    assert set(condition_blocks)==set(CONDITIONS)
    iv={c:interval(condition_blocks[c]) for c in CONDITIONS}
    h=[(a-b)/2 for a,b in zip(condition_blocks['A_extra'],condition_blocks['B_extra'])]
    iv['H']=interval(h);valid=delivery_valid and telemetry_valid
    signed=iv['H']['lo']>0 or iv['H']['hi']<0
    response=valid and signed and iv['H']['precision']
    bounded=valid and iv['H']['bounded']
    residual=valid and not iv['balanced']['bounded']
    indeterminate=not valid or not(response or bounded)
    labels=[]
    if response:labels.append('INFORMATIVE_ASSIGNMENT_RESPONSE')
    if bounded:labels.append('INFORMATIVE_BOUNDED_RESPONSE')
    if residual:labels.append('RESIDUAL_INSTABILITY')
    if indeterminate:labels.append('INDETERMINATE')
    return dict(intervals=iv,delivery_valid=delivery_valid,telemetry_valid=telemetry_valid,
        observed_signed_H=signed,assignment_response=response,bounded_response=bounded,
        residual_instability=residual,indeterminate=indeterminate,labels=labels,
        old_result_unchanged=True,qualification=False)

def diagnostic_plan():
    """48 proposed quartets / 192 rows; not authorized for execution.

    Same size as ONE worker/profile's existing three-kind guard slice.
    Eight block contrasts per condition; physical-slot mapping alternates.
    Both orders occur for each condition within every block.
    """
    # Frozen joint balance, not selected by measurement outcomes.
    permutations=[(2,1,0),(0,2,1),(0,2,1),(0,1,2),(1,0,2),(2,1,0),(2,0,1),(1,0,2)]
    firsts=[(1,0,0),(1,1,0),(0,1,1),(0,0,1),(0,1,0),(0,1,1),(1,0,1),(1,0,0)]
    episodes=[]
    for b,perm in enumerate(permutations):
        for condition_position,c in enumerate(perm):
            first=firsts[b][c];swap=b%2
            for q in range(2):
                order=first^q;labels=[0,1,1,0] if order==0 else [1,0,0,1]
                slots=[a^swap for a in labels]
                episodes.append(dict(episode=len(episodes),block=b,condition=CONDITIONS[c],
                    condition_position=condition_position,role_swap=swap,order=order,
                    labels=labels,slots=slots,gaps_ns=[assigned_gap(CONDITIONS[c],s,swap) for s in slots]))
    return episodes
