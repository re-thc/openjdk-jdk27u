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

#include "runtime/park.hpp"
#include "runtime/thread.inline.hpp"
#include "utilities/align.hpp"
#include "unittest.hpp"

// Events are deliberately immortal. Return them to the pool, never delete them.
TEST_VM(ParkEvent, natural_alignment_and_recycled_events) {
  constexpr int count = 8;
  ParkEvent* events[count];
  for (int round = 0; round < 16; ++round) {
    for (int i = 0; i < count; ++i) {
      events[i] = ParkEvent::Allocate(Thread::current());
      ASSERT_NE(nullptr, events[i]);
      EXPECT_TRUE(is_aligned(reinterpret_cast<uintptr_t>(events[i]), alignof(ParkEvent)));
      // A permitted stale unpark may set the recycled event at any time.
      // Do not assert that a just-associated event has no pending permit.
      for (int j = 0; j < i; ++j) {
        EXPECT_NE(events[i], events[j]);
      }
      events[i]->unpark();
      EXPECT_EQ(events[i]->fired(), 1);
    }
    // Leave permits set while returning the immortal events for reassociation.
    for (int i = 0; i < count; ++i) {
      ParkEvent::Release(events[i]);
    }
  }
}
