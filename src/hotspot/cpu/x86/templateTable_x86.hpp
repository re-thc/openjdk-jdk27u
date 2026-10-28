/*
 * Copyright (c) 1998, 2019, Oracle and/or its affiliates. All rights reserved.
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

#ifndef CPU_X86_TEMPLATETABLE_X86_HPP
#define CPU_X86_TEMPLATETABLE_X86_HPP

  static void prepare_invoke(Register cache,
                             Register recv,
                             Register flags);
  static void invokevirtual_helper(Register index, Register recv,
                                   Register flags);
  static void volatile_barrier(Assembler::Membar_mask_bits order_constraint);

  static void emit_iconst(InterpreterMacroAssembler* masm, int value);
  static void emit_iload(InterpreterMacroAssembler* masm, int index);
  static void emit_istore(InterpreterMacroAssembler* masm, int index);
  static void emit_iop2(InterpreterMacroAssembler* masm, Operation op);

  // Explicit assembler/opcode forms shared by ordinary templates and the
  // interpreter-frame pilot. They never consult TemplateTable::_desc.
  static void emit_resolve_method_entry(InterpreterMacroAssembler* masm, Bytecodes::Code code,
                                       int byte_no, Register cache, Register index, Label* unresolved);
  static void emit_prepare_invoke(InterpreterMacroAssembler* masm, Bytecodes::Code code,
                                  Register cache, Register recv, Register flags, address* return_table);
  static void emit_direct_invoke(InterpreterMacroAssembler* masm, Bytecodes::Code code,
                                 address* return_table, Label* unresolved);

  // Helpers
  static void index_check(Register array, Register index);
  static void index_check_without_pop(Register array, Register index);

  static void putfield_or_static_helper(int byte_no, bool is_static, RewriteControl rc,
                                        Register obj, Register off, Register flags);
  static void fast_storefield_helper(Address field, Register rax);

#endif // CPU_X86_TEMPLATETABLE_X86_HPP
