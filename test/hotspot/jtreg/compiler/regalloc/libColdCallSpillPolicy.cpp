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

#include "jni.h"
#include "../../../../../src/hotspot/share/opto/coldCallSpill.hpp"

#include <limits>
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

  // Three scalar ranges cross two successive hot joins. Costs use predecessor
  // execution frequencies, not alternatives summed within one iteration.
  // The first join must propagate its deferred UP value to the second join.
  ColdCallSpillPolicy::PhiCosts packed_first[3];
  ColdCallSpillPolicy::PhiCosts packed_second[3];
  ColdCallSpillPolicy::PhiCosts packed_uncoordinated[3];
  for (unsigned int range = 0; range < 3; range++) {
    auto& first = packed_first[range];
    first.add_input(true, true, true, 2140.33);  // hot scalar definition
    first.add_input(true, true, true, 1.82001);  // cold UP sibling
    first.add_input(true, false, false, 1.81997); // returning call, DOWN
    CHECK(first.up_frequency() == 2140.33 + 1.82001);
    CHECK(first.down_frequency() == 1.81997);
    CHECK(first.should_keep_up(1.82001));

    auto& second = packed_second[range];
    second.add_input(true, first.should_keep_up(1.82001), true, 2143.97);
    second.add_input(true, true, true, 4536.68); // hot UP sibling
    second.add_input(true, true, true, 0.13977); // rare UP sibling
    CHECK(second.up_frequency() == 2143.97 + 4536.68 + 0.13977);
    CHECK(second.down_frequency() == 0.0);
    CHECK(second.should_keep_up(1.82001));

    // Repairing only the second join leaves the first hot DOWN input too
    // expensive to reload. This must not pass as coordinated deferral.
    auto& uncoordinated = packed_uncoordinated[range];
    uncoordinated.add_input(true, false, false, 2143.97);
    uncoordinated.add_input(true, true, true, 4536.68);
    uncoordinated.add_input(true, true, true, 0.13977);
    CHECK(!uncoordinated.should_keep_up(1.82001));
  }

  // Calls at 1/64 and 1/128 leave insufficient whole-range cost margin:
  // 126/128 is below 10 * (2 * 2/128 + 3 * 3/128) == 130/128.
  ColdCallSpillPolicy::PhiCosts insufficient_margin;
  insufficient_margin.add_input(true, true, true, 126.0 / 128.0);
  insufficient_margin.add_input(true, false, false, 2.0 / 128.0);
  CHECK(!insufficient_margin.should_keep_up(3.0 / 128.0));

  // Calls at 1/256 and 1/512 give both joins in the Java integration fixture
  // enough margin to retain an UP value through their pressure boundaries.
  const double fixture_constraints = 3.0 / 512.0;
  CHECK(ColdCallSpillPolicy::should_defer(true, true, 1.0, fixture_constraints));
  ColdCallSpillPolicy::PhiCosts fixture_first;
  fixture_first.add_input(true, true, true, 510.0 / 512.0);
  fixture_first.add_input(true, false, false, 2.0 / 512.0);
  CHECK(fixture_first.should_keep_up(fixture_constraints)); // 510/512 > 130/512
  ColdCallSpillPolicy::PhiCosts fixture_second;
  fixture_second.add_input(true, true, fixture_first.should_keep_up(fixture_constraints), 511.0 / 512.0);
  fixture_second.add_input(true, false, false, 1.0 / 512.0);
  CHECK(fixture_second.should_keep_up(fixture_constraints)); // 511/512 > 110/512
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 1.0 / 256.0, fixture_constraints));
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 1.0 / 512.0, fixture_constraints));

  // Keeping an already-UP deferred input does not need a memory transfer.
  // An empty join or all-DOWN inputs must not invent a register definition.
  ColdCallSpillPolicy::PhiCosts empty;
  CHECK(empty.up_frequency() == 0.0 && empty.down_frequency() == 0.0);
  CHECK(!empty.should_keep_up(0.0));
  ColdCallSpillPolicy::PhiCosts all_up;
  all_up.add_input(true, true, true, 64.0);
  all_up.add_input(true, true, true, 8.0);
  CHECK(all_up.should_keep_up(0.0));
  ColdCallSpillPolicy::PhiCosts all_down;
  all_down.add_input(true, false, false, 64.0);
  all_down.add_input(true, false, false, 8.0);
  CHECK(!all_down.should_keep_up(0.0));

  // Strict margin: load cost two, store cost one, and a hard constraint can
  // need both. Equality is not a saving, even with complete provenance.
  ColdCallSpillPolicy::PhiCosts equal_cost;
  equal_cost.add_input(true, true, true, 110.0);
  equal_cost.add_input(true, false, false, 4.0);
  CHECK(!equal_cost.should_keep_up(1.0));
  ColdCallSpillPolicy::PhiCosts saving;
  saving.add_input(true, true, true, 111.0);
  saving.add_input(true, false, false, 4.0);
  CHECK(saving.should_keep_up(1.0));
  ColdCallSpillPolicy::PhiCosts hot_down;
  hot_down.add_input(true, true, true, 1.0);
  hot_down.add_input(true, false, false, 64.0);
  CHECK(!hot_down.should_keep_up(0.0));

  // Individually cheap hard constraints can collectively defeat the margin.
  ColdCallSpillPolicy::PhiCosts constrained;
  constrained.add_input(true, true, true, 100.0);
  CHECK(constrained.should_keep_up(1.0));
  frequency = 0.0;
  last_node = 0;
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 301, 1.0);
  ColdCallSpillPolicy::add_constraint(frequency, last_node, 302, 2.5);
  CHECK(!constrained.should_keep_up(frequency));

  // RPO can encounter a loop header before its backedge state is known.
  // Neither that unknown state nor a coalesced unmarked UP definition can
  // acquire the provenance of another deferred input at the same join.
  ColdCallSpillPolicy::PhiCosts unknown_backedge;
  unknown_backedge.add_input(true, true, true, 64.0);
  unknown_backedge.add_input(false, true, true, 0.0);
  CHECK(!unknown_backedge.should_keep_up(0.0));
  unknown_backedge.add_input(true, true, true, 128.0);
  CHECK(!unknown_backedge.should_keep_up(0.0));
  ColdCallSpillPolicy::PhiCosts unmarked;
  unmarked.add_input(true, true, true, 64.0);
  unmarked.add_input(true, true, false, 1.0);
  CHECK(!unmarked.should_keep_up(0.0));

  // Phi copies are inserted before the predecessor terminator. A branch
  // probability cannot discount a load that executes for all successors.
  ColdCallSpillPolicy::PhiCosts full_predecessor;
  full_predecessor.add_input(true, true, true, 64.0);
  full_predecessor.add_input(true, false, false, 100.0);
  CHECK(!full_predecessor.should_keep_up(0.0));
  ColdCallSpillPolicy::PhiCosts discounted_edge;
  discounted_edge.add_input(true, true, true, 64.0);
  discounted_edge.add_input(true, false, false, 0.1);
  CHECK(discounted_edge.should_keep_up(0.0)); // Wrong cost input would reverse the decision.

  // Invalid or overflowed profile data must retain ordinary spill placement.
  const double invalid_frequencies[] = {
    -1.0, std::numeric_limits<double>::infinity(),
    -std::numeric_limits<double>::infinity(), std::numeric_limits<double>::quiet_NaN()
  };
  for (double invalid : invalid_frequencies) {
    CHECK(!ColdCallSpillPolicy::should_defer(true, true, invalid, 1.0));
    CHECK(!ColdCallSpillPolicy::should_defer(true, true, 64.0, invalid));
    CHECK(!all_up.should_keep_up(invalid));
    ColdCallSpillPolicy::PhiCosts invalid_up;
    invalid_up.add_input(true, true, true, invalid);
    CHECK(!invalid_up.should_keep_up(0.0));
    ColdCallSpillPolicy::PhiCosts invalid_down;
    invalid_down.add_input(true, true, true, 64.0);
    invalid_down.add_input(true, false, false, invalid);
    CHECK(!invalid_down.should_keep_up(0.0));
  }
  ColdCallSpillPolicy::PhiCosts zero;
  zero.add_input(true, true, true, 0.0);
  CHECK(!zero.should_keep_up(0.0));
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, 0.0, 0.0));
  CHECK(ColdCallSpillPolicy::should_defer(true, true, 64.0, 0.0));
  const double largest = std::numeric_limits<double>::max();
  ColdCallSpillPolicy::PhiCosts overflow;
  overflow.add_input(true, true, true, largest);
  overflow.add_input(true, true, true, largest);
  CHECK(!overflow.should_keep_up(0.0));
  ColdCallSpillPolicy::PhiCosts overflow_cost;
  overflow_cost.add_input(true, true, true, largest);
  overflow_cost.add_input(true, false, false, largest);
  CHECK(!overflow_cost.should_keep_up(0.0));
  CHECK(!ColdCallSpillPolicy::should_defer(true, true, largest, largest));

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
