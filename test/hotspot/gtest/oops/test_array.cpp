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

#include "memory/metadataFactory.hpp"
#include "unittest.hpp"

#include "nmt/mallocHeader.inline.hpp"
#include "nmt/memTracker.hpp"
#include "sanitizers/address.hpp"

#include <string>

template <typename T>
static void check_c_heap_array(const char* kind, int length, T value) {
  Array<T>* array = MetadataFactory::new_array_from_c_heap<T>(length, mtClassShared);
  ASSERT_NE(nullptr, array);

  // Check the actual requested allocation, not just Array's size calculation.
  const MallocHeader* header = MallocHeader::resolve_checked(array);
  // NMT poisons live allocation headers under ASan. Read only the header,
  // then restore its protection before any assertions or array accesses.
  ASAN_UNPOISON_MEMORY_REGION(header, sizeof(MallocHeader));
  const size_t requested_size = header->size();
  const MemTag allocation_tag = header->mem_tag();
  ASAN_POISON_MEMORY_REGION(header, sizeof(MallocHeader));
  ::testing::Test::RecordProperty(std::string(kind) + "_length_" +
                                 std::to_string(length) + "_requested_bytes",
                                 static_cast<int>(requested_size));
  EXPECT_EQ(requested_size, size_t(Array<T>::size(length)) * BytesPerWord);
  EXPECT_EQ(allocation_tag, mtClassShared);
  EXPECT_EQ(array->length(), length);

  for (int i = 0; i < length; i++) {
    EXPECT_EQ(array->at(i), T{});
    array->at_put(i, value);
  }
  for (int i = 0; i < length; i++) {
    EXPECT_EQ(array->at(i), value);
  }

  // This allocation came from the C heap, not ClassLoaderMetaspace.
  FreeHeap(array);
}

TEST_VM(Array, c_heap_allocation_size) {
  if (!MemTracker::enabled()) {
    GTEST_SKIP() << "Requires -XX:NativeMemoryTracking=summary or detail";
  }

  ::testing::Test::RecordProperty("bytes_per_word", BytesPerWord);

  int pointee = 0;
  const int lengths[] = {0, 1, 7, 1000};
  for (int length : lengths) {
    SCOPED_TRACE(length);
    check_c_heap_array<u1>("u1", length, 0xa5);
    check_c_heap_array<u4>("u4", length, 0xabcdef);
    check_c_heap_array<void*>("pointer", length, &pointee);
  }
}
