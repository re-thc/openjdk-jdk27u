/*
 * Copyright (c) 2026, Harry Chan <38070640+re-thc@users.noreply.github.com>
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
#include "memory/allocation.hpp"
#include "nmt/mallocLimit.hpp"
#include "nmt/mallocTracker.hpp"
#include "nmt/memTracker.hpp"
#include "utilities/khashTable.inline.hpp"
#include "unittest.hpp"

TEST_VM(KHashTable, scalar_map) {
  KHashTable<u2, mtTest> table;
  u2 value = 99;
  ASSERT_FALSE(table.get(0, &value));
  ASSERT_EQ(99, value);
  ASSERT_TRUE(table.put_if_absent(0, 7));
  ASSERT_FALSE(table.put_if_absent(0, 9));
  ASSERT_TRUE(table.get(0, &value));
  ASSERT_EQ(7, value);

  const uintptr_t high = (uintptr_t)1 << (BitsPerWord - 2);
  for (uintptr_t i = 1; i <= 200000; ++i) {
    ASSERT_TRUE(table.put_if_absent(high + i * 8, (u2)(i % 65535)));
    ASSERT_TRUE(table.put_if_absent(i * 8, (u2)(i % 65535)));
  }
  for (uintptr_t i = 1; i <= 200000; ++i) {
    ASSERT_FALSE(table.put_if_absent(high + i * 8, 0));
    ASSERT_TRUE(table.get(high + i * 8, &value));
    ASSERT_EQ((u2)(i % 65535), value);
    ASSERT_TRUE(table.get(i * 8, &value));
    ASSERT_EQ((u2)(i % 65535), value);
  }
}

TEST_VM(KHashTable, address_set) {
  KHashTable<char, mtTest, false> table;
  ASSERT_FALSE(table.contains(0));
  ASSERT_TRUE(table.put_if_absent(0, 0));
  ASSERT_TRUE(table.contains(0));
  ASSERT_FALSE(table.put_if_absent(0, 0));
  const uintptr_t high = (uintptr_t)1 << (BitsPerWord - 2);
  for (uintptr_t i = 1; i <= 200000; ++i) {
    ASSERT_TRUE(table.put_if_absent(high + i * 8, 0));
    ASSERT_TRUE(table.put_if_absent(i * 8, 0));
  }
  for (uintptr_t i = 1; i <= 200000; ++i) {
    ASSERT_TRUE(table.contains(high + i * 8));
    ASSERT_TRUE(table.contains(i * 8));
    ASSERT_FALSE(table.put_if_absent(high + i * 8, 0));
  }
}

TEST_VM(KHashTable, native_accounting) {
  if (!MemTracker::enabled()) {
    return;
  }
  const MallocMemory* memory = MallocMemorySummary::as_snapshot()->by_tag(mtTest);
  const size_t before_size = memory->malloc_size();
  const size_t before_count = memory->malloc_count();
  {
    KHashTable<address, mtTest> table;
    for (uintptr_t i = 0; i < 10000; ++i) {
      table.put_if_absent(i * 8, (address)(i * 8));
    }
    ASSERT_GT(memory->malloc_size(), before_size);
    ASSERT_GT(memory->malloc_count(), before_count);
  }
  ASSERT_EQ(before_size, memory->malloc_size());
  ASSERT_EQ(before_count, memory->malloc_count());
}

// As in the NMT death tests, use the expected fatal message when NMT is off.
// Run with NativeMemoryTracking=summary to exercise the allocation failures.
TEST_VM_FATAL_ERROR_MSG(KHashTable, initial_allocation_failure, ".*AllocateHeap.*") {
  if (!MemTracker::enabled()) {
    fatal("Fake message please ignore: AllocateHeap");
  }
  MallocLimitHandler::initialize("test:1:oom");
  KHashTable<uintptr_t, mtTest> table;
}

TEST_VM_FATAL_ERROR_MSG(KHashTable, growth_allocation_failure, ".*ReallocateHeap.*") {
  if (!MemTracker::enabled()) {
    fatal("Fake message please ignore: ReallocateHeap");
  }
  MallocLimitHandler::initialize("test:64k:oom");
  KHashTable<uintptr_t, mtTest> table;
  for (uintptr_t i = 0; i < 100000; ++i) {
    table.put_if_absent(i * 8, i);
  }
}
