/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

#ifndef SHARE_OPTO_SPILLCOPYRETENTION_HPP
#define SHARE_OPTO_SPILLCOPYRETENTION_HPP

#include "memory/allocation.hpp"
#include "opto/regmask.hpp"

// Small policy operations shared by the AMD64 prototype and its native tests.
// These limits bound logical search work and graph sizes, NOT compilation time.
// Copy removal has its own admission allowance and an independent pass limit.
class SpillCopyRetentionPolicy : AllStatic {
public:
  enum : uint {
    MaxAnalysisWork = 1000000,
    MaxChanges = 4,
    MaxTrials = 128,
    MaxLivenessRounds = 64,
    MaxIntervalBlocks = 64,
    MaxEntries = 128,
    MaxBlocks = 2048,
    MaxNodes = 32768,
    MaxNodeIndex = 131072,
    MaxLRGs = 65536,
    MaxRegisters = 2048,
    MaxEdges = 262144,
    MaxCleanupMapWork = 8 * 1024 * 1024
  };

  class Budget : public StackObj {
    uint _left;
  public:
    explicit Budget(uint units) : _left(units) {}
    bool charge(uint units = 1) {
      if (units > _left) {
        _left = 0;
        return false;
      }
      _left -= units;
      return true;
    }
    uint left() const { return _left; }
  };

  static bool supported_mask(const RegMask& mask) {
    RegMask basic;
    return !mask.is_offset() && mask.rm_size_in_words() <= basic.rm_size_in_words();
  }

  static bool graph_size_supported(uint blocks, uint nodes, uint node_index,
                                   uint lrgs, uint registers, uint edges) {
    return blocks <= MaxBlocks && nodes <= MaxNodes && node_index <= MaxNodeIndex &&
           lrgs <= MaxLRGs && registers <= MaxRegisters && edges <= MaxEdges;
  }

  // Admission estimate for the dominant register-map copies/merges/clears.
  // This deliberately is NOT a bound on recursive copy chasing/deletion or on
  // all work in post_allocate_copy_removal(). MaxChanges separately caps passes.
  static uint64_t cleanup_map_work(uint blocks, uint predecessor_edges, uint registers) {
    return 2ULL * blocks + (3ULL * blocks + predecessor_edges) * registers;
  }

  static bool gp_registers(const RegMask& gp, const RegMask& allocation, RegMask& result) {
    result.clear();
    if (!supported_mask(allocation)) {
      return false;
    }
    result.assignFrom(gp);
    result.and_with(allocation);
    result.smear_to_sets(2); // A 32-bit x86 definition destroys both GP halves.
    return true;
  }

  static void transfer(RegMask& live, const RegMask& defs, const RegMask& inputs) {
    live.subtract(defs);
    live.or_with(inputs);
  }

  static bool consumer(bool mach, bool safepoint, bool call, bool recovery,
                       uint two_adr, uint edge, const RegMask& mask, RegMask& allowed) {
    if (!mach || safepoint || call || recovery || two_adr == edge || !supported_mask(mask)) {
      return false;
    }
    allowed.and_with(mask);
    return !allowed.is_empty();
  }

  static bool interval_barrier(bool safepoint, bool call,
                               const RegMask& allocation, const RegMask& home) {
    return safepoint || call || allocation.overlap(home);
  }

  // Phi operands are uses on their particular predecessor edge, not in the
  // successor's ordinary transfer. The callback obtains that edge's allocation.
  template<typename InputRegisters>
  static bool phi_edge_uses(uint phi_count, uint edge, InputRegisters input_registers,
                            Budget& budget, RegMask& out) {
    for (uint phi = 0; phi < phi_count; phi++) {
      if (!budget.charge()) {
        return false;
      }
      RegMask input;
      if (!input_registers(phi, edge, input)) {
        return false;
      }
      out.or_with(input);
    }
    return true;
  }

  // Node-like objects allow the native test to exercise exactly this selection
  // without constructing a Compile. No recursive traversal through other Phis.
  template<typename N>
  static N* invariant_entry(N* source, Budget& budget) {
    N* entry = nullptr;
    bool self = false;
    for (uint k = 1; k < source->req(); k++) {
      if (!budget.charge()) {
        return nullptr;
      }
      N* input = source->in(k);
      if (input == source) {
        self = true;
      } else if (input == nullptr || (entry != nullptr && entry != input)) {
        return nullptr;
      } else {
        entry = input;
      }
    }
    return self ? entry : nullptr;
  }
};

// Existing cleanup can fold a self+entry Phi. Later eligibility may reuse only
// the exact entry identity, LRG, type, oop kind and complete original stack mask.
template<typename N, typename T>
class SpillCopyRetentionEntry : public ArenaObj {
public:
  N* const _node;
  const uint _lid;
  const T* const _type;
  const uint _is_oop;
  const RegMask _home;

  SpillCopyRetentionEntry(N* node, uint lid, const T* type, uint is_oop, const RegMask& home)
    : _node(node), _lid(lid), _type(type), _is_oop(is_oop), _home(home) {}

  bool matches(N* node, uint lid, const T* type, uint is_oop, const RegMask& home) const {
    RegMask missing(_home), extra(home);
    missing.subtract(home);
    extra.subtract(_home);
    return node == _node && lid == _lid && type == _type && is_oop == _is_oop &&
           missing.is_empty() && extra.is_empty();
  }
};

#endif // SHARE_OPTO_SPILLCOPYRETENTION_HPP
