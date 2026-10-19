# Fixed confirmation after the original nine-cell matrix

The original 216 forks all succeeded. Dense decode improved in all twelve
pairs: median +7.343%, paired bootstrap 95% interval +5.762% to +8.934%.
Array copy had a median -2.274%, interval -5.786% to -0.137%; individual pair
changes ranged from -12.28% to +15.09%. Raw decode was also variable, with
AB and BA group medians of opposite signs. These observations justify a
control diagnosis and a fixed independent confirmation, not discarding data.

First inspect allocated copy-control/JMH-loop code on both release images.
Then run exactly twelve additional independent AB/BA pairs for each of three
cells: dense decode, raw decode, and array copy. Keep the original images,
application classes, flags, affinity, three warmups and five measurements.
Rotate cell order by pair as well as alternating AB and BA. No resampling,
retries or extra pairs will be selected based on favorable scores.

Report the original and confirmation estimates separately. Also report the
median of all 24 paired ratios, with a 20,000-draw bootstrap stratified by
campaign (twelve resampled pairs from each campaign), seed 20261019. Preserve
every observation and both ordering groups. Interpret the control against
its generated code and the raw-copy control. Do not replace the original
matrix with this subset or claim all nine per-cell 95% intervals are
simultaneous confidence intervals.

The startup/compiler batch's first command failed before launching Java
because /usr/bin/time is unavailable. The failed folder is retained. The
completed replacement uses Python's standard os.wait4 per-child resource
usage for user/system CPU and peak RSS, with perf_counter wall time. All
48 replacement cost invocations succeeded. The primary timing data and
median/bootstrap estimators were unchanged.
