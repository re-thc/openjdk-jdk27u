/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
        if (!(__builtin_cpu_supports("avx2") && __builtin_cpu_supports("bmi") &&
              __builtin_cpu_supports("bmi2") && __builtin_cpu_supports("lzcnt"))) return 0;
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

static jint check_kernels(void) {
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
