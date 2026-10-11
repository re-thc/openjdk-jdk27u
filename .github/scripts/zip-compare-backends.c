/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <zlib.h>
#include "libdeflate.h"

extern int jdk_ng_deflateInit2_(z_streamp, int, int, int, int, int, const char*, int);
extern int jdk_ng_inflateInit2_(z_streamp, int, const char*, int);
extern int jdk_ng_deflate(z_streamp, int);
extern int jdk_ng_inflate(z_streamp, int);
extern int jdk_ng_deflateReset(z_streamp);
extern int jdk_ng_inflateReset(z_streamp);
extern int jdk_ng_deflateEnd(z_streamp);
extern int jdk_ng_inflateEnd(z_streamp);
extern int jdk_release_deflateInit2_(z_streamp, int, int, int, int, int, const char*, int);
extern int jdk_release_inflateInit2_(z_streamp, int, const char*, int);
extern int jdk_release_deflate(z_streamp, int);
extern int jdk_release_inflate(z_streamp, int);
extern int jdk_release_deflateReset(z_streamp);
extern int jdk_release_inflateReset(z_streamp);
extern int jdk_release_deflateEnd(z_streamp);
extern int jdk_release_inflateEnd(z_streamp);
extern uLong jdk_ng_crc32(uLong, const Bytef*, uInt);
extern uLong jdk_ng_adler32(uLong, const Bytef*, uInt);
extern uLong jdk_release_crc32(uLong, const Bytef*, uInt);
extern uLong jdk_release_adler32(uLong, const Bytef*, uInt);

typedef struct {
    int (*deflateInit2_)(z_streamp, int, int, int, int, int, const char*, int);
    int (*inflateInit2_)(z_streamp, int, const char*, int);
    int (*deflate)(z_streamp, int);
    int (*inflate)(z_streamp, int);
    int (*deflateReset)(z_streamp);
    int (*inflateReset)(z_streamp);
    int (*deflateEnd)(z_streamp);
    int (*inflateEnd)(z_streamp);
} NgFunctions;

static const NgFunctions functions[] = {
    {jdk_release_deflateInit2_, jdk_release_inflateInit2_, jdk_release_deflate,
     jdk_release_inflate, jdk_release_deflateReset, jdk_release_inflateReset,
     jdk_release_deflateEnd, jdk_release_inflateEnd},
    {jdk_ng_deflateInit2_, jdk_ng_inflateInit2_, jdk_ng_deflate,
     jdk_ng_inflate, jdk_ng_deflateReset, jdk_ng_inflateReset,
     jdk_ng_deflateEnd, jdk_ng_inflateEnd}
};


static double now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}


static uLong ld_crc32(uLong crc, const Bytef* p, uInt n) {
    return libdeflate_crc32(crc, p, n);
}
static uLong ld_adler32(uLong crc, const Bytef* p, uInt n) {
    return libdeflate_adler32(crc, p, n);
}

static void checksum_benchmark(const unsigned char* corpus, size_t corpus_size) {
    typedef uLong (*Checksum)(uLong, const Bytef*, uInt);
    static const Checksum checksums[2][4] = {
        {adler32, jdk_release_adler32, jdk_ng_adler32, ld_adler32},
        {crc32, jdk_release_crc32, jdk_ng_crc32, ld_crc32}
    };
    static const char* names[] = {"zlib", "zlib-ng-release", "zlib-ng-develop", "libdeflate"};
    size_t sizes[] = {1, 64, 1024, 16384, 65536, 1048576, corpus_size};
    volatile uLong sink = 0;
    puts("size,checksum,library,ns");
    for (size_t si = 0; si < sizeof(sizes) / sizeof(sizes[0]); si++) {
        size_t n = sizes[si];
        unsigned char* input = malloc(n);
        if (!input) abort();
        for (size_t i = 0; i < n; i++) input[i] = corpus[i % corpus_size];
        for (int kind = 0; kind < 2; kind++) {
            uLong seed = kind == 0 ? 1 : 0;
            uLong expected = checksums[kind][0](seed, input, n);
            for (int backend = 0; backend < 4; backend++) {
                Checksum checksum = checksums[kind][backend];
                if (checksum(seed, input, n) != expected) abort();
                unsigned int count = 0;
                double start = now(), end;
                do {
                    for (int batch = 0; batch < 32; batch++) sink = checksum(seed, input, n);
                    count += 32;
                    end = now();
                } while (end - start < 0.2);
                printf("%zu,%s,%s,%.2f\n", n, kind == 0 ? "adler32" : "crc32",
                       names[backend], (end - start) * 1e9 / count);
            }
        }
        free(input);
    }
    if (sink == 0xffffffffUL) fprintf(stderr, "checksum sink: %lu\n", sink);
}

/* Reuse each library's context, matching the Java benchmark. Inflate exactly
   the same stock-zlib compressed representation in all three libraries. */
int main(int argc, char** argv) {
    if (argc < 2 || argc > 3) { fprintf(stderr, "usage: %s corpus-file [level]\n", argv[0]); return 1; }
    int checksum_mode = argc == 3 && strcmp(argv[2], "checksums") == 0;
    int level = argc == 3 && !checksum_mode ? atoi(argv[2]) : 6;
    if (level < 1 || level > 9) return 1;
    FILE* f = fopen(argv[1], "rb");
    if (f == NULL) return 1;
    fseek(f, 0, SEEK_END);
    size_t corpus_size = ftell(f);
    rewind(f);
    unsigned char* corpus = malloc(corpus_size);
    if (corpus_size == 0 || corpus == NULL || fread(corpus, 1, corpus_size, f) != corpus_size) return 1;
    fclose(f);
    if (checksum_mode) {
        checksum_benchmark(corpus, corpus_size);
        free(corpus);
        return 0;
    }
    puts("size,level,library,deflate_ns,inflate_ns,compressed_bytes,common_compressed_bytes");
    size_t sizes[] = {64, 1024, 16384, 65536, 1048576, corpus_size};
    for (size_t si = 0; si < sizeof(sizes) / sizeof(sizes[0]); si++) {
        size_t n = sizes[si];
        size_t capacity = compressBound(n);
        unsigned char* input = malloc(n);
        unsigned char* compressed = malloc(capacity);
        unsigned char* common = malloc(capacity);
        unsigned char* output = malloc(n);
        if (!input || !compressed || !common || !output) abort();
        for (size_t i = 0; i < n; i++) input[i] = corpus[i % corpus_size];
        uLong common_size = capacity;
        if (compress2(common, &common_size, input, n, level) != Z_OK) abort();
        for (int backend = 0; backend < 4; backend++) {
            z_stream def = {0}, inf = {0};
            struct libdeflate_compressor* lc = NULL;
            struct libdeflate_decompressor* li = NULL;
            if (backend == 0) {
                if (deflateInit(&def, level) != Z_OK || inflateInit(&inf) != Z_OK) abort();
            } else if ((backend == 1 || backend == 2)) {
                if (functions[backend - 1].deflateInit2_(&def, level, Z_DEFLATED, MAX_WBITS, 8, Z_DEFAULT_STRATEGY,
                                         ZLIB_VERSION, sizeof(def)) != Z_OK ||
                    functions[backend - 1].inflateInit2_(&inf, MAX_WBITS, ZLIB_VERSION, sizeof(inf)) != Z_OK) abort();
            } else {
                lc = libdeflate_alloc_compressor(level);
                li = libdeflate_alloc_decompressor();
                if (!lc || !li) abort();
            }
            int count = 0;
            size_t compressed_size = 0;
            double start = now(), end;
            do {
                if (backend == 3) {
                    compressed_size = libdeflate_zlib_compress(lc, input, n, compressed, capacity);
                    if (compressed_size == 0) abort();
                } else {
                    if ((backend ? functions[backend - 1].deflateReset(&def) : deflateReset(&def)) != Z_OK) abort();
                    def.next_in = input; def.avail_in = n;
                    def.next_out = compressed; def.avail_out = capacity;
                    if ((backend ? functions[backend - 1].deflate(&def, Z_FINISH) : deflate(&def, Z_FINISH)) != Z_STREAM_END) abort();
                    compressed_size = def.total_out;
                }
                count++; end = now();
            } while (end - start < 0.2);
            double deflate_ns = (end - start) * 1e9 / count;
            uLong verified_size = n;
            if (uncompress(output, &verified_size, compressed, compressed_size) != Z_OK ||
                verified_size != n || memcmp(input, output, n)) abort();
            count = 0; start = now();
            do {
                if (backend == 3) {
                    size_t actual;
                    if (libdeflate_zlib_decompress(li, common, common_size, output, n, &actual) || actual != n) abort();
                } else {
                    if ((backend ? functions[backend - 1].inflateReset(&inf) : inflateReset(&inf)) != Z_OK) abort();
                    inf.next_in = common; inf.avail_in = common_size;
                    inf.next_out = output; inf.avail_out = n;
                    if ((backend ? functions[backend - 1].inflate(&inf, Z_FINISH) : inflate(&inf, Z_FINISH)) != Z_STREAM_END || inf.total_out != n) abort();
                }
                count++; end = now();
            } while (end - start < 0.2);
            double inflate_ns = (end - start) * 1e9 / count;
            if (memcmp(input, output, n)) abort();
            printf("%zu,%d,%s,%.1f,%.1f,%zu,%lu\n", n, level,
                   backend == 0 ? "zlib" : backend == 1 ? "zlib-ng-release" : backend == 2 ? "zlib-ng-develop" : "libdeflate",
                   deflate_ns, inflate_ns, compressed_size, common_size);
            if (backend == 0) { deflateEnd(&def); inflateEnd(&inf); }
            else if ((backend == 1 || backend == 2)) { functions[backend - 1].deflateEnd(&def); functions[backend - 1].inflateEnd(&inf); }
            else { libdeflate_free_compressor(lc); libdeflate_free_decompressor(li); }
        }
        free(input); free(compressed); free(common); free(output);
    }
    free(corpus);
    return 0;
}
