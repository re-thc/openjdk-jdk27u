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
 *
 */

#ifndef SHARE_OPTO_COLDCALLSPILL_HPP
#define SHARE_OPTO_COLDCALLSPILL_HPP

#include <float.h>

// Cost and reverse-liveness mechanics shared by Split and its native test.
// The caller owns mask scratch storage; persistent masks and JVMState are unchanged.
class ColdCallSpillPolicy {
  ColdCallSpillPolicy() = delete;

public:
  static bool valid_frequency(double frequency) {
    return frequency >= 0.0 && frequency <= DBL_MAX;
  }

  static void add_constraint(double& frequency, unsigned int& last_node,
                             unsigned int node, double node_frequency) {
    if (last_node != node) {
      frequency += node_frequency;
      last_node = node;
    }
  }

  static bool should_defer(bool has_call_debug_use, bool scalar,
                           double definition_frequency, double constraint_frequency) {
    // A provisional placement margin, not permission to relax constraints.
    return has_call_debug_use && scalar && valid_frequency(definition_frequency) &&
           valid_frequency(constraint_frequency) && definition_frequency > 10.0 * constraint_frequency;
  }

  // Phi copies execute in the predecessor block, not necessarily on a dedicated
  // edge. Use that block's full, loop-scaled frequency. Unknown loop inputs and
  // unrelated coalesced definitions must not acquire deferral provenance.
  class PhiCosts {
    double _up_frequency;
    double _down_frequency;
    bool _proven;

  public:
    PhiCosts() : _up_frequency(0.0), _down_frequency(0.0), _proven(true) {}

    void add_input(bool known, bool up, bool deferred, double predecessor_frequency) {
      _proven &= known && (!up || deferred) && valid_frequency(predecessor_frequency);
      if (up) {
        _up_frequency += predecessor_frequency;
      } else {
        _down_frequency += predecessor_frequency;
      }
    }

    double up_frequency() const { return _up_frequency; }
    double down_frequency() const { return _down_frequency; }

    bool should_keep_up(double constraint_frequency) const {
      // Match LRG's relative load/store costs (2/1), and reserve a store plus a
      // reload for each hard constraint. This is a conservative placement cost,
      // not an estimate of physical spill traffic or permission to relax masks.
      double up_cost = 2.0 * _down_frequency + 3.0 * constraint_frequency;
      return _proven && valid_frequency(_up_frequency) && valid_frequency(_down_frequency) &&
             valid_frequency(constraint_frequency) && valid_frequency(up_cost) &&
             _up_frequency > 10.0 * up_cost;
    }
  };

  template <typename Mask>
  static bool restricts_registers(Mask& missing_registers, const Mask& use_mask) {
    missing_registers.subtract(use_mask);
    return !missing_registers.is_empty();
  }

  template <typename RemoveDef, typename VisitLive, typename ProcessInputs>
  static void visit_reverse_node(unsigned int def, bool is_call,
                                 const RemoveDef& remove_def, const VisitLive& visit_live,
                                 const ProcessInputs& process_inputs) {
    remove_def(def);
    if (is_call) {
      visit_live();
    }
    // Call arguments/debug values become live before the call. They must not
    // be mistaken for values also live after it merely because they are inputs.
    process_inputs();
  }
};

#endif // SHARE_OPTO_COLDCALLSPILL_HPP
