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
 *
 */

#include "runtime/os.hpp"
#include "utilities/fastFloat.hpp"
#include "unittest.hpp"

#include <cmath>

template <typename C>
static void check_fast_float_bounds(C* input, int length, int coder) {
  for (int ix = 1; ix <= 2; ++ix) {
    for (int i = 0; i < length; ++i) {
      input[i] = C('0');
    }
    if (length > 0) {
      input[length - 1] = C('1');
    }
    double value = FastFloat::parse(input, length << coder, coder, ix);
    if (length == 0 || length > FastFloat::max_input_length) {
      EXPECT_TRUE(std::isnan(value));
      continue;
    }
    EXPECT_EQ(1.0, value);
    input[length - 1] = C('x');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    input[length - 1] = C(0xff);
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    if (sizeof(C) > 1) {
      input[length - 1] = C(0x130);
      EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    }
    for (int i = 0; i < length; ++i) {
      input[i] = C('9');
    }
    EXPECT_GT(FastFloat::parse(input, length << coder, coder, ix), 0.0);
    input[length - 1] = C('x');
    EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    if (sizeof(C) > 1) {
      input[length - 1] = C(0x130);
      EXPECT_TRUE(std::isnan(FastFloat::parse(input, length << coder, coder, ix)));
    }
    for (int i = 0; i < length; ++i) {
      input[i] = C('0');
    }
    if (length >= 2) {
      input[0] = C('-');
      input[length - 1] = C('0');
      value = FastFloat::parse(input, length << coder, coder, ix);
      EXPECT_EQ(0.0, value);
      EXPECT_TRUE(std::signbit(value));
    }
  }
}

TEST_VM(FastFloat, input_bounds) {
  const size_t page = os::vm_page_size();
  char* memory = os::reserve_memory(3 * page, mtTest);
  ASSERT_NE(nullptr, memory);
  ASSERT_TRUE(os::commit_memory(memory + page, page, false));
  const int edges[] = {63, 64, 65, 127, 128, 129, 1023, 1024, 1025};
  // Leave inaccessible pages before and after the input, without padding it.
  for (int coder = 0; coder <= 1; ++coder) {
    for (int edge = 0; edge < 49 + int(ARRAY_SIZE(edges)); ++edge) {
      int length = edge < 49 ? edge : edges[edge - 49];
      ASSERT_LE(size_t(length << coder), page);
      for (int end = 0; end <= 1; ++end) {
        char* input = memory + page + (end ? page - (length << coder) : 0);
        if (coder == 0) {
          check_fast_float_bounds(input, length, coder);
        } else {
          check_fast_float_bounds(reinterpret_cast<char16_t*>(input), length, coder);
        }
      }
    }
  }
  EXPECT_TRUE(os::release_memory(memory, 3 * page));
}
