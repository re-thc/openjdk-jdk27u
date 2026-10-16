# Native decimal formatting with Żmij

The floating-point and integer imports share a pinned upstream revision in
`make/data/zmij/version.txt` and use the MIT license option. The distributed
license is `src/java.base/share/legal/zmij.md`; local patches and vendor
verification sources are in `make/data/zmij`.

## Floating-point formatting

`UseZmijIntrinsics` enables native formatting on little-endian x86-64 and
AArch64. Interpreter, C1 and C2 have bounded leaf entries; Zero uses JNI on
supported architectures. Other architectures retain Java.
`-XX:-UseZmijIntrinsics` selects Java. `_formatZmij` and `_decimalZmij` obey
`DisableIntrinsic` and `ControlIntrinsic`; disabling an intrinsic retains JNI.

The portable x86-64 backend uses SSE2. A separate namespace and translation
unit provide SSE4.1, selected only when CPU support and `UseSSE` permit it.
AArch64 uses NEON. Neither leaf allocates nor safepoints. The array-writing
C2 call orders allocation and initialization and records writes to byte-array
bodies; the decimal-splitting leaf is pure. JNI resolves arrays in VM state.

Wide vendor stores stay in a zero-initialized 40-byte stack buffer. Latin1
copies remain within the caller's reserved `MAX_CHARS` span; UTF16 widens only
the logical result. Canonical compact Strings receive an exactly sized,
exclusively owned copy. Noncompact Strings retain the public copying
constructor. Builders and concatenation share the text conversion entries.

Float builder append uses Java in C2 to avoid native array materialization
and copying. `_useJavaFloatAppend` folds to true only in C2; the interpreter
and C1 use native formatting. Tiny nonzero subnormals keep native formatting
so append and `toString` agree.

## Rendering and precision metadata

`java-format.patch` supplies Java's fixed range `[1e-3, 1e7)`, uppercase `E`,
unpadded exponents without `+`, and a digit after the decimal point. Zero,
infinity and NaN use Java. Finite values use a shortest meaningful significand
that round-trips to the same raw bits. This can differ from the stock JDK:
`Float.MIN_VALUE` renders as `1.0E-45` and `Double.MIN_VALUE` as `5.0E-324`.
Opt-out restores the stock choice.

BigDecimal `valueOf(double)`, Formatter, DecimalFormat and DigitList also need
precision metadata. Tiny significands at most 128 retain the Java splitter;
exact integers keep the Java fast path. Native splitting packs the
significand, exactness and rounding direction in one long, with Java deriving
the exponent. Positive zero leaves metadata unchanged. The metadata bridge
depends on private vendor tables and representation, so upgrades must pass
the production-bridge verifier.

The precision factories request forced inlining in C2 and when native
conversion is enabled in C1, so callers can optimize the metadata holder
together with the resulting value. With native conversion disabled or
unavailable, C1 applies its ordinary inlining budgets to these factories.
In that Java-only route, positive non-tiny inputs with a holder omit the
unused text buffer. Null holders, negative inputs, tiny subnormals and
native-declined paths keep that buffer.

## Integer formatting

The signed int/long kernels serve the four DecimalDigits Latin1/UTF16 writers
in interpreter-only execution, covering Strings, builders and concatenation.
C1/C2 retain the existing Java bodies and profiling. Unsigned Long's separate
decomposition remains Java.
Ordinary tiered startup also retains Java; the native entries require
interpreter-only execution without compiled-call counting.

Vendor stores may exceed the exact Java output size. The bridge uses a
32-byte stack scratch buffer and copies only the logical result, widening
UTF16 exactly. It checks the array byte length and exclusive character end
index before copying. Null or rejected bounds return to Java.

`UseZmijIntegerIntrinsics` is independent of floating-point formatting and
defaults on for Linux x86-64/AArch64, macOS AArch64 and Windows x64. Other
platforms require explicit enablement.
`_formatDecimalIntLatin1`, `_formatDecimalIntUTF16`, `_formatDecimalLongLatin1`
and `_formatDecimalLongUTF16` controls select Java. There is no integer JNI
wrapper.

## Updating and testing

Use a clean upstream checkout and a complete revision:

```sh
python3 make/scripts/update-zmij.py /path/to/zmij --commit <40-hex-revision>
```

Without `--commit`, the updater requires an exact release tag. It checks the
MIT license and applies notation, Clang compatibility and unused-instantiation
patches with zero fuzz. Before installation, it verifies the production
metadata and exact integer-store bridges against the staged vendor files,
including sanitizer checks and scalar/SIMD fallback profiles. Failed patches,
compilation or assumptions stop installation. `--cxx` selects a host C++17
compiler.

Set `BOOT_JDK` to an installed JDK 26 or 27 and `JTREG_HOME` to jtreg
8.2.1+1 or newer. From the repository root, configure a release build and
run the focused compiler-policy test, followed by the conversion suites:

```sh
bash configure --with-conf-name=zmij --with-boot-jdk="$BOOT_JDK" \
    --with-jtreg="$JTREG_HOME" --with-debug-level=release --with-jobs=2
make CONF=zmij JOBS=2 images
make CONF=zmij test TEST='test/hotspot/jtreg/compiler/c1/TestDecimalFactoryInlining.java' JTREG='JOBS=1'
make CONF=zmij test TEST='test/jdk/jdk/internal/math/ToDecimal test/jdk/jdk/internal/util/DecimalDigits test/jdk/java/lang/Float test/jdk/java/lang/Double test/jdk/java/math/BigDecimal test/jdk/java/text/Format/DecimalFormat test/jdk/java/util/Formatter test/hotspot/jtreg/compiler/intrinsics/zmij test/hotspot/jtreg/compiler/intrinsics/decimalinteger' JTREG='JOBS=1'
```

Tests cover raw-bit round trips, shortest significands, precision flags,
signed zero, subnormals, Latin1/UTF16 offsets and guarded output bounds across
execution tiers, JNI, SSE2 and opt-outs. WhiteBox verifies intrinsic controls
and the C2-only float append choice. The decimal-factory policy test verifies
actual C1 levels 1/2/3 and C2 level 4, native on/off and JNI routes, explicit
inlining directives, compilation order and initialization behavior. Its
unrelated-holder, overload and loader fixtures check that the C1 exception
is limited to the two bootstrap precision factories.
