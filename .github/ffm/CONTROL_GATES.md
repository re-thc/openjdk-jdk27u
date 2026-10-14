Fixed before the approved remote run. No retries, discarded forks or relaxed
thresholds. One Linux x86_64 release job; no PR, merge or default-branch change.
The owner authorized initial publication with a push trigger restricted exactly
to codex/ffm-startup-diagnostic-20261014. No intermediate branch writes, workflow
dispatch, credentials change, retries or other automatic workflow are allowed.

Each unchanged-baseline control must have 12 paired forks, geometric ratio in
[0.95, 1.05], and its entire 95% paired-bootstrap interval in [0.90, 1.10].
Startup gates use whole-process elapsed and process CPU across all three shapes
and five modes. Retained gates use per-fork median elapsed and thread CPU/call
across the four handle cases and five modes. Missing or failed forks stop the
job's measurements. These explicit tolerances implement the prior requirement
to stop for meaningful drift or intervals too wide to assess a small change.

Order: startup with CDS off, startup with default CDS, retained with default
CDS. Analyze each completed set only after its forks exit. On the first failed
control, write STOPPED_CONTROL_FAILURE and collect no later measurements or
performance diagnostics. Always preserve raw data and run correctness tests
when image construction succeeded. Passing controls means review is possible,
not that a candidate is faster or regression-free. No broader matrix follows.

Exact phases, seeds, tiers and counts remain those in QUALIFICATION.md. Runtime
symbol/stub pointers are not archived in a JVM image. Compiler logs may include
ordinary diagnostic addresses; they are evidence, never runtime input.
