# DateFormatSymbols array sharing

The six symbol arrays from private locale templates are shared by ordinary
`DateFormatSymbols` instances and their clones. Public getters and setters
retain defensive copying. Subclass and deserialized arrays are copied when
cloned. Time-zone array copying is unchanged.

Before serialization exposes arrays to stream hooks, it detaches shared arrays
and disables further sharing from that instance. Cloning and detachment use the
same instance monitor; stream callbacks run after that monitor is released.
This preserves serialization graph aliases without exposing a clone's arrays.

## Build and correctness tests

Use an installed boot JDK, native toolchain and jtreg compatible with this tree,
as described in [building.md](building.md) and [testing.md](testing.md). From the
repository root, with `BOOT_JDK` and `JTREG_HOME` set to their installation homes:

```sh
bash configure --with-conf-name=review \
    --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME"
make CONF=review JOBS=4 jdk
make CONF=review JOBS=4 test \
    TEST='jdk/java/text/Format/DateFormat jdk/java/util/Locale jdk/sun/util/locale/provider jdk/java/util/PluggableLocale' \
    JTREG='JOBS=2;TIMEOUT_FACTOR=4;JAVA_OPTIONS=-XX:ActiveProcessorCount=4 -Xmx512m'
```

Run the focused ownership tests with explicit collectors:

```sh
for gc in Serial G1 Z; do
    make CONF=review JOBS=4 test \
        TEST='jdk/java/text/Format/DateFormat/DateFormatSymbolsSharingTest.java jdk/java/text/Format/DateFormat/DateFormatSymbolsSerializationAliasesTest.java jdk/java/text/Format/DateFormat/DateFormatSymbolsConcurrentSerializationTest.java' \
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

## Allocation reproduction and qualification

[DateFormatSymbolsFootprint.java](../test/micro/org/openjdk/bench/java/text/DateFormatSymbolsFootprint.java)
contains standalone compile, javaagent packaging and run commands. Its
`allocation` mode measures retained array identities and thread allocation
without collecting timings. Compare baseline and candidate JDKs in fresh JVMs
with identical options. The retained counts cover the six symbol arrays only;
they exclude strings, instances, time zones and other cache storage.

Existing Linux x64 validation passed 126 locale/formatter tests with one skip,
plus all three focused tests under each of Serial, G1 and ZGC. For 1,000 ordinary
instances or clones, the six-field arrays fell from 6,000 arrays/46,000 reference
slots to six arrays/46 slots. Allocation-only verification after the monitor
repair retained the savings and unchanged instance sizes.

Throughput is not established for the repaired clone path: the added monitor's
cost is unmeasured. An earlier grouped run showed roughly 2.4% slower Serial
formatter construction; a controlled follow-up did not establish a consistent
loss after accounting for unchanged controls. Those historical results do not
qualify the new clone monitor. Runtime qualification remains limited to Linux
x64; Linux AArch64, macOS arm64 and Windows x64 have not been run.
