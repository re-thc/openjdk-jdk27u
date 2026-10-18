# Source 4592230b measurement evidence

Runtime: `4592230b14fc2f4b537b162fd7f6b791e882b615`.
Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.
Every timed row compares complete original/enabled/disabled images. No patched
`java.base` classes are used. Enabled and disabled controls share the same fork
image. Image, compiler, harness, source and backend receipts accompany the samples.

| Cohort | Successful matched triplets | Status |
| --- | ---: | --- |
| Main matrix | 1,386 / 1,635 | 13 successful backend/tier shards; AVX-512 interpreter/C1 require missing-only recovery |
| Exact ABC periodic fixtures | 24 / 30 | Native serial, AVX2, ARM64/NEON and MSVC complete; AVX-512 requires recovery |
| Single/two-candidate supplement | 35 / 35 | Completed in [its separate run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39133697799) |

The [main table](RESULTS.md) retains every original/enabled/disabled mean, JMH
99.9% interval and higher enabled mean. It covers all 219 distinct inputs in the
249-row manifest. [Exact ABC results](abc-RESULTS.md) are a separate application
and cohort. Neither cohort qualifies subsequent runtime source `e036e637`.

Main raw files are named `BACKEND-TIER-CONTROL.json`, with separate metadata and
non-timing compilation diagnostics. Every measurement retains its two forks and
five measured samples per fork. Compilation output is not timing evidence.
[MSVC and AVX-512 bindings](msvc-and-skylake-index.json) retain the recovered
MSVC validation chain: the original producer failed before validation/timing; the
same complete archives were validated and measured in the recovery run. The
original failed producer is not relabeled as successful. Unsupported AVX-512
workers produced zero timings and are excluded from the table.

[ABC bindings](abc-index.json) identify the external application, compiler,
complete images, controls, fixtures and all raw samples. Native component screens
are recorded [separately](../native-screen2-4592230b/review.json); their comparison
against an enabled native baseline is not an original-Java speedup.
