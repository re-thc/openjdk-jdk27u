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


#include "gc/shenandoah/shenandoahForwarding.inline.hpp"
#include "oops/oop.inline.hpp"
#include "unittest.hpp"

TEST_VM(ShenandoahForwarding, changed_header_requires_new_copy) {
  if (!UseFourByteObjectHeaders) {
    return;
  }
  alignas(16) HeapWord storage[8] = {};
  oop source = cast_to_oop(&storage[0]);
  oop copy = cast_to_oop(&storage[4]);
  const markWord unhashed = markWord::prototype();
  const markWord hashed = unhashed.set_hashed_not_expanded();
  source->set_mark_full(hashed);
  // The allocation/copy was made using the earlier, unhashed snapshot.
  ASSERT_EQ(ShenandoahForwarding::try_update_forwardee(source, copy, unhashed), nullptr);
  ASSERT_EQ(source->mark().value(), hashed.value());
  ASSERT_FALSE(source->mark().is_forwarded());
  // Retry after allocating and initializing from the new snapshot.
  ASSERT_EQ(ShenandoahForwarding::try_update_forwardee(source, copy, hashed), copy);
  ASSERT_TRUE(ShenandoahForwarding::has_forwardee(source->mark()));
  ASSERT_TRUE(source->mark().is_forward_expanded());
  ASSERT_EQ(ShenandoahForwarding::get_forwardee_raw_unchecked(source), copy);
  // A competing evacuation returns the winner, without publishing its copy.
  oop other_copy = cast_to_oop(&storage[6]);
  ASSERT_EQ(ShenandoahForwarding::try_update_forwardee(source, other_copy, unhashed), copy);
}

TEST_VM(ShenandoahForwarding, self_forward_preserves_changed_header) {
  alignas(16) HeapWord storage[4] = {};
  oop source = cast_to_oop(&storage[0]);
  const markWord initial = markWord::prototype();
  markWord changed = initial.set_age(3);
  if (UseFourByteObjectHeaders) {
    changed = changed.set_hashed_not_expanded();
  }
  source->set_mark_full(changed);
  ASSERT_EQ(ShenandoahForwarding::try_forward_to_self(source, initial), nullptr);
  ASSERT_TRUE(source->mark().is_self_forwarded());
  ASSERT_EQ(source->mark().unset_self_forwarded().value(), changed.value());
  ASSERT_EQ(ShenandoahForwarding::try_update_forwardee(source, cast_to_oop(&storage[2]), initial), source);
}
