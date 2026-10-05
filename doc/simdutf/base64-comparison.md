# Base64 backend comparison

Retain **simdutf 9.2.1**. We tested aklomp/base64 master
`bf058e571ac5002b75b03fed38e33ed4e8d45eff` (the latest tagged release is
v0.5.2). It does not provide a general improvement for this integration.
No second Base64 dependency or production adapter is added.

These are **native vendor/adapter** measurements on 2026-10-05 UTC, AMD EPYC
9V74, GCC/G++ 14.2.0, Linux x86-64, pinned to CPU 2. Each cell is mean aklomp
time divided by mean simdutf time across five alternating 30 ms pairs at four
destination alignments, after 10 ms warmups per variant. **Above 1 favors
simdutf**. Both libraries use the same input and destination buffers. No
builds/tests run concurrently. [All 2,100 paired samples](base64-comparison.csv)
and [the standalone benchmark](base64-benchmark.cpp) are included.

| Forced ISA profile / operation | Size 32 | Size 128 | Size 65,536 |
| --- | ---: | ---: | ---: |
| AVX-512 / encode | 4.52× | 3.70× | 1.05× |
| AVX-512 / raw decode | 1.58× | 2.20× | 2.43× |
| AVX-512 / strict checked decode | 1.02× | 1.21× | 1.05× |
| AVX-512 / URL encode | 6.18× | 8.60× | 16.80× |
| AVX-512 / URL checked decode | 1.24× | 1.62× | 1.78× |
| AVX2 / encode | 2.48× | 1.13× | 1.22× |
| AVX2 / raw decode | 0.82× | 1.51× | 1.00× |
| AVX2 / strict checked decode | 0.87× | 1.14× | 1.01× |
| AVX2 / URL encode | 3.48× | 3.83× | 9.14× |
| AVX2 / URL checked decode | 1.04× | 1.49× | 1.60× |
| SSE4.2 / encode | 1.24× | 1.06× | 1.02× |
| SSE4.2 / raw decode | 0.62× | 1.03× | 1.01× |
| SSE4.2 / strict checked decode | 0.74× | 0.98× | 1.04× |
| SSE4.2 / URL encode | 2.28× | 3.83× | 5.75× |
| SSE4.2 / URL checked decode | 1.00× | 1.42× | 1.59× |

The CSV's last column is the *inverse* ratio (simdutf ns / aklomp ns).
Sizes are targets: encoding uses complete triples and decoding complete
quartets, with actual input byte counts recorded. The sweep also includes
16, 64, 256 and 1,024. Partial/padded tails and MIME decoding are outside this
vendor comparison; they remain with the existing Java handling.

The forced simdutf implementations are icelake, haswell and westmere; aklomp
uses AVX-512, AVX2 and SSE4.2 respectively. All run on the same modern CPU.
These are ISA profiles, not measurements on older CPUs or ARM64.
Aklomp's codec is selected once outside timing using the decode initializer
(which honors its AVX-512 flag); timed calls do not repeat CPU detection.

Aklomp has no URL alphabet API. Its measured encode adapter uses a branchless
alphabet replacement pass; decode uses branchless replacement in bounded
256-byte staging blocks and the streaming API. This includes the necessary
adaptation cost and avoids a per-call heap allocation or a large leaf stack
buffer. The comparison validates exact bytes against an independent scalar
oracle and checks destination canaries.

The checked rows include the bridge's strict alphabet prevalidation for both
libraries. This scan is a remaining optimization opportunity: on bulk AVX-512
decode, simdutf's 2.43× core advantage becomes 1.05× after checking. Removing
that scan needs separate validation of Java's rejection, partial-write and
consumption behavior. This change leaves those contracts intact.

Aklomp's short standard decode wins on AVX2/SSE4.2 do not justify another
vendor: most occur below the compiled Base64 cutoff of 128, while encoding
and URL conversion favor simdutf. Original C2 Base64 stubs remain selected
where available. There are **no fresh original-JDK, JNI or Java allocation
measurements in this experiment**; the local JVM cannot start because of
the host's exhausted thread/process quota. Historical original-JDK controls
remain in [the main report](results.md); they do not qualify this head.
ARM64 and Windows performance remain unmeasured.

## Reproduce

Build the JDK's simdutf object, then check out the pinned aklomp commit.
Its upstream CMake build can produce a static library with all x86 codecs:

```sh
cmake -S /path/to/base64 -B /tmp/aklomp-build -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=OFF -DBASE64_BUILD_CLI=OFF -DBASE64_WITH_AVX512=ON
cmake --build /tmp/aklomp-build --parallel 1
g++ -O3 -std=c++17 -Wall -Wextra -Werror -DBASE64_STATIC_DEFINE \
  -Isrc/utils/simdutf -I/path/to/base64/include \
  doc/simdutf/base64-benchmark.cpp /tmp/aklomp-build/libbase64.a \
  build/your-build/hotspot/variant-server/libjvm/objs/simdutf.o \
  -o /tmp/base64-benchmark
taskset -c 2 /tmp/base64-benchmark > /tmp/base64-comparison.csv
```

The recorded run compiled the same upstream C99 units with `-O3 -Wall
-Wextra -pedantic` and their per-codec ISA flags, then combined them with
`ld -r`; CMake is an alternative reproduction route. Recorded SHA-256:

- simdutf source: `02429dedc724b9daed89659462df8869a6b729e65256718be286336d8bf6aa8f`
- simdutf object: `60674bb5458a4df0fc7d2cff3a8c150300f60250a11793caa6b923256c32224b`
- aklomp object: `6482cefe2b5041d275f8a08bc153857778a44798540d576d68704b1943023ee4`
