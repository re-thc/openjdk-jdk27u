/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
 */

// Compile the production kernels with isolated capability/publication callbacks.
// This bypasses Java gates and VM debug assertions to test the native contract.
#define JVM_StringZillaCapabilities test_capabilities
#define JVM_RegisterStringZillaKernels test_register_kernels
#define StringZilla_initialize test_initialize
#include "StringZillaKernels.c"
#include <limits.h>
#include <stdlib.h>
#include <string.h>
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
#include <cpuid.h>
#endif

static jint requested_capabilities;
static const StringZillaKernels* published;

JNIEXPORT jint JNICALL test_capabilities(void) {
    return requested_capabilities;
}

JNIEXPORT void JNICALL test_register_kernels(const void* kernels) {
    published = (const StringZillaKernels*)kernels;
}

static int can_execute(jint capabilities) {
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
    if (capabilities & (JVM_STRINGZILLA_HASWELL | JVM_STRINGZILLA_SKYLAKE)) {
        // CPUID extended leaf 1, ECX bit 5 reports LZCNT on AMD and Intel.
        unsigned int eax, ebx, ecx, edx;
        if (!__get_cpuid(0x80000001, &eax, &ebx, &ecx, &edx) || !(ecx & (1u << 5))) return 0;
        if (!(__builtin_cpu_supports("avx2") && __builtin_cpu_supports("bmi") &&
              __builtin_cpu_supports("bmi2"))) return 0;
    }
    if (capabilities & JVM_STRINGZILLA_SKYLAKE) {
        if (!(__builtin_cpu_supports("avx512f") && __builtin_cpu_supports("avx512bw") &&
              __builtin_cpu_supports("avx512vl"))) return 0;
    }
#endif
    return 1;
}

// Return the failing line rather than relying on assertions enabled by the build.
#define CHECK(condition) do { if (!(condition)) return __LINE__; } while (0)
#define CHECK_UTF16(result, expected) do { \
    jint actual = (result); \
    CHECK(actual == JVM_STRINGZILLA_FALLBACK || actual == (expected)); \
} while (0)

static jint check_kernels(void) {
    // MSVC's serial helpers must not depend on optional bit-manipulation ISAs.
    for (int bit = 0; bit < 64; bit++) {
        sz_u64_t value = (sz_u64_t)1 << bit;
        CHECK(sz_u64_ctz(value) == bit);
        CHECK(sz_u64_clz(value) == 63 - bit);
        CHECK(sz_u64_popcount(value) == 1);
    }
    for (int bit = 0; bit < 32; bit++) {
        sz_u32_t value = (sz_u32_t)1 << bit;
        CHECK(sz_u32_ctz(value) == bit);
        CHECK(sz_u32_clz(value) == 31 - bit);
        CHECK(sz_u32_popcount(value) == 1);
    }
    CHECK(sz_u64_popcount(0) == 0);
    CHECK(sz_u64_popcount(0xFFFFFFFFFFFFFFFFull) == 64);
    CHECK(sz_u64_popcount(0x0123456789ABCDEFull) == 32);
    CHECK(sz_u32_popcount(0) == 0);
    CHECK(sz_u32_popcount(0xFFFFFFFFu) == 32);
    CHECK(sz_u32_popcount(0x01234567u) == 12);
#if defined(_MSC_VER) && !defined(__clang__) && defined(_M_X64)
    CHECK(sz_u64_ctz(0) == 64);
    CHECK(sz_u64_clz(0) == 64);
    CHECK(sz_u32_ctz(0) == 32);
    CHECK(sz_u32_clz(0) == 32);
#endif
    const jint counts[] = {0, 1, 63, 64};
    const jint invalid_counts[] = {-1, INT_MIN, 65, 128, 4096, INT_MAX};
    jchar source[256];
    char target[64];
    for (jint mask = 0; mask < 8; mask++) {
        requested_capabilities = mask;
        test_initialize();
        const StringZillaKernels* kernels = published;
        const StringZillaKernels* expected = &serial_kernels;
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
        if (mask & JVM_STRINGZILLA_SKYLAKE) expected = &skylake_kernels;
        else if (mask & JVM_STRINGZILLA_HASWELL) expected = &haswell_kernels;
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
        if (mask & JVM_STRINGZILLA_NEON) expected = &neon_kernels;
#endif
        CHECK(kernels == expected);
        test_initialize();
        CHECK(published == kernels);
        if (!can_execute(kernels->capabilities)) continue;

        // A single candidate compares the complete range, including unaligned bytes.
        const jint single_counts[] = {1, 2, 31, 32, 63, 64, 65, 127, 128};
        char single_source[264];
        char single_latin[128];
        jchar single_utf16[128];
        for (jint i = 0; i < 128; i++) {
            single_latin[i] = (char)(32 + i % 80);
            single_utf16[i] = (unsigned char)single_latin[i];
        }
        for (unsigned int c = 0; c < sizeof(single_counts) / sizeof(single_counts[0]); c++) {
            jint count = single_counts[c];
            for (jint offset = 0; offset < 8; offset++) {
                char* bytes = single_source + offset;
                memcpy(bytes, single_latin, count);
                CHECK(kernels->findLatin1(bytes, count, single_latin, count) == 0);
                CHECK(kernels->rfindLatin1(bytes, count, single_latin, count) == 0);
                bytes[count - 1] ^= 1;
                CHECK(kernels->findLatin1(bytes, count, single_latin, count) == -1);
                CHECK(kernels->rfindLatin1(bytes, count, single_latin, count) == -1);
                memcpy(bytes, single_utf16, count * sizeof(jchar));
                CHECK(kernels->findUTF16(bytes, count * 2, (const char*)single_utf16, count * 2) == 0);
                CHECK(kernels->rfindUTF16(bytes, count * 2, (const char*)single_utf16, count * 2) == 0);
                bytes[count * 2 - 1] ^= 1;
                CHECK(kernels->findUTF16(bytes, count * 2, (const char*)single_utf16, count * 2) == -1);
                CHECK(kernels->rfindUTF16(bytes, count * 2, (const char*)single_utf16, count * 2) == -1);
                if (count <= 64) {
                    bytes[count * 2 - 1] ^= 1;
                    CHECK(kernels->findUTF16Latin1(bytes, count * 2, single_latin, count) == 0);
                    CHECK(kernels->rfindUTF16Latin1(bytes, count * 2, single_latin, count) == 0);
                    bytes[0] ^= 1;
                    CHECK(kernels->findUTF16Latin1(bytes, count * 2, single_latin, count) == -1);
                    CHECK(kernels->rfindUTF16Latin1(bytes, count * 2, single_latin, count) == -1);
                }
            }
        }

        // Long UTF-16 windows with one or two aligned starts preserve reverse
        // ordering while ignoring byte-perfect occurrences at odd starts.
        jchar two_start_source[140], two_start_target[136];
        for (jint offset = 0; offset < 8; offset++) {
            jchar* text = two_start_source + offset;
            jchar* target = two_start_target + ((offset + 3) & 7);
            for (jint i = 0; i < 129; i++) target[i] = 0x0101;
            for (jint span = 0; span <= 1; span++) {
                jint length = 129 + span;
                for (jint i = 0; i < length; i++) text[i] = 0x0101;
                CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                        (const char*)target, 258), span * 2);
                text[64] = 0x0102;
                CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                        (const char*)target, 258), -1);
            }
            for (jint i = 0; i < 130; i++) text[i] = 0x0101;
            text[129] = 0x0202;
            CHECK_UTF16(kernels->rfindUTF16((const char*)text, 260, (const char*)target, 258), 0);
            text[129] = 0x0101;
            text[0] = 0x0202;
            CHECK_UTF16(kernels->rfindUTF16((const char*)text, 260, (const char*)target, 258), 2);
            for (jint i = 0; i < 129; i++) target[i] = 0x0104;
            for (jint i = 0; i < 130; i++) text[i] = 0x0401;
            CHECK_UTF16(kernels->rfindUTF16((const char*)text, 260, (const char*)target, 258), -1);
        }

        // Aligned short-needle filtering must verify interiors and batch edges.
        const jint short_counts[] = {1, 2, 3, 4, 8, 9, 16, 31, 32, 33, 63, 64, 65, 127, 128, 129};
        jchar aligned_source[512];
        jchar aligned_target[129];
        for (unsigned int c = 0; c < sizeof(short_counts) / sizeof(short_counts[0]); c++) {
            jint count = short_counts[c];
            const jint markers[] = {count / 2, count > 2 ? count - 2 : 0};
            for (unsigned int m = 0; m < sizeof(markers) / sizeof(markers[0]); m++) {
                jint marker = markers[m];
                for (jint i = 0; i < count; i++) aligned_target[i] = 0x0401;
                aligned_target[marker] = 0x0402;
                const jint positions[] = {0, 1, 31, 32, 33, 257, 512 - count};
                for (unsigned int p = 0; p < sizeof(positions) / sizeof(positions[0]); p++) {
                    jint position = positions[p];
                    for (jint i = 0; i < 512; i++) aligned_source[i] = 0x0401;
                    memcpy(aligned_source + position, aligned_target, count * sizeof(jchar));
                    CHECK_UTF16(kernels->rfindUTF16((const char*)aligned_source, sizeof(aligned_source),
                            (const char*)aligned_target, count * sizeof(jchar)), position * 2);
                    aligned_source[position + marker] = 0x0403;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)aligned_source, sizeof(aligned_source),
                            (const char*)aligned_target, count * sizeof(jchar)), -1);
                }
            }
        }

        // An odd byte occurrence must not make short dense candidates match.
        const jint short_odd_counts[] = {2, 3, 8, 9, 16, 31, 32, 33, 64};
        const jint short_odd_lengths[] = {511, 512, 513, 1023, 1024};
        jchar short_odd_source[1032], short_odd_target[72];
        for (unsigned int c = 0; c < sizeof(short_odd_counts) / sizeof(short_odd_counts[0]); c++) {
            jint count = short_odd_counts[c];
            for (jint offset = 0; offset < 8; offset++) {
                jchar* text = short_odd_source + offset;
                jchar* target = short_odd_target + ((offset + 3) & 7);
                for (jint i = 0; i < count; i++) target[i] = 0x0401;
                target[count - 2] = 0x0402;
                for (unsigned int n = 0; n < sizeof(short_odd_lengths) / sizeof(short_odd_lengths[0]); n++) {
                    jint length = short_odd_lengths[n], padding = length - count - 1;
                    for (jint i = 0; i < length; i++) text[i] = i < padding ? 0x0401 : 0;
                    memcpy((char*)(text + padding) + 1, target, count * sizeof(jchar));
                    CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                            (const char*)target, count * 2), -1);
                    const jint positions[] = {0, 1, 31, 32, 33};
                    for (unsigned int p = 0; p < sizeof(positions) / sizeof(positions[0]); p++) {
                        jint position = positions[p];
                        memcpy(text + position, target, count * sizeof(jchar));
                        CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                (const char*)target, count * 2), position * 2);
                        for (jint i = position; i < position + count; i++) text[i] = 0x0401;
                    }
                }
            }
        }

        // A rejected long-needle prefix must not skip overlapping suffixes.
        const jint overlap_lengths[] = {128, 129, 130, 255, 256, 257, 258, 259, 511, 512, 513, 768};
        const jint overlap_spans[] = {1, 2, 4, 8, 15, 16, 17, 30, 31, 32, 33, 64, 128, 256};
        char overlap_source[1536];
        char overlap_target[1024];
        jchar overlap_utf16_source[1536];
        jchar overlap_utf16_target[1024];
        for (unsigned int n = 0; n < sizeof(overlap_lengths) / sizeof(overlap_lengths[0]); n++) {
            jint count = overlap_lengths[n];
            for (jint pos = 0; pos <= 17; pos += 17) {
                for (unsigned int s = 0; s < sizeof(overlap_spans) / sizeof(overlap_spans[0]); s++) {
                    jint extra = overlap_spans[s];
                    jint size = pos + count + extra;
                    memset(overlap_source, 'a', size);
                    memset(overlap_target, 'a', count);
                    overlap_source[pos] = overlap_target[0] = 'b';
                    CHECK(kernels->rfindLatin1(overlap_source, size, overlap_target, count) == pos);
                    CHECK(kernels->rfindLatin1(overlap_source, pos + count - 1, overlap_target, count) == -1);
                    overlap_source[pos] = 'a';
                    CHECK(kernels->rfindLatin1(overlap_source, size, overlap_target, count) == -1);
                    for (int i = 0; i < size; i++) overlap_utf16_source[i] = 0x0401;
                    for (int i = 0; i < count; i++) overlap_utf16_target[i] = 0x0401;
                    overlap_utf16_source[pos] = overlap_utf16_target[0] = 0x0402;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)overlap_utf16_source, size * 2,
                                             (const char*)overlap_utf16_target, count * 2), pos * 2);
                    CHECK_UTF16(kernels->rfindUTF16((const char*)overlap_utf16_source, (pos + count - 1) * 2,
                                             (const char*)overlap_utf16_target, count * 2), -1);
                    overlap_utf16_source[pos] = 0x0401;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)overlap_utf16_source, size * 2,
                                             (const char*)overlap_utf16_target, count * 2), -1);
                }
            }
        }

        // Dense first-byte candidates exercise long-needle short-range filtering.
        const jint dense_counts[] = {257, 258, 511, 512};
        const jint dense_spans[] = {0, 1, 2, 15, 16, 17, 30, 31, 32, 33, 62, 63, 64, 65, 96};
        char dense_source[640], dense_target[520];
        for (unsigned int n = 0; n < sizeof(dense_counts) / sizeof(dense_counts[0]); n++) {
            jint count = dense_counts[n];
            const jint markers[] = {0, 1, count / 2, count - 2, count - 1};
            for (unsigned int m = 0; m < sizeof(markers) / sizeof(markers[0]); m++) {
                for (jint offset = 0; offset < 8; offset++) {
                    char* text = dense_source + offset;
                    char* target = dense_target + ((offset + 3) & 7);
                    memset(target, 'a', count);
                    target[markers[m]] = 'b';
                    for (unsigned int r = 0; r < sizeof(dense_spans) / sizeof(dense_spans[0]); r++) {
                        jint span = dense_spans[r];
                        const jint positions[] = {-1, 0, span / 2, span};
                        for (unsigned int i = 0; i < sizeof(positions) / sizeof(positions[0]); i++) {
                            jint position = positions[i];
                            memset(text, 'a', count + span);
                            if (position >= 0) memcpy(text + position, target, count);
                            CHECK(kernels->rfindLatin1(text, count + span, target, count) == position);
                        }
                    }
                }
            }
        }

        // A rejected rightmost pivot must retain earlier overlapping matches.
        const jint rejected_spans[] = {63, 64, 65, 96, 512, 1024};
        char rejected_source[1552], rejected_target[520];
        for (unsigned int n = 0; n < sizeof(dense_counts) / sizeof(dense_counts[0]); n++) {
            jint count = dense_counts[n];
            for (jint offset = 0; offset < 8; offset++) {
                char* text = rejected_source + offset;
                char* target = rejected_target + ((offset + 3) & 7);
                memset(target, 'a', count);
                target[count - 2] = 'b';
                for (unsigned int s = 0; s < sizeof(rejected_spans) / sizeof(rejected_spans[0]); s++) {
                    jint span = rejected_spans[s];
                    memset(text, 'a', count + span);
                    memcpy(text, target, count);
                    text[span + count - 2] = 'b';
                    if (span >= count) text[span] = 'c';
                    CHECK(kernels->rfindLatin1(text, count + span, target, count) == 0);
                    text[count - 2] = 'a';
                    if (span >= count) text[span] = 'a';
                    CHECK(kernels->rfindLatin1(text, count + span, target, count) == span);
                    text[span + count / 2] = 'c';
                    CHECK(kernels->rfindLatin1(text, count + span, target, count) == -1);
                }
            }
        }

        // Serial probes cover immediate matches and repeated-suffix contrast
        // outside the fixed samples, including a 511-byte needle.
        const jint serial_counts[] = {5, 8, 16, 32, 64, 256, 257, 258, 511, 512};
        const jint serial_spans[] = {0, 1, 2, 31, 32, 47, 63, 64, 65, 96, 512};
        char serial_source[1040], serial_target[520];
        for (unsigned int n = 0; n < sizeof(serial_counts) / sizeof(serial_counts[0]); n++) {
            jint count = serial_counts[n];
            jint contrast = count > 256 ? 254 : count / 2;
            for (jint offset = 0; offset < 8; offset++) {
                char* text = serial_source + offset;
                char* target = serial_target + ((offset + 3) & 7);
                memset(target, 'a', count);
                target[contrast] = 'b';
                for (unsigned int s = 0; s < sizeof(serial_spans) / sizeof(serial_spans[0]); s++) {
                    jint span = serial_spans[s], length = count + span;
                    const jint positions[] = {-1, 0, span / 2, span};
                    for (unsigned int p = 0; p < sizeof(positions) / sizeof(positions[0]); p++) {
                        jint position = positions[p];
                        memset(text, 'a', length);
                        if (position >= 0) memcpy(text + position, target, count);
                        CHECK(kernels->rfindLatin1(text, length, target, count) == position);
                    }
                    // An absent first byte must remain a fast rejection.
                    target[contrast] = 'a';
                    target[0] = 'b';
                    memset(text, 'a', length);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == -1);
                    memcpy(text + span, target, count);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == span);
                    // Uniform needles exercise the no-contrast case.
                    target[0] = 'a';
                    memset(text, 'a', length);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == span);
                    memset(text, 'b', length);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == -1);
                    target[contrast] = 'b';
                }
            }
        }

        // Select UTF-16 contrast by code unit. The byte-swapped rare character
        // shares both bytes with the source, creating unaligned byte candidates.
        const jint serial_utf16_counts[] = {129, 256};
        const jchar serial_rare[] = {0x0402, 0x0104};
        jchar serial_utf16_source[1040], serial_utf16_target[264];
        for (unsigned int n = 0; n < sizeof(serial_utf16_counts) / sizeof(serial_utf16_counts[0]); n++) {
            jint count = serial_utf16_counts[n];
            for (unsigned int r = 0; r < sizeof(serial_rare) / sizeof(serial_rare[0]); r++) {
                jchar rare = serial_rare[r];
                for (jint offset = 0; offset < 8; offset++) {
                    jchar* text = serial_utf16_source + offset;
                    jchar* target = serial_utf16_target + ((offset + 3) & 7);
                    for (jint i = 0; i < count; i++) target[i] = 0x0401;
                    target[127] = rare;
                    for (unsigned int s = 0; s < sizeof(serial_spans) / sizeof(serial_spans[0]); s++) {
                        jint span = serial_spans[s], length = count + span;
                        const jint positions[] = {-1, 0, span / 2, span};
                        for (unsigned int p = 0; p < sizeof(positions) / sizeof(positions[0]); p++) {
                            jint position = positions[p];
                            for (jint i = 0; i < length; i++) text[i] = 0x0401;
                            if (position >= 0) memcpy(text + position, target, count * sizeof(jchar));
                            CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                    (const char*)target, count * 2), (position < 0 ? -1 : position * 2));
                        }
                        target[127] = 0x0401;
                        target[0] = rare;
                        for (jint i = 0; i < length; i++) text[i] = 0x0401;
                        CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                (const char*)target, count * 2), -1);
                        memcpy(text + span, target, count * sizeof(jchar));
                        CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                (const char*)target, count * 2), span * 2);
                        target[0] = 0x0401;
                        for (jint i = 0; i < length; i++) text[i] = 0x0401;
                        CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                (const char*)target, count * 2), span * 2);
                        for (jint i = 0; i < length; i++) text[i] = 0x0403;
                        CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                (const char*)target, count * 2), -1);
                        target[127] = rare;
                    }
                }
            }
        }

        // A rejected later contrast must not hide an earlier aligned match.
        const jint serial_rejected_spans[] = {129, 191, 255, 256, 257, 512, 1024};
        jchar serial_rejected_source[1296];
        for (unsigned int r = 0; r < sizeof(serial_rare) / sizeof(serial_rare[0]); r++) {
            for (jint offset = 0; offset < 8; offset++) {
                jchar* text = serial_rejected_source + offset;
                jchar* target = serial_utf16_target + ((offset + 3) & 7);
                for (jint i = 0; i < 256; i++) target[i] = 0x0401;
                target[127] = serial_rare[r];
                for (unsigned int s = 0; s < sizeof(serial_rejected_spans) / sizeof(serial_rejected_spans[0]); s++) {
                    jint span = serial_rejected_spans[s], length = 256 + span;
                    for (jint i = 0; i < length; i++) text[i] = 0x0401;
                    memcpy(text, target, 256 * sizeof(jchar));
                    text[span + 127] = serial_rare[r];
                    text[length - 1] = 0x0403;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                            (const char*)target, 512), 0);
                    text[127] = 0x0401;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                            (const char*)target, 512), -1);
                    text[length - 1] = 0x0401;
                    CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                            (const char*)target, 512), span * 2);
                }
            }
        }

        // Probe common mismatch values before a late rare byte, in every
        // periodic phase and with markers inside and outside the suffix.
        const jint periodic_counts[] = {512, 513, 513};
        const jint periodic_lengths[] = {4096, 4095, 4096};
        const jint periodic_periods[] = {2, 3, 3};
        char periodic_source[4104], periodic_target[520];
        for (unsigned int n = 0; n < sizeof(periodic_counts) / sizeof(periodic_counts[0]); n++) {
            jint count = periodic_counts[n], length = periodic_lengths[n];
            jint period = periodic_periods[n], span = length - count;
            const jint markers[] = {count / 2 - 1, count - 4, count - 3, count - 2};
            for (unsigned int m = 0; m < sizeof(markers) / sizeof(markers[0]); m++) {
                for (jint phase = 0; phase < period; phase++) {
                    for (jint offset = 0; offset < 8; offset++) {
                        char* text = periodic_source + offset;
                        char* target = periodic_target + ((offset + 3) & 7);
                        for (jint k = 0; k < count; k++) target[k] = k % period == period - 1 ? 'b' : 'a';
                        target[markers[m]] = 'c';
                        for (jint k = 0; k < length; k++) {
                            text[k] = (k + phase) % period == period - 1 ? 'b' : 'a';
                        }
                        CHECK(kernels->rfindLatin1(text, length, target, count) == -1);
                        memcpy(text, target, count);
                        CHECK(kernels->rfindLatin1(text, length, target, count) == 0);
                        memcpy(text + span, target, count);
                        CHECK(kernels->rfindLatin1(text, length, target, count) == span);
                    }
                }
            }
        }

        // Include markers whose first mismatching byte is common but whose
        // other byte is absent, with both byte orders and odd byte candidates.
        const jint periodic_utf16_counts[] = {256, 258, 258, 257};
        const jint periodic_utf16_lengths[] = {2048, 2049, 2050, 2047};
        const jint periodic_utf16_periods[] = {2, 3, 3, 3};
        const jchar periodic_units[][3] = {{0x0401, 0x0104, 0x0204},
                                           {0x0104, 0x0401, 0x0402},
                                           {0x0401, 0x0402, 0x0501},
                                           {0x0104, 0x0204, 0x0105}};
        jchar periodic_utf16_source[2064], periodic_utf16_target[272];
        for (unsigned int n = 0; n < sizeof(periodic_utf16_counts) / sizeof(periodic_utf16_counts[0]); n++) {
            jint count = periodic_utf16_counts[n], length = periodic_utf16_lengths[n];
            jint period = periodic_utf16_periods[n], span = length - count;
            const jint markers[] = {count / 2 - 1, count - 4, count - 3, count - 2};
            for (unsigned int order = 0; order < sizeof(periodic_units) / sizeof(periodic_units[0]); order++) {
                for (unsigned int m = 0; m < sizeof(markers) / sizeof(markers[0]); m++) {
                    for (jint phase = 0; phase < period; phase++) {
                        for (jint offset = 0; offset < 8; offset++) {
                            jchar* text = periodic_utf16_source + offset;
                            jchar* target = periodic_utf16_target + ((offset + 3) & 7);
                            for (jint k = 0; k < count; k++) {
                                target[k] = periodic_units[order][k % period == period - 1 ? 1 : 0];
                            }
                            target[markers[m]] = periodic_units[order][2];
                            for (jint k = 0; k < length; k++) {
                                text[k] = periodic_units[order][(k + phase) % period == period - 1 ? 1 : 0];
                            }
                            CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                    (const char*)target, count * 2), -1);
                            memcpy(text, target, count * sizeof(jchar));
                            CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                    (const char*)target, count * 2), 0);
                            memcpy(text + span, target, count * sizeof(jchar));
                            CHECK_UTF16(kernels->rfindUTF16((const char*)text, length * 2,
                                    (const char*)target, count * 2), span * 2);
                        }
                    }
                }
            }
        }

        // Exercise the ABC/D pattern separately from AAB/C: every distinct
        // period value occurs in the text, and the last marker is not sampled.
        // UTF-16 includes both byte orders; a present byte need not form a unit.
        for (jint n = 0; n < 2; n++) {
            jint period = n + 2, count = 512 + n, length = 4096 - n;
            jint utf_count = 256 + n, utf_length = 2048 - n;
            for (jint phase = 0; phase < period; phase++) {
                for (jint offset = 0; offset < 8; offset++) {
                    char* text = periodic_source + offset;
                    char* target = periodic_target + ((offset + 3) & 7);
                    for (jint k = 0; k < count; k++) target[k] = (char)('a' + k % period);
                    target[count - 3] = (char)('a' + period);
                    for (jint k = 0; k < length; k++) text[k] = (char)('a' + (k + phase) % period);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == -1);
                    memcpy(text, target, count);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == 0);
                    memcpy(text + length - count, target, count);
                    CHECK(kernels->rfindLatin1(text, length, target, count) == length - count);
                    for (jint order = 0; order < 2; order++) {
                        jchar* utf_text = periodic_utf16_source + offset;
                        jchar* utf_target = periodic_utf16_target + ((offset + 3) & 7);
                        for (jint k = 0; k < utf_count; k++) {
                            jchar value = (jchar)(0x0401 + k % period);
                            utf_target[k] = order ? (jchar)((value << 8) | (value >> 8)) : value;
                        }
                        jchar marker = (jchar)(0x0401 + period);
                        utf_target[utf_count - 3] = order
                                ? (jchar)((marker << 8) | (marker >> 8)) : marker;
                        for (jint k = 0; k < utf_length; k++) {
                            jchar value = (jchar)(0x0401 + (k + phase) % period);
                            utf_text[k] = order ? (jchar)((value << 8) | (value >> 8)) : value;
                        }
                        CHECK_UTF16(kernels->rfindUTF16((const char*)utf_text, utf_length * 2,
                                (const char*)utf_target, utf_count * 2), -1);
                        memcpy(utf_text, utf_target, utf_count * sizeof(jchar));
                        CHECK_UTF16(kernels->rfindUTF16((const char*)utf_text, utf_length * 2,
                                (const char*)utf_target, utf_count * 2), 0);
                        memcpy(utf_text + utf_length - utf_count, utf_target, utf_count * sizeof(jchar));
                        CHECK_UTF16(kernels->rfindUTF16((const char*)utf_text, utf_length * 2,
                                (const char*)utf_target, utf_count * 2), (utf_length - utf_count) * 2);
                    }
                }
            }
        }

        // A third presence-query hit is not fully verified. Retain it for
        // bulk fallback, including the sole valid match at start zero.
        for (jint offset = 0; offset < 8; offset++) {
            char* text = periodic_source + offset;
            char* target = periodic_target + ((offset + 3) & 7);
            const jint count = 257, stride = count + 3, length = 4 * count + 9;
            memset(text, 'x', length);
            memset(target, 'a', count);
            target[0] = 'b';
            target[count / 2] = 'd';
            target[count - 2] = 'e';
            target[count - 1] = 'c';
            for (jint k = 0; k < 4; k++) memcpy(text + k * stride, target, count);
            text[3 * stride + count / 2] = 'x';
            text[2 * stride + count - 1] = 'x';
            text[stride + count - 2] = 'x';
            CHECK(kernels->rfindLatin1(text, length, target, count) == 0);

            jchar* utf_text = periodic_utf16_source + offset;
            jchar* utf_target = periodic_utf16_target + ((offset + 3) & 7);
            const jint utf_count = 129, utf_stride = utf_count + 3, utf_length = 4 * utf_count + 9;
            for (jint k = 0; k < utf_length; k++) utf_text[k] = 0x0405;
            for (jint k = 0; k < utf_count; k++) utf_target[k] = 0x0406;
            utf_target[0] = 0x0401;
            utf_target[utf_count / 2] = 0x0402;
            utf_target[utf_count - 2] = 0x0404;
            utf_target[utf_count - 1] = 0x0403;
            for (jint k = 0; k < 4; k++) {
                memcpy(utf_text + k * utf_stride, utf_target, utf_count * sizeof(jchar));
            }
            utf_text[3 * utf_stride + utf_count / 2] = 0x0405;
            utf_text[2 * utf_stride + utf_count - 1] = 0x0405;
            utf_text[utf_stride + utf_count - 2] = 0x0405;
            CHECK_UTF16(kernels->rfindUTF16((const char*)utf_text, utf_length * 2,
                    (const char*)utf_target, utf_count * 2), 0);
        }

        // A bounded UTF-16 byte probe may encounter an odd candidate first.
        // Its bulk fallback must retain earlier aligned matches and let the
        // existing adapter reject later byte-perfect odd occurrences.
        jchar bounded_odd_source[520], bounded_odd_target[136];
        const jchar bounded_odd_units[][2] = {{0x0401, 0x0104}, {0x0104, 0x0401}};
        for (unsigned int order = 0; order < sizeof(bounded_odd_units) / sizeof(bounded_odd_units[0]); order++) {
            for (jint offset = 0; offset < 8; offset++) {
                jchar* text = bounded_odd_source + offset;
                jchar* target = bounded_odd_target + ((offset + 3) & 7);
                for (jint i = 0; i < 129; i++) target[i] = bounded_odd_units[order][1];
                for (jint i = 0; i < 512; i++) text[i] = bounded_odd_units[order][0];
                CHECK_UTF16(kernels->rfindUTF16((const char*)text, 1024, (const char*)target, 258), -1);
                memcpy(text, target, 258);
                CHECK_UTF16(kernels->rfindUTF16((const char*)text, 1024, (const char*)target, 258), 0);
            }
        }

        // Long-needle verification must accept every byte-array alignment.
        sz_align_(64) char unaligned_source[576];
        sz_align_(64) char unaligned_target[320];
        const jint lengths[] = {24, 32, 64, 90, 128, 254, 256, 258};
        for (unsigned int n = 0; n < sizeof(lengths) / sizeof(lengths[0]); n++) {
            jint length = lengths[n];
            for (int offset = 0; offset < 32; offset++) {
                char* text = unaligned_source + offset;
                char* needle = unaligned_target + offset;
                memset(text, 'a', 512);
                memset(needle, 'a', length);
                needle[0] = 'b';
                needle[length - 1] = 'c';
                memcpy(text + 64, needle, length);
                CHECK(kernels->findLatin1(text, 512, needle, length) == 64);
                CHECK(kernels->rfindLatin1(text, 512, needle, length) == 64);
                CHECK(kernels->equal(text + 64, needle, length) == 1);
                if ((offset & 1) == 0) {
                    CHECK_UTF16(kernels->findUTF16(text, 512, needle, length), 64);
                    CHECK_UTF16(kernels->rfindUTF16(text, 512, needle, length), 64);
                }
                needle[length / 2] ^= 1;
                CHECK(kernels->findLatin1(text, 512, needle, length) == -1);
                CHECK(kernels->rfindLatin1(text, 512, needle, length) == -1);
                CHECK(kernels->equal(text + 64, needle, length) == 0);
                if ((offset & 1) == 0) {
                    CHECK_UTF16(kernels->findUTF16(text, 512, needle, length), -1);
                    CHECK_UTF16(kernels->rfindUTF16(text, 512, needle, length), -1);
                }
            }
        }

        // Exact byte-set predicates for every Latin1 value, alignment and table.
        // Allocate exact ends so sanitizer runs can detect vector overreads.
        for (int mode = 0; mode <= 4; mode++) {
            CHECK(kernels->scanLatin1(NULL, -1, mode) == JVM_STRINGZILLA_FALLBACK);
            CHECK(kernels->scanLatin1(NULL, JVM_STRINGZILLA_MAX_BYTES + 1, mode) == JVM_STRINGZILLA_FALLBACK);
            CHECK(kernels->scanLatin1(NULL, 0, mode) == -1);
            for (unsigned int ch = 0; ch < 256; ch++) {
                int whitespace = (ch >= 9 && ch <= 13) || (ch >= 28 && ch <= 32);
                int match = mode == 0 ? ch == 10 || ch == 13 : mode <= 2 ? ch > 32 : !whitespace;
                for (int offset = 0; offset < 32; offset++) {
                    char* allocation = (char*)malloc(257 + offset);
                    CHECK(allocation != NULL);
                    char* bytes = allocation + offset;
                    memset(bytes, (int)ch, 257);
                    int expected = match ? (mode == 2 || mode == 4 ? 256 : 0) : -1;
                    int result = kernels->scanLatin1(bytes, 257, mode);
                    free(allocation);
                    CHECK(result == expected);
                }
            }
            const int scan_lengths[] = {1, 7, 8, 15, 16, 31, 32, 33, 255, 256, 257, 65536};
            for (unsigned int n = 0; n < sizeof(scan_lengths) / sizeof(scan_lengths[0]); n++) {
                int length = scan_lengths[n];
                for (int offset = 0; offset < 32; offset++) {
                    char* allocation = (char*)malloc(length + offset);
                    CHECK(allocation != NULL);
                    char* bytes = allocation + offset;
                    memset(bytes, mode == 0 ? 'x' : ' ', length);
                    CHECK(kernels->scanLatin1(bytes, length, mode) == -1);
                    for (int p = 0; p < length; p = p < 33 ? p + 1 : length - 1) {
                        bytes[p] = mode == 0 ? '\r' : (char)0xa0;
                        CHECK(kernels->scanLatin1(bytes, length, mode) == p);
                        bytes[p] = mode == 0 ? 'x' : ' ';
                        if (p == length - 1) break;
                    }
                    free(allocation);
                }
            }
        }
        CHECK(kernels->scanLatin1(NULL, 1, -1) == JVM_STRINGZILLA_FALLBACK);
        CHECK(kernels->scanLatin1(NULL, 1, 5) == JVM_STRINGZILLA_FALLBACK);

        // Limits are enforced by every table, before touching either array.
        StringZillaSearchFn bounded[] = {kernels->findLatin1, kernels->rfindLatin1,
                                        kernels->findUTF16, kernels->rfindUTF16};
        for (unsigned int i = 0; i < sizeof(bounded) / sizeof(bounded[0]); i++) {
            CHECK(bounded[i](NULL, JVM_STRINGZILLA_MAX_BYTES + 2, NULL, 2) == JVM_STRINGZILLA_FALLBACK);
            CHECK(bounded[i](NULL, 4096, NULL, 2048) == JVM_STRINGZILLA_FALLBACK);
        }
        CHECK_UTF16(kernels->findUTF16Latin1(NULL, JVM_STRINGZILLA_MAX_BYTES + 2, NULL, 1), JVM_STRINGZILLA_FALLBACK);
        CHECK_UTF16(kernels->rfindUTF16Latin1(NULL, JVM_STRINGZILLA_MAX_BYTES + 2, NULL, 1), JVM_STRINGZILLA_FALLBACK);
        StringZillaCharFn chars[] = {kernels->findCharLatin1, kernels->rfindCharLatin1,
                                    kernels->findCharUTF16, kernels->rfindCharUTF16};
        for (unsigned int i = 0; i < sizeof(chars) / sizeof(chars[0]); i++) {
            CHECK(chars[i](NULL, JVM_STRINGZILLA_MAX_BYTES + 2, 'a') == JVM_STRINGZILLA_FALLBACK);
        }
        CHECK(kernels->equal(NULL, NULL, JVM_STRINGZILLA_MAX_BYTES + 1) == JVM_STRINGZILLA_FALLBACK);
        // Long-needle probes also reject excessive work before any array read.
        CHECK(kernels->rfindLatin1(NULL, JVM_STRINGZILLA_MAX_BYTES + 1, NULL, 511) == JVM_STRINGZILLA_FALLBACK);
        CHECK(kernels->rfindLatin1(NULL, JVM_STRINGZILLA_MAX_WORK / 511 + 1, NULL, 511) == JVM_STRINGZILLA_FALLBACK);
        CHECK_UTF16(kernels->rfindUTF16(NULL, JVM_STRINGZILLA_MAX_BYTES + 2, NULL, 512), JVM_STRINGZILLA_FALLBACK);
        CHECK_UTF16(kernels->rfindUTF16(NULL, JVM_STRINGZILLA_MAX_WORK / 512 + 2, NULL, 512), JVM_STRINGZILLA_FALLBACK);

        // An actual byte-perfect odd occurrence forces the aligned adapter.
        // Most earlier candidates agree until the penultimate code unit.
        jchar repeated[1024] = {0};
        jchar long_needle[64];
        for (int i = 0; i < 512; i++) repeated[i] = 0x0401;
        for (int i = 0; i < 64; i++) long_needle[i] = 0x0401;
        long_needle[62] = 0x0402;
        memcpy((char*)(repeated + 512) + 1, long_needle, sizeof(long_needle));
        CHECK_UTF16(kernels->findUTF16((const char*)repeated, 577 * 2, (const char*)long_needle, 128), -1);
        CHECK_UTF16(kernels->rfindUTF16((const char*)repeated, 577 * 2, (const char*)long_needle, 128), -1);
        // Forward search must continue beyond the odd match to a real match.
        memcpy(repeated + 608, long_needle, sizeof(long_needle));
        CHECK_UTF16(kernels->findUTF16((const char*)repeated, 672 * 2, (const char*)long_needle, 128), 1216);
        CHECK_UTF16(kernels->rfindUTF16((const char*)repeated, 672 * 2, (const char*)long_needle, 128), 1216);
        // Reverse search must continue before the odd match to a real match.
        memcpy(repeated + 23, long_needle, sizeof(long_needle));
        CHECK_UTF16(kernels->rfindUTF16((const char*)repeated, 577 * 2, (const char*)long_needle, 128), 46);

        // Periodic crossed bytes force aligned searching in both directions.
        // Real matches straddle batch lanes/edges and leave a scalar tail.
        const int aligned_counts[] = {1, 2, 3, 16, 64};
        const int positions[] = {0, 1, 15, 16, 31, 32, 33, 63, 64, 65};
        jchar crossed[512], aligned_needle[64];
        for (int i = 0; i < 64; i++) aligned_needle[i] = 0x0104;
        for (unsigned int c = 0; c < sizeof(aligned_counts) / sizeof(aligned_counts[0]); c++) {
            int count = aligned_counts[c];
            for (unsigned int p = 0; p < sizeof(positions) / sizeof(positions[0]); p++) {
                for (int i = 0; i < 512; i++) crossed[i] = 0x0401;
                memcpy(crossed + positions[p], aligned_needle, count * 2);
                memcpy(crossed + 155, aligned_needle, count * 2);
                CHECK_UTF16(kernels->findUTF16((const char*)crossed, sizeof(crossed),
                                         (const char*)aligned_needle, count * 2), positions[p] * 2);
                CHECK_UTF16(kernels->rfindUTF16((const char*)crossed, sizeof(crossed),
                                          (const char*)aligned_needle, count * 2), 310);
            }
        }

        StringZillaSearchFn searches[] = {kernels->findUTF16Latin1, kernels->rfindUTF16Latin1};
        for (int reverse = 0; reverse < 2; reverse++) {
            for (unsigned int i = 0; i < sizeof(invalid_counts) / sizeof(invalid_counts[0]); i++) {
                // NULL pointers prove rejection precedes any read, including
                // when the haystack is too short or the count would overflow.
                CHECK(searches[reverse](NULL, 0, NULL, invalid_counts[i]) == -1);
                CHECK(searches[reverse](NULL, INT_MAX, NULL, invalid_counts[i]) == -1);
            }
            for (unsigned int c = 0; c < sizeof(counts) / sizeof(counts[0]); c++) {
                jint count = counts[c];
                for (int i = 0; i < 256; i++) source[i] = 0x100;
                for (int i = 0; i < count; i++) {
                    target[i] = (char)(i * 37 + 3);
                    source[17 + i] = source[155 + i] = (unsigned char)target[i];
                }
                jint expected = count == 0 ? (reverse ? sizeof(source) : 0) : (reverse ? 310 : 34);
                CHECK(searches[reverse]((const char*)source, sizeof(source), target, count) == expected);
                if (count != 0) {
                    CHECK(searches[reverse]((const char*)source, count * 2 - 2, target, count) == -1);
                    target[count - 1] ^= (char)0xff;
                    CHECK(searches[reverse]((const char*)source, sizeof(source), target, count) == -1);
                }
            }
        }
    }
    return 0;
}

JNIEXPORT jint JNICALL Java_StringZillaKernelsTest_check(JNIEnv* env, jclass ignored) {
    return check_kernels();
}

JNIEXPORT jlong JNICALL Java_StringZillaKernelsTest_limits(JNIEnv* env, jclass ignored) {
    return ((jlong)JVM_STRINGZILLA_MAX_BYTES << 32) | JVM_STRINGZILLA_MAX_WORK;
}
