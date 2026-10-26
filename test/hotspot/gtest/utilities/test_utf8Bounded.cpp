/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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


#include "runtime/os.hpp"
#include "utilities/checkedCast.hpp"
#include "utilities/utf8.hpp"
#include "unittest.hpp"

#ifdef LINUX
#include <sys/mman.h>
#include <unistd.h>
#endif

static void check_classification(const unsigned char* bytes, size_t length,
                                 int units, bool latin1, bool multibyte) {
  // Deliberately initialize the outputs to their opposite values.
  bool actual_latin1 = !latin1;
  bool actual_multibyte = !multibyte;
  EXPECT_EQ(units, UTF8::unicode_length(reinterpret_cast<const char*>(bytes), length,
                                      actual_latin1, actual_multibyte));
  EXPECT_EQ(latin1, actual_latin1);
  EXPECT_EQ(multibyte, actual_multibyte);
}

// A decoder oracle, independent of the validator's ASCII prefix and surrogate
// pair shortcut. MUTF encodes UTF-16 units, so isolated surrogates are legal.
static bool legal_mutf(const unsigned char* bytes, size_t length, bool relaxed) {
  size_t i = 0;
  while (i < length) {
    unsigned int first = bytes[i++];
    if (first > 0 && first < 128) {
      continue;
    }
    int tails;
    unsigned int value;
    if (first >= 0xc0 && first <= 0xdf) {
      tails = 1;
      value = first - 0xc0;
    } else if (first >= 0xe0 && first <= 0xef) {
      tails = 2;
      value = first - 0xe0;
    } else {
      return false;
    }
    if (length - i < static_cast<size_t>(tails)) {
      return false;
    }
    for (int t = 0; t < tails; t++) {
      unsigned int next = bytes[i++];
      if (next < 0x80 || next > 0xbf) {
        return false;
      }
      value = value * 64 + next - 0x80;
    }
    if (!relaxed && ((tails == 1 && value != 0 && value < 128) ||
                     (tails == 2 && value < 2048))) {
      return false;
    }
  }
  return true;
}

static void check_legality(const unsigned char* bytes, size_t length) {
  for (bool relaxed : {false, true}) {
    EXPECT_EQ(legal_mutf(bytes, length, relaxed),
              UTF8::is_legal_utf8(bytes, length, relaxed)) << "length=" << length;
  }
}

TEST_VM(utf8, bounded_classification_units) {
  unsigned char bytes[160];
  // All UTF-16 units, including encoded NUL, Latin1 transitions, and both
  // surrogate ranges. Every position in and around the first two SIMD blocks.
  for (unsigned int unit = 0; unit <= 0xffff; unit++) {
    unsigned char encoded[3];
    size_t width;
    if (unit > 0 && unit < 128) {
      encoded[0] = unit;
      width = 1;
    } else if (unit < 2048) {
      encoded[0] = 0xc0 | (unit >> 6);
      encoded[1] = 0x80 | (unit & 63);
      width = 2;
    } else {
      encoded[0] = 0xe0 | (unit >> 12);
      encoded[1] = 0x80 | ((unit >> 6) & 63);
      encoded[2] = 0x80 | (unit & 63);
      width = 3;
    }
    for (size_t prefix = 0; prefix < 33; prefix++) {
      memset(bytes, 'a', sizeof(bytes));
      memcpy(bytes + prefix, encoded, width);
      for (size_t suffix : {size_t(0), size_t(17)}) {
        size_t length = prefix + width + suffix;
        check_classification(bytes, length, checked_cast<int>(prefix + 1 + suffix),
                             unit <= 255, width != 1);
        check_legality(bytes, length);
      }
    }
  }
  const unsigned char pair[] = {0xed, 0xa0, 0x80, 0xed, 0xb0, 0x80};
  for (size_t prefix = 0; prefix < 64; prefix++) {
    memset(bytes, 'a', sizeof(bytes));
    memcpy(bytes + prefix, pair, sizeof(pair));
    check_classification(bytes, prefix + sizeof(pair), checked_cast<int>(prefix + 2), false, true);
    check_legality(bytes, prefix + sizeof(pair));
  }
}

TEST_VM(utf8, bounded_relaxed_classification) {
  // Classification is not validation or canonicalization. Preserve the flags
  // of legal pre-48 overlong encodings, including three-byte encoded NUL.
  const unsigned char two[] = {0xc0, 0x81, 0xc1, 0xbf};
  const unsigned char three[] = {0xe0, 0x80, 0x80};
  check_classification(two, sizeof(two), 2, true, true);
  check_classification(three, sizeof(three), 1, false, true);
  EXPECT_TRUE(UTF8::is_legal_utf8(two, sizeof(two), true));
  EXPECT_TRUE(UTF8::is_legal_utf8(three, sizeof(three), true));
  EXPECT_FALSE(UTF8::is_legal_utf8(two, sizeof(two), false));
  EXPECT_FALSE(UTF8::is_legal_utf8(three, sizeof(three), false));
}

TEST_VM(utf8, bounded_legality_errors) {
  const unsigned char cases[][6] = {
    {0}, {0x80}, {0xbf},                         // NUL and stray continuations
    {0xc0}, {0xc2, 0x41}, {0xc2, 0xc2},         // missing or invalid continuation
    {0xc0, 0x81}, {0xc1, 0xbf},                 // overlong two-byte units
    {0xe0}, {0xe0, 0xa0},                       // truncated three-byte units
    {0xe1, 0x41, 0x80}, {0xe1, 0x80, 0x41},   // invalid first/second continuation
    {0xe0, 0x80, 0x80}, {0xe0, 0x9f, 0xbf},   // overlong three-byte units
    {0xf0, 0x90, 0x80, 0x80},                 // standard UTF8 supplementary
    {0xf4, 0x8f, 0xbf, 0xbf}, {0xf5}, {0xff}, // four-byte/invalid leads
    {0xc0, 0x80}, {0xc3, 0xbf}, {0xc4, 0x80}, // NUL/Latin1 limits
    {0xed, 0xa0, 0x80}, {0xed, 0xbf, 0xbf},   // isolated surrogate units
    {0xed, 0xa0, 0x80, 0xed, 0xb0, 0x80}      // surrogate pair
  };
  const size_t widths[] = {1, 1, 1, 1, 2, 2, 2, 2, 1, 2, 3, 3, 3, 3,
                           4, 4, 1, 1, 2, 2, 2, 3, 3, 6};
  STATIC_ASSERT(ARRAY_SIZE(cases) == ARRAY_SIZE(widths));
  unsigned char bytes[160];
  for (size_t c = 0; c < ARRAY_SIZE(cases); c++) {
    for (size_t prefix = 0; prefix < 64; prefix++) {
      for (size_t suffix = 0; suffix < 33; suffix++) {
        memset(bytes, 'a', sizeof(bytes));
        memcpy(bytes + prefix, cases[c], widths[c]);
        check_legality(bytes, prefix + widths[c] + suffix);
      }
    }
  }
  // Every possible one/two-byte input, then deterministic arbitrary longer
  // inputs. In particular, ASCII after an error cannot hide that error.
  for (unsigned int value = 0; value <= 0xffff; value++) {
    bytes[0] = value >> 8;
    bytes[1] = value & 255;
    check_legality(bytes, 1);
    check_legality(bytes, 2);
  }
  uint32_t state = 0x12345678;
  for (size_t length = 0; length < sizeof(bytes); length++) {
    for (int sample = 0; sample < 100; sample++) {
      for (size_t i = 0; i < length; i++) {
        state = state * 1664525 + 1013904223;
        bytes[i] = state >> 24;
      }
      check_legality(bytes, length);
    }
  }
}

static void check_boundary(unsigned char* bytes, size_t length) {
  memset(bytes, 'a', length);
  check_classification(bytes, length, checked_cast<int>(length), true, false);
  check_legality(bytes, length);
  if (length > 0) {
    for (unsigned char lead : {0xc2, 0xe0, 0xf0, 0xff}) {
      bytes[length - 1] = lead;
      check_legality(bytes, length);
    }
    bytes[length - 1] = 'a';
  }
  if (length >= 2) {
    bytes[length - 2] = 0xe0;
    bytes[length - 1] = 0xa0;
    check_legality(bytes, length);
    bytes[length - 2] = bytes[length - 1] = 'a';
  }
  // Move every relevant encoding/error through every tail position and lane.
  for (size_t i = 0; i < length; i++) {
    bytes[i] = 0;
    check_legality(bytes, length);
    bytes[i] = 0x80;
    check_legality(bytes, length);
    bytes[i] = 'a';
    if (length - i >= 2) {
      bytes[i] = 0xc0;
      bytes[i + 1] = 0x80;
      check_classification(bytes, length, checked_cast<int>(length - 1), true, true);
      check_legality(bytes, length);
      bytes[i] = bytes[i + 1] = 'a';
    }
    if (length - i >= 3) {
      bytes[i] = 0xed;
      bytes[i + 1] = 0xa0;
      bytes[i + 2] = 0x80;
      check_classification(bytes, length, checked_cast<int>(length - 2), false, true);
      check_legality(bytes, length);
      bytes[i] = bytes[i + 1] = bytes[i + 2] = 'a';
    }
  }
}

TEST_VM(utf8, bounded_guard_pages) {
  const size_t granule = os::vm_allocation_granularity();
  char* base = os::reserve_memory(3 * granule, mtTest);
  ASSERT_NE(nullptr, base);
  ASSERT_TRUE(os::commit_memory(base + granule, granule, false));
  for (size_t length = 0; length <= 128; length++) {
    // Empty inputs may point at an unreadable page. Nonempty inputs have no
    // padding before/after the specified allocation; exercise both edges.
    check_boundary(reinterpret_cast<unsigned char*>(base + granule), length);
    check_boundary(reinterpret_cast<unsigned char*>(base + 2 * granule - length), length);
  }
  os::release_memory(base, 3 * granule);
}

#ifdef LINUX
TEST_VM(utf8, bounded_mapped_file) {
  const size_t page = os::vm_page_size();
  int fd = os::create_file_for_heap(os::get_temp_directory());
  ASSERT_GE(fd, 0);
  ASSERT_EQ(0, ftruncate(fd, page));
  void* base = mmap(nullptr, 3 * page, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  ASSERT_NE(MAP_FAILED, base);
  unsigned char* data = static_cast<unsigned char*>(base) + page;
  ASSERT_EQ(data, mmap(data, page, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, 0));
  for (size_t length = 0; length <= 128; length++) {
    check_boundary(data, length);
    // The bound is exactly EOF, followed by an inaccessible reservation.
    check_boundary(data + page - length, length);
  }
  EXPECT_EQ(0, munmap(base, 3 * page));
  EXPECT_EQ(0, close(fd));
}
#endif
