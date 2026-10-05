# Native backend comparison

`CompareBackends.c` compares reused stock-zlib and zlib-ng streams with reused
libdeflate compressor/decompressor contexts at a selected level (6 by default). Each timed batch lasts
at least 0.2 seconds. Compression output is checked with stock zlib;
decompression uses the **same stock-zlib representation** in every library.
Compressed sizes are recorded because equal numeric levels do not guarantee
equal compression ratios across libraries.

The checked-in CSV contains medians of three batches per case on an Intel Xeon
Platinum 8573C, Linux x86_64, GCC 14.2. Stock zlib is the repository's 1.3.2,
compiled with `-O3`; both candidate libraries are compiled with `-O2`.
zlib-ng 2.3.3 uses compatibility mode and the `jdk_ng_` prefix; libdeflate is
1.26. The text corpus is this repository's `ZipFile.java`, repeated to fill the
requested length. The random corpus is 1 MiB from Python's
`random.Random(12345).randbytes(1048576)`. Native candidate results do not include
JVM/JNI overhead and do not measure Java's incremental streaming API.

Build the two candidate archives from their pinned release sources. For example,
configure zlib-ng out of tree with:

```
CFLAGS='-O2 -fPIC' /path/to/zlib-ng/configure --static --zlib-compat --sprefix=jdk_ng_
make libz.a
cmake -S /path/to/libdeflate -B /path/to/libdeflate-build \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS_RELEASE='-O2 -DNDEBUG' \
    -DLIBDEFLATE_BUILD_SHARED_LIB=OFF
cmake --build /path/to/libdeflate-build
```

Build a stock-zlib archive from `src/java.base/share/native/libzip/zlib` with
`-O3 -DZ_HAVE_UNISTD_H`. Compile and run the comparison with:

```
cc -O3 -I src/java.base/share/native/libzip/zlib -I /path/to/libdeflate \
    test/micro/native/zip/CompareBackends.c /path/to/stock-zlib/libz.a \
    /path/to/zlib-ng-build/libz.a /path/to/libdeflate-build/libdeflate.a \
    -o compare-backends
./compare-backends src/java.base/share/classes/java/util/zip/ZipFile.java 6
./compare-backends /path/to/random-corpus.bin
```

libdeflate wins the measured large whole-buffer cases. zlib-ng is selected for
the JDK integration because it supports incremental streaming, dictionaries,
flush modes, and parameter changes. The Java integration additionally retains
stock zlib when the first input chunk is at most 1 KiB, including incremental
ZIP/GZIP writes. Streams retain that library until reset. A zero-capacity call
does not commit the choice.

For real-corpus comparisons, concatenate the sorted source files in a documented
corpus and run levels 1, 3, 6 and 9. The last size row measures the whole corpus
without repetition. Record its SHA-256 and file list, build all three libraries
with equal optimization settings, and report speed alongside compressed bytes.
The historical CSV above uses different stock/candidate optimization levels;
new results should identify their own compiler flags and provenance.
