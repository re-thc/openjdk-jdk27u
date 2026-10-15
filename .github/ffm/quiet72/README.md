Compare the frozen scalar startup candidate A with two identical baseline labels
in 12 fixed paired blocks for each of C1 and C2. All 72 quiet processes use the
original reused-handle loop, with no instrumentation in the measured interval.
The checked-in plan is the approved v19 order; this job runs only once.

The original baseline/control gates remain unchanged. Any consistent candidate
slowdown holds A, including losses smaller than 2%; there is no acceptable-loss
margin. Candidate intervals crossing one remain inconclusive. A successful job
does not qualify shipping or authorize further diagnostics or a PR.

`status.json` retains all paired ratios, intervals and slowdown signals, and the
artifact preserves every fork's exact command, output and checksum result.
Failed controls stop qualification; a failed or invalid fork stops collection
without retries. Remaining platform and correctness work needs separate scope.
