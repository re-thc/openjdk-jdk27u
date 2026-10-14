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


#ifndef SHARE_CLASSFILE_COMPACTHASHTABLE_INLINE_HPP
#define SHARE_CLASSFILE_COMPACTHASHTABLE_INLINE_HPP

#include "classfile/compactHashtable.hpp"

#include "runtime/prefetch.inline.hpp"

template <typename K, typename V, V (*DECODE)(address, u4), bool (*EQUALS)(V, K, int)>
template <typename KEY>
inline void CompactHashtable<K, V, DECODE, EQUALS>::lookup_batch(const KEY* keys, const unsigned int* hashes,
                                                                 const int* lens, int count, V* values) const {
  // The bucket, the entries and the value of each key are dependent loads.
  // Do each step for a group of keys, prefetching what the next step reads.
  const int group_size = 16;
  u4* entries[group_size];
  for (int start = 0; start < count; start += group_size) {
    const int n = MIN2(group_size, count - start);
    if (_entry_count == 0) {
      for (int i = 0; i < n; i++) {
        values[start + i] = nullptr;
      }
      continue;
    }
    for (int i = 0; i < n; i++) {
      Prefetch::read(&_buckets[hashes[start + i] % _bucket_count], 0);
    }
    for (int i = 0; i < n; i++) {
      entries[i] = _entries + BUCKET_OFFSET(_buckets[hashes[start + i] % _bucket_count]);
      Prefetch::read(entries[i], 0);
    }
    for (int i = 0; i < n; i++) {
      // The value of the first entry with the hash of the key.
      const unsigned int hash = hashes[start + i];
      const int index = hash % _bucket_count;
      u4* entry = entries[i];
      V value = nullptr;
      if (BUCKET_TYPE(_buckets[index]) == VALUE_ONLY_BUCKET_TYPE) {
        value = decode(entry[0]);
      } else {
        u4* entry_max = _entries + BUCKET_OFFSET(_buckets[index + 1]);
        for (; entry < entry_max; entry += 2) {
          if ((unsigned int)entry[0] == hash) {
            value = decode(entry[1]);
            break;
          }
        }
      }
      if (value != nullptr) {
        Prefetch::read(value, 0);
      }
      values[start + i] = value;
    }
    for (int i = 0; i < n; i++) {
      V value = values[start + i];
      if (value != nullptr && !EQUALS(value, keys[start + i], lens[start + i])) {
        // Another key with the same hash, rare enough to look up again.
        values[start + i] = lookup(keys[start + i], hashes[start + i], lens[start + i]);
      }
    }
  }
}

#endif // SHARE_CLASSFILE_COMPACTHASHTABLE_INLINE_HPP
