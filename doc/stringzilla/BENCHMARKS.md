# StringZilla measurements and validation

Enable with `-XX:+UseStringZillaIntrinsics`; the product flag defaults to false.
The tables report measured costs by compilation tier, input length, encoding and
match position. The complete raw JMH records, confidence intervals, VM arguments
and hashes of the tested VM, libjava and modules are in `results.json`.

## Method

AMD EPYC 9V74, x86-64 Linux, AVX2/AVX-512 enabled; CPU 0 pinned, one benchmark
at a time. JMH 1.37 measures average time in ns/op. The main matrix contains
**518 measurements / 259 off-on pairs**, with one isolated fork per parameter
case, three 500 ms warmups and five 500 ms measurements. A further **81 original
Java controls** restore the exact `StringLatin1` and `StringUTF16` sources from
base commit `33e539f2d4a847f283a3793df6eebd41b9d1dfac` using `--patch-module`,
with the flag off and otherwise identical settings. A further **16 longer
controls** repeat short/early-match cases. Three more mixed-coder short controls
compare original/off/on with three forks each. Search C1 controls use two
isolated forks, three 500 ms warmups and five 1 s measurements per fork. The C1 equality
coder-mismatch control uses three forks. Six repeated original-Java character
controls and six layout controls also use three forks per state.

The main baseline is the same built release VM with the flag off.
All C1 measurements and the added interpreter/C2 mixed-character controls use
the final image. The remaining interpreter/C2 measurements retain the image
before the final mixed-coder C1 inlining hint was removed: native libraries
are identical, all 98 `StringUTF16` method instruction sequences are identical,
and C2 keeps its existing forward-search intrinsic. The raw records identify the
artifact set used by each run and include hashes for both images. The original
Java controls use that VM too; neither is a separately built pristine upstream
VM. They reveal costs shared by both modified flag states. Emulated ARM results
are functional validation; ARM hardware timing remains unmeasured.

Interpreter uses `-Xint`; C1 uses `-XX:TieredStopAtLevel=1`; C2 uses
`-XX:-TieredCompilation`. All child JVMs use `-XX:ActiveProcessorCount=1`,
Serial GC and `-Xshare:off`. Builds and functional tests finish before timing.
Four-character needles; lengths are Java characters, so UTF-16 uses twice as
many bytes. Random inputs use a fixed seed. `MISS` has no match; `START` matches
at zero; `END` matches at the last position; `REPEATED` stresses repeated prefix
candidates. Equality uses distinct backing arrays with equal contents (`EQUAL`),
a first-character mismatch (`START`) or a last-character mismatch (`END`).
Additional interpreter/C1 cases place mismatches at the second character,
character 31, the middle, and the first UTF-16 high byte.
`CROSSED` produces odd-byte matches with no valid UTF-16 code-unit match.

Small differences need longer repeated runs. All slower means are retained;
reported confidence intervals and raw samples permit assessing uncertainty.
The C1 different-coder equality follow-up retains a 0.209 ns higher enabled mean
with overlapping intervals. A default-layout C2 character control is faster
with the original helpers than with both modified states; its unchanged scan
instructions and the fixed-alignment/rotating-haystack controls below show
layout sensitivity. The rotating control measures 12.867 / 12.131 / 12.138 ns
for original / off / on; the single-array result remains in the tables.

## Reproduction

Compile `test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java` with
JMH 1.37 core and its annotation processor, or use OpenJDK's microbenchmark
build, then run:

```sh
doc/stringzilla/run-benchmarks.sh "$TEST_JDK" "$JMH_CLASSPATH" results 0
```

The script defaults to one isolated fork per case. For longer controls use
`-f 2 -wi 3 -w 500ms -i 5 -r 1s` with one parameter case per JMH invocation.
The original-Java controls compile the two unmodified sources from the base
commit with `javac --patch-module java.base=SOURCE_DIR -d PATCH_DIR ...`; add
`--patch-module=java.base=PATCH_DIR` to the child JVM arguments with the feature
off. Preserve the tier, collector, CPU pin and other VM options.
For the layout controls, repeat the character case with
`-XX:ObjectAlignmentInBytes=64`, then compile
`test/micro/org/openjdk/bench/java/lang/StringZillaAlignment.java` and run
`StringZillaAlignment.indexOfChar` at length 256 with the default alignment,
three forks, three 500 ms warmups and five 1 s measurements. It rotates over
32 separately allocated UTF-16 haystacks. Use the same original/off/on states.

Length gates precede Java flag reads on short inputs. Search windows become eligible
at 256 bytes; a scalar first-candidate probe can reduce the native remainder.
Same-coder UTF-16 forward searches preserve the original scalar loop and force-inline
the dispatch; mixed-coder helpers retain C1's normal inlining choice. Eligible
long windows check the first candidate for short needles.
Latin-1 forward searches also check the first candidate; outlined Java
wrappers keep C1 native register setup out of the scalar loop. C1 force-inlines
the Latin-1 reverse dispatcher. C2 retains its existing forward substring,
forward character, and equality intrinsics. Interpreter equality checks lengths
and the first byte; C1 checks lengths and an unrolled eight-byte prefix before
the native equality leaf. ISA selection occurs during initialization;
the x86 VM leaf adapter is one load and one tail jump into independent libjava.

## Validation

* Final x86 release JDK image and all four standard CDS archives built.
  Matching x86 fastdebug and AArch64 cross-release VM/libjava builds succeeded.
* Final standard jtreg: **152 passed, five skipped, zero failures/errors**:
  String 90 passed/2 skipped; StringBuilder 16 passed; StringBuffer 25 passed;
  HotSpot string intrinsics 21 passed/3 skipped. This includes all three new
  tests and all eight scalar-oracle configurations, including forced-C2 startup
  compilation and both interpreter/compiled JNI fallback modes.
* Final fastdebug: all eight oracle modes passed. Coverage includes empty and
  oversized needles, dispatch/prefix boundaries, extreme ranges, both coders,
  mixed encodings, supplementary/isolated surrogates, periodic odd-byte inputs,
  logical builder capacity, mutation, concurrent GC and distinct-array equality.
* WhiteBox forces all **22** public search/equality/local-allocation callers to
  compile and execute at levels 1 and 4 on x86 release, x86 fastdebug and
  AArch64/QEMU. All ten intrinsic registrations and Java/VM flag consistency
  pass with the flag on/off under CDS and G1; equality availability is checked
  independently in C1 and C2.
* Concurrent-GC leaf oracles also pass with ZGC and Shenandoah on x86.
* x86 `UseAVX=0` and `UseAVX=2` oracles passed. AArch64/QEMU interpreter, C1
  and C2 oracles passed with the cross-built VM and NEON kernels.
* Vendor manifest verification passes for 28 unmodified upstream files;
  staged whitespace checks pass. Full tier1/tier2, sanitizers, other architectures
  and ARM hardware timing have not been run.

The standard jtreg command is:

```sh
make CONF=cloud test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string' \
  'JTREG=JAVA_OPTIONS=-XX:+UseStringZillaIntrinsics;JOBS=2;TIMEOUT_FACTOR=4'
```

## Complete final matrix

Means are ns/op. Speedup is **off / on**; values below 1 indicate a slower
enabled mean. `LL` = Latin-1, `UU` = UTF-16, `UL` = UTF-16 source/Latin-1 needle.
All paired parameters match; every pair is included.

### Interpreter

| Operation | Coder | Length | Shape | Off ns | On ns | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| bufferIndexOf | LATIN1 | 4096 | MISS | 36011.007 | 536.512 | 67.12x |
| bufferIndexOf | UTF16 | 4096 | MISS | 149989.355 | 860.302 | 174.34x |
| builderIndexOf | LATIN1 | 4096 | MISS | 36254.050 | 476.411 | 76.10x |
| builderIndexOf | UTF16 | 4096 | MISS | 139759.241 | 829.411 | 168.50x |
| contains | LATIN1 | 4096 | MISS | 38923.846 | 678.731 | 57.35x |
| contains | UTF16 | 4096 | MISS | 145852.543 | 883.014 | 165.18x |
| equals | LATIN1 | 32 | END | 509.046 | 110.184 | 4.62x |
| equals | LATIN1 | 32 | EQUAL | 563.666 | 111.166 | 5.07x |
| equals | LATIN1 | 32 | HIGH_BYTE | 67.359 | 66.859 | 1.01x |
| equals | LATIN1 | 32 | MIDDLE | 329.338 | 111.272 | 2.96x |
| equals | LATIN1 | 32 | PREFIX | 534.842 | 113.406 | 4.72x |
| equals | LATIN1 | 32 | SECOND | 137.988 | 108.903 | 1.27x |
| equals | LATIN1 | 32 | START | 125.496 | 107.994 | 1.16x |
| equals | LATIN1 | 4096 | END | 51122.550 | 176.690 | 289.34x |
| equals | LATIN1 | 4096 | EQUAL | 52740.107 | 176.519 | 298.78x |
| equals | LATIN1 | 4096 | HIGH_BYTE | 67.487 | 67.919 | 0.99x |
| equals | LATIN1 | 4096 | MIDDLE | 25903.540 | 149.180 | 173.64x |
| equals | LATIN1 | 4096 | PREFIX | 539.472 | 112.551 | 4.79x |
| equals | LATIN1 | 4096 | SECOND | 139.485 | 110.227 | 1.27x |
| equals | LATIN1 | 4096 | START | 122.044 | 108.452 | 1.13x |
| equals | UTF16 | 32 | END | 930.371 | 108.612 | 8.57x |
| equals | UTF16 | 32 | EQUAL | 973.954 | 113.658 | 8.57x |
| equals | UTF16 | 32 | HIGH_BYTE | 137.436 | 110.304 | 1.25x |
| equals | UTF16 | 32 | MIDDLE | 550.051 | 114.073 | 4.82x |
| equals | UTF16 | 32 | PREFIX | 971.806 | 119.178 | 8.15x |
| equals | UTF16 | 32 | SECOND | 148.085 | 109.990 | 1.35x |
| equals | UTF16 | 32 | START | 123.009 | 108.275 | 1.14x |
| equals | UTF16 | 4096 | END | 97130.523 | 244.277 | 397.62x |
| equals | UTF16 | 4096 | EQUAL | 99550.116 | 244.166 | 407.72x |
| equals | UTF16 | 4096 | HIGH_BYTE | 146.547 | 110.066 | 1.33x |
| equals | UTF16 | 4096 | MIDDLE | 53284.052 | 182.905 | 291.32x |
| equals | UTF16 | 4096 | PREFIX | 959.410 | 114.239 | 8.40x |
| equals | UTF16 | 4096 | SECOND | 148.351 | 108.984 | 1.36x |
| equals | UTF16 | 4096 | START | 122.794 | 107.431 | 1.14x |
| indexOf | LATIN1 | 32 | MISS | 446.994 | 472.838 | 0.95x |
| indexOf | LATIN1 | 256 | MISS | 2380.285 | 224.078 | 10.62x |
| indexOf | LATIN1 | 4096 | MISS | 34213.418 | 317.628 | 107.72x |
| indexOf | LATIN1 | 4096 | START | 266.943 | 258.423 | 1.03x |
| indexOf | MIXED | 32 | END | 1581.173 | 1517.988 | 1.04x |
| indexOf | MIXED | 32 | MISS | 1316.145 | 1337.463 | 0.98x |
| indexOf | MIXED | 32 | REPEATED | 5101.148 | 5047.888 | 1.01x |
| indexOf | MIXED | 256 | END | 9132.750 | 333.498 | 27.38x |
| indexOf | MIXED | 256 | MISS | 10018.109 | 303.170 | 33.04x |
| indexOf | MIXED | 256 | REPEATED | 45663.233 | 505.864 | 90.27x |
| indexOf | MIXED | 4096 | END | 144968.030 | 522.433 | 277.49x |
| indexOf | MIXED | 4096 | MISS | 149678.194 | 522.938 | 286.23x |
| indexOf | MIXED | 4096 | REPEATED | 854158.718 | 687.556 | 1242.31x |
| indexOf | MIXED | 4096 | START | 395.503 | 395.570 | 1.00x |
| indexOf | UTF16 | 32 | MISS | 1299.428 | 1315.467 | 0.99x |
| indexOf | UTF16 | 256 | MISS | 8973.480 | 347.916 | 25.79x |
| indexOf | UTF16 | 4096 | MISS | 142691.975 | 528.407 | 270.04x |
| indexOf | UTF16 | 4096 | START | 482.152 | 520.450 | 0.93x |
| indexOfChar | LATIN1 | 32 | MISS | 479.658 | 499.059 | 0.96x |
| indexOfChar | LATIN1 | 256 | MISS | 2586.923 | 2679.021 | 0.97x |
| indexOfChar | LATIN1 | 4096 | MISS | 38985.080 | 213.299 | 182.77x |
| indexOfChar | LATIN1 | 4096 | START | 154.323 | 159.805 | 0.97x |
| indexOfChar | MIXED | 32 | MISS | 1584.086 | 1456.431 | 1.09x |
| indexOfChar | MIXED | 256 | MISS | 10665.004 | 272.769 | 39.10x |
| indexOfChar | UTF16 | 32 | MISS | 1403.978 | 1519.473 | 0.92x |
| indexOfChar | UTF16 | 256 | MISS | 10166.314 | 270.372 | 37.60x |
| indexOfChar | UTF16 | 4096 | MISS | 154167.235 | 491.977 | 313.36x |
| indexOfChar | UTF16 | 4096 | START | 199.532 | 194.626 | 1.03x |
| lastIndexOf | LATIN1 | 32 | MISS | 621.278 | 586.499 | 1.06x |
| lastIndexOf | LATIN1 | 256 | MISS | 3045.172 | 289.183 | 10.53x |
| lastIndexOf | LATIN1 | 4096 | MISS | 37589.133 | 399.738 | 94.03x |
| lastIndexOf | LATIN1 | 4096 | START | 44401.775 | 393.772 | 112.76x |
| lastIndexOf | MIXED | 32 | END | 526.952 | 526.582 | 1.00x |
| lastIndexOf | MIXED | 32 | MISS | 1387.638 | 1481.556 | 0.94x |
| lastIndexOf | MIXED | 32 | REPEATED | 1356.735 | 1390.909 | 0.98x |
| lastIndexOf | MIXED | 256 | END | 511.518 | 441.119 | 1.16x |
| lastIndexOf | MIXED | 256 | MISS | 9168.955 | 329.412 | 27.83x |
| lastIndexOf | MIXED | 256 | REPEATED | 10043.697 | 475.886 | 21.11x |
| lastIndexOf | MIXED | 4096 | END | 534.261 | 444.262 | 1.20x |
| lastIndexOf | MIXED | 4096 | MISS | 179208.602 | 650.830 | 275.35x |
| lastIndexOf | MIXED | 4096 | REPEATED | 143537.552 | 756.939 | 189.63x |
| lastIndexOf | UTF16 | 32 | MISS | 1443.516 | 1461.236 | 0.99x |
| lastIndexOf | UTF16 | 256 | MISS | 9422.238 | 358.053 | 26.32x |
| lastIndexOf | UTF16 | 4096 | MISS | 144644.778 | 605.855 | 238.75x |
| lastIndexOf | UTF16 | 4096 | START | 162308.451 | 635.234 | 255.51x |
| lastIndexOfChar | LATIN1 | 32 | MISS | 450.357 | 467.249 | 0.96x |
| lastIndexOfChar | LATIN1 | 256 | MISS | 2472.801 | 251.268 | 9.84x |
| lastIndexOfChar | LATIN1 | 4096 | MISS | 36931.065 | 306.854 | 120.35x |
| lastIndexOfChar | LATIN1 | 4096 | START | 36519.766 | 326.657 | 111.80x |
| lastIndexOfChar | MIXED | 32 | MISS | 1495.334 | 1322.886 | 1.13x |
| lastIndexOfChar | MIXED | 256 | MISS | 9515.640 | 621.612 | 15.31x |
| lastIndexOfChar | UTF16 | 32 | MISS | 1317.253 | 1309.275 | 1.01x |
| lastIndexOfChar | UTF16 | 256 | MISS | 9117.966 | 608.588 | 14.98x |
| lastIndexOfChar | UTF16 | 4096 | MISS | 146927.259 | 896.299 | 163.93x |
| lastIndexOfChar | UTF16 | 4096 | START | 142042.129 | 909.487 | 156.18x |
| replace | LATIN1 | 4096 | MISS | 38723.465 | 1061.484 | 36.48x |
| replace | UTF16 | 4096 | MISS | 142399.728 | 1243.176 | 114.55x |

### C1

| Operation | Coder | Length | Shape | Off ns | On ns | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| bufferIndexOf | LATIN1 | 4096 | MISS | 2401.675 | 128.646 | 18.67x |
| bufferIndexOf | UTF16 | 4096 | MISS | 1844.134 | 244.878 | 7.53x |
| builderIndexOf | LATIN1 | 4096 | MISS | 2524.664 | 119.511 | 21.12x |
| builderIndexOf | UTF16 | 4096 | MISS | 1859.530 | 231.707 | 8.03x |
| contains | LATIN1 | 4096 | MISS | 2366.528 | 120.911 | 19.57x |
| contains | UTF16 | 4096 | MISS | 1840.365 | 246.233 | 7.47x |
| equals | LATIN1 | 32 | END | 32.077 | 9.372 | 3.42x |
| equals | LATIN1 | 32 | EQUAL | 30.921 | 9.226 | 3.35x |
| equals | LATIN1 | 32 | HIGH_BYTE | 3.124 | 3.412 | 0.92x |
| equals | LATIN1 | 32 | MIDDLE | 18.814 | 9.252 | 2.03x |
| equals | LATIN1 | 32 | PREFIX | 32.920 | 9.274 | 3.55x |
| equals | LATIN1 | 32 | SECOND | 7.101 | 4.939 | 1.44x |
| equals | LATIN1 | 32 | START | 8.118 | 4.873 | 1.67x |
| equals | LATIN1 | 4096 | END | 3423.187 | 70.833 | 48.33x |
| equals | LATIN1 | 4096 | EQUAL | 3192.212 | 70.881 | 45.04x |
| equals | LATIN1 | 4096 | HIGH_BYTE | 3.106 | 3.209 | 0.97x |
| equals | LATIN1 | 4096 | MIDDLE | 1653.262 | 39.979 | 41.35x |
| equals | LATIN1 | 4096 | PREFIX | 30.471 | 8.764 | 3.48x |
| equals | LATIN1 | 4096 | SECOND | 6.713 | 5.171 | 1.30x |
| equals | LATIN1 | 4096 | START | 6.133 | 4.570 | 1.34x |
| equals | UTF16 | 32 | END | 57.501 | 8.635 | 6.66x |
| equals | UTF16 | 32 | EQUAL | 56.298 | 8.966 | 6.28x |
| equals | UTF16 | 32 | HIGH_BYTE | 6.832 | 4.945 | 1.38x |
| equals | UTF16 | 32 | MIDDLE | 31.074 | 8.496 | 3.66x |
| equals | UTF16 | 32 | PREFIX | 57.608 | 8.420 | 6.84x |
| equals | UTF16 | 32 | SECOND | 7.634 | 5.304 | 1.44x |
| equals | UTF16 | 32 | START | 6.199 | 4.536 | 1.37x |
| equals | UTF16 | 4096 | END | 6656.549 | 138.212 | 48.16x |
| equals | UTF16 | 4096 | EQUAL | 6419.610 | 129.723 | 49.49x |
| equals | UTF16 | 4096 | HIGH_BYTE | 6.774 | 4.905 | 1.38x |
| equals | UTF16 | 4096 | MIDDLE | 3302.730 | 87.013 | 37.96x |
| equals | UTF16 | 4096 | PREFIX | 60.595 | 8.420 | 7.20x |
| equals | UTF16 | 4096 | SECOND | 7.721 | 5.625 | 1.37x |
| equals | UTF16 | 4096 | START | 6.225 | 4.638 | 1.34x |
| indexOf | LATIN1 | 32 | MISS | 22.758 | 22.354 | 1.02x |
| indexOf | LATIN1 | 256 | MISS | 154.894 | 15.143 | 10.23x |
| indexOf | LATIN1 | 4096 | MISS | 2473.419 | 120.441 | 20.54x |
| indexOf | LATIN1 | 4096 | START | 9.353 | 8.981 | 1.04x |
| indexOf | MIXED | 32 | END | 21.470 | 21.360 | 1.01x |
| indexOf | MIXED | 32 | MISS | 17.922 | 17.765 | 1.01x |
| indexOf | MIXED | 32 | REPEATED | 90.155 | 92.044 | 0.98x |
| indexOf | MIXED | 256 | END | 133.925 | 31.001 | 4.32x |
| indexOf | MIXED | 256 | MISS | 123.625 | 26.935 | 4.59x |
| indexOf | MIXED | 256 | REPEATED | 834.746 | 27.350 | 30.52x |
| indexOf | MIXED | 4096 | END | 1948.997 | 248.091 | 7.86x |
| indexOf | MIXED | 4096 | MISS | 1868.607 | 263.095 | 7.10x |
| indexOf | MIXED | 4096 | REPEATED | 12803.705 | 243.504 | 52.58x |
| indexOf | MIXED | 4096 | START | 8.157 | 8.286 | 0.98x |
| indexOf | UTF16 | 32 | MISS | 17.360 | 17.040 | 1.02x |
| indexOf | UTF16 | 256 | MISS | 120.527 | 23.604 | 5.11x |
| indexOf | UTF16 | 4096 | MISS | 1836.941 | 219.866 | 8.35x |
| indexOf | UTF16 | 4096 | START | 6.529 | 6.431 | 1.02x |
| indexOfChar | LATIN1 | 32 | MISS | 25.120 | 25.867 | 0.97x |
| indexOfChar | LATIN1 | 256 | MISS | 157.677 | 160.993 | 0.98x |
| indexOfChar | LATIN1 | 4096 | MISS | 2463.753 | 66.991 | 36.78x |
| indexOfChar | LATIN1 | 4096 | START | 4.776 | 4.699 | 1.02x |
| indexOfChar | MIXED | 32 | MISS | 19.407 | 18.994 | 1.02x |
| indexOfChar | MIXED | 256 | MISS | 120.600 | 24.507 | 4.92x |
| indexOfChar | UTF16 | 32 | MISS | 18.904 | 18.765 | 1.01x |
| indexOfChar | UTF16 | 256 | MISS | 114.779 | 23.862 | 4.81x |
| indexOfChar | UTF16 | 4096 | MISS | 1734.002 | 257.096 | 6.74x |
| indexOfChar | UTF16 | 4096 | START | 4.493 | 4.856 | 0.93x |
| lastIndexOf | LATIN1 | 32 | MISS | 29.505 | 30.997 | 0.95x |
| lastIndexOf | LATIN1 | 256 | MISS | 223.974 | 16.014 | 13.99x |
| lastIndexOf | LATIN1 | 4096 | MISS | 3459.106 | 142.967 | 24.20x |
| lastIndexOf | LATIN1 | 4096 | START | 3557.486 | 150.966 | 23.56x |
| lastIndexOf | MIXED | 32 | END | 10.470 | 10.801 | 0.97x |
| lastIndexOf | MIXED | 32 | MISS | 37.556 | 37.345 | 1.01x |
| lastIndexOf | MIXED | 32 | REPEATED | 37.456 | 37.653 | 0.99x |
| lastIndexOf | MIXED | 256 | END | 10.409 | 9.591 | 1.09x |
| lastIndexOf | MIXED | 256 | MISS | 225.897 | 25.318 | 8.92x |
| lastIndexOf | MIXED | 256 | REPEATED | 225.865 | 30.086 | 7.51x |
| lastIndexOf | MIXED | 4096 | END | 10.311 | 9.398 | 1.10x |
| lastIndexOf | MIXED | 4096 | MISS | 3499.579 | 246.426 | 14.20x |
| lastIndexOf | MIXED | 4096 | REPEATED | 3499.465 | 257.661 | 13.58x |
| lastIndexOf | UTF16 | 32 | MISS | 29.448 | 29.285 | 1.01x |
| lastIndexOf | UTF16 | 256 | MISS | 154.267 | 23.136 | 6.67x |
| lastIndexOf | UTF16 | 4096 | MISS | 2350.965 | 277.942 | 8.46x |
| lastIndexOf | UTF16 | 4096 | START | 2720.960 | 238.467 | 11.41x |
| lastIndexOfChar | LATIN1 | 32 | MISS | 28.401 | 27.775 | 1.02x |
| lastIndexOfChar | LATIN1 | 256 | MISS | 175.449 | 36.026 | 4.87x |
| lastIndexOfChar | LATIN1 | 4096 | MISS | 2580.483 | 79.758 | 32.35x |
| lastIndexOfChar | LATIN1 | 4096 | START | 2496.772 | 77.827 | 32.08x |
| lastIndexOfChar | MIXED | 32 | MISS | 22.219 | 22.148 | 1.00x |
| lastIndexOfChar | MIXED | 256 | MISS | 124.972 | 28.424 | 4.40x |
| lastIndexOfChar | UTF16 | 32 | MISS | 22.418 | 22.747 | 0.99x |
| lastIndexOfChar | UTF16 | 256 | MISS | 123.233 | 28.867 | 4.27x |
| lastIndexOfChar | UTF16 | 4096 | MISS | 1842.553 | 284.349 | 6.48x |
| lastIndexOfChar | UTF16 | 4096 | START | 2315.873 | 241.035 | 9.61x |
| replace | LATIN1 | 4096 | MISS | 2470.954 | 126.423 | 19.55x |
| replace | UTF16 | 4096 | MISS | 2383.935 | 220.806 | 10.80x |

### C2

| Operation | Coder | Length | Shape | Off ns | On ns | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| bufferIndexOf | LATIN1 | 4096 | MISS | 382.439 | 381.715 | 1.00x |
| bufferIndexOf | UTF16 | 4096 | MISS | 779.771 | 758.132 | 1.03x |
| builderIndexOf | LATIN1 | 4096 | MISS | 388.467 | 386.419 | 1.01x |
| builderIndexOf | UTF16 | 4096 | MISS | 759.160 | 732.505 | 1.04x |
| contains | LATIN1 | 4096 | MISS | 368.789 | 368.428 | 1.00x |
| contains | UTF16 | 4096 | MISS | 746.265 | 729.374 | 1.02x |
| equals | LATIN1 | 32 | END | 2.063 | 2.066 | 1.00x |
| equals | LATIN1 | 32 | EQUAL | 2.337 | 2.306 | 1.01x |
| equals | LATIN1 | 32 | START | 2.110 | 2.103 | 1.00x |
| equals | LATIN1 | 4096 | END | 69.671 | 69.059 | 1.01x |
| equals | LATIN1 | 4096 | EQUAL | 71.368 | 70.884 | 1.01x |
| equals | LATIN1 | 4096 | START | 2.164 | 2.073 | 1.04x |
| equals | UTF16 | 32 | END | 2.576 | 2.564 | 1.00x |
| equals | UTF16 | 32 | EQUAL | 3.004 | 2.829 | 1.06x |
| equals | UTF16 | 32 | START | 2.664 | 2.096 | 1.27x |
| equals | UTF16 | 4096 | END | 147.039 | 146.224 | 1.01x |
| equals | UTF16 | 4096 | EQUAL | 133.785 | 132.930 | 1.01x |
| equals | UTF16 | 4096 | START | 2.071 | 2.138 | 0.97x |
| indexOf | LATIN1 | 32 | MISS | 4.566 | 4.472 | 1.02x |
| indexOf | LATIN1 | 256 | MISS | 25.214 | 24.972 | 1.01x |
| indexOf | LATIN1 | 4096 | MISS | 375.258 | 374.830 | 1.00x |
| indexOf | LATIN1 | 4096 | START | 3.694 | 3.469 | 1.06x |
| indexOf | MIXED | 32 | END | 7.655 | 7.561 | 1.01x |
| indexOf | MIXED | 32 | MISS | 7.516 | 7.233 | 1.04x |
| indexOf | MIXED | 32 | REPEATED | 12.263 | 12.491 | 0.98x |
| indexOf | MIXED | 256 | END | 46.493 | 46.835 | 0.99x |
| indexOf | MIXED | 256 | MISS | 46.433 | 46.658 | 1.00x |
| indexOf | MIXED | 256 | REPEATED | 193.795 | 200.666 | 0.97x |
| indexOf | MIXED | 4096 | END | 725.371 | 747.267 | 0.97x |
| indexOf | MIXED | 4096 | MISS | 719.322 | 738.432 | 0.97x |
| indexOf | MIXED | 4096 | REPEATED | 3514.965 | 3637.564 | 0.97x |
| indexOf | MIXED | 4096 | START | 3.840 | 3.836 | 1.00x |
| indexOf | UTF16 | 32 | MISS | 7.710 | 7.697 | 1.00x |
| indexOf | UTF16 | 256 | MISS | 47.902 | 46.928 | 1.02x |
| indexOf | UTF16 | 4096 | CROSSED | 735.012 | 723.108 | 1.02x |
| indexOf | UTF16 | 4096 | MISS | 743.480 | 721.543 | 1.03x |
| indexOf | UTF16 | 4096 | START | 4.256 | 4.280 | 0.99x |
| indexOfChar | LATIN1 | 32 | MISS | 2.323 | 2.228 | 1.04x |
| indexOfChar | LATIN1 | 256 | MISS | 4.627 | 4.644 | 1.00x |
| indexOfChar | LATIN1 | 4096 | MISS | 54.066 | 57.026 | 0.95x |
| indexOfChar | LATIN1 | 4096 | START | 1.696 | 1.680 | 1.01x |
| indexOfChar | MIXED | 32 | MISS | 2.801 | 2.818 | 0.99x |
| indexOfChar | MIXED | 256 | MISS | 10.524 | 10.602 | 0.99x |
| indexOfChar | UTF16 | 32 | MISS | 2.878 | 2.850 | 1.01x |
| indexOfChar | UTF16 | 256 | MISS | 10.740 | 10.584 | 1.01x |
| indexOfChar | UTF16 | 4096 | MISS | 145.385 | 144.079 | 1.01x |
| indexOfChar | UTF16 | 4096 | START | 1.812 | 1.899 | 0.95x |
| lastIndexOf | LATIN1 | 32 | MISS | 10.565 | 10.514 | 1.00x |
| lastIndexOf | LATIN1 | 256 | MISS | 48.311 | 14.592 | 3.31x |
| lastIndexOf | LATIN1 | 4096 | MISS | 660.740 | 122.751 | 5.38x |
| lastIndexOf | LATIN1 | 4096 | START | 676.173 | 147.887 | 4.57x |
| lastIndexOf | MIXED | 32 | END | 6.952 | 6.493 | 1.07x |
| lastIndexOf | MIXED | 32 | MISS | 10.278 | 9.751 | 1.05x |
| lastIndexOf | MIXED | 32 | REPEATED | 9.854 | 9.570 | 1.03x |
| lastIndexOf | MIXED | 256 | END | 6.505 | 4.254 | 1.53x |
| lastIndexOf | MIXED | 256 | MISS | 45.128 | 22.286 | 2.02x |
| lastIndexOf | MIXED | 256 | REPEATED | 45.251 | 26.765 | 1.69x |
| lastIndexOf | MIXED | 4096 | END | 6.428 | 4.214 | 1.53x |
| lastIndexOf | MIXED | 4096 | MISS | 654.306 | 239.410 | 2.73x |
| lastIndexOf | MIXED | 4096 | REPEATED | 650.470 | 250.855 | 2.59x |
| lastIndexOf | UTF16 | 32 | MISS | 9.766 | 9.787 | 1.00x |
| lastIndexOf | UTF16 | 256 | MISS | 47.292 | 21.704 | 2.18x |
| lastIndexOf | UTF16 | 4096 | CROSSED | 670.278 | 305.501 | 2.19x |
| lastIndexOf | UTF16 | 4096 | MISS | 655.774 | 280.882 | 2.33x |
| lastIndexOf | UTF16 | 4096 | START | 967.230 | 286.357 | 3.38x |
| lastIndexOfChar | LATIN1 | 32 | MISS | 12.093 | 12.321 | 0.98x |
| lastIndexOfChar | LATIN1 | 256 | MISS | 57.462 | 11.132 | 5.16x |
| lastIndexOfChar | LATIN1 | 4096 | MISS | 986.835 | 59.181 | 16.67x |
| lastIndexOfChar | LATIN1 | 4096 | START | 1002.134 | 63.188 | 15.86x |
| lastIndexOfChar | MIXED | 32 | MISS | 10.282 | 10.261 | 1.00x |
| lastIndexOfChar | MIXED | 256 | MISS | 45.136 | 24.483 | 1.84x |
| lastIndexOfChar | UTF16 | 32 | MISS | 11.229 | 10.591 | 1.06x |
| lastIndexOfChar | UTF16 | 256 | MISS | 46.815 | 25.532 | 1.83x |
| lastIndexOfChar | UTF16 | 4096 | MISS | 683.679 | 238.394 | 2.87x |
| lastIndexOfChar | UTF16 | 4096 | START | 679.241 | 245.199 | 2.77x |
| replace | LATIN1 | 4096 | MISS | 373.462 | 364.914 | 1.02x |
| replace | UTF16 | 4096 | MISS | 743.283 | 723.247 | 1.03x |

## Original-Java controls

These controls restore the original two Java helpers in the same final VM.
The modified off/on columns are the corresponding main-matrix measurements.
This comparison exposes dispatch costs shared by both feature states; it does
not isolate native-kernel acceleration or compare to a pristine upstream VM.

| Tier | Operation | Coder | Length | Shape | Original Java ns | Modified off ns | Modified on ns |
| --- | --- | --- | ---: | --- | ---: | ---: | ---: |
| interpreter | indexOf | LATIN1 | 32 | MISS | 463.199 | 446.994 | 472.838 |
| interpreter | indexOf | LATIN1 | 256 | MISS | 2344.484 | 2380.285 | 224.078 |
| interpreter | indexOf | LATIN1 | 4096 | START | 251.764 | 266.943 | 258.423 |
| interpreter | indexOf | MIXED | 32 | MISS | 1304.829 | 1316.145 | 1337.463 |
| interpreter | indexOf | MIXED | 256 | MISS | 9120.822 | 10018.109 | 303.170 |
| interpreter | indexOf | MIXED | 4096 | START | 404.751 | 395.503 | 395.570 |
| interpreter | indexOf | UTF16 | 32 | MISS | 1273.359 | 1299.428 | 1315.467 |
| interpreter | indexOf | UTF16 | 256 | MISS | 9429.365 | 8973.480 | 347.916 |
| interpreter | indexOf | UTF16 | 4096 | START | 505.600 | 482.152 | 520.450 |
| interpreter | indexOfChar | LATIN1 | 32 | MISS | 463.183 | 479.658 | 499.059 |
| interpreter | indexOfChar | LATIN1 | 256 | MISS | 2605.823 | 2586.923 | 2679.021 |
| interpreter | indexOfChar | MIXED | 32 | MISS | 1428.966 | 1584.086 | 1456.431 |
| interpreter | indexOfChar | MIXED | 256 | MISS | 10008.377 | 10665.004 | 272.769 |
| interpreter | indexOfChar | UTF16 | 32 | MISS | 1397.404 | 1403.978 | 1519.473 |
| interpreter | indexOfChar | UTF16 | 256 | MISS | 9893.862 | 10166.314 | 270.372 |
| interpreter | lastIndexOf | LATIN1 | 32 | MISS | 541.927 | 621.278 | 586.499 |
| interpreter | lastIndexOf | LATIN1 | 256 | MISS | 2540.805 | 3045.172 | 289.183 |
| interpreter | lastIndexOf | MIXED | 32 | MISS | 1451.460 | 1387.638 | 1481.556 |
| interpreter | lastIndexOf | MIXED | 256 | MISS | 9335.116 | 9168.955 | 329.412 |
| interpreter | lastIndexOf | UTF16 | 32 | MISS | 1507.051 | 1443.516 | 1461.236 |
| interpreter | lastIndexOf | UTF16 | 256 | MISS | 9210.334 | 9422.238 | 358.053 |
| interpreter | lastIndexOfChar | LATIN1 | 32 | MISS | 466.655 | 450.357 | 467.249 |
| interpreter | lastIndexOfChar | LATIN1 | 256 | MISS | 2642.521 | 2472.801 | 251.268 |
| interpreter | lastIndexOfChar | MIXED | 32 | MISS | 1317.993 | 1495.334 | 1322.886 |
| interpreter | lastIndexOfChar | MIXED | 256 | MISS | 9544.903 | 9515.640 | 621.612 |
| interpreter | lastIndexOfChar | UTF16 | 32 | MISS | 1335.336 | 1317.253 | 1309.275 |
| interpreter | lastIndexOfChar | UTF16 | 256 | MISS | 9340.288 | 9117.966 | 608.588 |
| c1 | indexOf | LATIN1 | 32 | MISS | 22.635 | 22.758 | 22.354 |
| c1 | indexOf | LATIN1 | 256 | MISS | 161.713 | 154.894 | 15.143 |
| c1 | indexOf | LATIN1 | 4096 | START | 9.054 | 9.353 | 8.981 |
| c1 | indexOf | MIXED | 32 | MISS | 18.830 | 17.922 | 17.765 |
| c1 | indexOf | MIXED | 256 | MISS | 129.554 | 123.625 | 26.935 |
| c1 | indexOf | MIXED | 4096 | START | 8.290 | 8.157 | 8.286 |
| c1 | indexOf | UTF16 | 32 | MISS | 18.001 | 17.360 | 17.040 |
| c1 | indexOf | UTF16 | 256 | MISS | 122.919 | 120.527 | 23.604 |
| c1 | indexOf | UTF16 | 4096 | START | 7.743 | 6.529 | 6.431 |
| c1 | indexOfChar | LATIN1 | 32 | MISS | 24.814 | 25.120 | 25.867 |
| c1 | indexOfChar | LATIN1 | 256 | MISS | 152.652 | 157.677 | 160.993 |
| c1 | indexOfChar | MIXED | 32 | MISS | 17.390 | 19.407 | 18.994 |
| c1 | indexOfChar | MIXED | 256 | MISS | 151.787 | 120.600 | 24.507 |
| c1 | indexOfChar | UTF16 | 32 | MISS | 22.383 | 18.904 | 18.765 |
| c1 | indexOfChar | UTF16 | 256 | MISS | 149.202 | 114.779 | 23.862 |
| c1 | lastIndexOf | LATIN1 | 32 | MISS | 28.829 | 29.505 | 30.997 |
| c1 | lastIndexOf | LATIN1 | 256 | MISS | 226.973 | 223.974 | 16.014 |
| c1 | lastIndexOf | MIXED | 32 | MISS | 38.682 | 37.556 | 37.345 |
| c1 | lastIndexOf | MIXED | 256 | MISS | 296.352 | 225.897 | 25.318 |
| c1 | lastIndexOf | UTF16 | 32 | MISS | 38.171 | 29.448 | 29.285 |
| c1 | lastIndexOf | UTF16 | 256 | MISS | 296.964 | 154.267 | 23.136 |
| c1 | lastIndexOfChar | LATIN1 | 32 | MISS | 28.210 | 28.401 | 27.775 |
| c1 | lastIndexOfChar | LATIN1 | 256 | MISS | 170.801 | 175.449 | 36.026 |
| c1 | lastIndexOfChar | MIXED | 32 | MISS | 22.471 | 22.219 | 22.148 |
| c1 | lastIndexOfChar | MIXED | 256 | MISS | 144.251 | 124.972 | 28.424 |
| c1 | lastIndexOfChar | UTF16 | 32 | MISS | 23.317 | 22.418 | 22.747 |
| c1 | lastIndexOfChar | UTF16 | 256 | MISS | 144.395 | 123.233 | 28.867 |
| c2 | indexOf | LATIN1 | 32 | MISS | 4.446 | 4.566 | 4.472 |
| c2 | indexOf | LATIN1 | 256 | MISS | 23.993 | 25.214 | 24.972 |
| c2 | indexOf | LATIN1 | 4096 | START | 3.579 | 3.694 | 3.469 |
| c2 | indexOf | MIXED | 32 | MISS | 7.348 | 7.516 | 7.233 |
| c2 | indexOf | MIXED | 256 | MISS | 48.973 | 46.433 | 46.658 |
| c2 | indexOf | MIXED | 4096 | START | 3.877 | 3.840 | 3.836 |
| c2 | indexOf | UTF16 | 32 | MISS | 8.143 | 7.710 | 7.697 |
| c2 | indexOf | UTF16 | 256 | MISS | 47.775 | 47.902 | 46.928 |
| c2 | indexOf | UTF16 | 4096 | START | 4.289 | 4.256 | 4.280 |
| c2 | indexOfChar | LATIN1 | 32 | MISS | 2.287 | 2.323 | 2.228 |
| c2 | indexOfChar | LATIN1 | 256 | MISS | 4.595 | 4.627 | 4.644 |
| c2 | indexOfChar | MIXED | 32 | MISS | 2.548 | 2.801 | 2.818 |
| c2 | indexOfChar | MIXED | 256 | MISS | 8.338 | 10.524 | 10.602 |
| c2 | indexOfChar | UTF16 | 32 | MISS | 2.552 | 2.878 | 2.850 |
| c2 | indexOfChar | UTF16 | 256 | MISS | 8.473 | 10.740 | 10.584 |
| c2 | lastIndexOf | LATIN1 | 32 | MISS | 10.249 | 10.565 | 10.514 |
| c2 | lastIndexOf | LATIN1 | 256 | MISS | 46.374 | 48.311 | 14.592 |
| c2 | lastIndexOf | MIXED | 32 | MISS | 10.094 | 10.278 | 9.751 |
| c2 | lastIndexOf | MIXED | 256 | MISS | 46.237 | 45.128 | 22.286 |
| c2 | lastIndexOf | UTF16 | 32 | MISS | 10.061 | 9.766 | 9.787 |
| c2 | lastIndexOf | UTF16 | 256 | MISS | 47.802 | 47.292 | 21.704 |
| c2 | lastIndexOfChar | LATIN1 | 32 | MISS | 12.097 | 12.093 | 12.321 |
| c2 | lastIndexOfChar | LATIN1 | 256 | MISS | 66.221 | 57.462 | 11.132 |
| c2 | lastIndexOfChar | MIXED | 32 | MISS | 10.354 | 10.282 | 10.261 |
| c2 | lastIndexOfChar | MIXED | 256 | MISS | 45.351 | 45.136 | 24.483 |
| c2 | lastIndexOfChar | UTF16 | 32 | MISS | 10.232 | 11.229 | 10.591 |
| c2 | lastIndexOfChar | UTF16 | 256 | MISS | 45.137 | 46.815 | 25.532 |

## Longer controls

Two forks for C1 search controls; three forks for the C1 coder-mismatch equality
and C2 immediate-match controls.
JMH 99.9% confidence intervals are shown; intervals that overlap do not establish
a performance difference. Means, intervals and all raw iteration samples are
retained in `results.json`.

| Tier | Operation | Coder | Length | Shape | Off ns [interval] | On ns [interval] | Speedup |
| --- | --- | --- | ---: | --- | ---: | ---: | ---: |
| c1 | equals | LATIN1 | 32 | HIGH_BYTE | 3.161 [3.093, 3.229] | 3.369 [3.184, 3.555] | 0.94x |
| c1 | indexOf | LATIN1 | 32 | MISS | 21.963 [21.640, 22.287] | 22.009 [21.480, 22.538] | 1.00x |
| c1 | indexOf | LATIN1 | 4096 | START | 9.174 [8.961, 9.388] | 9.420 [8.906, 9.933] | 0.97x |
| c1 | indexOf | UTF16 | 32 | MISS | 17.845 [16.537, 19.153] | 17.288 [17.189, 17.386] | 1.03x |
| c1 | indexOf | UTF16 | 4096 | START | 6.560 [6.485, 6.635] | 6.554 [6.283, 6.825] | 1.00x |
| c1 | lastIndexOf | LATIN1 | 32 | MISS | 29.774 [28.455, 31.093] | 29.088 [28.780, 29.396] | 1.02x |
| c1 | lastIndexOfChar | UTF16 | 32 | MISS | 21.819 [21.115, 22.523] | 22.654 [22.012, 23.296] | 0.96x |
| c2 | indexOf | LATIN1 | 4096 | START | 3.529 [3.456, 3.602] | 3.512 [3.401, 3.624] | 1.00x |

## Repeated mixed-coder short control

Three isolated forks per state, three 500 ms warmups and five 1 s measurements.
The original helper uses the same final VM; this repeats the C1 mixed-coder
32-character miss with the final natural inlining choice.

| State | ns/op | 99.9% interval |
| --- | ---: | ---: |
| original | 18.437 | [18.204, 18.670] |
| off | 18.175 | [17.776, 18.575] |
| on | 17.971 | [17.732, 18.211] |

## Repeated original-Java character controls

Three isolated forks per state, with the same final VM and the exact original
helpers for the original state. These follow up single-fork original-helper
comparisons. JMH 99.9% intervals and all iteration samples are retained.

| Tier | Coder | Length | State | ns/op | 99.9% interval |
| --- | --- | ---: | --- | ---: | ---: |
| c2 | UTF16 | 256 | original | 8.647 | [7.943, 9.351] |
| c2 | UTF16 | 256 | off | 10.842 | [10.717, 10.968] |
| c2 | UTF16 | 256 | on | 10.554 | [10.500, 10.609] |
| c1 | MIXED | 32 | original | 21.133 | [18.067, 24.199] |
| c1 | MIXED | 32 | off | 18.754 | [18.062, 19.446] |
| c1 | MIXED | 32 | on | 18.810 | [18.402, 19.218] |

## Character-search layout controls

The default-layout original-helper control above has a lower measured mean than
the modified helpers in both flag states. C2 inlining diagnostics show the same
stock character-search intrinsic and the same vector scan instructions.
The following controls test layout sensitivity rather than replacing that result:
64-byte object alignment, and 32 separately allocated haystacks under default
VM alignment (`StringZillaAlignment`). Each state uses three isolated forks.
The rotating benchmark includes cursor/array-access overhead, so its absolute
cost is comparable only within that control.

| Control | State | ns/op | 99.9% interval |
| --- | --- | ---: | ---: |
| alignment_control | original | 10.558 | [10.317, 10.800] |
| alignment_control | off | 10.824 | [10.617, 11.032] |
| alignment_control | on | 10.788 | [10.724, 10.853] |
| rotating_control | original | 12.867 | [12.704, 13.029] |
| rotating_control | off | 12.131 | [11.925, 12.337] |
| rotating_control | on | 12.138 | [11.872, 12.404] |
