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


#include "runtime/atomicAccess.hpp"
#include "runtime/os.hpp"
#include "runtime/thread.hpp"
#include "utilities/concurrentHashTable.inline.hpp"
#include "utilities/concurrentHashTableTasks.inline.hpp"
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

static void cht_get_batch_during_grow(Thread* thr) {
  BatchTestTable* cht = new BatchTestTable(5, 6, (size_t)-1);
  BatchLookup lookups[4];
  uintptr_t found[4] = {};
  const uintptr_t values[] = {1, 17, 33, 32};
  for (size_t i = 0; i < 3; i++) {
    lookups[i]._val = values[i];
    EXPECT_TRUE(cht->insert(thr, lookups[i], values[i]));
  }

  BatchTestTable::GrowTask grow(cht);
  ASSERT_TRUE(grow.prepare(thr));
  ASSERT_TRUE(grow.do_task(thr));
  EXPECT_EQ(cht->get_size_log2(thr), (size_t)5);

  // The first bucket has moved, but the old table is still published.
  // Insert through its redirect so the value exists only in the new table.
  lookups[3]._val = values[3];
  EXPECT_TRUE(cht->insert(thr, lookups[3], values[3]));
  BatchFound bf(found);
  cht->get_batch(thr, lookups, 4, bf);
  for (size_t i = 0; i < 4; i++) {
    EXPECT_EQ(found[i], values[i]);
  }
  EXPECT_EQ(bf._calls, (size_t)4);

  while (grow.do_task(thr)) { }
  grow.done(thr);
  EXPECT_EQ(cht->get_size_log2(thr), (size_t)6);
  delete cht;
}

// One thread grows and shrinks the table, and inserts and removes values,
// while the others look up values in batches: those that stay in the table
// must always be found, those never inserted never, and the others found only
// with their own value. Batches that run during a resize walk redirected
// buckets and must not see freed nodes; the interleaving is up to the
// scheduler, so this is likely but not certain on each run.
static void cht_get_batch_while_resizing(Thread* thr) {
  const size_t log2_size = 2;
  const size_t log2_grow_to = 10;   // reached after 8 grows per round
  const uintptr_t stable = 1000;    // odd values 1, 3, ...
  const uintptr_t churn = 512;      // values 4, 8, ...
  const size_t count = 64;
  const int readers = 3;
  const int rounds = 10;
  BatchTestTable* cht = new BatchTestTable(log2_size, log2_grow_to + 2, (size_t)-1);
  for (uintptr_t v = 0; v < stable; v++) {
    BatchLookup l;
    l._val = 2 * v + 1;
    EXPECT_TRUE(cht->insert(thr, l, l._val));
  }

  size_t min_log2 = SIZE_MAX;
  size_t max_log2 = 0;
  volatile int done = 0;
  volatile size_t errors = 0;
  volatile size_t batches = 0;
  volatile int readers_started = 0;
  auto worker = [&](Thread* current, int id) {
    if (id == 0) {
      // Start once every reader has completed a batch. Readers keep looking up
      // until the writer is done, but nothing makes a lookup coincide with any
      // given resize.
      while (AtomicAccess::load_acquire(&readers_started) < readers) {
        os::naked_yield();
      }
      for (int round = 0; round < rounds; round++) {
        for (uintptr_t v = 1; v <= churn; v++) {
          BatchLookup l;
          l._val = 4 * v;
          cht->insert(current, l, l._val);
          if (v % 64 == 0) {
            cht->grow(current, log2_grow_to);
            max_log2 = MAX2(max_log2, cht->get_size_log2(current));
          }
        }
        for (uintptr_t v = 1; v <= churn; v++) {
          BatchLookup l;
          l._val = 4 * v;
          cht->remove(current, l);
          if (v % 64 == 0) {
            cht->shrink(current);
            min_log2 = MIN2(min_log2, cht->get_size_log2(current));
          }
        }
      }
      AtomicAccess::release_store(&done, 1);
      return;
    }
    BatchLookup lookups[count];
    uintptr_t found[count];
    uint64_t seed = (uint64_t)id;
    bool started = false;
    while (AtomicAccess::load_acquire(&done) == 0) {
      for (size_t i = 0; i < count; i++) {
        seed = seed * 6364136223846793005ULL + 1442695040888963407ULL;
        uintptr_t r = (uintptr_t)(seed >> 33);
        switch (i % 3) {
          case 0:  lookups[i]._val = 2 * (r % stable) + 1; break;   // always present
          case 1:  lookups[i]._val = 4 * (r % churn + 1); break;    // coming and going
          default: lookups[i]._val = 4 * (r % churn + 1) + 2; break; // never inserted
        }
        found[i] = 0;
      }
      BatchFound bf(found);
      cht->get_batch(current, lookups, count, bf);
      for (size_t i = 0; i < count; i++) {
        bool bad = (i % 3 == 0) ? found[i] != lookups[i]._val
                                : (found[i] != 0 && found[i] != lookups[i]._val) || (i % 3 == 2 && found[i] != 0);
        if (bad) {
          AtomicAccess::inc(&errors);
        }
      }
      AtomicAccess::inc(&batches);
      if (!started) {
        AtomicAccess::inc(&readers_started);
        started = true;
      }
    }
  };
  TestThreadGroup<decltype(worker)> ttg(worker, readers + 1);
  ttg.doit();
  ttg.join();

  EXPECT_EQ(errors, (size_t)0) << "batches found wrong values while the table was resized";
  EXPECT_GT(batches, (size_t)0);
  EXPECT_EQ(max_log2, log2_grow_to) << "the table grew while it was read";
  EXPECT_EQ(min_log2, log2_size) << "the table shrank while it was read";
  delete cht;
}

TEST_VM(ConcurrentHashTable, get_batch) {
  nomt_test_doer(cht_get_batch);
}

TEST_VM(ConcurrentHashTable, get_batch_grow_hint) {
  nomt_test_doer(cht_get_batch_grow_hint);
}

TEST_VM(ConcurrentHashTable, get_batch_during_grow) {
  nomt_test_doer(cht_get_batch_during_grow);
}

TEST_VM(ConcurrentHashTable, get_batch_while_resizing) {
  cht_get_batch_while_resizing(Thread::current());
}
