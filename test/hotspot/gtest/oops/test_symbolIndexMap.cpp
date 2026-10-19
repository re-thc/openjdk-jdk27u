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
#include "nmt/mallocLimit.hpp"
#include "nmt/mallocTracker.hpp"
#include "nmt/memTracker.hpp"
#include "oops/symbolIndexMap.inline.hpp"
#include "unittest.hpp"

TEST_VM(SymbolIndexMap, indexes_and_identity) {
  SymbolIndexMap table;
  const uintptr_t high = (uintptr_t)1 << (BitsPerWord - 2);
  ASSERT_EQ(0, table.symbol_to_value((const Symbol*)8));
  for (uintptr_t i = 1; i <= 32000; ++i) {
    table.add_if_absent((const Symbol*)(i * 8), (u2)i);
    table.add_if_absent((const Symbol*)(high + i * 8), (u2)(i + 32000));
  }
  for (uintptr_t i = 1; i <= 32000; ++i) {
    table.add_if_absent((const Symbol*)(i * 8), 0);
    table.add_if_absent((const Symbol*)(high + i * 8), 0);
    ASSERT_EQ((u2)i, table.symbol_to_value((const Symbol*)(i * 8)));
    ASSERT_EQ((u2)(i + 32000), table.symbol_to_value((const Symbol*)(high + i * 8)));
  }
}

TEST_VM(SymbolIndexMap, native_accounting) {
  if (!MemTracker::enabled()) {
    return;
  }
  const MallocMemory* memory = MallocMemorySummary::as_snapshot()->by_tag(mtSymbol);
  const size_t before_size = memory->malloc_size();
  const size_t before_count = memory->malloc_count();
  {
    auto* table = new (mtSymbol) SymbolIndexMap();
    for (uintptr_t i = 1; i <= 16000; ++i) {
      table->add_if_absent((const Symbol*)(i * 8), (u2)i);
    }
    ASSERT_GT(memory->malloc_size(), before_size);
    ASSERT_GT(memory->malloc_count(), before_count);
    delete table;
  }
  ASSERT_EQ(before_size, memory->malloc_size());
  ASSERT_EQ(before_count, memory->malloc_count());
}

// Run with NativeMemoryTracking=summary to exercise the real allocation path.
TEST_VM_FATAL_ERROR_MSG(SymbolIndexMap, initial_allocation_failure, ".*AllocateHeap.*") {
  if (!MemTracker::enabled()) {
    fatal("Fake message please ignore: AllocateHeap");
  }
  MallocLimitHandler::initialize("symbol:1:oom");
  SymbolIndexMap table;
  table.add_if_absent((const Symbol*)8, 1);
}

TEST_VM_FATAL_ERROR_MSG(SymbolIndexMap, growth_allocation_failure, ".*AllocateHeap.*") {
  if (!MemTracker::enabled()) {
    fatal("Fake message please ignore: AllocateHeap");
  }
  const MallocMemory* memory = MallocMemorySummary::as_snapshot()->by_tag(mtSymbol);
  size_t live = memory->malloc_size() + memory->arena_size();
  char limit[80];
  os::snprintf_checked(limit, sizeof(limit), "symbol:%zu:oom", live + 65536);
  MallocLimitHandler::initialize(limit);
  SymbolIndexMap table;
  for (uintptr_t i = 1; i <= 32000; ++i) {
    table.add_if_absent((const Symbol*)(i * 8), (u2)i);
  }
}
