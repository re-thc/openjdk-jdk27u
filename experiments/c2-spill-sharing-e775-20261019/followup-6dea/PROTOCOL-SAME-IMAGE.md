# Same-image targeted control: fixed before its build and timings

Motivation: original copy driver code is unchanged but timing has adverse point
estimates. The positive trigger removes stack work yet times worse. Eight-step
lifetime limits retain activation but add one normal-path load to the trigger;
this does not demonstrate replacement spills as the cause. Keep all original
stock-v5 observations and the full96fork option screen; do not replace them.

Build one temporary diagnostic JVM from product/test head774c1c0, adding only
an Oracle boolean compile command DisableSpillCopySharing (defaultfalse) and
an early skip when that method option is true. Default v5 behavior is unchanged.
This diagnostic switch is NOT part of the product PR. Commit and identify this
separate experiment. Use the exact same complete image/installation path in
both arms, with explicit CDS-on and identical app/benchmark/corpus content.

Use equal-length CompileCommandFile paths for each cell and arm, registering
the exact same method patterns/boolean type in each arm. A disables sharing only
in that cell's target methods; B enables it. All other methods keep unchanged v5
policy in both arms. Targets: source and dense = WindowBuffer.executeSequencesDirect
and BlockDecoder.decodeSequencesRolling; positive = existingTrigger.kernel;
copy = actualJMHcopyControl_thrpt_jmhStub. The copy target had no sharing; it is
a mechanism-negative control. The positive alone retains its original forced
FPUspillingtrue in BOTH arms. Do not modify the application or the old benchmark.

Before timings, verify switch recognition, complete output and activation/code
changes in exact targeted C2 methods (debug trace/code capture), unchanged copy
code, and movingGC/deoptimization/alias/exception safety with default policy.
Use the new activation-backed fixture with both FPUspilling modes. Keep logging
and profiling out of the timing batch. Build both complete release/fastdebug
images with the established configuration; runtime image identity is identical
between arms because the same image is used. No build/test/diagnostic JVM during
primary measurements.

Then run exactly12alternating AB/BA pairs in each of four cells (source, dense,
positive-trigger, copy), interleaving/rotating cells by pair:96fresh forks. Same
JMH1.37, one thread, affinity0-3, SerialGC512MiB, ActiveProcessorCount4,
three1s warmups/five1s measurements, CDSon. Per-fork median of five iterations,
median within-pair B/A ratios;20k whole-pair bootstrap seed20261019 and AB/BA
order medians. Intervals are per-cell95%, not simultaneous. Preserve every run,
no favorable subset/retry/early stopping. Any failure remains logged and must be
diagnosed before a distinctly named restart; no silent erase.

This is a targeted causal diagnostic, not a replacement for current-master
whole-JVM stock-v5 qualification. It tests whether changing the targeted methods
within one JVM binary reproduces their apparent gain/loss, while leaving other
compiled methods' sharing policy constant. It does not isolate every hardware
cause. The implementation remains unflagged in PR56 unless independent evidence
justifies a later product change and full final-source qualification. CI on the
actual product head remains necessary and must not be called passed while queued.
