#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Prospective stratified fork-level Welch intervals; never pools iterations."""
import math
import statistics as S


def require(ok, reason):
    if not ok:
        raise ValueError(reason)


def t_quantile(p, df):
    require(.5 < p < 1 and df >= 2, 't domain')
    coefficient = math.exp(math.lgamma((df + 1) / 2) - math.lgamma(df / 2)) / math.sqrt(math.pi)
    def cdf(x):
        end = math.atan(x / math.sqrt(df))
        n = 1024
        step = end / n
        total = 1 + math.cos(end) ** (df - 1)
        total += sum((4 if i % 2 else 2) * math.cos(i * step) ** (df - 1) for i in range(1, n))
        return .5 + coefficient * step * total / 3
    lo, hi = 0., 2.
    while cdf(hi) < p:
        hi *= 2
        require(hi <= 1024, 'unresolved quantile')
    for _ in range(55):
        mid = (lo + hi) / 2
        if cdf(mid) < p:
            lo = mid
        else:
            hi = mid
    return (lo + hi) / 2


def contrast(numerator, denominator):
    # Two fixed sessions, three independent JVM forks per arm/session. Each
    # fork contributes ONE mean of its three measurement iterations.
    require(len(numerator)==len(denominator)==2, 'two complete sessions')
    require(all(math.isfinite(v) and v>0 for arm in [numerator,denominator] for session in arm for v in session), 'positive finite fork means')
    effects, components = [], []
    for ns, ds in zip(numerator, denominator):
        require(len(ns) == len(ds) == 3, 'three forks per session')
        n, d = [list(map(math.log, a)) for a in [ns, ds]]
        effects.append(S.mean(n) - S.mean(d))
        components += [S.variance(a) / 12 for a in [n, d]]
    require(len(effects) == 2, 'two sessions')
    mean, variance = S.mean(effects), sum(components)
    df = variance ** 2 / sum(x*x/2 for x in components) if variance else None
    critical = t_quantile(1 - .05 / (2 * 14), max(2., df)) if variance else None
    half = critical * math.sqrt(variance) if variance else None
    return dict(ratio=math.exp(mean), lower=math.exp(mean-half) if half is not None else None,
                upper=math.exp(mean+half) if half is not None else None,
                session_ratios=list(map(math.exp, effects)), log_variance_components=components,
                df=df, critical=critical, family=14, family_alpha=.05)


def assess(data, cases):
    result = {}; controls = True; nonregression = True; harm = False
    for key, case in cases.items():
        effect = contrast(data['B'][key], data['A'][key])
        null = contrast(data['C'][key], data['CP'][key])
        tolerance = case['control_margin']
        null_ok = null['lower'] is not None and null['lower'] >= 1-tolerance and null['upper'] <= 1+tolerance and all(
            1-tolerance <= r <= 1+tolerance for r in null['session_ratios'])
        limit = 1 + case['nonregression_margin']
        bounded = effect['upper'] is not None and effect['upper'] <= limit and all(r <= limit for r in effect['session_ratios'])
        controls &= null_ok; nonregression &= bounded; harm |= effect['lower'] is not None and effect['lower'] > limit
        # B/C is descriptive only. No significance claim or acceptance gate.
        descriptive = [S.mean(data['B'][key][s]) / S.mean(data['C'][key][s]) for s in range(2)]
        result[key] = dict(baseline_effect=effect, image_control=null, control_pass=null_ok,
                           bounded_nonregression=bounded, B_over_C_descriptive=descriptive)
    target = result['direct-4096']['baseline_effect']
    benefit = target['upper'] is not None and target['upper'] <= .97 and all(r < 1 for r in target['session_ratios'])
    status = ('UNRESOLVED_CONTROL' if not controls else 'HOLD_BASELINE_COST' if harm else
              'UNRESOLVED_PRECISION' if not nonregression else 'BASELINE_BENEFIT_WITH_BOUNDED_GUARDS'
              if benefit else 'BOUNDED_NONREGRESSION_NO_PROVEN_BENEFIT')
    return dict(status=status, controls_pass=controls, bounded_nonregression=nonregression,
                benefit_4096=benefit, observed_cost_beyond_margin=harm,
                baseline_cost_demonstrated=controls and harm, comparisons=result, shipping_qualified=False,
                scope='Public C1 paths under the fixed independent-fork/stratified-session model; not C2 or causal route proof.')
