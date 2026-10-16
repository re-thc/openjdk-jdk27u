/* Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only */
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
      ASSERT_NOT_NULL(events[i]);
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
