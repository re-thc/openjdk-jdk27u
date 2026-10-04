/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 */

#include "runtime/stringZilla.hpp"
#include "runtime/vm_version.hpp"

// Leaf kernels must never allocate through libc or terminate the VM on assertions.
#define SZ_AVOID_LIBC 1
#define SZ_DEBUG 0

// Compile ISA-specialized functions, but dispatch using HotSpot's CPU/OS checks.
#if defined(AMD64) && (defined(__GNUC__) || defined(__clang__))
#define SZ_USE_SKYLAKE 1
#define SZ_USE_HASWELL 1
#define SZ_USE_WESTMERE 1
#endif
#include "stringzilla/find.h"

namespace {
typedef sz_cptr_t (*search_fn)(sz_cptr_t, sz_size_t, sz_cptr_t, sz_size_t);

search_fn select_search(bool reverse) {
#if defined(AMD64) && (defined(__GNUC__) || defined(__clang__))
  if (UseAVX >= 2 && VM_Version::supports_avx2() && VM_Version::supports_bmi1() &&
      VM_Version::supports_bmi2() && VM_Version::supports_lzcnt()) {
    if (UseAVX >= 3 && VM_Version::supports_avx512vlbw()) {
      return reverse ? sz_rfind_skylake : sz_find_skylake;
    }
    return reverse ? sz_rfind_haswell : sz_find_haswell;
  }
#elif defined(AARCH64) && SZ_USE_NEON
  return reverse ? sz_rfind_neon : sz_find_neon;
#endif
  return reverse ? sz_rfind_serial : sz_find_serial;
}

// Byte search can match across UTF-16 code units. After the first such match,
// filter aligned first/last code units in batches and use StringZilla to verify
// the interior. This avoids one byte-search call per false match on periodic data.
bool matches_utf16(const jchar* src, const jchar* tgt, int count) {
  return src[0] == tgt[0] && src[count - 1] == tgt[count - 1] &&
         (count <= 2 || sz_equal_serial((const char*)(src + 1), (const char*)(tgt + 1),
                                       (sz_size_t)(count - 2) * 2));
}

int search_utf16_serial(const jchar* src, int length, const jchar* tgt, int count, bool reverse) {
  int limit = length - count;
  for (int i = reverse ? limit : 0; i >= 0 && i <= limit; i += reverse ? -1 : 1) {
    if (matches_utf16(src + i, tgt, count)) return i * 2;
  }
  return -1;
}

#if defined(AMD64) && (defined(__GNUC__) || defined(__clang__))
__attribute__((target("avx2,bmi,bmi2,lzcnt")))
int search_utf16_haswell(const jchar* src, int length, const jchar* tgt, int count, bool reverse) {
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

#if defined(AARCH64) && SZ_USE_NEON
int search_utf16_neon(const jchar* src, int length, const jchar* tgt, int count, bool reverse) {
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

int search_utf16_aligned(const char* src, int length, const char* tgt, int count, bool reverse) {
  const jchar* source = (const jchar*)src;
  const jchar* target = (const jchar*)tgt;
#if defined(AMD64) && (defined(__GNUC__) || defined(__clang__))
  if (UseAVX >= 2 && VM_Version::supports_avx2() && VM_Version::supports_bmi1() &&
      VM_Version::supports_bmi2() && VM_Version::supports_lzcnt()) {
    return search_utf16_haswell(source, length / 2, target, count / 2, reverse);
  }
#elif defined(AARCH64) && SZ_USE_NEON
  return search_utf16_neon(source, length / 2, target, count / 2, reverse);
#endif
  return search_utf16_serial(source, length / 2, target, count / 2, reverse);
}

int find_char_latin1(const char* src, int length, int ch) {
  return StringZilla::search_char(src, length, ch, false, false);
}
int find_char_utf16(const char* src, int length, int ch) {
  return StringZilla::search_char(src, length, ch, true, false);
}
int rfind_char_latin1(const char* src, int length, int ch) {
  return StringZilla::search_char(src, length, ch, false, true);
}
int rfind_char_utf16(const char* src, int length, int ch) {
  return StringZilla::search_char(src, length, ch, true, true);
}
int find_latin1(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, false, false);
}
int find_utf16(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, true, false);
}
int find_utf16_latin1(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, 2, false);
}
int rfind_utf16_latin1(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, 2, true);
}
int rfind_latin1(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, false, true);
}
int rfind_utf16(const char* src, int length, const char* tgt, int tgt_length) {
  return StringZilla::search(src, length, tgt, tgt_length, true, true);
}
}

// Leaf: no allocation, handles, locks, or safepoints while accessing heap bytes.
int StringZilla::search(const char* src, int length, const char* tgt, int tgt_length,
                       int encoding, bool reverse) {
  // Mixed coder searches widen a bounded needle on the native stack.
  // Java gates this path at 64 code units; no heap allocation or GC transition.
  jchar widened[64];
  if (encoding == 2) {
    assert(tgt_length <= 64, "mixed needle limit");
    for (int i = 0; i < tgt_length; i++) widened[i] = (unsigned char)tgt[i];
    tgt = (const char*)widened;
    tgt_length *= 2;
  }
  bool utf16 = encoding != 0;
  if (tgt_length == 0) return reverse ? length : 0;
  if (length < tgt_length) return -1;
  search_fn fn = select_search(reverse);
  const char* match = fn(src, (sz_size_t)length, tgt, (sz_size_t)tgt_length);
  if (match == nullptr) return -1;
  int offset = (int)(match - src);
  if (!utf16 || (offset & 1) == 0) return offset;
  return search_utf16_aligned(src, length, tgt, tgt_length, reverse);
}

int StringZilla::search_char(const char* src, int length, int ch, bool utf16, bool reverse) {
  if (!utf16) {
    char needle = (char)ch;
    return search(src, length, &needle, 1, 0, reverse);
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
  return search(src, length, (const char*)needle, needle_length, 1, reverse);
}

address StringZilla::entry(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_stringzillaFindCharLatin1: return CAST_FROM_FN_PTR(address, find_char_latin1);
    case vmIntrinsics::_stringzillaFindCharUTF16: return CAST_FROM_FN_PTR(address, find_char_utf16);
    case vmIntrinsics::_stringzillaRfindCharLatin1: return CAST_FROM_FN_PTR(address, rfind_char_latin1);
    case vmIntrinsics::_stringzillaRfindCharUTF16: return CAST_FROM_FN_PTR(address, rfind_char_utf16);

    case vmIntrinsics::_stringzillaFindUTF16Latin1: return CAST_FROM_FN_PTR(address, find_utf16_latin1);
    case vmIntrinsics::_stringzillaRfindUTF16Latin1: return CAST_FROM_FN_PTR(address, rfind_utf16_latin1);

    case vmIntrinsics::_stringzillaFindLatin1: return CAST_FROM_FN_PTR(address, find_latin1);
    case vmIntrinsics::_stringzillaFindUTF16: return CAST_FROM_FN_PTR(address, find_utf16);
    case vmIntrinsics::_stringzillaRfindLatin1: return CAST_FROM_FN_PTR(address, rfind_latin1);
    case vmIntrinsics::_stringzillaRfindUTF16: return CAST_FROM_FN_PTR(address, rfind_utf16);
    default: ShouldNotReachHere(); return nullptr;
  }
}
