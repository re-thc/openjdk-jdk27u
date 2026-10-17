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
 */

#include "opto/constantThreshold.hpp"
#include "unittest.hpp"

// These calls exercise the production predicate directly. In Java tests,
// comparisons against a domain maximum can fold before the IfNode helper runs.
TEST(opto, constant_threshold_signed_int) {
  EXPECT_TRUE(is_adjacent_constant_threshold(min_jint, min_jint + 1, false));
  EXPECT_TRUE(is_adjacent_constant_threshold(max_jint - 1, max_jint, false));
  EXPECT_TRUE(is_adjacent_constant_threshold((jint)-1, (jint)0, false));
  EXPECT_TRUE(is_adjacent_constant_threshold((jint)63, (jint)64, false));
  EXPECT_FALSE(is_adjacent_constant_threshold(max_jint, min_jint, false));
  EXPECT_FALSE(is_adjacent_constant_threshold((jint)63, (jint)65, false));
  EXPECT_FALSE(is_adjacent_constant_threshold((jint)64, (jint)63, false));
}

TEST(opto, constant_threshold_unsigned_int) {
  EXPECT_TRUE(is_adjacent_constant_threshold((jint)0, (jint)1, true));
  EXPECT_TRUE(is_adjacent_constant_threshold((jint)-2, (jint)-1, true));
  EXPECT_TRUE(is_adjacent_constant_threshold(max_jint, min_jint, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jint)-1, (jint)0, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jint)63, (jint)65, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jint)64, (jint)63, true));
}

TEST(opto, constant_threshold_signed_long) {
  EXPECT_TRUE(is_adjacent_constant_threshold(min_jlong, min_jlong + 1, false));
  EXPECT_TRUE(is_adjacent_constant_threshold(max_jlong - 1, max_jlong, false));
  EXPECT_TRUE(is_adjacent_constant_threshold((jlong)-1, (jlong)0, false));
  EXPECT_TRUE(is_adjacent_constant_threshold((jlong)63, (jlong)64, false));
  EXPECT_FALSE(is_adjacent_constant_threshold(max_jlong, min_jlong, false));
  EXPECT_FALSE(is_adjacent_constant_threshold((jlong)63, (jlong)65, false));
  EXPECT_FALSE(is_adjacent_constant_threshold((jlong)64, (jlong)63, false));
}

TEST(opto, constant_threshold_unsigned_long) {
  EXPECT_TRUE(is_adjacent_constant_threshold((jlong)0, (jlong)1, true));
  EXPECT_TRUE(is_adjacent_constant_threshold((jlong)-2, (jlong)-1, true));
  EXPECT_TRUE(is_adjacent_constant_threshold(max_jlong, min_jlong, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jlong)-1, (jlong)0, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jlong)63, (jlong)65, true));
  EXPECT_FALSE(is_adjacent_constant_threshold((jlong)64, (jlong)63, true));
}
