# DateFormatSymbols array sharing

The six symbol arrays from private locale templates are shared by ordinary
`DateFormatSymbols` instances and their clones. Public getters and setters
retain defensive copying. Subclass and deserialized arrays are copied when
cloned. Time-zone array copying is unchanged.

Trusted, unmodified instances share an immutable snapshot of the six array
references. Their clones copy from that snapshot without locking the source.
Setters invalidate the snapshot before replacing a field. Serialization
invalidates it and detaches shared arrays under the instance monitor before
stream hooks can expose them. A clone that already captured the snapshot keeps
using its privately owned arrays; a clone without one uses the guarded fallback.
Time-zone copying and stream callbacks run outside that monitor. Subclasses and
deserialized arrays retain conservative copying.

## Build and correctness tests

Use an installed boot JDK, native toolchain and jtreg compatible with this tree,
as described in [building.md](building.md) and [testing.md](testing.md). From the
repository root, with `BOOT_JDK` and `JTREG_HOME` set to their installation homes:

```sh
bash bin/configure-dev --with-conf-name=review \
    --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME"
make CONF=review JOBS=4 images
make CONF=review JOBS=4 test \
    TEST='test/jdk/java/text/Format/DateFormat test/jdk/java/util/Locale test/jdk/sun/util/locale/provider test/jdk/java/util/PluggableLocale' \
    JTREG='JOBS=2;TIMEOUT_FACTOR=4;JAVA_OPTIONS=-XX:ActiveProcessorCount=4 -Xmx512m'
```

Run the focused ownership tests with explicit collectors:

```sh
for gc in Serial G1 Z; do
    make CONF=review JOBS=4 test \
        TEST='test/jdk/java/text/Format/DateFormat/DateFormatSymbolsSharingTest.java test/jdk/java/text/Format/DateFormat/DateFormatSymbolsSerializationAliasesTest.java test/jdk/java/text/Format/DateFormat/DateFormatSymbolsConcurrentSerializationTest.java' \
        JTREG="JOBS=1;TIMEOUT_FACTOR=4;JAVA_OPTIONS=-XX:ActiveProcessorCount=2 -Xmx512m -XX:+Use${gc}GC"
done
```

The concurrent serialization test uses JDI to pause the writer immediately
after an array is detached, then starts a clone on another thread. It traces
the source, clone and hook-retained array identities and checks isolation after
both threads finish. A second schedule replaces the array through a setter
while the writer is paused. Other tests cover all six getters/setters,
subclasses, providers, serialized graph aliases, time zones, formatting/parsing,
concurrent locale-cache access, and cloning from stream callbacks on both the
writer thread and a separate worker.

A third JDI schedule stops a clone after it captures the immutable snapshot,
lets serialization finish and a hook mutate the exposed source array, then
resumes the clone's reference copies. The clone and locale cache must remain
isolated. The original two partial-detachment schedules still execute.

## Allocation reproduction and qualification

[DateFormatSymbolsFootprint.java](../test/micro/org/openjdk/bench/java/text/DateFormatSymbolsFootprint.java)
contains standalone compile, javaagent packaging and run commands. Its
`allocation` mode measures retained array identities and thread allocation
without collecting timings. Compare baseline and candidate JDKs in fresh JVMs
with identical options. Array counts cover the six symbol arrays; the probe
also reports instance and deduplicated snapshot bytes separately. Strings,
time zones and other cache storage are excluded.

Current matched Linux x64 diagnostics use this fork's four-byte headers. For
1,000 ordinary Locale.US instances or clones, Serial/G1 six-field storage falls from
6,000 arrays/46,000 reference slots/240,000 shallow bytes to six arrays/46
slots/240 bytes. The cohort also reaches one 32-byte snapshot; instances remain
56 bytes. The measured subset including all 1,000 instances therefore falls
from 296,000 to 56,272 shallow bytes.

ZGC uses wider references: array storage falls from 416,000 to 416 bytes, but
the added reference increases each instance from 88 to 96 bytes and the cohort
reaches one 56-byte snapshot. Including these costs, the measured subset falls
from 504,000 to 96,472 bytes. The probe reports array, instance and snapshot
storage separately. Strings, time zones and other cache storage are excluded;
these are not whole-process retention or RSS estimates.

The constructor and clone thread-allocation probes observe 240 fewer bytes per
operation with Serial/G1 and 408 with ZGC. Formatter construction also includes
other allocations and JIT-dependent variation; retain the measured ranges.
Serialization of a fresh shared instance detaches its arrays, so applications
that serialize every instance do not retain the same six-array sharing benefit;
the additional ZGC instance storage remains.

The final interleaved comparison observes 41–54% faster lazy-zone clones in the
selected conditions, but about 11% slower warm-zone clones under Serial and
smaller G1 warm-zone costs. Sharing is a measured memory/CPU tradeoff. Workloads
dominated by initialized time-zone-table cloning should evaluate that cost
before selecting this component. Parallel region-override construction remains
outside the claim because of an inherited shared-Builder race documented in
the validation record; override ownership is tested sequentially.

The [comparison guide](memory-overhead-native-decision.md) covers dedicated JMH
construction/clone/format/parse, a shared read-only clone prototype, and fresh
first-write serialization. The serialization setup verifies a round trip; a
standalone current-image smoke check produces identical wire bytes on baseline
and candidate. Allocation-agent runs remain separate from timed forks. See the
[validation record](memory-overhead-validation.md) for actual runtime costs,
controls, source identities and platform limits. Earlier throughput observations
remain historical and do not qualify later clone/ownership implementations.
