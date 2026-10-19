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
 */

#ifndef SHARE_OPTO_SPILLCOPYSHARING_HPP
#define SHARE_OPTO_SPILLCOPYSHARING_HPP

#include "memory/allocation.hpp"
#include "utilities/globalDefinitions.hpp"

// Limits and small graph-independent guards used by the allocator and gtests.
class SpillCopySharing : AllStatic {
public:
  static constexpr uint MaxNodes = 32768;
  static constexpr uint MaxRanges = 65536;
  static constexpr uint MaxInputs = 64;
  static constexpr uint MaxUses = 8;
  static constexpr uint MaxDistance = 64;
  static constexpr uint MaxOrigin = 16;
  static constexpr uint MaxMaskBits = 4096;
  static constexpr uint MaskWords = MaxMaskBits / BitsPerWord;
  static constexpr uint MaxWork = 262144;

  class Work : public StackObj {
    uint _left;
  public:
    explicit Work(uint limit = MaxWork) : _left(limit) {}
    bool spend(uint amount = 1) {
      if (amount > _left) { _left = 0; return false; }
      _left -= amount;
      return true;
    }
    bool exhausted() const { return _left == 0; }
    uint left() const { return _left; }
  };

  // Caller supplies one byte per resolved range, once for the entire pass.
  // Counts saturate at two; no per-reload set is allocated.
  class Definitions : public StackObj {
    uint8_t* _count;
    uint _size;
  public:
    Definitions(uint8_t* counts, uint size) : _count(counts), _size(size) {
      for (uint i = 0; i < size; i++) _count[i] = 0;
    }
    bool add(uint range) {
      if (range >= _size) return false;
      if (range != 0 && _count[range] < 2) _count[range]++;
      return true;
    }
    bool single(uint range) const {
      return range != 0 && range < _size && _count[range] == 1;
    }
  };

  template <typename B, typename RangeMap>
  static bool count_block(B* block, const RangeMap& range, Definitions& definitions, Work& work) {
    for (uint i = 0; i < block->number_of_nodes(); i++) {
      if (!work.spend() || !definitions.add(range(block->get_node(i)))) return false;
    }
    return true;
  }

  // Spare null input capacity is allowed. Any real precedence edge rejects
  // both a reload and its users before Node::replace_by can redirect it.
  template <typename N>
  static bool no_precedence(N* n, Work& work) {
    if (n == nullptr || n->req() > n->len() || n->len() > MaxInputs) return false;
    for (uint k = n->req(); k < n->len(); k++) {
      if (!work.spend() || n->in(k) != nullptr) return false;
    }
    return true;
  }

  template <typename N, typename AcceptMask>
  static bool ordinary_user(N* value, N* use, const AcceptMask& accept_mask, Work& work) {
    if (use->is_Phi() || use->is_MachCall() || !no_precedence(use, work)) return false;
    uint tied = use->is_Mach() ? use->as_Mach()->two_adr() : 0;
    if (tied != 0 && (tied >= use->req() || use->in(tied) == value)) return false;
    bool found = false;
    for (uint k = 0; k < use->req(); k++) {
      if (!work.spend()) return false;
      if (use->in(k) != value) continue;
      if (k == 0) return false;
      auto* jvms = use->jvms();
      if (jvms != nullptr && k >= jvms->debug_start()) return false;
      if (!accept_mask(use->in_RegMask(k))) return false;
      found = true;
    }
    return found;
  }

  enum Origin { IntegerDefinition, Copy, Other };

  template <typename N, typename IsInteger>
  static Origin classify_origin(N* n, const IsInteger& is_integer) {
    if (n->is_Copy()) return Copy;
    if (!n->is_Mach() || n->is_Proj() || n->is_Phi() ||
        n->is_MachTemp() || n->is_MachSafePoint()) return Other;
    return is_integer(n) ? IntegerDefinition : Other;
  }

  // The production adapter admits only a non-projection, non-Phi, ordinary
  // integer-producing Mach node as IntegerDefinition. In particular, a
  // save-on-entry projection cannot become an ordinary value via copies.
  template <typename N, typename Access>
  static bool ordinary_origin(N* n, const Access& access, Work& work) {
    for (uint depth = 0; depth < MaxOrigin; depth++) {
      if (n == nullptr || n->req() > n->len() || n->len() > MaxInputs || !work.spend()) return false;
      Origin kind = access.kind(n);
      if (kind == IntegerDefinition) return true;
      if (kind != Copy || !no_precedence(n, work)) return false;
      n = access.copy_source(n);
    }
    return false; // Includes cycles and overlong copy chains.
  }
};

#endif // SHARE_OPTO_SPILLCOPYSHARING_HPP
