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


#include "classfile/symbolTable.hpp"
#include "runtime/os.hpp"
#include "threadHelper.inline.hpp"
#include "unittest.hpp"

// Threads that add the same new symbols at the same time each hold exactly one
// reference to them, also when their inserts race.
TEST_VM(SymbolTable, test_concurrent_add_refcount) {
  constexpr int threads = 4;
  constexpr int names = 5000;
  constexpr int name_length = 40;
  static Symbol* syms[threads][names];

  auto adder = [&](Thread* current, int id) {
    char name[name_length];
    for (int i = 0; i < names; i++) {
      os::snprintf_checked(name, name_length, "test_concurrent_add_refcount_%d", i);
      syms[id][i] = SymbolTable::new_symbol(name);
    }
  };
  TestThreadGroup<decltype(adder)> ttg(adder, threads);
  ttg.doit();
  ttg.join();

  for (int i = 0; i < names; i++) {
    Symbol* sym = syms[0][i];
    for (int t = 1; t < threads; t++) {
      ASSERT_EQ(syms[t][i], sym) << "threads got different symbols for one name";
    }
    ASSERT_EQ(sym->refcount(), threads) << "each thread holds one reference";
    for (int t = 0; t < threads; t++) {
      sym->decrement_refcount();
    }
  }
}
