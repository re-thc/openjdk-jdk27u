# Scanner lazy numeric locale data

Source baseline: `89885a6288e7aaabd01678a704a586272c0f96e3`.
Implementation: `b2adcf68944f1251cf1b7b09e9cc5c1d58e37153`.
Reviewed source/test head: `c5f0e0b4918007062a500594a9640c4ecffa8e9c`.
This is a source-review milestone; integration qualification remains incomplete.

Text and boolean scanning do not need numerical locale symbols. This change
captures the selected locale and provider preference immediately, then defers
numeric symbols and affixes until a numeric pattern or `toString()` needs them.
Every configuration containing SPI or HOST retains eager provider calls and
string snapshots. Existing locale, radix, pattern-cache and type-cache behavior
is preserved. The initializer stays outside numeric parsing compilations.

## Build and regression tests

Use installed platform build dependencies, a JDK 27 boot JDK and jtreg 8.3.
Set `BOOT_JDK` and `JTREG` to their installation directories. From this checkout,
add any dependency options required by the platform to the normal configure:

```sh
bash configure --with-conf-name=scanner --with-debug-level=release \
  --with-jobs=4 --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG" \
  --with-jvm-features=-shenandoahgc
make CONF=scanner JOBS=4 jdk images

for collector in G1 Serial Z; do
  JAVA_HOME="$BOOT_JDK" "$JTREG/bin/jtreg" \
    -jdk:build/scanner/images/jdk -conc:2 \
    "-javaoptions:-XX:+Use${collector}GC" \
    "-w:build/scanner/scanner-${collector}-work" \
    "-r:build/scanner/scanner-${collector}-report" \
    test/jdk/java/util/Scanner
done
```

The regression tests cover locale capture and reset, numeric caches, radix and
validation, non-ASCII digits, locale extensions, debugging symbols, stateful
NumberFormat/DecimalFormatSymbols providers, callback ordering, mutable
snapshots, immediate failures and reentrant locale changes.

## First-use reproduction

Build the baseline in a separate ordinary checkout using equivalent options.
Use the normal `images/jdk` images so both have their generated default CDS
archives. Set `BASE_JDK` and `CANDIDATE_JDK` to those image directories.
In a separate probe directory, save this as `ScannerLocaleProbe.java`:

```java
public class ScannerLocaleProbe {
    public static void main(String[] args) {
        System.out.println("READY");
        long start = System.nanoTime();
        if (args.length == 0 || !args[0].equals("empty")) {
            try (var scanner = new java.util.Scanner("alpha\nbeta\n")) {
                scanner.nextLine();
            }
        }
        System.out.println(System.nanoTime() - start);
    }
}
```

```sh
"$BASE_JDK/bin/javac" ScannerLocaleProbe.java
for mode in empty line; do
  "$BASE_JDK/bin/java" -Xms32m -Xmx128m -XX:+UseG1GC \
    -Duser.language=en -Duser.country=US \
    "-Xlog:class+init=info:file=base-${mode}.log" \
    -cp . ScannerLocaleProbe "$mode"
  "$CANDIDATE_JDK/bin/java" -Xms32m -Xmx128m -XX:+UseG1GC \
    -Duser.language=en -Duser.country=US \
    "-Xlog:class+init=info:file=candidate-${mode}.log" \
    -cp . ScannerLocaleProbe "$mode"
done
```

The candidate text trace should avoid initializing NumberFormat, DecimalFormat,
DecimalFormatSymbols and CLDR provider machinery. Verify archive mapping with
`-Xlog:cds=info` in a separate run. For timings, remove logging, run alternating
fresh-process pairs, retain an empty control and separate time to READY from
the printed first-operation duration. Keep builds and other measurements idle.
Repeat with Serial/ZGC as needed; CDS-off is a separate diagnostic.

## Qualification limits

On Linux x64, the original eight Scanner jtreg tests passed on the baseline with
the default collector and on the candidate with G1, Serial and ZGC. At the reviewed head, the full ten-test suite
passed with G1; the two additional tests passed separately with Serial and ZGC.
This is not a fresh full ten-test run with each collector. The non-DecimalFormat
test also passed on the baseline. The new class-initialization guard failed on
the baseline as intended: it asserts the candidate's lazy behavior, rather than
compatibility. Its CDS-off child VMs expose initialization order; they are not
the source of the default-CDS timing measurements.

The measured images contain the same production source tree as the reviewed
head, but were built before its test-only commits. They must not be described
as fresh builds of that exact head. Default-CDS first text use and instrumented
thread allocation improved on the one measured Linux x64 host. Long numeric
construction checks were within 1% of baseline, but the shorter 10k-warmup /
20k-measurement checks showed double construction about 8.5% slower and integer
token scanning about 4% slower. These remain unresolved protected signals;
longer warmup does not supersede them. There is no demonstrated JVM-readiness
gain or general numeric-neutrality result.

Linux AArch64, macOS arm64 and Windows x64 execution remains unverified. Native
HOST settings behavior was source-reviewed; only Linux HOST fallback was
exercised. No cross-platform, native-memory or universal throughput claim is
supported. The next bounded decision is specified in
[the qualification milestone](scanner-qualification/README.md).
