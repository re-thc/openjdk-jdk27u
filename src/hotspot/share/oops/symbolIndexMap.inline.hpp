/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
#ifndef SHARE_OOPS_SYMBOLINDEXMAP_INLINE_HPP
#define SHARE_OOPS_SYMBOLINDEXMAP_INLINE_HPP

#include "memory/allocation.hpp"
#include "utilities/compilerWarnings.hpp"

// Keep STL headers and their assertions within the standard-library boundary.
BEGIN_ALLOW_FORBIDDEN_FUNCTIONS
#include "utilities/vmassert_uninstall.hpp"
#define ANKERL_UNORDERED_DENSE_DISABLE_PMR
#include "utilities/ankerl/unordered_dense.h"
#undef ANKERL_UNORDERED_DENSE_DISABLE_PMR
#include "utilities/vmassert_reinstall.hpp"
END_ALLOW_FORBIDDEN_FUNCTIONS

class Symbol;

// Both the value vector and the rebound index storage use mtSymbol and the
// same fatal-on-OOM allocation path as the original reconstitution maps.
template<typename T>
class SymbolIndexAllocator {
public:
  using value_type = T;
  using is_always_equal = std::true_type;
  SymbolIndexAllocator() = default;
  template<typename U> SymbolIndexAllocator(const SymbolIndexAllocator<U>&) {}

  T* allocate(size_t n) {
    if (n > SIZE_MAX / sizeof(T)) {
      vm_exit_out_of_memory(SIZE_MAX, OOM_MALLOC_ERROR, "Symbol index allocation size");
    }
    return reinterpret_cast<T*>(AllocateHeap(n * sizeof(T), mtSymbol));
  }
  void deallocate(T* p, size_t) { FreeHeap(p); }
  template<typename U> bool operator==(const SymbolIndexAllocator<U>&) const { return true; }
  template<typename U> bool operator!=(const SymbolIndexAllocator<U>&) const { return false; }
};

// A short-lived JVMTI reconstitution map. Symbols belong to the constant pool;
// only scalar indexes are copied out, and no entry pointer or iterator escapes.
class SymbolIndexMap : public AnyObj {
  NONCOPYABLE(SymbolIndexMap);
  using Value = std::pair<const Symbol*, u2>;
  using Map = ankerl::unordered_dense::map<const Symbol*, u2,
      ankerl::unordered_dense::hash<const Symbol*>, std::equal_to<const Symbol*>,
      SymbolIndexAllocator<Value>>;
  Map _table;

public:
  // A user-provided constructor preserves AnyObj's heap allocation marker.
  SymbolIndexMap() {}
  void add_if_absent(const Symbol* sym, u2 value) { _table.emplace(sym, value); }
  u2 symbol_to_value(const Symbol* sym) const {
    auto entry = _table.find(sym);
    return entry == _table.end() ? 0 : entry->second;
  }
};

#endif // SHARE_OOPS_SYMBOLINDEXMAP_INLINE_HPP
