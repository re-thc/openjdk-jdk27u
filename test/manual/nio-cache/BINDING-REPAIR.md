# Native worker identity admission

## Exact failure and source cause

The e9c9bf5 diagnostic timed out in admission despite its fork completing five
warmups and two iterations. The counter collector never started. Read-only
inspection of live inspection-process and parent task directories established
that their `stat`, `status` and `schedstat` views exist, but `children` returns
ENOENT while the same tasks are alive. The required child-list view is absent
in this saved environment; this is not an authorization denial or evidence
that the JMH fork failed to start.

The old admission function caught FileNotFoundError for each task's children
file as if the task had exited, then returned an empty child set. Consequently
worker discovery could never be reached on this environment. Increasing the
admission deadline or adjusting a thread-name truncation rule would not repair
that prerequisite. The failed receipt and incomplete logs remain unchanged.

## Repair and guarantees

The optional diagnostic now has a versioned, nonce-checked handshake written
once by the benchmark's trial setup. It reads `/proc/thread-self/stat` to obtain
the **native** worker TID and starttime, pairs them with the JVM PID and exact
benchmark identity, and exclusively creates the binding file. Direct stream
I/O avoids using NIO's temporary-buffer cache for this protocol. The protocol
is inactive unless both observer properties are configured; it runs outside
all existing warmup/measurement windows and adds no timed-loop operation.

The controller checks executable, actual ForkedMain argv (including nonce and
binding path), parent/group/session, and kernel PID/TID starttimes. A full
owned-descendant audit must agree before the seven-file collector is bound.
No children files, worker-name assumptions or Java thread IDs participate.
Missing and partial records remain pending only within the existing8-second
admission cap; incorrect records fail. Poll count, byte count and last state
survive in failed receipts. Collection and cleanup retain their prior limits,
identity protection, subreaping and group/escaped-descendant handling. Transient
extra children between full audits remain outside the detection guarantee.

## Demonstrated readiness and remaining prerequisite

Read-only inspection confirmed `/proc/thread-self/stat` reports the inspection
thread's native ID and matches its task stat starttime. A single bound-file
visibility read succeeded for the required scheduling/context files without
any JVM launch. The missing `children` view is recorded but is not required.
Preparation and runtime preflight repeat the mandatory checks and stop before
Popen if a required view is unavailable. There is no silent counter fallback.

Realistic offline fixtures cover the actual taskset/coordinator/ForkedMain
command shapes, absent children views, delayed and partial handshakes, arbitrary
worker names, ancestry/command/nonce mismatches, reused or vanished identities,
and admission-stage timeouts. Launch-guard tests prove unavailable required
views and stale classes cannot reach Popen. The existing compiled fixture was
inspected offline and **correctly rejected** because it predates this protocol.

The revised Java fixture has not been compiled or executed: neither is currently
authorized. Before a later run, compile the current source with the repository
README commands and prepare fresh inputs. Protocol constant-pool markers reject
old artifacts; they do not constitute full bytecode verification or prove
source-to-bytecode identity. The compiler, generated registration/hints and all
class bytes must be retained and frozen for any approved execution. No JDK
rebuild or external/private handoff is required. No new runtime is requested by
this source repair, and neither failed attempt may be retried automatically.
