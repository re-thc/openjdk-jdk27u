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


#include "utilities/macros.hpp"

#if INCLUDE_CDS

#include "classfile/compactHashtable.inline.hpp"
#include "unittest.hpp"

// Values are strings in one buffer, encoded as their offsets in it.
static const char* decode_test_string(address base, u4 offset) {
  return (const char*)(base + offset);
}

static bool test_string_equals(const char* value, const char* key, int len) {
  return (int)strlen(value) == len && memcmp(value, key, len) == 0;
}

typedef CompactHashtable<const char*, const char*, decode_test_string, test_string_equals> TestCompactTable;

// Builds a table by hand, in the layout that CompactHashtableWriter dumps,
// so that the hashes, and so the collisions, can be chosen.
class TestCompactTableBuilder {
  static const int max_entries = 64;
  static const u4 bucket_count = 8;
  char _strings[2048];
  u4 _string_end;
  u4 _buckets[bucket_count + 1];
  u4 _entries[2 * max_entries];
  const char* _keys[max_entries];
  unsigned int _hashes[max_entries];
  u4 _offsets[max_entries];
  int _count;

public:
  TestCompactTableBuilder() : _string_end(0), _count(0) {}

  void add(const char* key, unsigned int hash) {
    size_t len = strlen(key) + 1;
    memcpy(_strings + _string_end, key, len);
    _keys[_count] = key;
    _hashes[_count] = hash;
    _offsets[_count++] = _string_end;
    _string_end += (u4)len;
  }

  // Buckets with one entry hold only its value, as the writer does for them.
  void build(TestCompactTable* table) {
    u4 entry = 0;
    for (u4 b = 0; b < bucket_count; b++) {
      int in_bucket = 0;
      for (int i = 0; i < _count; i++) {
        in_bucket += (_hashes[i] % bucket_count == b) ? 1 : 0;
      }
      if (in_bucket == 1) {
        _buckets[b] = BUCKET_INFO(entry, VALUE_ONLY_BUCKET_TYPE);
      } else {
        _buckets[b] = BUCKET_INFO(entry, REGULAR_BUCKET_TYPE);
      }
      for (int i = 0; i < _count; i++) {
        if (_hashes[i] % bucket_count == b) {
          if (in_bucket != 1) {
            _entries[entry++] = _hashes[i];
          }
          _entries[entry++] = _offsets[i];
        }
      }
    }
    _buckets[bucket_count] = BUCKET_INFO(entry, TABLEEND_BUCKET_TYPE);
    table->init((address)_strings, (u4)_count, bucket_count, _buckets, _entries);
  }

  const char* value_of(const char* key) const {
    for (int i = 0; i < _count; i++) {
      if (strcmp(_keys[i], key) == 0) {
        return _strings + _offsets[i];
      }
    }
    return nullptr;
  }
};

struct TestQuery {
  const char* key;
  unsigned int hash;
};

// Each key is looked up with lookup_batch and with lookup, which must agree,
// and give the value of the key if it was added.
static void check_batch(const TestCompactTable& table, const TestCompactTableBuilder& builder,
                        const TestQuery* queries, int count) {
  const char* keys[256];
  unsigned int hashes[256];
  int lens[256];
  const char* values[256];
  for (int i = 0; i < count; i++) {
    keys[i] = queries[i].key;
    hashes[i] = queries[i].hash;
    lens[i] = (int)strlen(queries[i].key);
  }
  table.lookup_batch(keys, hashes, lens, count, values);
  for (int i = 0; i < count; i++) {
    const char* scalar = table.lookup(keys[i], hashes[i], lens[i]);
    EXPECT_EQ(values[i], scalar) << "batch and scalar lookups differ for " << keys[i];
    EXPECT_EQ(values[i], builder.value_of(keys[i])) << "wrong value for " << keys[i];
  }
}

TEST_VM(CompactHashtable, lookup_batch) {
  TestCompactTableBuilder builder;
  // Bucket 0: a regular bucket with two keys of the same hash, so that a
  // lookup of the second first meets the first.
  builder.add("collide_a", 8);
  builder.add("collide_b", 8);
  builder.add("other_in_0", 16);
  // Bucket 1: a value-only bucket.
  builder.add("only_in_1", 1);
  // Bucket 2: a regular bucket with different hashes.
  builder.add("two_a", 2);
  builder.add("two_b", 10);
  builder.add("two_c", 18);
  // Buckets 3 to 7 are empty, except for one more value-only bucket.
  builder.add("only_in_5", 5);
  TestCompactTable table;
  builder.build(&table);

  const TestQuery queries[] = {
    { "collide_a", 8 }, { "collide_b", 8 }, { "other_in_0", 16 },
    { "collide_c", 8 },     // same hash as two entries, but absent
    { "missing_0", 24 },    // regular bucket, no entry of this hash
    { "only_in_1", 1 },
    { "not_in_1", 1 },      // value-only bucket of another key
    { "not_in_1", 9 },
    { "two_a", 2 }, { "two_b", 10 }, { "two_c", 18 },
    { "two_d", 26 },
    { "empty_3", 3 }, { "empty_4", 4 }, { "empty_7", 7 },
    { "only_in_5", 5 }, { "not_in_5", 13 },
  };
  const int n = (int)(sizeof(queries) / sizeof(queries[0]));
  check_batch(table, builder, queries, n);

  // More keys than are looked up side by side, in groups of uneven size.
  TestQuery many[100];
  for (int i = 0; i < 100; i++) {
    many[i] = queries[(i * 7) % n];
  }
  for (int count = 0; count <= 100; count += 33) {
    check_batch(table, builder, many, count);
  }
}

TEST_VM(CompactHashtable, lookup_batch_empty_table) {
  TestCompactTableBuilder builder;
  TestCompactTable table;
  builder.build(&table);
  const TestQuery queries[] = { { "a", 0 }, { "b", 1 }, { "c", 7 } };
  check_batch(table, builder, queries, 3);
}

#endif // INCLUDE_CDS
