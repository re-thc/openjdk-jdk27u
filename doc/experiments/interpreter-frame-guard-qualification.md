# Forced-poll and late-breakpoint qualification

Source `dff603c8988` adds bounded regressions for the two open shared-entry
checks. Both release and fastdebug pass a forced armed-local-poll test and a
real breakpoint installed after native-prefix preparation, using preparation
actions 0, 4 and 5. The existing pilot fixture and five direct-baseline tests
also pass on both images: fourteen jtreg results in total.

These close the requested concrete fallback checks within the current pilot
contract. The poll case exercises normal disarm-poll processing without queued
handshake work. The debugger case installs the breakpoint late, with the
startup-only capability already reserved and conservative fallback already in
effect. Neither case is an application-performance or arbitrary-tooling claim.

The preceding [shared-guard report](interpreter-frame-shared-guards.md) and its
source/images remain preserved. No admission hook, opcode expansion, ordinary
C1/C2 policy change, default enablement, performance campaign or public action
accompanies this qualification.

## Forced armed poll: an actual guard and runtime path

Existing WhiteBox native/VM APIs process pending local polls on their return
transition. They cannot deterministically leave the poll armed at this later
interpreter entry guard. The new seam is deliberately restricted to WhiteBox:
one primitive MethodCounters test byte and two allocation-free runtime leaves.
Generated hooks are present only with UseInterpreterFramePilot and WhiteBoxAPI.
The byte is initialized and cleared for CDS; it retains no metadata/thread
pointer and changes neither enablement nor ordinary tier policy.

The [guard fixture](../../test/hotspot/jtreg/compiler/interpreter/InterpreterFramePilotGuardTest.java)
first prepares and executes a real prefix, checking one native hit and result
54. It then requests a one-shot poll through WhiteBox action 6; action 7 checks
the pending state, and a duplicate request must refuse. The next target call
must traverse the following state sequence:

| State | Required source event |
|---|---|
| 1, requested | Explicit WhiteBox request for an already published/enabled prefix |
| 2, armed | Entry leaf consumes the request and calls SafepointMechanism::arm_local_poll_release on the current thread |
| 3, guard seen | The actual shared guard observes the nonzero polling bit and takes its normal fallback branch |
| 4, processed | The real vtos safepoint stub returns from its normal runtime call at BCP 0 |

The official arming API installs both the polling word and page values. The
unchanged fallback dispatch uses generate_poll=true. State 3 is written only
inside its actual nonzero poll branch; state 4 is recorded only after call_VM
and pop_cont_fastpath in the normal polling stub, with the live owner-checked
Method and BCP 0. A different BCI records a failing state. The return leaf gets
Method/BCP directly from the interpreter frame/registers: the JavaFrameAnchor
has already been reset by call_VM.

For the forced call, the fixture checks result 54, state 4, no native-hit
increment and the same published entry. Its following unarmed invocation must
again produce 54 and increment native hits exactly once. This proves both
ordinary fallback and subsequent resumption, rather than merely observing a
polling bit from a later WhiteBox transition.

The leaves perform atomic state operations, metadata comparisons and official
poll arming only. They allocate nothing, acquire no lock, wait for nothing and
perform no VM transition. Entry registers are saved/restored; the post-runtime
hook preserves canonical vtos state and uses the restored BCP. Assertions and
the original guard checks remain enabled. No handshake is allocated/enqueued
from a leaf: that would violate its explicit allocation/blocking contract.

This validates an armed local poll and its legitimate no-work/disarm processing
through the ordinary runtime. It does not claim to test a queued handshake,
concurrent GC completion or all safepoint latency behavior.

## Breakpoint installed after prefix preparation

The focused [native JVMTI test library](../../test/hotspot/jtreg/compiler/interpreter/libInterpreterFramePilotGuards.cpp)
reserves breakpoint and local-variable capabilities in Agent_OnLoad. Event
delivery starts disabled. The Java test then prepares and enables a prefix for:

```java
static int lateTarget(int x, int y) {
    int sum = x + y;
    return sum + x;
}
```

Only after preparation and recording its native entry does the test install a
real breakpoint at BCI 2, the interior iadd. Observed preparation checks that
this BCI is inside the generated prefix; the silent producer shares the same
generator. All cases verify a nonzero, enabled native entry and no nmethod.

At each event, the agent checks the exact Method/location and top-frame BCI,
reads locals x=17 and y=20, changes x to 100 with SetLocalInt, then reads it back.
The already loaded operands at BCI 2 remain 17/20, so sum becomes 37 and the
later iload of x must observe 100. The test requires result **137**, not the
ordinary result 54, for three calls and exactly three breakpoint events. Native
hits remain unchanged and the prepared entry remains present during these
breakpointed calls. After ClearBreakpoint, result 54 returns and event count
stays three. This verifies debugger-visible location, local mutation and clear
semantics, rather than only an unchanged arithmetic result.

HotSpot makes can_generate_breakpoint_events available during OnLoad; its
acquisition already enables conservative global tooling guards. The test
explicitly checks ordinary fallback before installing the breakpoint. It
therefore verifies late SetBreakpoint with a prepared prefix, while preserving
that existing restriction. It does not demonstrate live acquisition after
active pilot execution, or isolate the per-method breakpoint-count guard from
the global capability guard. The existing pilot fixture separately retains
its active-prefix-to-late-JFR-fallback check. No guard/capability restriction
was bypassed to manufacture an active-debugger case.

## Execution evidence and limits

Independent source review accepted the concrete test hooks, frame/register
handling, leaf restrictions, test-state lifetime, native-source discovery and
JVMTI oracle before execution. The new guard driver verifies six child JVMs
per build: poll and breakpoint cases for each of the original VM-thread
observed, requesting-thread observed and observation-free producers. All twelve
child outcomes are summarized in
[cases](direct-baseline-data/interpreter-guards-cases.tsv). These rows summarize
assertions required by a passing driver; they are not timing samples.

Both builds also pass the existing pilot fixture, including Serial/G1, GC/oop
identity, late JFR, handoff/deoptimization, concurrency, exhaustion and unloading,
and the five direct tests (basic, instance, long, handler and stale install).
See the complete [test ledger](direct-baseline-data/interpreter-guards-tests.tsv)
and [source/libjvm/native-library hashes](direct-baseline-data/interpreter-guards-images.tsv).
No build or semantic test failed in this qualification run.

The test library alone was compiled from its registered native test source and
supplied through jtreg's nativepath; no full native-test image or wider campaign
was needed. VM builds ran sequentially with JOBS=3 and the recorded landed
logging prerequisite. All owned commands were reaped. PID1's zombie set is
unchanged at twenty; available workspace space is 3.3 GiB. Previous shared-guard
images were hash-checked unchanged. Raw logs, native symbols, test reports and
new images remain private under `/workspace/interpreter-frame-guards`.

The new WhiteBox-only hook encoding changes the test-enabled interpreter
image; old timing cohorts remain separate. No new CPU, wall, repayment or
throughput estimate is inferred from these correctness tests. The early-tier
admission and application-payoff questions remain open.

A subsequent [six-JVM matched comparison](interpreter-frame-match.md) measures
the preserved observed reference against the observation-free route, rotates
first preparation, and retains all request/setup/execution outcomes. It changes
only the measurement harness and makes no application-adoption claim.
