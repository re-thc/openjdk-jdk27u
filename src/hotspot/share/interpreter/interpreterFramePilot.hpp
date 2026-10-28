/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#ifndef SHARE_INTERPRETER_INTERPRETERFRAMEPILOT_HPP
#define SHARE_INTERPRETER_INTERPRETERFRAMEPILOT_HPP

#include "memory/allStatic.hpp"
#include "interpreter/bytecodes.hpp"
#include "runtime/handles.hpp"

class InterpreterMacroAssembler;
class Label;
class MethodCounters;
class Method;

// Cost-isolation pilot, selected explicitly through WhiteBox. Bounded immutable
// category-1 bodies live inside the normal interpreter code arena. No nmethod,
// compiled scopes/maps, persistent Method pointer or separate Java frame.
class InterpreterFramePilot : AllStatic {
 private:
  template<bool Observe>
  static bool generate_locked(const methodHandle& method, jlong* stats);
 public:
  enum { analysis_cpu=11, buffer_setup_cpu, emission_cpu, publication_cpu, buffer_cleanup_cpu,
         lock_cpu, resource_cleanup_cpu, blob_allocation_cpu, blob_allocation_wall, blob_requested_bytes,
         arena_initialization_cpu, arena_initialization_wall, resource_used_bytes, resource_chunk_bytes,
         assigned_slice_bytes, counter_allocation_cpu, buffer_owns_blob, producer_thread_id, request_thread_id,
         preparation_action, lock_wall, continuation_hits, stats_count };
  static constexpr int arena_size=64*K;
  static constexpr int shared_code_budget=64*K;
  static void reserve();
  static void record_blob_allocation(jlong cpu,jlong wall,int bytes);
  static void startup_costs(jlong* stats);
  static bool set_enabled(const methodHandle& method,bool enabled);
  static void snapshot(const methodHandle& method,jlong* stats);
  // Emit once in the interpreter entry; execute before every native prefix.
  // Preserves rax (prefix entry) and rdx (owned MethodCounters).
  static void emit_entry_guards(InterpreterMacroAssembler* masm, Label& fallback, bool count_hit=true);
  static address* invoke_return_table(bool is_interface);
  static void set_return_entry(bool is_interface, TosState state, address entry);
  static void set_call_entry(Bytecodes::Code code, address entry);
  static address call_entry(Bytecodes::Code code);
  static void emit_dynamic_call_stub(InterpreterMacroAssembler* masm,Bytecodes::Code code,Label& fallback);
  static void emit_resume(InterpreterMacroAssembler* masm, TosState state, int step);
  enum TestPollState : u1 { test_poll_none, test_poll_requested, test_poll_armed,
                           test_poll_guard_seen, test_poll_processed, test_poll_wrong_bci };
  // WhiteBox-only deterministic local-poll regression. Leaves allocate/block
  // nowhere. Generation requires UseInterpreterFramePilot, WhiteBoxAPI and
  // the explicit startup-only InterpreterFramePilotTestPoll test opt-in.
  static bool test_poll_enabled();
  static bool request_poll_test(const methodHandle& method);
  static int poll_test_state(const methodHandle& method);
  static void arm_test_poll(MethodCounters* counters);
  static void record_test_poll(Method* method, address bcp);
  static void emit_test_poll_return(InterpreterMacroAssembler* masm);
  // Held-method core: no clocks, statistics, snapshot or Java result allocation.
  static bool prepare(const methodHandle& method);
  static bool prepare(const methodHandle& method, jlong* stats);
};
#endif
