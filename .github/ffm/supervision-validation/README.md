# One bounded supervision validation for source review

**Not authorized to execute by publication.** This is one prepared validation of
the reviewed Linux collector owner, not an FFM measurement or a retry of a spent
campaign. Use the existing retained native Linux ARM64 VM after its actual
interfaces and ownership contract are inspected. Do not assume a different VM
has working procfs, wait/subreaper semantics or an init that reaps children.

`inspect_host.py` only reads the current architecture, boot/PID1 identity, own
task/children interfaces, namespace identifiers and available wait/prctl symbols.
It launches no children, calls no wait/prctl operation, sends no signals and
changes no settings. Run it on the selected existing VM before live approval:

```sh
python3 inspect_host.py --out "$FFM_FRESH_HOST_BINDING"
```

Its exit zero means the read-only prerequisites are present, not that containment
works. Bind the actual VM/container name and normal entry command separately.
Identify its existing init/reaper and ownership follow-through from actual VM
configuration. PID1's name alone is not functional reaping evidence. Missing or
incompatible interfaces stop this path; install nothing and change no settings.

After explicit approval, execute this once from this directory:

```sh
python3 validate_supervision.py --kit ../performance-decision-216 \
    --host-binding "$FFM_FRESH_HOST_BINDING" --out "$FFM_NEW_VALIDATION_OUTPUT"
```

The kit manifest must be SHA256
`4d0578a07aca7d7bd10738aa56ae7f76634a83f1792b33cf51b9095674e98abc`
from reviewed runner `24788e9d47d3401653fdc0b044f815a85605f908`.
The production supervisor bytes are also pinned. This added directory changes
no file in that reviewed measurement kit and creates no execution grant/bindings.

All fixtures and an independent outer observer are in `validate_supervision.py`.
There are at most five descendant processes in total: one worker, three fixture
launches, and one forked child. Cases run once and stop on a failed case:

1. A normal collector exits and is reaped without intervention.
2. A TERM-ignoring collector must be killed and reaped.
3. A parent exits after its TERM-ignoring child establishes a separate session;
   the production owner must adopt, kill and reap that exact escaped child.

Each production endpoint is six seconds. The independent outer owner has a
25-second allowance including cleanup, deferred INT/TERM/HUP handling and bounded
cleanup on ordinary post-launch failures. TERM begins by second 21 and KILL by
second 23 when scheduled normally. No signal is authorized after the endpoint;
only nonblocking reaps/observation remain. Fixtures also have ten-second alarms.
All signals require current exact unreaped child ownership. ECHILD is required
to prove final cleanup; an empty procfs snapshot alone is insufficient.

Retain intent, launch and fixture identity files, each production supervision
receipt, cases.json, driver.log, outer.json and the actual command exit status.
Success requires three expected case results, complete reaping, no independent
outer intervention, actual zero worker return and an in-budget final observation.
OS/filesystem stalls may prevent termination or receipt writing: report missing
evidence/pending PIDs as failure and verify current ownership with the actual
VM reaper before any follow-through. Never signal a historical bare PID.

There are no JVMs, builds, native libraries, FFM calls, installations or global
namespace/cgroup/PID1 changes. No automatic retry or performance run follows.
Success establishes this limited supervision check only. The original FFM
controls, slowdown holds, source pins and separate execution grant still apply.
