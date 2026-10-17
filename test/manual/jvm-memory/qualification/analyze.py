# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Conservative paired analysis; no subprocesses, downloads or plotting packages.

Student-t intervals assume approximately normal paired log-ratios. Eight forks
cannot establish a distribution-free or universal performance guarantee.
"""
import math
import statistics


def _beta_fraction(a, b, x):
    # Continued fraction for regularized incomplete beta; modified Lentz method.
    tiny = 1e-300
    qab, qap, qam = a+b, a+1, a-1
    c = 1.0
    d = 1-qab*x/qap
    d = 1/(d if abs(d)>tiny else tiny)
    h = d
    for m in range(1, 301):
        aa = m*(b-m)*x/((qam+2*m)*(a+2*m))
        d = 1+aa*d; d = d if abs(d)>tiny else tiny
        c = 1+aa/c; c = c if abs(c)>tiny else tiny
        d = 1/d; h *= d*c
        aa = -(a+m)*(qab+m)*x/((a+2*m)*(qap+2*m))
        d = 1+aa*d; d = d if abs(d)>tiny else tiny
        c = 1+aa/c; c = c if abs(c)>tiny else tiny
        d = 1/d; delta = d*c; h *= delta
        if abs(delta-1)<3e-14:
            return h
    raise ValueError('Incomplete beta did not converge')


def _beta(a,b,x):
    if x<=0: return 0.0
    if x>=1: return 1.0
    front=math.exp(math.lgamma(a+b)-math.lgamma(a)-math.lgamma(b)+a*math.log(x)+b*math.log1p(-x))
    if x<(a+1)/(a+b+2):
        return front*_beta_fraction(a,b,x)/a
    return 1-front*_beta_fraction(b,a,1-x)/b


def critical(df, alpha):
    low,high=0.,1000.
    for _ in range(100):
        middle=(low+high)/2
        upper=.5*_beta(df/2,.5,df/(df+middle*middle))
        if upper>alpha/2: low=middle
        else: high=middle
    return high


def interval(values, t):
    if len(values)!=8 or not all(math.isfinite(v) for v in values):
        raise ValueError('Require eight finite paired values')
    mean=statistics.mean(values)
    radius=t*statistics.stdev(values)/math.sqrt(8)
    return [mean-radius,mean+radius]


def quantile(values,p):
    ordered=sorted(values)
    if not ordered: return None
    return ordered[max(0,math.ceil(len(ordered)*p)-1)]


def analyze(samples):
    # 24 workload + 6 startup + 6 pause metrics, for both C/B and B/B.
    t=critical(7,.05/72)
    rows=[];failures=[]
    groups=sorted({(s['gc'],s['method']) for s in samples})
    if len(groups)!=30:
        return {'decision':'HOLD','reason':'Expected 30 workload/collector groups','actual':len(groups)}
    for gc,method in groups:
        metrics={}
        for control in [False,True]:
            ratios=[];pause_ratios=[];pause_deltas=[];pause_counts=[]
            for pair in range(8):
                selected=[s for s in samples if s['gc']==gc and s['method']==method
                          and s['control']==control and s['pair']==pair]
                if len(selected)!=2:
                    return {'decision':'HOLD','reason':'Missing/duplicate pair','group':[gc,method,control,pair]}
                if control:
                    selected.sort(key=lambda s:s['member'])
                    baseline,candidate=selected
                else:
                    baseline=next(s for s in selected if s['tag']=='B')
                    candidate=next(s for s in selected if s['tag']=='C')
                b,c=baseline['time_per_work'],candidate['time_per_work']
                if not (math.isfinite(b) and math.isfinite(c) and b>0 and c>0):
                    return {'decision':'HOLD','reason':'Invalid score'}
                ratios.append(math.log(c/b))
                if method.endswith('Alloc.testSmallObject'):
                    bp,cp=baseline['pauses_ms'],candidate['pauses_ms']
                    pause_counts.append([len(bp),len(cp)])
                    if len(bp)>=100 and len(cp)>=100:
                        b99,c99=quantile(bp,.99),quantile(cp,.99)
                        if b99>0 and c99>0:
                            pause_ratios.append(math.log(c99/b99));pause_deltas.append(c99-b99)
            ci=list(map(math.exp,interval(ratios,t)))
            valid=ci[0]>=.97 and ci[1]<=1.03 if control else ci[1]<=1.03
            label='BB' if control else 'CB'
            row={'paired_log_ratios':ratios,'geometric_time_ratio':math.exp(statistics.mean(ratios)),
                 'simultaneous_interval':ci,'time_gate':valid}
            if not valid: failures.append([gc,method,label,'time/control'])
            if method.endswith('Alloc.testSmallObject'):
                enough=len(pause_ratios)==8 and all(sum(c[i] for c in pause_counts)>=1000 for i in [0,1])
                row['pause_counts']=pause_counts
                if enough:
                    pci=list(map(math.exp,interval(pause_ratios,t)));dci=interval(pause_deltas,t)
                    valid_pause=(pci[0]>=.95 and pci[1]<=1.05 and dci[0]>=-1 and dci[1]<=1
                                 if control else pci[1]<=1.05 and dci[1]<=1)
                    row.update(p99_ratio_interval=pci,p99_delta_ms_interval=dci,
                               pause_gate=valid_pause)
                else:
                    valid_pause=False;row['pause_gate']='unresolved sample count'
                if not valid_pause: failures.append([gc,method,label,'pause/control'])
            metrics[label]=row
        rows.append({'gc':gc,'method':method,'metrics':metrics})
    # Preserve all pause observations, including non-gated workloads.
    pauses=[]
    for gc,method in groups:
        for tag in ['B','C']:
            values=[v for s in samples if s['gc']==gc and s['method']==method and
                    s['tag']==tag and not s['control'] for v in s['pauses_ms']]
            pauses.append({'gc':gc,'method':method,'tag':tag,'count':len(values),
                           'p50_ms':quantile(values,.5),'p95_ms':quantile(values,.95),
                           'p99_ms':quantile(values,.99) if len(values)>=1000 else None,
                           'max_ms':max(values) if values else None})
    return {'decision':'HOLD' if failures else 'LOCAL_GO','failures':failures,
            'interval_family':72,'critical_t_df7':t,'pairs':8,'groups':rows,'pause_summaries':pauses,
            'pause_estimand':'geometric mean of paired per-fork p99; absolute mean paired per-fork p99 difference',
            'limits':'normal paired-log model; eight forks; no universal/native-other-architecture claim'}
