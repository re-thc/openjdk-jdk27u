# Native decimal parsing with fast_float

The header-only fast_float import uses the MIT license. Its release and full
revision are pinned in `make/data/fast_float/version.txt`; the distributed
license is `src/java.base/share/legal/fast_float.md`.

## Floating-point parsing

`FloatingDecimal.parseFloat` and `parseDouble` share the native adapter.
`UseFastFloatIntrinsics` enables it by default on all platforms. Interpreter
and C1 leaf entries support little-endian x86-64 and AArch64; C2 uses a shared
runtime leaf. Other interpreter/C1 ports, including Zero, use JNI.
`-XX:-UseFastFloatIntrinsics` selects Java throughout. Disabling
`_parseFastFloat` or `_parseFastFloatDigits` with `DisableIntrinsic` or
`ControlIntrinsic` retains JNI.

The String adapter reads Latin1 or native-endian UTF16 storage directly and
accepts at most 1,024 code units. It handles Java trim whitespace, a leading
plus and an optional `f/F/d/D` suffix, and requires complete consumption.
Unsupported syntax returns a NaN sentinel to the Java parser, preserving
symbolic values, hexadecimal literals and exception behavior. Range errors
produce correctly rounded signed zero or infinity. Float parsing rounds
directly to binary32 before widening to the common double-valued native ABI.

The DigitList adapter accepts 8–768 trusted ASCII digits and a decimal point
position. It tokenizes the significant prefix with eight-digit scans and keeps
its complete span for exact rounding. The adjusted exponent uses 64-bit
arithmetic. Shorter inputs retain the Java fast path.

Both leaves are bounded, allocate nothing and cannot safepoint while holding
interior array pointers. String loads use normal GC barriers; C2's memory
dependency orders input reads. JNI resolves arrays in VM state and calls the
same kernels. Java eligibility checks are forced inline so disabled controls
can fold away in compiled callers.

BigDecimal reuses an existing cached decimal String only during full
`floatValue`/`doubleValue` conversion. Exact arithmetic, simple conversions,
zero and obvious overflow/underflow paths run first. Uncached values and large
representations retain the arithmetic algorithm.

## Integer parsing

The integer `from_chars` overloads serve signed and unsigned Integer/Long
String-and-radix methods in interpreter-only execution on x86-64 and AArch64.
The leaf accepts decimal radix, at most 1,024 code units, one leading plus and
complete ASCII text. Rejected inputs return to Java, preserving Unicode digits,
other radices, overflow, null handling and exceptions. A result whose bits
equal `Long.MIN_VALUE` also uses Java because those bits encode the sentinel.

`UseFastIntegerIntrinsics` is independent of floating-point parsing and defaults
on for Linux x86-64 and AArch64. Other supported platforms require explicit
enablement. The IDs are
`_parseDecimalInt`, `_parseDecimalLong`, `_parseUnsignedDecimalInt` and
`_parseUnsignedDecimalLong`. Their controls select the original Java entry.
Tiered VMs, counted execution and debugger events retain normal Java entries
and profiling; C1/C2 compile the existing bodies. CharSequence and BigInteger
parsing retain Java.

## Updating and testing

Check out a clean upstream release tag, then run:

```sh
python3 make/scripts/update-fast-float.py /path/to/fast_float
```

The updater requires an unmodified release at least v8.3.2, copies headers
without local patches, and records the release, revision and MIT license.
Review the vendor diff and run parsing and precision tests before updating:

```sh
make CONF=<configuration> images
make CONF=<configuration> test TEST='test/jdk/jdk/internal/math/FloatingDecimal test/jdk/jdk/internal/util/DecimalDigits test/jdk/java/lang/Float test/jdk/java/lang/Double test/jdk/java/lang/Integer test/jdk/java/lang/Long test/jdk/java/math/BigDecimal test/hotspot/jtreg/compiler/intrinsics/fastfloat test/hotspot/jtreg/compiler/intrinsics/decimalinteger'
```

The differential tests compare raw bits and exception behavior with Java
across execution tiers, UTF16, JNI and opt-outs. WhiteBox tests verify
intrinsic controls and that integer methods keep their compiled Java bodies.
