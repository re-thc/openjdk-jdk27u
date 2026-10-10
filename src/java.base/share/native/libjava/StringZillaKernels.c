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

#include "StringZillaKernels.h"
#include "jvm.h"

#define SZ_AVOID_LIBC 1
#define SZ_DEBUG 0
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
#define SZ_USE_SKYLAKE 1
#define SZ_USE_HASWELL 1
#define SZ_USE_WESTMERE 1
#endif
#include "stringzilla/find.h"

typedef sz_cptr_t (*search_fn)(sz_cptr_t, sz_size_t, sz_cptr_t, sz_size_t);
typedef int (*aligned_fn)(const jchar*, int, const jchar*, int, jboolean);

// Verify aligned candidates from the search-direction end, so repeated
// prefixes with late reverse mismatches reject early. The batch filter has
// already checked the first and last code units.
static jboolean matches_utf16_aligned(const jchar* src, const jchar* tgt, int count, jboolean reverse) {
    int pairs = (count + 1) / 2;
    for (int j = 1; j < pairs; j++) {
        int first = reverse ? count - 1 - j : j;
        int second = reverse ? j : count - 1 - j;
        if (src[first] != tgt[first] ||
                (first != second && src[second] != tgt[second])) {
            return JNI_FALSE;
        }
    }
    return JNI_TRUE;
}

SZ_HELPER_INLINE int search_utf16_aligned(const jchar* src, int length, const jchar* tgt,
                                         int count, jboolean reverse) {
    // Batch the boundary checks so the compiler can vectorize the filter.
    const int lanes = 32;
    jchar candidates[32];
    jchar first = tgt[0], last = tgt[count - 1];
    int remaining = length - count + 1;
    int consumed = 0;
    while (remaining >= lanes) {
        int start = reverse ? remaining - lanes : consumed;
        jchar any = 0;
        for (int j = 0; j < lanes; j++) {
            candidates[j] = (src[start + j] == first) & (src[start + j + count - 1] == last);
            any += candidates[j];
        }
        if (any != 0) {
            for (int j = 0; j < lanes; j++) {
                int lane = reverse ? lanes - 1 - j : j;
                if (candidates[lane] && matches_utf16_aligned(src + start + lane, tgt, count, reverse)) {
                    return (start + lane) * 2;
                }
            }
        }
        remaining -= lanes;
        consumed += lanes;
    }
    for (int j = 0; j < remaining; j++) {
        int index = reverse ? remaining - 1 - j : consumed + j;
        if (src[index] == first && src[index + count - 1] == last &&
                matches_utf16_aligned(src + index, tgt, count, reverse)) {
            return index * 2;
        }
    }
    return -1;
}

static int search_utf16_default(const jchar* src, int length, const jchar* tgt,
                                int count, jboolean reverse) {
    return search_utf16_aligned(src, length, tgt, count, reverse);
}

#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
// Compile the portable loop for AVX2 under the VM capability gate.
__attribute__((target("avx2")))
static int search_utf16_haswell(const jchar* src, int length, const jchar* tgt,
                                int count, jboolean reverse) {
    return search_utf16_aligned(src, length, tgt, count, reverse);
}
#endif

static jint search_impl(const char* src, jint length, const char* tgt, jint tgt_length,
                        jint encoding, jboolean reverse, search_fn fn, aligned_fn aligned) {
    // Validate the mixed cap before reading the needle or computing byte size.
    jchar widened[64];
    if (encoding == 2 && (unsigned int)tgt_length > sizeof(widened) / sizeof(widened[0])) {
        return -1;
    }
    if (length < 0 || tgt_length < 0) {
        return -1;
    }
    if (tgt_length == 0) {
        return reverse ? length : 0;
    }
    jint needle_bytes = encoding == 2 ? tgt_length * 2 : tgt_length;
    if (length < needle_bytes) {
        return -1;
    }
    // Both byte search and any aligned verification execute without safepoints.
    // Bound bytes and worst-case candidate-comparison work before reading arrays.
    if (length > JVM_STRINGZILLA_MAX_BYTES ||
            (jlong)length * needle_bytes > JVM_STRINGZILLA_MAX_WORK) {
        return JVM_STRINGZILLA_FALLBACK;
    }
    if (encoding == 2) {
        for (int i = 0; i < tgt_length; i++) {
            widened[i] = (unsigned char)tgt[i];
        }
        tgt = (const char*)widened;
    }
    const char* match = fn(src, (sz_size_t)length, tgt, (sz_size_t)needle_bytes);
    if (match == NULL) {
        return -1;
    }
    int offset = (int)(match - src);
    if (encoding == 0 || (offset & 1) == 0) {
        return offset;
    }
    // Byte search already excluded aligned matches before/after this occurrence.
    int count = needle_bytes / 2;
    if (reverse) {
        return aligned((const jchar*)src, offset / 2 + count, (const jchar*)tgt, count, JNI_TRUE);
    }
    int start = offset / 2 + 1;
    int result = aligned((const jchar*)src + start, length / 2 - start, (const jchar*)tgt, count, JNI_FALSE);
    return result < 0 ? -1 : start * 2 + result;
}

static jint search_char_impl(const char* src, jint length, jint ch, jboolean utf16,
                             jboolean reverse, search_fn fn, aligned_fn aligned) {
    if (!utf16) {
        char needle = (char)ch;
        return search_impl(src, length, &needle, 1, 0, reverse, fn, aligned);
    }
    jchar needle[2];
    int needle_length = 2;
    if (ch < 0x10000) {
        needle[0] = (jchar)ch;
    } else {
        needle[0] = (jchar)(0xd800 + ((ch - 0x10000) >> 10));
        needle[1] = (jchar)(0xdc00 + ((ch - 0x10000) & 0x3ff));
        needle_length = 4;
    }
    return search_impl(src, length, (const char*)needle, needle_length, 1, reverse, fn, aligned);
}

/* Every published table is immutable; repeated initialization is harmless. */
#define DEFINE_KERNELS(tag, forward, backward, equality, aligned, caps) \
static jint tag##_find_latin1(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_FALSE, forward, aligned); \
} \
static jint tag##_find_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_FALSE, forward, aligned); \
} \
static jint tag##_find_mixed(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 2, JNI_FALSE, forward, aligned); \
} \
static jint tag##_rfind_latin1(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_TRUE, backward, aligned); \
} \
static jint tag##_rfind_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_TRUE, backward, aligned); \
} \
static jint tag##_rfind_mixed(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 2, JNI_TRUE, backward, aligned); \
} \
static jint tag##_find_char_latin1(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_FALSE, JNI_FALSE, forward, aligned); \
} \
static jint tag##_find_char_utf16(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_TRUE, JNI_FALSE, forward, aligned); \
} \
static jint tag##_rfind_char_latin1(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_FALSE, JNI_TRUE, backward, aligned); \
} \
static jint tag##_rfind_char_utf16(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_TRUE, JNI_TRUE, backward, aligned); \
} \
static jint tag##_equal(const char* s, const char* t, jint n) { \
    if ((unsigned int)n > JVM_STRINGZILLA_MAX_BYTES) return JVM_STRINGZILLA_FALLBACK; \
    return equality(s, t, (sz_size_t)n); \
} \
static const StringZillaKernels tag##_kernels = { \
    caps, tag##_find_latin1, tag##_find_utf16, tag##_find_mixed, \
    tag##_rfind_latin1, tag##_rfind_utf16, tag##_rfind_mixed, \
    tag##_find_char_latin1, tag##_find_char_utf16, \
    tag##_rfind_char_latin1, tag##_rfind_char_utf16, tag##_equal \
};

DEFINE_KERNELS(serial, sz_find_serial, sz_rfind_serial, sz_equal_serial, search_utf16_default, JVM_STRINGZILLA_SERIAL)
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
DEFINE_KERNELS(haswell, sz_find_haswell, sz_rfind_haswell, sz_equal_haswell, search_utf16_haswell, JVM_STRINGZILLA_HASWELL)
DEFINE_KERNELS(skylake, sz_find_skylake, sz_rfind_skylake, sz_equal_skylake, search_utf16_haswell, JVM_STRINGZILLA_SKYLAKE)
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
DEFINE_KERNELS(neon, sz_find_neon, sz_rfind_neon, sz_equal_neon, search_utf16_default, JVM_STRINGZILLA_NEON)
#endif
#undef DEFINE_KERNELS

void StringZilla_initialize(void) {
    jint capabilities = JVM_StringZillaCapabilities();
    const StringZillaKernels* kernels = &serial_kernels;
    (void)capabilities; // Serial-only builds have no ISA-specific selection.
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
    if (capabilities & JVM_STRINGZILLA_SKYLAKE) {
        kernels = &skylake_kernels;
    } else if (capabilities & JVM_STRINGZILLA_HASWELL) {
        kernels = &haswell_kernels;
    }
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
    if (capabilities & JVM_STRINGZILLA_NEON) {
        kernels = &neon_kernels;
    }
#endif
    JVM_RegisterStringZillaKernels(kernels);
}
