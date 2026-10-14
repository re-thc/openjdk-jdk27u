# One approved physical ng1/ng6 native reuse64 experiment

The completed order-gate run38607984247 remains failed:141/1152 controls, no tiny comparison. This new prospective question is only complete64-byte wrapped native reset+FINISH reuse under the exact preparation below. It cannot qualify Java PR6 (Java1 maps to physical ng2), stock-relative benefit, fresh construction, raw/other tiny sizes, larger inputs or unknown-length streaming. No PR6/default/library-source changes.

Pins: PR6 `3f71d03f3297f94e8c2cc34160262a880be337fc`; unchanged PR6 vendored ng with upstream pin `88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0`; stock inflate helper1.3.2; corpus `9870d54525f8f5a1315da6f2f9b289fb535e26a3`. All215 vendor hashes checked. GCC14 -O2 -fPIC, configure --static --zlib-compat --sprefix=jdk_ng_, detected SIMD/quick/medium enabled, shared ng -Bsymbolic. One image per process, default allocator, one persistent stream, windowBits15/memLevel8/default strategy, direct private physical levels1/6. Stock compression is not timed.

## Frozen population and schedule

Eight families: original Java/HotSpot/documentation64-byte prefixes, repeated-A64, and32 fixed distinct64-byte banks each for text/valid JSON/SHAKE256/random-mixed patterns. Exactly132 arrays. The source defines their exact bytes with seed fixed-order-v1-20261015:<bank>; manifest hashes every array before execution. The original prefixes concatenate lexicographically sorted immediate source files in the three pinned corpus directories. These are completed whole inputs and finite reused banks, not a prediction from a64-byte chunk or infinitely unseen inputs.

Two workers are launched and reach READY with their images/streams resident. They wait using blocking getchar; the coordinator waits using select, without polling/spinning. Initial physical levels are P0=6 and P1=1, restored after initial untimed correctness. Command order is fixed:

1. READY P0 and READY P1 before measurement begins.
2. P0 pre-controls; P1 remains resident and blocked.
3. P1 pre-controls; P0 remains resident and blocked.
4. Global gate on every one of32 pre A/A cells, after both complete. Any failure sends QUIT to both and skips all comparisons.
5. If all pass: P0 comparison, P1 comparison, P1 post-controls, P0 post-controls.
6. QUIT both only after both post brackets finish. A post failure disqualifies the whole new comparison; no samples/budgets change.

There is no worker end-to-end run before the other's pre-controls. Persistent stream/state/output addresses are asserted and retained; no address selection or replacement processes. One CPU is pinned for both workers, measured serially. A900-second measurement deadline begins after both READY acknowledgements and before P0 pre. Preparation/compilation are outside; timeout means incomplete evidence, never another attempt. STARTED plus nonempty-output refusal and GITHUB_RUN_ATTEMPT=1 guards prevent accidental retry.

Per family/process: pre A/A1, pre A/A6, comparison6-versus1, post A/A1, post A/A6. Chronological blocks are the outer loop across the full family grid. Each cell has12 blocks, each eight four-batch quartets, each128 complete streams per batch. Family order rotates by block and is mirrored in P1. A/A level order alternates by block/family/worker. Quartet labels are ABBA if(block+quartet+worker)%2=0, otherwise BAAB. In comparison A=physical6,B=physical1; A/A labels both use the same declared level and same function/stream.

Maximum:80 cells,30720 batch rows,3932160 timed streams. Pre32 cells/12288 rows; comparison16/6144; post32/12288. All pre controls finish even when one already looks bad. No selection, exclusions, offsets, extended samples or retries.

## Exact preparation and predecessor meaning

For family bank count K (1 or32), block b and quartet q, offset=(8*b+q)%K. All four batches have the same offset and input-bank sequence. Each batch does the following outside timing:

1. Record the actual current level before preparation: the previous measured batch's target, or the restored initial level for the first row. Record whether it differs from the new target.
2. Reset the empty persistent stream; call deflateParams(target) with no input and enough output; assert no input/output and the same internal state pointer.
3. Execute exactly eight reset+FINISH warm streams at banks **(offset-8+j) mod K, j=0..7**, in that order.

Timed operations then use banks **(offset+k) mod K, k=0..127**. Each includes deflateReset, pointer/length assignment and FINISH until stream end. No init/end/allocation/level change is hidden in a construction or switching claim: neither use case is claimed. Preparation wall time is recorded separately. Final compressed bytes/length sums are checked outside timing, and the final output of the fourth batch is inflated after each quartet.

Every row retains all eight warm-bank indices, preparation predecessor, switched/unchanged flag and target. The scorer retains counts and means by predecessor/target/phase/family and per-block counts, without deleting those rows from the main estimates. These are descriptive strata, not a bias subtraction. The result is limited to this fixed eight-warm-stream recipe; no independence from predecessor level, cache state or application switching cost is claimed. After the eight warm streams the immediately preceding completed stream is already at the target; “switched” refers to the pre-preparation level, not that immediately preceding warm stream.

## Exact contrasts and inference

Let y_i=wall_ns_i/128 for batch i in one quartet. Each label occurs twice. The signed quartet contrast is **d_q=(sum_A y_i-sum_B y_i)/2**. Thus ABBA uses(y0+y3-y1-y2)/2, and BAAB uses(y1+y2-y0-y3)/2. Positive comparison benefit means physical6 costs more than physical1. Use the same label contrast in A/A.

Each block observation is **D_b=(1/8)*sum_q d_q**. Only these **12 chronological block observations** enter mean, sample standard deviation, SEM=sd(D)/sqrt(12), and confidence intervals. No batch-row/quartet pseudoreplication. Each process's equal-family aggregate block is the arithmetic mean of its eight family D_b values from that same global block; every128-stream batch visits each bank equally.

Every pre/post A/A cell must meet **abs(mean(D))+2.201*sd(D)/sqrt(12)<=100ns**. This original tiny criterion is unchanged. There is one allocation/slot here, so no separate two-slot contrast exists. Counters and CPU times are retained without exclusions.

There are18 benefit estimates:8 families plus1 aggregate in each of2 processes. Use **two-sided Bonferroni Student-t**, df11, critical **t_11(1-0.05/(2*18))**. Every interval uses only its12 block observations. No process pooling can cancel a failed process.

Approved practical-success criteria, applied only after all pre/post controls pass:

- Both aggregate simultaneous lower bounds are at least500ns per complete stream.
- Every family simultaneous lower bound is at least-100ns.
- Aggregate point means are positive in both ABBA/BAAB order strata, in both processes.
- Every payload's complete compressed output is at most8 bytes larger at physical1 than at physical6.

Report all ties, failures and byte deltas/ratios. Failure of any condition means no broad native reuse64 recommendation; no favorable subset or modified threshold. The result cannot resolve the original approximately350ns stock/ng6 regression.

## Correctness and retained evidence

Before/after, every bank/level's persistent reset output is compared to a fresh initialization at the same level, both stock-inflated and byte-compared to input. These fresh streams are untimed correctness references, not lifecycle timing. Every measured batch checks the entire output-length sum and final compressed bytes against its before reference. Representative final outputs are inflated per quartet; not every timed stream is inflated. C assertions preserve the same persistent state through every reset/FINISH/parameter operation.

Retain source/manifest/full schedule before measurement, all payloads, compressed outputs, raw rows, maps/function/state/buffer addresses, coordination acknowledgements, exact build/environment/binary identities, every control and all18 block-based estimates. One native Linux job prints a bounded read-only evidence export after completion and uploads all outputs even on failure; export never runs measurements. No separate evidence-reader publication or runner is needed.

Stock-relative benefit/bytes, native fresh lifecycle including calloc/init/end/free,32/128/raw coverage, ordinary/long costs and correctness transitions, actual-Java reset/finish and new/end, and dynamic parameter/JNI switching remain distinct mandatory shipping qualifications. They cannot borrow this calibration. In current PR6, public Java level1 selects physical ng2. No mapping/default change is authorized by a positive native result.
