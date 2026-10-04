# Default-on validation

StringZilla is enabled by default in this fork. `-XX:-UseStringZillaIntrinsics`
opts out; `-XX:+UseStringZillaIntrinsics` remains an explicit enable option.
The search/equality implementation, ISA selection, thresholds and JNI fallback
are unchanged from the recorded benchmark images. `results.json` preserves the
hashes and explicit on/off arguments of those earlier measurements.

Verified on 2026-10-04:

* x86 release image and all four CDS archives built with the new default.
  Matching x86 fastdebug and AArch64 cross-release VM builds succeeded.
* `PrintFlagsFinal` reports `UseStringZillaIntrinsics = true` with origin
  `{default}` and `false` with origin `{command line}` for explicit opt-out,
  in both release and fastdebug.
* Standard jtreg, with no global enabling option: **155 passed, 2 skipped,
  zero failures/errors**. String: 92 passed; StringBuilder: 16 passed;
  StringBuffer: 25 passed; HotSpot string intrinsics: 22 passed/2 skipped.
* All eight scalar-oracle configurations passed in release and fastdebug.
  Seven omit the enabling flag, including interpreter, C1, C2, forced-C2 startup,
  compact strings off, and interpreter/compiled JNI fallback; the eighth
  explicitly opts out.
* Java gate, all ten search bridges and equality availability passed with no
  flag, explicit on, and explicit off in release (CDS/G1) and fastdebug
  (G1, CDS off).
* All 22 public search/equality/local-allocation callers compiled and executed
  at levels 1 and 4 without an enabling flag on x86 release, x86 fastdebug
  and AArch64/QEMU.
* AArch64/QEMU interpreter, C1 and C2 oracles passed without an enabling flag;
  default and explicit opt-out availability checks passed.
* Vendor manifest verification: 28 unmodified upstream files. Whitespace
  checks passed. ARM hardware timing and full tier1/tier2 remain untested.

Reproduction:

```sh
make CONF=cloud test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string' \
  'JTREG=JOBS=2;TIMEOUT_FACTOR=4'
```

The availability test has default/on/off runs. The search-oracle and caller
compilation tests exercise the default without `-XX:+UseStringZillaIntrinsics`.

Tested artifact SHA-256 hashes:

| Artifact | SHA-256 |
| --- | --- |
| `build/cloud/images/jdk/lib/server/libjvm.so` | `ccd136760d4d94b60c9eb5046e27533778d2e2fda69da692bdaa5e21c3f8db15` |
| `build/cloud/images/jdk/lib/libjava.so` | `f524be8df8ad878428880ae4ddad97b404cf398db91b62dfd2045bd420eb5d44` |
| `build/cloud/images/jdk/lib/modules` | `d8dc91b7adc3f3bf0bc2298982f397c019ac1e1e3809fdd7b2351177649c06b5` |
| `build/stringzilla-fastdebug/support/modules_libs/java.base/server/libjvm.so` | `cda8a26daf04dfe0bb0675353d9162c1084c0c52637d5ae72675c84e315e4461` |
| `build/stringzilla-fastdebug/support/modules_libs/java.base/libjava.so` | `9cae72a5c5b76a65f4f82fbe25c547683161371eeaa6a86bdc702c5ae8192b35` |
| `build/stringzilla-aarch64/jdk/lib/server/libjvm.so` | `58cdabb75e71bbcb50a73b6593a22169f627cf500abc0517b2d87499bf04f85f` |
| `build/stringzilla-aarch64/jdk/lib/libjava.so` | `8c0b580c3ba338f1f42eefb1741f0a8de297d5d625e9c4af2fc7d33ed929822e` |
