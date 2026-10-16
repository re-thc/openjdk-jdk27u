# Observer repair: attribution, budget and detection limits

The first approved scheduling attempt is preserved as a failed observation.
It completed within its90-second scope, with normal JVM exits and complete
cleanup, but captured only three worker samples. Their gaps were2316ms and
2959ms against a30ms limit. Observer CPU consumption was95.99% of one CPU
against2%. No iteration could be admitted. None of those timing results is a
performance pass; there was no automatic retry.

## Identified cause

One separately instrumented, read-only invocation of the legacy ownership
snapshot (no workload or JVM launched) took3.0605seconds wall and3.0003seconds
CPU on the process-dense saved host. It read17707process records and executed
about2.14million Python calls. Of its wall time,2.365seconds accumulated in
`Path.glob('[0-9]*/stat')`, which scans both the root and process directories;
reading the17707stat files accumulated another0.468seconds. Thus each collection
tick did work proportional to the entire host process table before reading the
worker. This directly explains the observed multi-second gaps and high CPU
consumption. It was not evidence of slow per-worker scheduling-counter reads.

The ownership graph also depended on the whole table, though the glob/reads
dominated the instrumented invocation. Global scans still have a role in
ownership auditing, but they cannot run at50Hz on this host. The auditor now
uses one root `os.scandir` and direct known-PID stat reads; signal-time identity
revalidation likewise reads only the owned PID rather than rescanning the table.

## Collection design

Admission now consumes a nonce-checked trial-setup native identity handshake,
checks PID/TID starttimes, executable, actual ForkedMain command line and isolated
group/session, and performs a full owned-descendant audit. The superseded
child-list/name discovery path failed on this environment; see `BINDING-REPAIR.md`. Then the identities are immutable. Collection
holds seven descriptors and performs exactly eight bounded reads per tick,
including two worker identity reads around the scheduling counters. Each read
is limited to16KiB; acquisition bounds include the context counters. There is
no process/task enumeration, glob, global ownership scan, or worker rediscovery
in collection. Object disappearance never triggers rebinding.

Global audits resume after collection. Subreaping, a verified isolated-group
kill, individual cleanup of descendants that escape the group/session, and the
kernel child query cover persistent/adopted descendants. Cleanup retains the
existing two-second reserve; inability to finish is inconclusive, never a pass.
Tests exercise both group cleanup and an escaped descendant while preserving
preexisting outside processes. Recycled PID/TID identities cannot be accepted
or deliberately signaled using stale identity evidence.

The collection loop intentionally cannot detect a short-lived unexpected child
that appears and vanishes between audits. Expected
process creation is constrained by the one-fork JMH command and disabled helper
probes; full process-event accounting would need a different facility. Receipts
state this limitation instead of claiming that bound identities prove the
absence of every transient process. A retained unexpected child or an adopted
zombie causes an audit failure, even when later cleanup succeeds.

## Offline budget evidence

Reproduce without any JVM or child launch:

```sh
python3 -m unittest discover -s test/manual/nio-cache -v
python3 test/manual/nio-cache/replay_observer.py
```

The replay opens synthetic procfs-shaped files with representative scheduling
and CPU-context text sizes. It performs600samples, JSON encoding/buffered output,
seven fixed-path output-size checks per tick, and stage instrumentation. There
are no sleeps: CPU cost is divided by the nominal12seconds that600ticks occupy
at50Hz. After the handshake repair, one measured replay used25.392ms total CPU
(0.2116% of one CPU), comprising11.426ms bound reads,6.007ms encoding/writes,
5.809ms size checks, and remaining instrumentation/loop costs. The2% budget
corresponds to240ms over that nominal span, approximately9.45times the observed
synthetic cost.

This is a feasibility estimate, not live-runtime qualification. Synthetic files
do not reproduce procfs kernel generation, timer wakeups, contention, actual
process scheduling, or every filesystem effect. The repaired observer keeps
the live2% CPU,5ms acquisition,30ms gap, monotonicity and bracketing gates;
none is relaxed based on the replay. Per-stage CPU/wall/max durations in future
receipts attribute admission, audit, read, serialization, size-check, analysis
and cleanup cost. Collection-wide CPU includes stage accounting and wakeups;
admission/shutdown costs are recorded separately rather than diluted into that
fraction.

The previous failed receipt and its archive are not rewritten. This repair is
source/offline-tested only. A further live diagnostic requires a fresh checkout,
frozen inputs and a new bounded approval; it is not authorized by the earlier
attempt. No new JVM, build, compilation or CI job was used for this repair.
