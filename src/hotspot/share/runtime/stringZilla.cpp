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

#include "runtime/atomic.hpp"
#include "runtime/stringZilla.hpp"
#include "runtime/vm_version.hpp"
#include "StringZillaKernels.h"

namespace {
Atomic<const StringZillaKernels*> published_kernels;

const StringZillaKernels* kernels() {
  const StringZillaKernels* result = published_kernels.load_acquire();
  assert(result != nullptr, "StringZilla class must initialize its kernels first");
  return result;
}

#define SEARCH_ENTRY(name, field, mixed) \
  int name(const char* src, int length, const char* tgt, int tgt_length) { \
    assert(!(mixed) || tgt_length <= 64, "mixed needle limit"); \
    return kernels()->field(src, length, tgt, tgt_length); \
  }
#define CHAR_ENTRY(name, field) \
  int name(const char* src, int length, int ch) { \
    return kernels()->field(src, length, ch); \
  }
SEARCH_ENTRY(find_latin1, findLatin1, false)
SEARCH_ENTRY(find_utf16, findUTF16, false)
SEARCH_ENTRY(find_utf16_latin1, findUTF16Latin1, true)
SEARCH_ENTRY(rfind_latin1, rfindLatin1, false)
SEARCH_ENTRY(rfind_utf16, rfindUTF16, false)
SEARCH_ENTRY(rfind_utf16_latin1, rfindUTF16Latin1, true)
CHAR_ENTRY(find_char_latin1, findCharLatin1)
CHAR_ENTRY(find_char_utf16, findCharUTF16)
CHAR_ENTRY(rfind_char_latin1, rfindCharLatin1)
CHAR_ENTRY(rfind_char_utf16, rfindCharUTF16)
int equal_bytes(const char* src, const char* tgt, int length) {
  if ((unsigned int)length > StringZilla::max_bytes) return JVM_STRINGZILLA_FALLBACK;
  const StringZillaKernels* table = published_kernels.load_acquire();
  if (table != nullptr) return table->equal(src, tgt, length);
  // String equality can run before native bootstrap publishes libjava.
  for (int i = 0; i < length; i++) {
    if (src[i] != tgt[i]) return 0;
  }
  return 1;
}
#undef SEARCH_ENTRY
#undef CHAR_ENTRY
}

void StringZilla::register_kernels(const void* table) {
  assert(table != nullptr, "kernel table");
  published_kernels.release_store((const StringZillaKernels*)table);
}

int StringZilla::equal_range(const char* src, int length, const char* tgt, int tgt_offset) {
  return equal_bytes(src, tgt + tgt_offset, length);
}

int StringZilla::capabilities() {
#if defined(AMD64) && !defined(ZERO)
  if (UseAVX >= 2 && VM_Version::supports_avx2() && VM_Version::supports_bmi1() &&
      VM_Version::supports_bmi2() && VM_Version::supports_lzcnt()) {
    if (UseAVX >= 3 && VM_Version::supports_avx512vlbw()) return JVM_STRINGZILLA_SKYLAKE;
    return JVM_STRINGZILLA_HASWELL;
  }
#elif defined(AARCH64) && !defined(ZERO)
  return JVM_STRINGZILLA_NEON;
#endif
  return JVM_STRINGZILLA_SERIAL;
}

int StringZilla::search(const char* src, int length, const char* tgt, int tgt_length,
                       int encoding, bool reverse) {
  assert(encoding != 2 || tgt_length <= 64, "mixed needle limit");
  const StringZillaKernels* table = kernels();
  StringZillaSearchFn fn;
  if (encoding == 0) fn = reverse ? table->rfindLatin1 : table->findLatin1;
  else if (encoding == 1) fn = reverse ? table->rfindUTF16 : table->findUTF16;
  else fn = reverse ? table->rfindUTF16Latin1 : table->findUTF16Latin1;
  return fn(src, length, tgt, tgt_length);
}

int StringZilla::search_char(const char* src, int length, int ch, bool utf16, bool reverse) {
  const StringZillaKernels* table = kernels();
  StringZillaCharFn fn = utf16 ? (reverse ? table->rfindCharUTF16 : table->findCharUTF16) :
                               (reverse ? table->rfindCharLatin1 : table->findCharLatin1);
  return fn(src, length, ch);
}

address StringZilla::entry(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_stringzillaEqualsRange: return CAST_FROM_FN_PTR(address, StringZilla::equal_range);
    case vmIntrinsics::_equalsL: return CAST_FROM_FN_PTR(address, equal_bytes);
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
