# Strict same-configuration A/A copy placebo, before its timings

The targeted same-image12pair study gave source+4.314%[1.522,7.561], dense
+7.010%[6.216,8.452], synthetic+.175%[-6.130,3.514], copy-2.410%[-5.690,3.291].
All96forks pass. The copy's canonical instructions/registers/stack offsets and
external call annotations match. Its negative interval includes zero but also
meaningful loss. Do not assert it is fixed or call all negative observations
noise without a control. Old whole-VM and option screen data remain retained.

Run one strict null experiment:24fresh JVM forks,12AB/BA pairs, copy only. Both
nominal arms use the EXACT same diag-v image and EXACT same copy-control-B.txt
file (sharing enabled in both). No feature/policy/argument variation in the
benchmark JVM. Only parent output/result names and independent-process random
state differ. Same unchanged workload/JMH1.37/affinity0-3/SerialGC512MiB/CDSon,
three1s warmups/five1s measurements. Median-of-iterations, median paired ratio,
20k whole-pair bootstrap seed20261019 and order groups. Keep every sample.
This estimates a null/noise floor, not a favorable retry of the negative study.
Do not subtract its point estimate from earlier results or pool unlike tests.
No builds/tests/diagnostic JVMs during this fixed batch. No optional stopping.
