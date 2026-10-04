# Native decimal conversion with fast_float

This change vendors fast_float **8.3.0**, tag commit
`b0ab987b3dfdde13fa1915f65ef2a5c068d9208c`, under its MIT license.
The library is header-only and has no runtime dependencies. The release and
commit are recorded in `make/data/fast_float/version.txt`; the distributed
license is `src/java.base/share/legal/fast_float.md`.

## Controls and implementation

Native decimal conversion is **enabled by default** on little-endian x86-64
and AArch64. Using this fork requires no enabling flags.
`-XX:-UseFastFloatIntrinsics` opts out and selects the existing Java implementation.
The two intrinsic IDs, `_parseFastFloat` and `_parseFastFloatDigits`, also obey
`DisableIntrinsic` and `ControlIntrinsic`. Disabling an intrinsic alone leaves
its JNI implementation available. Disabling the product flag bypasses native
conversion entirely, including BigDecimal and DecimalFormat.

`FloatingDecimal` passes the original String to a private native method.
The interpreter, C1 and C2 read its backing byte array, coder and length and
make a leaf C++ call. There is no String encoding, array allocation, JNI
transition or pinning on these intrinsic paths. Both compact Latin-1 and
native-endian UTF-16 String storage are supported. C1 uses the platform's C
calling convention through shared LIR; the interpreter has x86-64 and
AArch64 entries. C2 uses an ordinary leaf runtime call, requiring no new
machine instructions or SIMD feature checks. Other interpreter/C1 targets
use JNI.

The Java wrappers and eligibility check use `@ForceInline` so their new
guards do not push these previously tiny entry points beyond C1's ordinary
inline limit. This also lets the disabled flag fold away in compiled callers.

The leaf parser neither allocates nor reaches a safepoint. It accepts at most
1,024 UTF-16 code units. The Java entry point also gates this bound so larger
inputs proceed directly to the existing parser. Safepoint polling at the
interpreter entry and normal compiled polls remain in place. String field
loads use the normal GC barriers. The C2 call's memory dependency orders
input reads, and interior pointers never cross a safepoint. The JNI fallback
resolves arrays in VM state and calls the same bounded parser.

A float is parsed directly with `from_chars<float>`, then widened exactly for
the common double-valued native ABI. Parsing a double and narrowing it to
float would introduce double rounding and is deliberately avoided.

The adapter handles Java's leading plus, trim whitespace (code units
`<= 0x20`), and optional `f/F/d/D` suffix. It requires complete consumption,
rejects fast_float's infinity/NaN spellings, and treats range errors as Java's
correctly rounded signed zero or infinity. A NaN sentinel delegates unsupported
syntax, symbolic values, hexadecimal literals and exceptions to the original
Java parser. The sentinel cannot collide with a successful decimal conversion. Java also
skips the native call for ordinary symbolic and hexadecimal spellings.

The digit-buffer adapter uses fast_float's `parse_eight_digits_unrolled` to
tokenize at most 19 significant digits and supplies the full original digit
span to `from_chars_advanced` for exact rounding when required. The decimal
exponent is adjusted in 64-bit arithmetic, including extreme int exponents.
Inputs shorter than eight digits keep the existing Java fast path, avoiding
leaf-call overhead when a single word scan cannot be used.

## Consumers audited

| Consumer | Integration |
| --- | --- |
| Float/Double parsing, `valueOf(String)`, String constructors | Shared `FloatingDecimal.parseFloat/parseDouble` entry points |
| DecimalFormat and DigitList | `parseDoubleSignlessDigits`: 8–768 trusted ASCII digits and decimal exponent; eight-digit word scanning, no copy or Java String allocation |
| BigDecimal `floatValue/doubleValue` | Full conversion with positive scale and an existing cached decimal representation of at most 1,024 code units |
| BigDecimal simple conversions | Existing exact arithmetic, integer conversion, zero and obvious overflow/underflow paths run first |
| BigDecimal constructors, exact arithmetic, BigInteger | Retain exact precision/scale and integer algorithms; binary floating point parsing cannot implement these operations |
| Scanner floating point methods and lookahead | Already call Float/Double parsing |
| ChoiceFormat and CompactNumberFormat | Already call Double parsing; DecimalFormat's separate digit path is covered above |
| XML schema FloatDV/DoubleDV, XPath/XSLT conversions, XML durations/date-times | Already call Float/Double parsing |
| Preferences, JDBC rowsets/XML readers, JMX option parsing, Provider version parsing, locale range weights | Already call Float/Double parsing or their String `valueOf` overloads |
| AWT/Swing/CSS, beans decoders/editors, image metadata, audio configuration, Marlin and desktop property parsing | Already call Float/Double parsing or their String `valueOf` overloads |
| javac literals/options, compiler/IGV utilities, JConsole/JDI/JStat, JLine colors, JFR metadata, demos | Already call Float/Double parsing or their String `valueOf` overloads |
| Incubator Vector Float16 parsing | Its Double parsing stage benefits; its distinct binary16 rounding algorithm remains intact |
| FloatToDecimal/DoubleToDecimal and formatting | The opposite conversion uses [Żmij](zmij.md); fast_float's decimal-to-binary algorithm does not apply |

The source audit covered qualified `parseFloat/parseDouble`, the String
`valueOf` overloads and constructors, every `FloatingDecimal` reference, and
the independent conversion routines in BigDecimal, DigitList and Float16.
Primitive boxing, class-file constant decoding, binary stream readers and
floating-point arithmetic do not parse decimal text. All applicable String
consumers reach the same two entry points; DigitList is the separate trusted
digit-buffer consumer. This avoids duplicating native adapters in those callers.

BigDecimal preserves arbitrary precision and scale. Native conversion changes
only its final rounding to float/double. Uncached values stay on the existing arithmetic path: formatting a new
representation would regress cold conversions. Native conversion neither
allocates nor retains an additional String. Large cached representations
also stay on the existing arithmetic path.

## Updating the vendor copy

1. Check upstream releases and check out a clean release tag (8.3.0 or newer).
2. Run `python3 make/scripts/update-fast-float.py /path/to/fast_float`.
3. Review the header and license diff and the recorded tag/commit. The updater
   rejects tracked local changes and applies the recorded layout patch before
   installing headers. If upstream has incorporated the patch, review and
   remove it from the updater rather than applying a second field move.
4. Build, run the differential and existing parsing/math/format tests, and
   repeat interpreter/C1/C2/JNI benchmarks before committing an update.

The local patch moves `parsed_number_string_t::error` next to `lastmatch`,
reducing the structure from 72 to 64 bytes on the tested 64-bit ABI. This is
upstream issue [#418](https://github.com/fastfloat/fast_float/issues/418).
It changes layout only; parsing logic and error reporting are unchanged.
The original upstream headers can be compared with the vendor copy using
`make/data/fast_float/layout.patch`.

## Reproducing validation and measurements

The differential test uses the original Java parser as its oracle for both
precisions, including exception type/message and signed-zero bits. It runs
in the interpreter, C1, C2, UTF-16, JNI-only and disabled configurations.
The HotSpot WhiteBox test checks both intrinsic IDs at compiler levels 1 and 4
and verifies the product flag and fine-grained intrinsic controls.

```sh
make CONF=<configuration> jdk
make CONF=<configuration> test TEST='test/jdk/jdk/internal/math/FloatingDecimal test/jdk/java/lang/Float test/jdk/java/lang/Double test/jdk/java/math/BigDecimal test/hotspot/jtreg/compiler/intrinsics/fastfloat'
```

`FastFloatParsing` is a deterministic JMH benchmark covering short integers,
ordinary decimals, floating point round trips, long mantissas, hex fallbacks,
DecimalFormat's digit conversion, and cached/cold BigDecimal conversions.
It consumes every result and reports nanoseconds per conversion. The cold
BigDecimal benchmarks include construction and create fresh objects.

With JMH 1.37 core, annotation processor, jopt-simple and commons-math jars in
the classpath, the following runs all three execution tiers and both fallback
controls and saves raw JSON and logs:

```sh
taskset -c <cpu> make/scripts/bench-fast-float.sh /path/to/jdk '/path/to/jmh/*' /path/to/results -f 3 -wi 3 -i 3 -w 500ms -r 500ms
```

Results, platform details, validation totals, and any limitations are recorded
in the [benchmark report](benchmarks/fast-float/README.md) and pull request.
Set `FAST_FLOAT_TIERS='c1 c2'` to repeat only selected tiers. Emulation is suitable for
ARM correctness checks; it is not evidence of native ARM performance.
