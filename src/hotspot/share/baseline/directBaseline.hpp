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
#ifndef SHARE_BASELINE_DIRECTBASELINE_HPP
#define SHARE_BASELINE_DIRECTBASELINE_HPP
#include "memory/allStatic.hpp"
#include "runtime/handles.hpp"
class AbstractCompiler;
class JavaThread;

// This is a separate bytecode emitter with its own compiler worker/queue.
// Shared-worker priority is retained as an experimental scheduling control.
// It reuses assembler and Runtime1 stubs, but no C1 IR, LIR or allocation.
class DirectBaseline : AllStatic {
 public:
#if defined(AMD64) && defined(COMPILER1)
  static AbstractCompiler* compiler();
  static void request(const methodHandle& method, JavaThread* thread);
#else
  static AbstractCompiler* compiler() { return nullptr; }
  static void request(const methodHandle&, JavaThread*) {}
#endif
};
#endif
