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
#include "runtime/handles.hpp"

// Cost-isolation pilot, selected explicitly through WhiteBox. Bounded immutable
// integer prefixes live inside the normal interpreter code arena. No nmethod,
// compiled scopes/maps, persistent Method pointer or separate Java frame.
class InterpreterFramePilot : AllStatic {
 private:
  static bool generate_locked(const methodHandle& method, jlong* stats);
 public:
  enum { analysis_cpu=11, buffer_setup_cpu, emission_cpu, publication_cpu, buffer_cleanup_cpu,
         lock_cpu, resource_cleanup_cpu, blob_allocation_cpu, blob_allocation_wall, blob_requested_bytes,
         arena_initialization_cpu, arena_initialization_wall, resource_used_bytes, resource_chunk_bytes,
         assigned_slice_bytes, counter_allocation_cpu, buffer_owns_blob, producer_thread_id, request_thread_id,
         preparation_action, lock_wall, stats_count };
  static constexpr int arena_size=64*K;
  static void reserve();
  static void record_blob_allocation(jlong cpu,jlong wall,int bytes);
  static void startup_costs(jlong* stats);
  static bool set_enabled(const methodHandle& method,bool enabled);
  static void snapshot(const methodHandle& method,jlong* stats);
  static bool prepare(const methodHandle& method, jlong* stats);
};
#endif
