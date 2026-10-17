/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

#include "memory/resourceArea.hpp"
#include "opto/chaitin.hpp"
#include "opto/spillCopyRetention.hpp"
#include "opto/type.hpp"
#include "runtime/thread.hpp"
#include "unittest.hpp"

#if defined(AMD64) && !defined(PRODUCT)

using Policy = SpillCopyRetentionPolicy;

// These tests call production policy/transfer helpers, not a second allocator
// implementation. Small integer slots denote distinct GP alias pairs or homes;
// they do not assume a particular instruction-selection/register-number table.
static RegMask slots(uint a, uint b) {
  RegMask mask;
  mask.insert(a);
  mask.insert(b);
  return RegMask(mask);
}

TEST_VM(SpillCopyRetention, integer_and_fat_definitions_kill_gp_pairs) {
  RegMask gp = slots(0, 1);
  gp.or_with(slots(2, 3));
  gp.or_with(slots(4, 5));
  RegMask allocation, killed;
  allocation.insert(2); // A 32-bit definition of just the low alias.
  ASSERT_TRUE(Policy::gp_registers(gp, allocation, killed));
  ASSERT_TRUE(killed.member(2));
  ASSERT_TRUE(killed.member(3));
  ASSERT_FALSE(killed.member(0));
  RegMask live = slots(2, 3);
  live.insert(4);
  Policy::transfer(live, killed, RegMask::EMPTY);
  ASSERT_FALSE(live.member(2));
  ASSERT_FALSE(live.member(3));
  ASSERT_TRUE(live.member(4));
  allocation.clear();
  allocation.insert(3); // A high-half-only kill still excludes the full GP.
  ASSERT_TRUE(Policy::gp_registers(gp, allocation, killed));
  ASSERT_TRUE(killed.member(2));
  ASSERT_TRUE(killed.member(3));

  allocation.or_with(slots(0, 5)); // Non-contiguous fat MachProj kill mask.
  ASSERT_TRUE(Policy::gp_registers(gp, allocation, killed));
  for (uint i = 0; i < 6; i++) {
    ASSERT_TRUE(killed.member(i));
  }
  allocation.insert(32); // Stack slots must not become GP clobbers.
  ASSERT_TRUE(Policy::gp_registers(gp, allocation, killed));
  ASSERT_FALSE(killed.member(32));
}

TEST_VM(SpillCopyRetention, original_fixed_and_two_address_constraints) {
  RegMask allowed = slots(2, 3);
  allowed.or_with(slots(4, 5));
  RegMask fixed;
  fixed.insert(4);
  ASSERT_TRUE(Policy::consumer(true, false, false, false, 0, 1, fixed, allowed));
  ASSERT_EQ(allowed.size(), 1U);
  ASSERT_TRUE(allowed.member(4));
  allowed.clear_to_sets(2); // The fixed single alias cannot hold a wide oop.
  ASSERT_TRUE(allowed.is_empty());

  allowed.assignFrom(slots(2, 3));
  ASSERT_FALSE(Policy::consumer(true, false, false, false, 1, 1, allowed, allowed));
  ASSERT_TRUE(Policy::consumer(true, false, false, false, 1, 2, allowed, allowed));
  ASSERT_FALSE(Policy::consumer(true, true, false, false, 0, 1, allowed, allowed));
  ASSERT_FALSE(Policy::consumer(true, false, true, false, 0, 1, allowed, allowed));
  ASSERT_FALSE(Policy::consumer(true, false, false, true, 0, 1, allowed, allowed));
  ASSERT_FALSE(Policy::consumer(false, false, false, false, 0, 1, allowed, allowed));
  ASSERT_FALSE(Policy::consumer(true, false, false, false, 0, 1, slots(4, 5), allowed));
  ASSERT_TRUE(allowed.is_empty());
}

TEST_VM(SpillCopyRetention, phi_operands_are_predecessor_specific) {
  Policy::Budget budget(20);
  RegMask edges[2] = {slots(2, 3), slots(4, 5)};
  auto input = [&](uint phi, uint edge, RegMask& result) {
    EXPECT_EQ(phi, 0U);
    result.assignFrom(edges[edge - 1]);
    return true;
  };
  RegMask left, right;
  ASSERT_TRUE(Policy::phi_edge_uses(1, 1, input, budget, left));
  ASSERT_TRUE(Policy::phi_edge_uses(1, 2, input, budget, right));
  ASSERT_TRUE(left.member(2));
  ASSERT_FALSE(left.member(4));
  ASSERT_TRUE(right.member(4));
  ASSERT_FALSE(right.member(2));
  // The Phi's ordinary transfer kills its result. It must not add every input
  // to both predecessors, nor lose an input because that result aliases it.
  RegMask successor_live = slots(2, 3);
  Policy::transfer(successor_live, slots(2, 3), RegMask::EMPTY);
  ASSERT_TRUE(successor_live.is_empty());
  successor_live.or_with(left);
  ASSERT_TRUE(successor_live.member(2));
  Policy::Budget none(0);
  ASSERT_FALSE(Policy::phi_edge_uses(1, 1, input, none, right));
  auto two_phis = [&](uint phi, uint edge, RegMask& result) {
    result.assignFrom(edges[(phi + edge - 1) & 1]);
    return true;
  };
  right.clear();
  ASSERT_TRUE(Policy::phi_edge_uses(2, 2, two_phis, budget, right));
  ASSERT_TRUE(right.member(2));
  ASSERT_TRUE(right.member(4));
  auto unsupported_input = [&](uint, uint, RegMask&) { return false; };
  ASSERT_FALSE(Policy::phi_edge_uses(1, 1, unsupported_input, budget, right));
}

struct RetentionTestNode {
  RetentionTestNode* inputs[4] = {};
  uint count = 1;
  uint req() const { return count; }
  RetentionTestNode* in(uint i) const { return inputs[i]; }
};

static void check_selected_reload_recolors(uint kind, const Type* type, uint oop, uint width) {
  ASSERT_NE(type, nullptr);
  uintptr_t identities[2] = {};
  // Identity token only: no Node is constructed, accessed or dereferenced.
  // Full CFG/Node eligibility remains an integration qualification obligation.
  Node* definition = reinterpret_cast<Node*>(&identities[0]);
  LRG seed{}, source{};
  RegMask gp = slots(0, 1);
  gp.or_with(slots(2, 3));
  gp.or_with(slots(4, 5));
  seed._def = definition;
  source._def = reinterpret_cast<Node*>(&identities[1]); // Identity only.
  seed._is_oop = oop;
  source._is_oop = oop;
  seed.set_num_regs(width);
  source.set_num_regs(width);
  for (uint i = 0; i < width; i++) {
    seed.insert(i);
    source.insert(OptoReg::stack2reg(8 + i));
  }
  seed.set_reg(width - 1);
  source.set_reg(OptoReg::stack2reg(8 + width - 1));
  seed.compute_set_mask_size();
  source.compute_set_mask_size();
  RegMask home(source.mask());
  OptoReg::Name home_reg = source.reg();
  ASSERT_TRUE(Policy::eligible_lrg(seed, source, definition, 1, kind, type, gp));
  if (kind == Op_RegP) {
    ASSERT_FALSE(Policy::eligible_lrg(seed, source, definition, 1, kind, TypeOopPtr::BOTTOM, gp));
    ASSERT_FALSE(Policy::eligible_lrg(seed, source, definition, 1, kind, TypeRawPtr::BOTTOM, gp));
  }
  RetentionTestNode entry, invariant;
  invariant.count = 3;
  invariant.inputs[1] = &entry;
  invariant.inputs[2] = &invariant;
  Policy::Budget analysis(20);
  ASSERT_EQ(Policy::invariant_entry(&invariant, analysis), &entry);
  RegMask allowed(gp);
  // A separate old value occupies pair4/5; original fixed operand masks leave
  // pair2/3 available. Both facts are supplied, not inferred from a fake CFG.
  allowed.subtract(slots(4, 5));
  RegMask output = slots(2, 3);
  ASSERT_TRUE(Policy::consumer(true, false, false, false, 0, 1, output, allowed));
  Policy::Budget cleanup(76);
  ASSERT_TRUE(Policy::recolor(seed, allowed, output, cleanup, 76));
  ASSERT_EQ(seed.reg(), OptoReg::Name(2 + width - 1));
  ASSERT_EQ(seed.mask_size(), static_cast<int>(width));
  ASSERT_EQ(seed.mask().size(), width);
  ASSERT_TRUE(seed.mask().member(2));
  ASSERT_EQ(seed.mask().member(3), width == 2);
  ASSERT_FALSE(seed.mask().member(0));
  ASSERT_EQ(seed._def, definition);
  ASSERT_EQ(static_cast<uint>(seed._is_oop), oop);
  ASSERT_EQ(source.reg(), home_reg);
  ASSERT_EQ(static_cast<uint>(source._is_oop), oop);
  RegMask difference(home);
  difference.subtract(source.mask());
  ASSERT_TRUE(difference.is_empty());
  difference.assignFrom(source.mask());
  difference.subtract(home);
  ASSERT_TRUE(difference.is_empty());
  ASSERT_EQ(cleanup.left(), 0U);
  // Repeating the request is a no-op and must not spend another cleanup pass.
  Policy::Budget unused(76);
  ASSERT_FALSE(Policy::recolor(seed, allowed, output, unused, 76));
  ASSERT_EQ(unused.left(), 76U);
}

TEST_VM(SpillCopyRetention, selected_int_narrow_and_base_oop_recolors) {
  check_selected_reload_recolors(Op_RegI, TypeInt::INT, 0, 1);
  check_selected_reload_recolors(Op_RegN, TypeNarrowOop::BOTTOM, 0, 1);
  check_selected_reload_recolors(Op_RegP, TypeInstPtr::NOTNULL, 1, 2);
}

TEST_VM(SpillCopyRetention, selected_rejections_leave_state_unchanged) {
  uintptr_t identity = 0;
  Node* definition = reinterpret_cast<Node*>(&identity);
  LRG seed{}, source{};
  RegMask gp = slots(0, 1);
  gp.or_with(slots(2, 3));
  seed._def = definition;
  seed.set_num_regs(1);
  seed.insert(0);
  seed.set_reg(0);
  seed.compute_set_mask_size();
  source.set_num_regs(1);
  source.insert(OptoReg::stack2reg(8));
  source.set_reg(OptoReg::stack2reg(8));
  source.compute_set_mask_size();
  ASSERT_TRUE(Policy::eligible_lrg(seed, source, definition, 1, Op_RegI, TypeInt::INT, gp));
  seed._is_bound = 1;
  ASSERT_FALSE(Policy::eligible_lrg(seed, source, definition, 1, Op_RegI, TypeInt::INT, gp));
  seed._is_bound = 0;
  ASSERT_FALSE(Policy::eligible_lrg(seed, source, definition, 2, Op_RegI, TypeInt::INT, gp));
  ASSERT_FALSE(Policy::eligible_lrg(seed, source, definition, 1, Op_RegN, TypeNarrowKlass::NULL_PTR, gp));
  RegMask alternate = slots(2, 3);
  Policy::Budget insufficient(75), unused(76);
  ASSERT_FALSE(Policy::recolor(seed, alternate, alternate, insufficient, 76));
  ASSERT_FALSE(Policy::recolor(seed, alternate, RegMask::EMPTY, unused, 76));
  ASSERT_EQ(unused.left(), 76U);
  ASSERT_EQ(seed.reg(), 0);
  ASSERT_EQ(seed.mask_size(), 1);
  ASSERT_EQ(seed.mask().size(), 1U);
  ASSERT_TRUE(seed.mask().member(0));
  ASSERT_EQ(seed._def, definition);
  ASSERT_EQ(source.reg(), OptoReg::stack2reg(8));
  ASSERT_EQ(source.mask_size(), 1);
}

TEST_VM(SpillCopyRetention, nested_invariant_phi_cleanup_requires_exact_entry) {
  RetentionTestNode entry, other, inner, outer;
  inner.count = 3;
  inner.inputs[1] = &entry;
  inner.inputs[2] = &inner;
  outer.count = 3;
  outer.inputs[1] = &inner;
  outer.inputs[2] = &outer;
  Policy::Budget budget(100);
  ASSERT_EQ(Policy::invariant_entry(&inner, budget), &entry);
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), &inner);
  int oop_type = 0, other_type = 0;
  RegMask home = slots(32, 33);
  SpillCopyRetentionEntry<RetentionTestNode, int> remembered(&entry, 17, &oop_type, 1, home);
  // Model the actual cleanup rewrite: inner self+entry folds; outer now has
  // the original concrete entry. Only that remembered identity remains legal.
  outer.inputs[1] = &entry;
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), &entry);
  ASSERT_TRUE(remembered.matches(&entry, 17, &oop_type, 1, home));
  ASSERT_FALSE(remembered.matches(&other, 17, &oop_type, 1, home));
  ASSERT_FALSE(remembered.matches(&entry, 18, &oop_type, 1, home));
  ASSERT_FALSE(remembered.matches(&entry, 17, &other_type, 1, home));
  ASSERT_FALSE(remembered.matches(&entry, 17, &oop_type, 0, home));
  ASSERT_FALSE(remembered.matches(&entry, 17, &oop_type, 1, slots(33, 34)));

  outer.count = 4;
  outer.inputs[3] = &entry;
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), &entry); // Repeated identical entry.
  outer.inputs[3] = &other; // A mutable join, not one concrete invariant entry.
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), nullptr);
  outer.count = 2;
  outer.inputs[1] = &entry; // No self edge.
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), nullptr);
  outer.inputs[1] = &outer; // All self, no concrete entry.
  ASSERT_EQ(Policy::invariant_entry(&outer, budget), nullptr);
  outer.count = 3;
  outer.inputs[2] = &entry;
  Policy::Budget none(0);
  ASSERT_EQ(Policy::invariant_entry(&outer, none), nullptr);
}

TEST_VM(SpillCopyRetention, stack_home_and_endpoint_barriers) {
  RegMask home = slots(32, 33);
  ASSERT_TRUE(Policy::interval_barrier(false, false, slots(33, 34), home));
  ASSERT_FALSE(Policy::interval_barrier(false, false, slots(34, 35), home));
  ASSERT_TRUE(Policy::interval_barrier(true, false, RegMask::EMPTY, home));
  ASSERT_TRUE(Policy::interval_barrier(false, true, RegMask::EMPTY, home));
}

TEST_VM(SpillCopyRetention, budget_exhaustion_and_admission_limits) {
  Policy::Budget budget(5);
  ASSERT_TRUE(budget.charge(4));
  ASSERT_EQ(budget.left(), 1U);
  ASSERT_FALSE(budget.charge(2));
  ASSERT_EQ(budget.left(), 0U); // Saturates; unsigned subtraction cannot wrap.
  ASSERT_FALSE(budget.charge());
  Policy::Budget exact(2);
  ASSERT_TRUE(exact.charge(2));
  ASSERT_EQ(exact.left(), 0U);
  ASSERT_FALSE(exact.charge());
  ASSERT_TRUE(Policy::graph_size_supported(Policy::MaxBlocks, Policy::MaxNodes, Policy::MaxNodeIndex,
                                          Policy::MaxLRGs, Policy::MaxRegisters, Policy::MaxEdges));
  ASSERT_FALSE(Policy::graph_size_supported(Policy::MaxBlocks + 1, 1, 1, 1, 1, 1));
  ASSERT_FALSE(Policy::graph_size_supported(1, Policy::MaxNodes + 1, 1, 1, 1, 1));
  ASSERT_FALSE(Policy::graph_size_supported(1, 1, Policy::MaxNodeIndex + 1, 1, 1, 1));
  ASSERT_FALSE(Policy::graph_size_supported(1, 1, 1, Policy::MaxLRGs + 1, 1, 1));
  ASSERT_FALSE(Policy::graph_size_supported(1, 1, 1, 1, Policy::MaxRegisters + 1, 1));
  ASSERT_FALSE(Policy::graph_size_supported(1, 1, 1, 1, 1, Policy::MaxEdges + 1));
  ASSERT_EQ(Policy::cleanup_map_work(2, 3, 8), 76ULL);
  Policy::Budget cleanup(100);
  ASSERT_TRUE(cleanup.charge(static_cast<uint>(Policy::cleanup_map_work(2, 3, 8))));
  ASSERT_FALSE(cleanup.charge(static_cast<uint>(Policy::cleanup_map_work(2, 3, 8))));
  ASSERT_EQ(Policy::MaxChanges, 4U); // Four passes total, at most three extra.
}

TEST_VM(SpillCopyRetention, extended_and_rolled_masks_are_rejected) {
  ResourceMark rm;
  RegMask basic;
  ASSERT_TRUE(Policy::supported_mask(basic));
  RegMask extended(Thread::current()->resource_area());
  extended.insert(basic.rm_size_in_bits() + BitsPerWord);
  ASSERT_FALSE(Policy::supported_mask(extended));
  RegMask rolled;
  rolled.set_infinite_stack(true);
  rolled.rollover();
  rolled.clear();
  ASSERT_FALSE(Policy::supported_mask(rolled));
  RegMask result, gp = slots(2, 3);
  ASSERT_FALSE(Policy::gp_registers(gp, extended, result));
  ASSERT_TRUE(result.is_empty());
  ASSERT_FALSE(Policy::consumer(true, false, false, false, 0, 1, rolled, gp));
}

#endif // AMD64 && !PRODUCT
