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


#include "runtime/os.hpp"
#include "runtime/thread.hpp"
#include "utilities/concurrentHashTable.inline.hpp"
#include "threadHelper.inline.hpp"
#include "unittest.hpp"

struct BatchConfig : public AllStatic {
  typedef uintptr_t Value;
  static uintx get_hash(const Value& value, bool* dead_hash) {
    return (uintx)value;
  }
  static void* allocate_node(void* context, size_t size, const Value& value) {
    return os::malloc(size, mtTest);
  }
  static void free_node(void* context, void* memory, const Value& value) {
    os::free(memory);
  }
};

typedef ConcurrentHashTable<BatchConfig, mtInternal> BatchTestTable;

struct BatchLookup {
  uintptr_t _val;
  BatchLookup() : _val(0) {}
  uintx get_hash() {
    return (uintx)_val;
  }
  bool equals(const uintptr_t* value) {
    return _val == *value;
  }
  bool is_dead(const uintptr_t* value) {
    return false;
  }
};

struct BatchFound {
  uintptr_t* _found;
  size_t _calls;
  BatchFound(uintptr_t* found) : _found(found), _calls(0) {}
  void operator()(size_t i, uintptr_t* value) {
    EXPECT_EQ(_found[i], (uintptr_t)0) << "item found twice";
    _found[i] = *value;
    _calls++;
  }
};

// Values of a table with 2^log2_size buckets that share a bucket with value.
static uintptr_t same_bucket(uintptr_t value, size_t log2_size, int n) {
  return value + ((uintptr_t)n << log2_size);
}

static void cht_get_batch(Thread* thr) {
  // Long chains, empty buckets, and more items than are walked side by side.
  const size_t log2_size = 4;
  const size_t count = 100;
  BatchTestTable* cht = new BatchTestTable(log2_size, log2_size, count);
  BatchLookup lookups[count];
  uintptr_t found[count];
  for (size_t i = 0; i < count; i++) {
    lookups[i]._val = same_bucket(1 + i % 7, log2_size, (int)(i / 7));
    found[i] = 0;
    if (i % 3 != 0) {
      EXPECT_TRUE(cht->insert(thr, lookups[i], lookups[i]._val)) << "Insert unique value failed.";
    }
  }

  BatchFound bf(found);
  bool grow_hint = true;
  cht->get_batch(thr, lookups, count, bf, &grow_hint);
  EXPECT_FALSE(grow_hint) << "Chains are short";
  for (size_t i = 0; i < count; i++) {
    if (i % 3 != 0) {
      EXPECT_EQ(found[i], lookups[i]._val) << "Inserted value not found " << i;
    } else {
      EXPECT_EQ(found[i], (uintptr_t)0) << "Value found that was not inserted " << i;
    }
  }
  EXPECT_EQ(bf._calls, count - (count + 2) / 3);

  BatchFound none(found);
  cht->get_batch(thr, lookups, 0, none);
  EXPECT_EQ(none._calls, (size_t)0);

  delete cht;
}

static void cht_get_batch_grow_hint(Thread* thr) {
  const size_t log2_size = 2;
  const size_t grow_hint = 4;
  BatchTestTable* cht = new BatchTestTable(log2_size, log2_size, grow_hint);
  const size_t count = 2 * grow_hint;
  BatchLookup lookups[count];
  uintptr_t found[count];
  for (size_t i = 0; i < count; i++) {
    lookups[i]._val = same_bucket(1, log2_size, (int)i);
    found[i] = 0;
    EXPECT_TRUE(cht->insert(thr, lookups[i], lookups[i]._val)) << "Insert unique value failed.";
  }
  // The first inserted value is last in the chain.
  BatchFound bf(found);
  bool hint = false;
  cht->get_batch(thr, lookups, 1, bf, &hint);
  EXPECT_TRUE(hint) << "Walked a chain longer than the grow hint";
  EXPECT_EQ(found[0], lookups[0]._val);
  delete cht;
}

TEST_VM(ConcurrentHashTable, get_batch) {
  nomt_test_doer(cht_get_batch);
}

TEST_VM(ConcurrentHashTable, get_batch_grow_hint) {
  nomt_test_doer(cht_get_batch_grow_hint);
}
