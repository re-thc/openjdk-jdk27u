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

#include "StringZillaKernels.h"
#include "jvm.h"

#define SZ_AVOID_LIBC 1
#define SZ_DEBUG 0
#if defined(__GNUC__) || defined(__clang__)
// Byte arrays and search offsets need not have word alignment.
#define SZ_USE_MISALIGNED_LOADS 0
#endif
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
#define SZ_USE_SKYLAKE 1
#define SZ_USE_HASWELL 1
#define SZ_USE_WESTMERE 1
#endif
#include "stringzilla/find.h"

typedef sz_cptr_t (*search_fn)(sz_cptr_t, sz_size_t, sz_cptr_t, sz_size_t);

// Pinned sz_byteset_t stores bit c at _u64s[c / 64], position c % 64.
// Java trim: U+0000..U+0020. Character.isWhitespace in Latin1:
// U+0009..U+000D and U+001C..U+0020; neither NEL nor NBSP is whitespace.
static const sz_byteset_t line_separators = {{0x2400ull, 0, 0, 0}};
static const sz_byteset_t non_trim = {{~0x1ffffffffull, ~0ull, ~0ull, ~0ull}};
static const sz_byteset_t non_whitespace = {{~0x1f0003e00ull, ~0ull, ~0ull, ~0ull}};

static jint scan_latin1_impl(const char* src, jint length, jint mode,
                            sz_find_byteset_t forward, sz_find_byteset_t backward) {
    // Check before any read, including on serial-only builds and JNI fallback.
    if ((unsigned int)length > JVM_STRINGZILLA_MAX_BYTES || (unsigned int)mode > 4) {
        return JVM_STRINGZILLA_FALLBACK;
    }
    if (length == 0) return -1;
    const sz_byteset_t* set = mode == 0 ? &line_separators : mode <= 2 ? &non_trim : &non_whitespace;
    sz_cptr_t match = (mode == 2 || mode == 4 ? backward : forward)(src, (sz_size_t)length, set);
    return match == NULL ? -1 : (jint)(match - src);
}

static jint search_impl(const char* src, jint length, const char* tgt, jint tgt_length,
                        jint encoding, jboolean reverse, search_fn fn) {
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
    // A byte match at an odd offset is not a UTF16 code-unit match.
    // Let the original Java operation handle this range.
    return JVM_STRINGZILLA_FALLBACK;
}

static jint search_char_impl(const char* src, jint length, jint ch, jboolean utf16,
                             jboolean reverse, search_fn fn) {
    if (!utf16) {
        char needle = (char)ch;
        return search_impl(src, length, &needle, 1, 0, reverse, fn);
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
    return search_impl(src, length, (const char*)needle, needle_length, 1, reverse, fn);
}

/* Every published table is immutable; repeated initialization is harmless. */
#define DEFINE_KERNELS(tag, forward, backward, equality, set_forward, set_backward, caps) \
static jint tag##_find_latin1(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_FALSE, forward); \
} \
static jint tag##_find_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_FALSE, forward); \
} \
static jint tag##_find_mixed(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 2, JNI_FALSE, forward); \
} \
static jint tag##_rfind_latin1(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 0, JNI_TRUE, backward); \
} \
static jint tag##_rfind_utf16(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 1, JNI_TRUE, backward); \
} \
static jint tag##_rfind_mixed(const char* s, jint n, const char* t, jint m) { \
    return search_impl(s, n, t, m, 2, JNI_TRUE, backward); \
} \
static jint tag##_find_char_latin1(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_FALSE, JNI_FALSE, forward); \
} \
static jint tag##_find_char_utf16(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_TRUE, JNI_FALSE, forward); \
} \
static jint tag##_rfind_char_latin1(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_FALSE, JNI_TRUE, backward); \
} \
static jint tag##_rfind_char_utf16(const char* s, jint n, jint c) { \
    return search_char_impl(s, n, c, JNI_TRUE, JNI_TRUE, backward); \
} \
static jint tag##_equal(const char* s, const char* t, jint n) { \
    if ((unsigned int)n > JVM_STRINGZILLA_MAX_BYTES) return JVM_STRINGZILLA_FALLBACK; \
    return equality(s, t, (sz_size_t)n); \
} \
static jint tag##_scan_latin1(const char* s, jint n, jint mode) { \
    return scan_latin1_impl(s, n, mode, set_forward, set_backward); \
} \
static const StringZillaKernels tag##_kernels = { \
    caps, tag##_find_latin1, tag##_find_utf16, tag##_find_mixed, \
    tag##_rfind_latin1, tag##_rfind_utf16, tag##_rfind_mixed, \
    tag##_find_char_latin1, tag##_find_char_utf16, \
    tag##_rfind_char_latin1, tag##_rfind_char_utf16, tag##_equal, tag##_scan_latin1 \
};

DEFINE_KERNELS(serial, sz_find_serial, sz_rfind_serial, sz_equal_serial, sz_find_byteset_serial, sz_rfind_byteset_serial, JVM_STRINGZILLA_SERIAL)
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
DEFINE_KERNELS(haswell, sz_find_haswell, sz_rfind_haswell, sz_equal_haswell, sz_find_byteset_haswell, sz_rfind_byteset_haswell, JVM_STRINGZILLA_HASWELL)
// The AVX-512 byte-set implementation requires Ice Lake capabilities beyond
// this backend's gate. Reuse the already qualified AVX2 byte-set instructions.
DEFINE_KERNELS(skylake, sz_find_skylake, sz_rfind_skylake, sz_equal_skylake, sz_find_byteset_haswell, sz_rfind_byteset_haswell, JVM_STRINGZILLA_SKYLAKE)
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
DEFINE_KERNELS(neon, sz_find_neon, sz_rfind_neon, sz_equal_neon, sz_find_byteset_neon, sz_rfind_byteset_neon, JVM_STRINGZILLA_NEON)
#endif
#undef DEFINE_KERNELS

jint StringZilla_initialize(void) {
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
    return kernels->capabilities;
}
