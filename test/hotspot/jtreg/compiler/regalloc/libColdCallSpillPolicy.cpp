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
 *
 */

#include "jni.h"
#include "../../../../../src/hotspot/share/opto/coldCallSpill.hpp"

#include <set>
#include <vector>

// The mask adapter tests the helper's operation contract. Production uses an
// arena-backed RegMask scratch. No cached size API exists here: an infinite
// stack mask must not hide missing physical registers.
struct Mask {
  unsigned int registers;
  bool infinite_stack;

  void subtract(const Mask& other) {
    registers &= ~other.registers;
    infinite_stack = infinite_stack && !other.infinite_stack;
  }
  bool is_empty() const { return registers == 0 && !infinite_stack; }
};

#define CHECK(condition) do { \
  if (!(condition)) { \
    env->ThrowNew(env->FindClass("java/lang/AssertionError"), #condition); \
    return; \
  } \
} while (0)

extern "C" JNIEXPORT void JNICALL
Java_compiler_regalloc_TestColdCallSpillPolicy_verify(JNIEnv* env, jclass) {
  double frequency = 0.0;
  unsigned int last_node = 0;
  // One call, encountered both as live-through and in sixteen debug slots.
  for (int i = 0; i < 17; i++) {
    ColdCallSpillPolicy::add_constraint(frequency, last_node, 101, 1.0);
  }
  CHECK(frequency == 1.0);
  CHECK(ColdCallSpillPolicy::should_defer(true, true, 64.0, frequency));
  CHECK(!ColdCallSpillPolicy::should_defer(false, true, 64.0, frequency));
  CHECK(!ColdCallSpillPolicy::should_defer(true, false, 64.0, frequency));
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 10.0, frequency));

  // Distinct individually-cold sites are collectively frequent.
  frequency = 0.0;
  last_node = 0;
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 202, 6.25);
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 201, 6.25);
  CHECK(frequency == 12.5);
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 100.0, frequency));
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 200, 100.0);
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 100.0, frequency));

  auto restricts = [](const Mask& use) {
    Mask missing = {15, false};
    return ColdCallSpillPolicy::restricts_registers(missing, use);
  };
  CHECK(!restricts({15, false})); // full physical class
  CHECK(!restricts({31, true}));  // superset plus stack
  CHECK(restricts({7, false}));  // a non-bound restrictive operand
  CHECK(restricts({1, false}));  // bound operand
  CHECK(restricts({0, true}));   // stack-only, despite infinite cached size
  CHECK(restricts({7, true}));   // registers plus infinite stack
  CHECK(restricts({0, false}));  // empty
  CHECK(restricts({16, false})); // disjoint register class
  Mask non_bound = {7, false};
  Mask scratch = {15, false};
  CHECK(ColdCallSpillPolicy::restricts_registers(scratch, non_bound));
  frequency = 1.0;
  last_node = 101;
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 102, 64.0);
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 64.0, frequency));

  // Walk a single block backward using the exact production visitation order.
  // 1 is live-out but first defined AFTER the call; 3 is consumed after the
  // call yet dead at block exit; 4 is the call result; 2 is a dying argument.
  std::set<unsigned int> live = {1};
  std::set<unsigned int> charged;
  std::vector<unsigned int> order;
  auto remove_def = [&](unsigned int def) { live.erase(def); order.push_back(1); };
  auto visit_live = [&]() { charged = live; order.push_back(2); };
  ColdCallSpillPolicy::visit_reverse_node(1, false, remove_def, visit_live, [&]() {
    live.insert(3); // value consumed after the call, omitted by block live-out
    live.insert(4); // call result consumed after the call
    order.push_back(3);
  });
  CHECK(order == std::vector<unsigned int>({1, 3}));
  order.clear();
  // A return projection is visited before its call in the backward walk.
  ColdCallSpillPolicy::visit_reverse_node(4, false, remove_def, visit_live, []() {});
  CHECK(live == std::set<unsigned int>({3}));
  CHECK(order == std::vector<unsigned int>({1}));
  order.clear();
  ColdCallSpillPolicy::visit_reverse_node(0, true, remove_def, visit_live, [&]() {
    live.insert(2); // call argument becomes live before the call
    order.push_back(3);
  });
  CHECK(order == std::vector<unsigned int>({1, 2, 3}));
  CHECK(charged == std::set<unsigned int>({3}));
  CHECK(live == std::set<unsigned int>({2, 3}));

  // A value already consumed before a call must not be charged there.
  live.clear();
  charged.clear();
  ColdCallSpillPolicy::visit_reverse_node(0, true, remove_def, visit_live, []() {});
  CHECK(charged.empty());
  ColdCallSpillPolicy::visit_reverse_node(0, false, remove_def, visit_live, [&]() { live.insert(5); });
  CHECK(live == std::set<unsigned int>({5}));
}
