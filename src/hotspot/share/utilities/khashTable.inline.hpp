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
#ifndef SHARE_UTILITIES_KHASHTABLE_INLINE_HPP
#define SHARE_UTILITIES_KHASHTABLE_INLINE_HPP

#include "memory/allocation.hpp"
#include "utilities/compilerWarnings.hpp"
#include "utilities/globalDefinitions.hpp"

// khash expands its allocation macros at instantiation. All allocations use
// HotSpot's fatal-on-OOM C-heap allocator and the owner's NMT category.
#define kmalloc(Z) AllocateHeap((Z), MEM_TAG)
#define kcalloc(N, Z) allocate_zeroed((N), (Z))
#define krealloc(P, Z) ReallocateHeap((char*)(P), (Z), MEM_TAG)
#define kfree(P) FreeHeap((P))
PRAGMA_DIAG_PUSH
PRAGMA_ZERO_AS_NULL_POINTER_CONSTANT_IGNORED
#include "utilities/klib/khash.h"

template<typename V, MemTag MEM_TAG, bool IS_MAP = true, typename K = uintptr_t>
class KHashTable : public AnyObj {
  NONCOPYABLE(KHashTable);
  static_assert(std::is_scalar<V>::value, "khash stores scalar values");
  static_assert(std::is_unsigned<K>::value, "khash keys are unsigned integers");

  static void* allocate_zeroed(size_t n, size_t size) {
    void* p = AllocateHeap(n * size, MEM_TAG);
    memset(p, 0, n * size);
    return p;
  }

  KHASH_INIT(hotspot, K, V, IS_MAP, primitive_hash<K>, primitive_equals<K>)
  khash_t(hotspot)* _table;

public:
  KHashTable() : _table(kh_init(hotspot)) {}
  ~KHashTable() { kh_destroy(hotspot, _table); }

  bool contains(K key) const {
    return kh_get(hotspot, _table, key) != kh_end(_table);
  }

  // Returns a copied scalar. No pointer into the movable storage escapes.
  bool get(K key, V* value) const {
    khiter_t index = kh_get(hotspot, _table, key);
    if (index == kh_end(_table)) {
      return false;
    }
    *value = kh_value(_table, index);
    return true;
  }

  bool put_if_absent(K key, V value) {
    // Check the next doubled arrays before khash's 32-bit capacity rounding
    // or size_t allocation arithmetic can overflow (including on ILP32).
    if (_table->n_occupied >= _table->upper_bound &&
        (_table->n_buckets == (khint_t(1) << 31) ||
         size_t(_table->n_buckets) > SIZE_MAX / 2 / sizeof(K) ||
         (IS_MAP && size_t(_table->n_buckets) > SIZE_MAX / 2 / sizeof(V)))) {
      if (contains(key)) {
        return false;
      }
      vm_exit_out_of_memory(sizeof(K), OOM_MALLOC_ERROR, "khash capacity");
    }
    int result;
    khiter_t index = kh_put(hotspot, _table, key, &result);
    if (result < 0) {
      vm_exit_out_of_memory(sizeof(K), OOM_MALLOC_ERROR, "khash capacity");
    }
    if (result != 0 && IS_MAP) {
      kh_value(_table, index) = value;
    }
    return result != 0;
  }
};
PRAGMA_DIAG_POP
#undef kmalloc
#undef kcalloc
#undef krealloc
#undef kfree

#endif // SHARE_UTILITIES_KHASHTABLE_INLINE_HPP
