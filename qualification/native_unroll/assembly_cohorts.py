"""Exact observed release cohorts; independent of timed process comparisons."""
import itertools


def cohorts(platform,pair_only=False):
    sve_modes=['0'] if platform=='mac' else ['default','0']
    conversions=['rebuilt_b3','candidate'] if pair_only else ['base87','rebuilt_b3','candidate']
    observed=[]
    for header,sve in itertools.product(['legacy','four','eight'],sve_modes):
        observed.extend((([header,sve,'default','conversion'],image) for image in conversions))
        observed.extend((([header,sve,'default','rawBits'],image) for image in ['rebuilt_b3','candidate']))
    observed.extend(((['legacy',sve,'1','conversion'],image) for sve,image in itertools.product(sve_modes,conversions)))
    return observed


def verify_index(index,platform,pair_only=False):
    expected={(tuple(condition),image) for condition,image in cohorts(platform,pair_only)}
    actual=[(tuple(row['condition']),row['image']) for row in index]
    if len(actual)!=len(expected) or set(actual)!=expected:
        raise RuntimeError('Incomplete, duplicate or unexpected assembly cohort')
    names=[row['name'] for row in index]
    if len(set(names))!=len(names):raise RuntimeError('Duplicate assembly log name')
