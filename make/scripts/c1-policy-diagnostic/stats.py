import math, statistics
from scipy.stats import binomtest, t

def bounds(values, probability=.95, two_sided=False):
    n=len(values);mean=statistics.mean(values);se=statistics.stdev(values)/math.sqrt(n)
    critical=float(t.ppf((1+probability)/2 if two_sided else probability,n-1))
    return mean,mean-critical*se,mean+critical*se

def contrast(numerator,denominator):
    assert len(numerator)==len(denominator) and len(numerator)>1
    values=[math.log(a/b) for a,b in zip(numerator,denominator)]
    mean,lo,hi=bounds(values,.95,True);upper=bounds(values,1-.05/16)[2]
    pct=lambda v:100*math.expm1(v)
    slower=sum(v>0 for v in values);faster=sum(v<0 for v in values);nonzero=slower+faster
    one=float(binomtest(slower,nonzero,.5,alternative='greater').pvalue) if nonzero else 1.
    two=float(binomtest(slower,nonzero,.5).pvalue) if nonzero else 1.
    return {'n':len(values),'numerator':numerator,'denominator':denominator,'paired_log_ratios':values,
            'geometric_percent':pct(mean),'nominal_paired_95_percent':[pct(lo),pct(hi)],
            'familywise_95_upper_percent':pct(upper),'family_endpoints':16,
            'slower_pairs':slower,'faster_pairs':faster,'ties':len(values)-nonzero,
            'one_sided_slowdown_sign_p':one,'two_sided_sign_p':two,
            'established_loss_veto':lo>0,'consistent_positive_loss_hold':mean>0 and slower>len(values)/2,
            'sign_loss_veto':one<=.05}

def calibration(current,alias):
    result=contrast(alias,current);lo,hi=result['nominal_paired_95_percent']
    result['equivalence_and_zero_pass']=-1<=lo<=0<=hi<=1
    result['sign_pass']=result['two_sided_sign_p']>.05
    result['pass']=result['equivalence_and_zero_pass'] and result['sign_pass']
    return result

def allocation(numerator,denominator):
    differences=[a-b for a,b in zip(numerator,denominator)]
    mean,_,upper=bounds(differences)
    return {'n':len(differences),'numerator_B_op':numerator,'denominator_B_op':denominator,
            'paired_delta_B_op':differences,'mean_delta_B_op':mean,'one_sided_95_upper_B_op':upper,'pass':upper<.1}
