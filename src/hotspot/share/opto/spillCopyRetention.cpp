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

#include "opto/chaitin.hpp"
#include "opto/spillCopyRetention.hpp"
#include "opto/type.hpp"

bool SpillCopyRetentionPolicy::eligible_lrg(const LRG& seed, const LRG& source, const Node* definition,
                                           uint members, uint reg, const Type* type, const RegMask& gp) {
  return type != nullptr && members == 1 && seed.alive() && seed._def == definition && seed.is_singledef() &&
         !seed.is_bound() && !seed._fat_proj && !seed._is_vector && !seed._is_float &&
         OptoReg::is_reg(seed.reg()) && gp.member(seed.reg()) &&
         (reg == Op_RegP || reg == Op_RegN || reg == Op_RegI) &&
         seed.num_regs() == (reg == Op_RegP ? 2 : 1) &&
         (reg != Op_RegP || (type->isa_oopptr() != nullptr && type->is_ptr()->offset() == 0 && seed._is_oop)) &&
         (reg != Op_RegN || type->isa_narrowoop() != nullptr) &&
         seed._is_oop == source._is_oop && OptoReg::is_stack(source.reg());
}

void SpillCopyRetentionPolicy::remove_current_color(const LRG& seed, RegMask& allowed) {
  RegMask current(seed.mask());
  current.smear_to_sets(2);
  allowed.subtract(current);
  allowed.clear_to_sets(seed.num_regs());
}

bool SpillCopyRetentionPolicy::recolor(LRG& seed, const RegMask& allowed, const RegMask& output,
                                       Budget& cleanup_budget, uint cleanup_work) {
  if ((seed.num_regs() != 1 && seed.num_regs() != 2) ||
      !supported_mask(allowed) || !supported_mask(output) || !supported_mask(seed.mask())) {
    return false;
  }
  RegMask choices(allowed);
  choices.and_with(output);
  remove_current_color(seed, choices);
  if (choices.is_empty()) {
    return false;
  }
  OptoReg::Name reg = OptoReg::add(choices.find_first_elem(), seed.num_regs() - 1);
  if (!OptoReg::is_reg(reg) || !cleanup_budget.charge(cleanup_work)) {
    return false;
  }
  seed.clear();
  seed.set_reg(reg);
  for (int r = 0; r < seed.num_regs(); r++) {
    seed.insert(OptoReg::add(reg, -r));
  }
  seed.set_mask_size(seed.num_regs());
  return true;
}
