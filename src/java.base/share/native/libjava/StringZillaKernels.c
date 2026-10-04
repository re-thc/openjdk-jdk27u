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

// Byte search can match across UTF-16 code units. After the first such match,
// filter aligned first/last code units in batches and use StringZilla to verify
// the interior. This avoids one byte-search call per false match on periodic data.
static jboolean matches_utf16(const jchar* src, const jchar* tgt, int count) {
  return src[0] == tgt[0] && src[count - 1] == tgt[count - 1] &&
         (count <= 2 || sz_equal_serial((const char*)(src + 1), (const char*)(tgt + 1),
                                       (sz_size_t)(count - 2) * 2));
}

static int search_utf16_serial(const jchar* src, int length, const jchar* tgt, int count, jboolean reverse) {
  int limit = length - count;
  for (int i = reverse ? limit : 0; i >= 0 && i <= limit; i += reverse ? -1 : 1) {
    if (matches_utf16(src + i, tgt, count)) return i * 2;
  }
  return -1;
}

#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
__attribute__((target("avx2,bmi,bmi2,lzcnt")))
static int search_utf16_haswell(const jchar* src, int length, const jchar* tgt, int count, jboolean reverse) {
  const int lanes = 16;
  __m256i first = _mm256_set1_epi16(tgt[0]);
  __m256i last = _mm256_set1_epi16(tgt[count - 1]);
  int remaining = length - count + 1;
  int consumed = 0;
  while (remaining >= lanes) {
    int start = reverse ? remaining - lanes : consumed;
    __m256i head = _mm256_loadu_si256((const __m256i*)(src + start));
    __m256i mask = _mm256_cmpeq_epi16(head, first);
    if (count > 1) {
      __m256i tail = _mm256_loadu_si256((const __m256i*)(src + start + count - 1));
      mask = _mm256_and_si256(mask, _mm256_cmpeq_epi16(tail, last));
    }
    unsigned int bits = (unsigned int)_mm256_movemask_epi8(mask);
    while (bits != 0) {
      int lane = reverse ? (31 - sz_u32_clz(bits)) / 2 : sz_u32_ctz(bits) / 2;
      int index = start + lane;
      if (matches_utf16(src + index, tgt, count)) return index * 2;
      bits &= ~(3u << (lane * 2));
    }
    remaining -= lanes;
    consumed += lanes;
  }
  if (remaining == 0) return -1;
  int start = reverse ? 0 : consumed;
  int result = search_utf16_serial(src + start, remaining + count - 1, tgt, count, reverse);
  return result < 0 ? -1 : start * 2 + result;
}
#endif

#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
static int search_utf16_neon(const jchar* src, int length, const jchar* tgt, int count, jboolean reverse) {
  const int lanes = 8;
  uint16x8_t first = vdupq_n_u16(tgt[0]);
  uint16x8_t last = vdupq_n_u16(tgt[count - 1]);
  int remaining = length - count + 1;
  int consumed = 0;
  while (remaining >= lanes) {
    int start = reverse ? remaining - lanes : consumed;
    uint16x8_t mask = vceqq_u16(vld1q_u16(src + start), first);
    if (count > 1) {
      mask = vandq_u16(mask, vceqq_u16(vld1q_u16(src + start + count - 1), last));
    }
    uint64_t bits = vget_lane_u64(vreinterpret_u64_u8(vshrn_n_u16(mask, 8)), 0);
    while (bits != 0) {
      int lane = reverse ? (63 - sz_u64_clz_neon_(bits)) / 8 : sz_u64_ctz_neon_(bits) / 8;
      int index = start + lane;
      if (matches_utf16(src + index, tgt, count)) return index * 2;
      bits &= ~(UINT64_C(0xff) << (lane * 8));
    }
    remaining -= lanes;
    consumed += lanes;
  }
  if (remaining == 0) return -1;
  int start = reverse ? 0 : consumed;
  int result = search_utf16_serial(src + start, remaining + count - 1, tgt, count, reverse);
  return result < 0 ? -1 : start * 2 + result;
}
#endif

static jint search_impl(const char* src, jint length, const char* tgt, jint tgt_length,
                        jint encoding, jboolean reverse, search_fn fn, aligned_fn aligned) {
  // Mixed coder searches widen a bounded needle on the native stack.
  // Java gates this path at 64 code units; no heap allocation or GC transition.
  jchar widened[64];
  if (encoding == 2) {
    for (int i = 0; i < tgt_length; i++) widened[i] = (unsigned char)tgt[i];
    tgt = (const char*)widened;
    tgt_length *= 2;
  }
  jboolean utf16 = encoding != 0;
  if (tgt_length == 0) return reverse ? length : 0;
  if (length < tgt_length) return -1;
  const char* match = fn(src, (sz_size_t)length, tgt, (sz_size_t)tgt_length);
  if (match == NULL) return -1;
  int offset = (int)(match - src);
  if (!utf16 || (offset & 1) == 0) return offset;
  return aligned((const jchar*)src, length / 2, (const jchar*)tgt, tgt_length / 2, reverse);
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

/* Select ISA once at class initialization; every published table is immutable. */
#define DEFINE_KERNELS(tag, forward, backward, aligned, equality, caps) \
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
    return equality(s, t, (sz_size_t)n); \
} \
static const StringZillaKernels tag##_kernels = { \
    caps, tag##_find_latin1, tag##_find_utf16, tag##_find_mixed, \
    tag##_rfind_latin1, tag##_rfind_utf16, tag##_rfind_mixed, \
    tag##_find_char_latin1, tag##_find_char_utf16, \
    tag##_rfind_char_latin1, tag##_rfind_char_utf16, tag##_equal \
};

DEFINE_KERNELS(serial, sz_find_serial, sz_rfind_serial, search_utf16_serial, sz_equal_serial, JVM_STRINGZILLA_SERIAL)
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
DEFINE_KERNELS(haswell, sz_find_haswell, sz_rfind_haswell, search_utf16_haswell, sz_equal_haswell, JVM_STRINGZILLA_HASWELL)
DEFINE_KERNELS(skylake, sz_find_skylake, sz_rfind_skylake, search_utf16_haswell, sz_equal_skylake, JVM_STRINGZILLA_SKYLAKE)
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
DEFINE_KERNELS(neon, sz_find_neon, sz_rfind_neon, search_utf16_neon, sz_equal_neon, JVM_STRINGZILLA_NEON)
#endif
#undef DEFINE_KERNELS

void StringZilla_initialize(void) {
    jint capabilities = JVM_StringZillaCapabilities();
    const StringZillaKernels* kernels = &serial_kernels;
    (void)capabilities; // Serial-only builds have no ISA-specific selection.
#if (defined(__x86_64__) || defined(_M_X64)) && (defined(__GNUC__) || defined(__clang__))
    if (capabilities & JVM_STRINGZILLA_SKYLAKE) kernels = &skylake_kernels;
    else if (capabilities & JVM_STRINGZILLA_HASWELL) kernels = &haswell_kernels;
#endif
#if (defined(__aarch64__) || defined(_M_ARM64)) && SZ_USE_NEON
    if (capabilities & JVM_STRINGZILLA_NEON) kernels = &neon_kernels;
#endif
    JVM_RegisterStringZillaKernels(kernels);
}
