Native macOS shared-buffer handback

Branches
  wip/io-buffer-mac-handback: shared socket staging plus qualification artifacts.
  wip/macos-sendfile-zero-count: independent baseline bug fix, commit
    66ea1e76a1e5ef7f9241c006af204d5c4b897fb7, directly on b16e63cf101.
The shared handback excludes the macOS fix. Apply that fix separately to reproduce
the combined 44-pass jtreg validation. Without it, TransferSocketChannel retains
the baseline zero-count failure on macOS. No PR or merge is part of this handback.

Timed sendfile-fix parity
  original-warmed:   A without fix, B without fix (matched).
  final:            A without fix, B with fix.
  mixed-original:   A without fix, B without fix (matched).
  inline-sensitivity: same original candidate for A and B, both without fix;
                      B alone disables staging-method inlining.
The fixed function implements file-to-socket transferTo. The harness measures
socket-to-file transferFrom; it does not call the fixed function. Keep the series
separate. The matched original-warmed series supports the shared-buffer result
independently of the final series' patch difference.

The report is ../io-buffer-macos-qualification.txt and the full summary matrix is
../io-buffer-macos-results.csv. CPU, allocation, adverse pairs and uncertainty are
retained. These Mac results cover shared buffer behavior; Linux-specific syscall
savings have not been measured.

Archive
  results/<series>/raw.jsonl: all 2,720 individual timing samples, with commands.
  paired-forks.csv: all 272 paired fork medians, including adverse pairs.
  manifest.json: source refs, patch parity, sample counts and artifact hashes.
  c2-inlining.txt, c2-tasks.json: compiler excerpts and task content sizes/durations.
  validation.txt: combined jtreg test summary.
Command paths are relative to repository root; other arguments and numeric
measurements match the local records. All original XML, stdout/stderr, native
builds and .jtr logs remain in the local build/io-20261030 and build/io-candidate
directories. No binaries or complete compiler logs are added to git.

Harness
SocketFileBench.java is the exact measured extended harness body with a license
header added. original/SocketFileBench.java preserves the original-warmed source.
The Python scripts use only the standard library. No benchmark framework is added.
The published runner writes to build/io-20261030 and refuses an existing label.
The analyzer uses the same median/bootstrap calculation as the measured runs.
Benchmarks require loopback sockets and process CPU/allocation measurement.

Re-run from repository root, with native release JDKs built using the matching
configuration described in the report. Set IO_BASELINE_JDK and IO_CANDIDATE_JDK
to the desired JDK directories; select matching sendfile patches deliberately.

  mkdir -p build/io-20261030/classes-extended
  "$IO_CANDIDATE_JDK/bin/javac" \
    --add-exports java.base/jdk.internal.access=ALL-UNNAMED \
    -d build/io-20261030/classes-extended doc/io-buffer-macos/SocketFileBench.java

  python3 doc/io-buffer-macos/run_pairs.py --label fresh-primary --pairs 8 \
    --baseline "$IO_BASELINE_JDK" --candidate "$IO_CANDIDATE_JDK"
  python3 doc/io-buffer-macos/analyze.py fresh-primary

For the original-warmed series, compile original/SocketFileBench.java into
build/io-20261030/classes-original and pass --classes with that directory. For
mixed/virtual cases, select the extended harness and repeat --case as needed:
  --case socket:7:mixed:platform
  --case socket:8192:mixed:platform
  --case empty:8192:mixed:platform
  --case socket:7:available:virtual
  --case socket:8192:available:virtual
  --case socket:8192:exhausted:virtual
Each archived row records the full command for its series. The inlining sensitivity
series uses the same candidate for both --baseline and --candidate, adding:
  --b-option=-XX:CompileCommand=dontinline,sun.nio.ch.FileChannelImpl::transferFromArbitraryChannel

Recompute archived summaries without running new benchmarks:
  python3 doc/io-buffer-macos/analyze.py "$PWD/doc/io-buffer-macos/results/final"
Repeat for original-warmed, mixed-original and inline-sensitivity. This writes
derived summary.json and summary.csv next to raw.jsonl; they are not part of the
archive. Bootstrap uses 10,000 paired resamples and seed 20261030. Per-series
summaries must remain separate because source harnesses and comparison purposes
differ. Nothing in these scripts rebuilds or pushes a JDK.
