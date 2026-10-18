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
 */

#include "memory/allocation.inline.hpp"
#include "memory/resourceArea.hpp"
#include "opto/spillCopySharing.hpp"
#include "unittest.hpp"

namespace {
using Sharing = SpillCopySharing;

struct DebugState {
  uint start;
  uint debug_start() const { return start; }
};

struct Value {
  enum Kind { Integer, SaveOnEntryProjection, Phi, Copy, Temp, SafePoint, Call, Other } kind;
  uint range;
  uint required;
  uint capacity;
  uint tied;
  DebugState* state;
  uint masks[4];
  Value* inputs[4];
  Value(Kind k = Other, uint r = 1) : kind(k), range(r), required(2), capacity(2),
                                    tied(0), state(nullptr), masks{}, inputs{} {}
  uint req() const { return required; }
  uint len() const { return capacity; }
  Value* in(uint i) const { return inputs[i]; }
  uint is_Copy() const { return kind == Copy ? 1 : 0; }
  bool is_Mach() const { return kind != Other; }
  bool is_Proj() const { return kind == SaveOnEntryProjection; }
  bool is_Phi() const { return kind == Phi; }
  bool is_MachTemp() const { return kind == Temp; }
  bool is_MachSafePoint() const { return kind == SafePoint; }
  bool is_MachCall() const { return kind == Call; }
  Value* as_Mach() { return this; }
  uint two_adr() const { return tied; }
  DebugState* jvms() const { return state; }
  uint in_RegMask(uint k) const { return masks[k]; }
};

struct OriginAccess {
  Sharing::Origin kind(Value* n) const {
    // Give every modeled value the integer register category. The common
    // production classifier must still reject projections/Phis/VM values.
    return Sharing::classify_origin(n, [](Value*) { return true; });
  }
  Value* copy_source(Value* n) const { return n->in(1); }
};

struct BlockImage {
  Value* nodes[4];
  uint number_of_nodes() const { return 4; }
  Value* get_node(uint i) const { return nodes[i]; }
  uint end_idx() const { return 2; }
};
} // namespace

TEST_VM(SpillCopySharing, ordinary_origin_and_copy_chain) {
  Value value(Value::Integer), a(Value::Copy), b(Value::Copy);
  a.inputs[1] = &value;
  b.inputs[1] = &a;
  Sharing::Work work;
  ASSERT_TRUE(Sharing::ordinary_origin(&b, OriginAccess{}, work));
}

TEST_VM(SpillCopySharing, save_on_entry_and_phi_origins_are_rejected) {
  Value saved(Value::SaveOnEntryProjection), phi(Value::Phi), copy(Value::Copy);
  Value temp(Value::Temp), safe(Value::SafePoint);
  Sharing::Work work;
  copy.inputs[1] = &saved;
  ASSERT_FALSE(Sharing::ordinary_origin(&copy, OriginAccess{}, work));
  copy.inputs[1] = &phi;
  ASSERT_FALSE(Sharing::ordinary_origin(&copy, OriginAccess{}, work));
  copy.inputs[1] = &temp;
  ASSERT_FALSE(Sharing::ordinary_origin(&copy, OriginAccess{}, work));
  copy.inputs[1] = &safe;
  ASSERT_FALSE(Sharing::ordinary_origin(&copy, OriginAccess{}, work));
  Value ordinary(Value::Integer);
  ASSERT_EQ(Sharing::Other, Sharing::classify_origin(&ordinary, [](Value*) { return false; }));
}

TEST_VM(SpillCopySharing, copy_cycle_and_overlong_origin_are_rejected) {
  Value a(Value::Copy), b(Value::Copy);
  a.inputs[1] = &b;
  b.inputs[1] = &a;
  Sharing::Work work;
  ASSERT_FALSE(Sharing::ordinary_origin(&a, OriginAccess{}, work));
  Value chain[Sharing::MaxOrigin + 1] = {Value(Value::Integer)};
  for (uint i = 1; i <= Sharing::MaxOrigin; i++) {
    chain[i].kind = Value::Copy;
    chain[i].inputs[1] = &chain[i - 1];
  }
  ASSERT_FALSE(Sharing::ordinary_origin(&chain[Sharing::MaxOrigin], OriginAccess{}, work));
}

TEST_VM(SpillCopySharing, precedence_edges_and_spare_capacity) {
  Value value(Value::Integer), copy(Value::Copy), user(Value::Other);
  copy.inputs[1] = &value;
  copy.capacity = 4;
  Sharing::Work work;
  ASSERT_TRUE(Sharing::no_precedence(&copy, work)); // Spare null capacity.
  copy.inputs[2] = &value;
  ASSERT_FALSE(Sharing::no_precedence(&copy, work)); // Reload's own edge.
  ASSERT_FALSE(Sharing::ordinary_origin(&copy, OriginAccess{}, work));
  user.capacity = 4;
  user.inputs[3] = &copy;
  ASSERT_FALSE(Sharing::no_precedence(&user, work)); // Precedence-only user.
}

TEST_VM(SpillCopySharing, oversized_input_capacity_is_rejected_without_walking_it) {
  Value value(Value::Integer);
  value.capacity = Sharing::MaxInputs + 1;
  Sharing::Work work(5);
  ASSERT_FALSE(Sharing::no_precedence(&value, work));
  ASSERT_FALSE(Sharing::ordinary_origin(&value, OriginAccess{}, work));
  ASSERT_EQ(5u, work.left());
}

TEST_VM(SpillCopySharing, user_guards_and_actual_input_positions) {
  Value value(Value::Integer), user(Value::Integer);
  user.inputs[1] = &value;
  user.masks[1] = 1;
  auto unbound_register_mask = [](uint mask) { return mask == 1; };
  Sharing::Work work;
  ASSERT_TRUE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.kind = Value::Phi;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.kind = Value::Call;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.kind = Value::Integer;
  user.tied = 1;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.tied = 0;
  DebugState debug{1};
  user.state = &debug;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.state = nullptr;
  user.masks[1] = 0; // The production callback rejects a bound/empty mask.
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.masks[1] = 2; // A stack-enabled consumer is also rejected.
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.inputs[1] = nullptr;
  user.inputs[0] = &value;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
  user.inputs[0] = nullptr;
  ASSERT_FALSE(Sharing::ordinary_user(&value, &user, unbound_register_mask, work));
}

TEST_VM(SpillCopySharing, definition_after_block_end_counts) {
  Value value(Value::Integer, 1), reload(Value::Copy, 5);
  Value control(Value::Other, 0), tail_projection(Value::Other, 5);
  BlockImage block{{&value, &reload, &control, &tail_projection}};
  uint8_t counts[8];
  Sharing::Definitions definitions(counts, 8);
  Sharing::Work work;
  auto range = [](Value* n) { return n->range; };
  ASSERT_TRUE(Sharing::count_block(&block, range, definitions, work));
  ASSERT_EQ(2u, block.end_idx());
  ASSERT_TRUE(definitions.single(1));
  ASSERT_FALSE(definitions.single(5));
  ASSERT_FALSE(definitions.single(0));
}

TEST_VM(SpillCopySharing, high_range_ids_saturate_in_one_table) {
  ResourceMark rm;
  uint8_t* counts = NEW_RESOURCE_ARRAY(uint8_t, Sharing::MaxRanges);
  Sharing::Definitions definitions(counts, Sharing::MaxRanges);
  uint high = Sharing::MaxRanges - 1;
  ASSERT_TRUE(definitions.add(high));
  ASSERT_TRUE(definitions.single(high));
  for (uint i = 0; i < 1000; i++) ASSERT_TRUE(definitions.add(high));
  ASSERT_FALSE(definitions.single(high));
  ASSERT_FALSE(definitions.add(Sharing::MaxRanges));
  ASSERT_FALSE(definitions.single(Sharing::MaxRanges));
}

TEST_VM(SpillCopySharing, work_exhaustion_never_underflows) {
  Sharing::Work work(3);
  ASSERT_TRUE(work.spend(2));
  ASSERT_EQ(1u, work.left());
  ASSERT_FALSE(work.spend(2));
  ASSERT_EQ(0u, work.left());
  ASSERT_FALSE(work.spend());
  ASSERT_TRUE(work.exhausted());
  Value value(Value::Integer);
  ASSERT_FALSE(Sharing::ordinary_origin(&value, OriginAccess{}, work));
}
