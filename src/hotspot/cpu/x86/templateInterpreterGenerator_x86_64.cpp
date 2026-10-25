/*
 * Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
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

#include "asm/macroAssembler.hpp"
#include "commonIntrinsics_x86.inline.hpp"
#include "compiler/disassembler.hpp"
#include "interpreter/interp_masm.hpp"
#include "interpreter/interpreter.hpp"
#include "interpreter/interpreterRuntime.hpp"
#include "interpreter/templateInterpreterGenerator.hpp"
#include "oops/methodCounters.hpp"
#include "oops/typeArrayKlass.hpp"
#include "memory/universe.hpp"
#include "prims/jvmtiExport.hpp"
#include "runtime/commonIntrinsics.hpp"
#include "runtime/sharedRuntime.hpp"
#include "runtime/stubRoutines.hpp"

#define __ Disassembler::hook<InterpreterMacroAssembler>(__FILE__, __LINE__, _masm)->

#ifdef _WIN64
address TemplateInterpreterGenerator::generate_slow_signature_handler() {
  address entry = __ pc();

  // rbx: method
  // r14: pointer to locals
  // c_rarg3: first stack arg - wordSize
  __ mov(c_rarg3, rsp);
  // adjust rsp
  __ subptr(rsp, 4 * wordSize);
  __ call_VM(noreg,
             CAST_FROM_FN_PTR(address,
                              InterpreterRuntime::slow_signature_handler),
             rbx, r14, c_rarg3);

  // rax: result handler

  // Stack layout:
  // rsp: 3 integer or float args (if static first is unused)
  //      1 float/double identifiers
  //        return address
  //        stack args
  //        garbage
  //        expression stack bottom
  //        bcp (null)
  //        ...

  // Do FP first so we can use c_rarg3 as temp
  __ movl(c_rarg3, Address(rsp, 3 * wordSize)); // float/double identifiers

  for ( int i= 0; i < Argument::n_int_register_parameters_c-1; i++ ) {
    XMMRegister floatreg = as_XMMRegister(i+1);
    Label isfloatordouble, isdouble, next;

    __ testl(c_rarg3, 1 << (i*2));      // Float or Double?
    __ jccb(Assembler::notZero, isfloatordouble);

    // Do Int register here
    switch ( i ) {
      case 0:
        __ load_unsigned_short(rscratch1, Address(rbx, Method::access_flags_offset()));
        __ testl(rscratch1, JVM_ACC_STATIC);
        __ cmovptr(Assembler::zero, c_rarg1, Address(rsp, 0));
        break;
      case 1:
        __ movptr(c_rarg2, Address(rsp, wordSize));
        break;
      case 2:
        __ movptr(c_rarg3, Address(rsp, 2 * wordSize));
        break;
      default:
        break;
    }

    __ jmpb(next);

    __ bind(isfloatordouble);
    __ testl(c_rarg3, 1 << ((i*2)+1));     // Double?
    __ jccb(Assembler::notZero, isdouble);

// Do Float Here
    __ movflt(floatreg, Address(rsp, i * wordSize));
    __ jmpb(next);

// Do Double here
    __ bind(isdouble);
    __ movdbl(floatreg, Address(rsp, i * wordSize));

    __ bind(next);
  }


  // restore rsp
  __ addptr(rsp, 4 * wordSize);

  __ ret(0);

  return entry;
}
#else
address TemplateInterpreterGenerator::generate_slow_signature_handler() {
  address entry = __ pc();

  // rbx: method
  // r14: pointer to locals
  // c_rarg3: first stack arg - wordSize
  __ mov(c_rarg3, rsp);
  // adjust rsp
  __ subptr(rsp, 14 * wordSize);
  __ call_VM(noreg,
             CAST_FROM_FN_PTR(address,
                              InterpreterRuntime::slow_signature_handler),
             rbx, r14, c_rarg3);

  // rax: result handler

  // Stack layout:
  // rsp: 5 integer args (if static first is unused)
  //      1 float/double identifiers
  //      8 double args
  //        return address
  //        stack args
  //        garbage
  //        expression stack bottom
  //        bcp (null)
  //        ...

  // Do FP first so we can use c_rarg3 as temp
  __ movl(c_rarg3, Address(rsp, 5 * wordSize)); // float/double identifiers

  for (int i = 0; i < Argument::n_float_register_parameters_c; i++) {
    const XMMRegister r = as_XMMRegister(i);

    Label d, done;

    __ testl(c_rarg3, 1 << i);
    __ jccb(Assembler::notZero, d);
    __ movflt(r, Address(rsp, (6 + i) * wordSize));
    __ jmpb(done);
    __ bind(d);
    __ movdbl(r, Address(rsp, (6 + i) * wordSize));
    __ bind(done);
  }

  // Now handle integrals.  Only do c_rarg1 if not static.
  __ load_unsigned_short(c_rarg3, Address(rbx, Method::access_flags_offset()));
  __ testl(c_rarg3, JVM_ACC_STATIC);
  __ cmovptr(Assembler::zero, c_rarg1, Address(rsp, 0));

  __ movptr(c_rarg2, Address(rsp, wordSize));
  __ movptr(c_rarg3, Address(rsp, 2 * wordSize));
  __ movptr(c_rarg4, Address(rsp, 3 * wordSize));
  __ movptr(c_rarg5, Address(rsp, 4 * wordSize));

  // restore rsp
  __ addptr(rsp, 14 * wordSize);

  __ ret(0);

  return entry;
}
#endif  // __WIN64

/**
 * Method entry for static native methods:
 *   int java.util.zip.CRC32.update(int crc, int b)
 */
address TemplateInterpreterGenerator::generate_CRC32_update_entry() {
  assert(UseCRC32Intrinsics, "this intrinsic is not supported");
  address entry = __ pc();

  // rbx,: Method*
  // r13: senderSP must preserved for slow path, set SP to it on fast path
  // c_rarg0: scratch (rdi on non-Win64, rcx on Win64)
  // c_rarg1: scratch (rsi on non-Win64, rdx on Win64)

  Label slow_path;
  __ safepoint_poll(slow_path, true /* at_return */, false /* in_nmethod */);

  // We don't generate local frame and don't align stack because
  // we call stub code and there is no safepoint on this path.

  // Load parameters
  const Register crc = rax;  // crc
  const Register val = c_rarg0;  // source java byte value
  const Register tbl = c_rarg1;  // scratch

  // Arguments are reversed on java expression stack
  __ movl(val, Address(rsp,   wordSize)); // byte value
  __ movl(crc, Address(rsp, 2*wordSize)); // Initial CRC

  __ lea(tbl, ExternalAddress(StubRoutines::crc_table_addr()));
  __ notl(crc); // ~crc
  __ update_byte_crc32(crc, val, tbl);
  __ notl(crc); // ~crc
  // result in rax

  // _areturn
  __ pop(rdi);                // get return address
  __ mov(rsp, r13);           // set sp to sender sp
  __ jmp(rdi);

  // generate a vanilla native entry as the slow path
  __ bind(slow_path);
  __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::native));
  return entry;
}

/**
 * Method entry for static native methods:
 *   int java.util.zip.CRC32.updateBytes(int crc, byte[] b, int off, int len)
 *   int java.util.zip.CRC32.updateByteBuffer(int crc, long buf, int off, int len)
 */
address TemplateInterpreterGenerator::generate_CRC32_updateBytes_entry(AbstractInterpreter::MethodKind kind) {
  assert(UseCRC32Intrinsics, "this intrinsic is not supported");
  address entry = __ pc();

  // rbx,: Method*
  // r13: senderSP must preserved for slow path, set SP to it on fast path

  Label slow_path;
  __ safepoint_poll(slow_path, false /* at_return */, false /* in_nmethod */);

  // We don't generate local frame and don't align stack because
  // we call stub code and there is no safepoint on this path.

  // Load parameters
  const Register crc = c_rarg0;  // crc
  const Register buf = c_rarg1;  // source java byte array address
  const Register len = c_rarg2;  // length
  const Register off = len;      // offset (never overlaps with 'len')

  // Arguments are reversed on java expression stack
  // Calculate address of start element
  if (kind == Interpreter::java_util_zip_CRC32_updateByteBuffer) {
    __ movptr(buf, Address(rsp, 3*wordSize)); // long buf
    __ movl2ptr(off, Address(rsp, 2*wordSize)); // offset
    __ addq(buf, off); // + offset
    __ movl(crc,   Address(rsp, 5*wordSize)); // Initial CRC
  } else {
    __ movptr(buf, Address(rsp, 3*wordSize)); // byte[] array
    __ addptr(buf, arrayOopDesc::base_offset_in_bytes(T_BYTE)); // + header size
    __ movl2ptr(off, Address(rsp, 2*wordSize)); // offset
    __ addq(buf, off); // + offset
    __ movl(crc,   Address(rsp, 4*wordSize)); // Initial CRC
  }
  // Can now load 'len' since we're finished with 'off'
  __ movl(len, Address(rsp, wordSize)); // Length

  __ super_call_VM_leaf(CAST_FROM_FN_PTR(address, StubRoutines::updateBytesCRC32()), crc, buf, len);
  // result in rax

  // _areturn
  __ pop(rdi);                // get return address
  __ mov(rsp, r13);           // set sp to sender sp
  __ jmp(rdi);

  // generate a vanilla native entry as the slow path
  __ bind(slow_path);
  __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::native));
  return entry;
}

/**
* Method entry for static (non-native) methods:
*   int java.util.zip.CRC32C.updateBytes(int crc, byte[] b, int off, int end)
*   int java.util.zip.CRC32C.updateDirectByteBuffer(int crc, long address, int off, int end)
*/
address TemplateInterpreterGenerator::generate_CRC32C_updateBytes_entry(AbstractInterpreter::MethodKind kind) {
  assert(UseCRC32CIntrinsics, "this intrinsic is not supported");
  address entry = __ pc();
  // Load parameters
  const Register crc = c_rarg0;  // crc
  const Register buf = c_rarg1;  // source java byte array address
  const Register len = c_rarg2;
  const Register off = c_rarg3;  // offset
  const Register end = len;

  // Arguments are reversed on java expression stack
  // Calculate address of start element
  if (kind == Interpreter::java_util_zip_CRC32C_updateDirectByteBuffer) {
    __ movptr(buf, Address(rsp, 3 * wordSize)); // long address
    __ movl2ptr(off, Address(rsp, 2 * wordSize)); // offset
    __ addq(buf, off); // + offset
    __ movl(crc, Address(rsp, 5 * wordSize)); // Initial CRC
    // Note on 5 * wordSize vs. 4 * wordSize:
    // *   int java.util.zip.CRC32C.updateByteBuffer(int crc, long address, int off, int end)
    //                                                   4         2,3          1        0
    // end starts at SP + 8
    // The Java(R) Virtual Machine Specification Java SE 7 Edition
    // 4.10.2.3. Values of Types long and double
    //    "When calculating operand stack length, values of type long and double have length two."
  } else {
    __ movptr(buf, Address(rsp, 3 * wordSize)); // byte[] array
    __ addptr(buf, arrayOopDesc::base_offset_in_bytes(T_BYTE)); // + header size
    __ movl2ptr(off, Address(rsp, 2 * wordSize)); // offset
    __ addq(buf, off); // + offset
    __ movl(crc, Address(rsp, 4 * wordSize)); // Initial CRC
  }
  __ movl(end, Address(rsp, wordSize)); // end
  __ subl(end, off); // end - off
  __ super_call_VM_leaf(CAST_FROM_FN_PTR(address, StubRoutines::updateBytesCRC32C()), crc, buf, len);
  // result in rax
  // _areturn
  __ pop(rdi);                // get return address
  __ mov(rsp, r13);           // set sp to sender sp
  __ jmp(rdi);

  return entry;
}

/**
 * Method entry for static method:
 *    java.lang.Float.float16ToFloat(short floatBinary16)
 */
address TemplateInterpreterGenerator::generate_Float_float16ToFloat_entry() {
  assert(VM_Version::supports_float16(), "this intrinsic is not supported");
  address entry = __ pc();

  // r13: the sender's SP

  // Load value into xmm0 and convert
  __ movswl(rax, Address(rsp, wordSize));
  __ flt16_to_flt(xmm0, rax);

  // Return result in xmm0
  __ pop(rdi);      // get return address
  __ mov(rsp, r13); // set rsp to sender's SP
  __ jmp(rdi);

  return entry;
}

/**
 * Method entry for static method:
 *    java.lang.Float.floatToFloat16(float value)
 */
address TemplateInterpreterGenerator::generate_Float_floatToFloat16_entry() {
  assert(VM_Version::supports_float16(), "this intrinsic is not supported");
  address entry = __ pc();

  // r13: the sender's SP

  // Load value into xmm0, convert and put result into rax
  __ movflt(xmm0, Address(rsp, wordSize));
  __ flt_to_flt16(rax, xmm0, xmm1);

  // Return result in rax
  __ pop(rdi);      // get return address
  __ mov(rsp, r13); // set rsp to sender's SP
  __ jmp(rdi);

  return entry;
}

//
// Various method entries
//

address TemplateInterpreterGenerator::generate_math_entry(AbstractInterpreter::MethodKind kind) {

  // rbx,: Method*
  // rcx: scratrch
  // r13: sender sp

  address entry_point = __ pc();

  // These don't need a safepoint check because they aren't virtually
  // callable. We won't enter these intrinsics from compiled code.
  // If in the future we added an intrinsic which was virtually callable
  // we'd have to worry about how to safepoint so that this code is used.

  // mathematical functions inlined by compiler
  // (interpreter must provide identical implementation
  // in order to avoid monotonicity bugs when switching
  // from interpreter to compiler in the middle of some
  // computation)
  //
  // stack: [ ret adr ] <-- rsp
  //        [ lo(arg) ]
  //        [ hi(arg) ]
  //

  if (kind == Interpreter::java_lang_math_fmaD) {
    if (!UseFMA) {
      return nullptr; // Generate a vanilla entry
    }
    __ movdbl(xmm0, Address(rsp, wordSize));
    __ movdbl(xmm1, Address(rsp, 3 * wordSize));
    __ movdbl(xmm2, Address(rsp, 5 * wordSize));
    __ fmad(xmm0, xmm1, xmm2, xmm0);
  } else if (kind == Interpreter::java_lang_math_fmaF) {
    if (!UseFMA) {
      return nullptr; // Generate a vanilla entry
    }
    __ movflt(xmm0, Address(rsp, wordSize));
    __ movflt(xmm1, Address(rsp, 2 * wordSize));
    __ movflt(xmm2, Address(rsp, 3 * wordSize));
    __ fmaf(xmm0, xmm1, xmm2, xmm0);
  } else if (kind == Interpreter::java_lang_math_sqrt) {
    __ sqrtsd(xmm0, Address(rsp, wordSize));
  } else if (kind == Interpreter::java_lang_math_exp) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dexp() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dexp())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dexp));
    }
  } else if (kind == Interpreter::java_lang_math_log) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dlog() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dlog())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dlog));
    }
  } else if (kind == Interpreter::java_lang_math_log10) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dlog10() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dlog10())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dlog10));
    }
  } else if (kind == Interpreter::java_lang_math_sin) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dsin() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dsin())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dsin));
    }
  } else if (kind == Interpreter::java_lang_math_cos) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dcos() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dcos())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dcos));
    }
  } else if (kind == Interpreter::java_lang_math_pow) {
    __ movdbl(xmm1, Address(rsp, wordSize));
    __ movdbl(xmm0, Address(rsp, 3 * wordSize));
    if (StubRoutines::dpow() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dpow())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dpow));
    }
  } else if (kind == Interpreter::java_lang_math_tan) {
    __ movdbl(xmm0, Address(rsp, wordSize));
    if (StubRoutines::dtan() != nullptr) {
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dtan())));
    } else {
      __ call_VM_leaf0(CAST_FROM_FN_PTR(address, SharedRuntime::dtan));
    }
  } else if (kind == Interpreter::java_lang_math_sinh) {
    if (StubRoutines::dsinh() != nullptr) {
      __ movdbl(xmm0, Address(rsp, wordSize));
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dsinh())));
    } else {
      return nullptr; // Fallback to default implementation
    }
  } else if (kind == Interpreter::java_lang_math_tanh) {
    if (StubRoutines::dtanh() != nullptr) {
      __ movdbl(xmm0, Address(rsp, wordSize));
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dtanh())));
    } else {
      return nullptr; // Fallback to default implementation
    }
  } else if (kind == Interpreter::java_lang_math_cbrt) {
    if (StubRoutines::dcbrt() != nullptr) {
      __ movdbl(xmm0, Address(rsp, wordSize));
      __ call(RuntimeAddress(CAST_FROM_FN_PTR(address, StubRoutines::dcbrt())));
    } else {
      return nullptr; // Fallback to default implementation
    }
  } else if (kind == Interpreter::java_lang_math_abs) {
    assert(StubRoutines::x86::double_sign_mask() != nullptr, "not initialized");
    __ movdbl(xmm0, Address(rsp, wordSize));
    __ andpd(xmm0, ExternalAddress(StubRoutines::x86::double_sign_mask()));
  } else {
    ShouldNotReachHere();
  }

  __ pop(rax);
  __ mov(rsp, r13);
  __ jmp(rax);

  return entry_point;
}

void TemplateInterpreterGenerator::generate_big_integer_entry(vmIntrinsics::ID id, Label& slow_path) {
#ifdef _WIN64
  const Register arg4 = rax;
  const Register arg5 = rscratch1;
#else
  const Register arg4 = c_rarg4;
  const Register arg5 = c_rarg5;
#endif
  address entry_slot = nullptr;
  int result_slot = -1;
  auto bounded = [&](Register length, int limit) {
    __ testl(length, length);
    __ jcc(Assembler::lessEqual, slow_path);
    __ cmpl(length, limit);
    __ jcc(Assembler::greater, slow_path);
  };
  auto disjoint = [&](Register input, Register output) {
    __ cmpptr(input, output);
    __ jcc(Assembler::equal, slow_path);
  };
  auto elements = [&](Register array) {
    __ addptr(array, arrayOopDesc::base_offset_in_bytes(T_INT));
  };
  switch (id) {
    case vmIntrinsics::_multiplyToLen:
      __ movptr(c_rarg0, Address(rsp, 5 * wordSize));
      __ movl(c_rarg1, Address(rsp, 4 * wordSize));
      __ movptr(c_rarg2, Address(rsp, 3 * wordSize));
      __ movl(c_rarg3, Address(rsp, 2 * wordSize));
      __ movptr(rscratch1, Address(rsp, wordSize));
      bounded(c_rarg1, CommonIntrinsics::max_quadratic_limbs);
      bounded(c_rarg3, CommonIntrinsics::max_quadratic_limbs);
      disjoint(c_rarg0, rscratch1);
      disjoint(c_rarg2, rscratch1);
      __ movptr(arg4, rscratch1);
      elements(c_rarg0);
      elements(c_rarg2);
      elements(arg4);
      entry_slot = StubRoutines::multiplyToLen_entry_address();
      result_slot = 1;
      break;
    case vmIntrinsics::_squareToLen:
      __ movptr(c_rarg0, Address(rsp, 4 * wordSize));
      __ movl(c_rarg1, Address(rsp, 3 * wordSize));
      __ movptr(c_rarg2, Address(rsp, 2 * wordSize));
      __ movl(c_rarg3, Address(rsp, wordSize));
      bounded(c_rarg1, CommonIntrinsics::max_quadratic_limbs);
      disjoint(c_rarg0, c_rarg2);
      elements(c_rarg0);
      elements(c_rarg2);
      entry_slot = StubRoutines::squareToLen_entry_address();
      result_slot = 2;
      break;
    case vmIntrinsics::_mulAdd:
      __ movptr(c_rarg0, Address(rsp, 5 * wordSize));
      __ movptr(c_rarg1, Address(rsp, 4 * wordSize));
      __ movl(c_rarg2, Address(rsp, 3 * wordSize));
      __ movl(c_rarg3, Address(rsp, 2 * wordSize));
      bounded(c_rarg3, CommonIntrinsics::max_leaf_elements);
      __ movl(rscratch1, Address(c_rarg0, arrayOopDesc::length_offset_in_bytes()));
      __ subl(rscratch1, c_rarg2);
      __ movl(c_rarg2, rscratch1);
      __ movl(arg4, Address(rsp, wordSize));
      elements(c_rarg0);
      elements(c_rarg1);
      entry_slot = StubRoutines::mulAdd_entry_address();
      break;
    case vmIntrinsics::_montgomeryMultiply:
      __ movptr(c_rarg0, Address(rsp, 7 * wordSize));
      __ movptr(c_rarg1, Address(rsp, 6 * wordSize));
      __ movptr(c_rarg2, Address(rsp, 5 * wordSize));
      __ movl(c_rarg3, Address(rsp, 4 * wordSize));
      __ movptr(rscratch1, Address(rsp, wordSize));
      bounded(c_rarg3, CommonIntrinsics::max_montgomery_limbs);
      disjoint(c_rarg0, rscratch1);
      disjoint(c_rarg1, rscratch1);
      disjoint(c_rarg2, rscratch1);
      __ movq(arg4, Address(rsp, 2 * wordSize));
      __ movptr(arg5, rscratch1);
      elements(c_rarg0);
      elements(c_rarg1);
      elements(c_rarg2);
      elements(arg5);
      entry_slot = StubRoutines::montgomeryMultiply_entry_address();
      result_slot = 1;
      break;
    case vmIntrinsics::_montgomerySquare:
      __ movptr(c_rarg0, Address(rsp, 6 * wordSize));
      __ movptr(c_rarg1, Address(rsp, 5 * wordSize));
      __ movl(c_rarg2, Address(rsp, 4 * wordSize));
      __ movptr(rscratch1, Address(rsp, wordSize));
      bounded(c_rarg2, CommonIntrinsics::max_montgomery_limbs);
      disjoint(c_rarg0, rscratch1);
      disjoint(c_rarg1, rscratch1);
      __ movq(c_rarg3, Address(rsp, 2 * wordSize));
      __ movptr(arg4, rscratch1);
      elements(c_rarg0);
      elements(c_rarg1);
      elements(arg4);
      entry_slot = StubRoutines::montgomerySquare_entry_address();
      result_slot = 1;
      break;
    case vmIntrinsics::_bigIntegerLeftShiftWorker:
    case vmIntrinsics::_bigIntegerRightShiftWorker: {
      bool left = id == vmIntrinsics::_bigIntegerLeftShiftWorker;
      __ movptr(c_rarg0, Address(rsp, 5 * wordSize));
      __ movptr(c_rarg1, Address(rsp, 4 * wordSize));
      __ movl(c_rarg2, Address(rsp, 3 * wordSize));
      __ movl(c_rarg3, Address(rsp, 2 * wordSize));
      __ movl(rscratch1, Address(rsp, wordSize));
      bounded(rscratch1, CommonIntrinsics::max_leaf_elements);
      bounded(c_rarg3, 31);
      __ testl(c_rarg2, c_rarg2);
      __ jcc(Assembler::negative, slow_path);
      if (!left) {
        __ cmpl(c_rarg2, 1);
        __ jcc(Assembler::greater, slow_path);
      }
      Label disjoint_arrays;
      __ cmpptr(c_rarg0, c_rarg1);
      __ jcc(Assembler::notEqual, disjoint_arrays);
      __ cmpl(c_rarg2, left ? 0 : 1);
      __ jcc(Assembler::notEqual, slow_path);
      __ bind(disjoint_arrays);
      __ movl(arg4, rscratch1);
      elements(c_rarg0);
      elements(c_rarg1);
      entry_slot = left ? StubRoutines::bigIntegerLeftShift_entry_address()
                        : StubRoutines::bigIntegerRightShift_entry_address();
      break;
    }
    default: ShouldNotReachHere();
  }
  __ lea(rscratch2, ExternalAddress(entry_slot));
  __ movptr(rscratch2, Address(rscratch2, 0));
  __ testptr(rscratch2, rscratch2);
  __ jcc(Assembler::zero, slow_path);
  __ enter();
  __ andptr(rsp, -16);
#ifdef _WIN64
  __ subptr(rsp, id != vmIntrinsics::_squareToLen ? 48 : frame::arg_reg_save_area_bytes);
  if (id != vmIntrinsics::_squareToLen) __ movptr(Address(rsp, frame::arg_reg_save_area_bytes), arg4);
  if (id == vmIntrinsics::_montgomeryMultiply) __ movptr(Address(rsp, frame::arg_reg_save_area_bytes + wordSize), arg5);
#endif
  __ call(rscratch2);
  __ leave();
  if (result_slot >= 0) __ movptr(rax, Address(rsp, result_slot * wordSize));
}

void TemplateInterpreterGenerator::generate_crypto_entry(vmIntrinsics::ID id, Label& slow_path) {
  bool block = id == vmIntrinsics::_aescrypt_encryptBlock || id == vmIntrinsics::_aescrypt_decryptBlock;
  bool ecb = id == vmIntrinsics::_electronicCodeBook_encryptAESCrypt || id == vmIntrinsics::_electronicCodeBook_decryptAESCrypt;
  bool cbc = id == vmIntrinsics::_cipherBlockChaining_encryptAESCrypt || id == vmIntrinsics::_cipherBlockChaining_decryptAESCrypt;
  bool ctr = id == vmIntrinsics::_counterMode_AESCrypt;
  bool gcm = id == vmIntrinsics::_galoisCounterMode_AESCrypt;
  bool decrypting = id == vmIntrinsics::_aescrypt_decryptBlock ||
                    id == vmIntrinsics::_electronicCodeBook_decryptAESCrypt ||
                    id == vmIntrinsics::_cipherBlockChaining_decryptAESCrypt;
  int slots = gcm ? 9 : block ? 5 : (ecb || cbc || ctr) ? 6 : 3;
  address entry_slot = nullptr;
  const Register key = rax, state = rcx, htable = rdx, counter = r8;
  const Register mode = rdi, encrypted = rdx, used = rcx, rate = r9;
  Label failed, done;
  __ enter();
#ifdef _WIN64
  __ push(rsi);
  __ push(rdi);
#endif
  __ andptr(rsp, -16);
  __ subptr(rsp, 64); // Windows shadow space and the GCM/CTR stack arguments.
  auto java_slot = [&](int index) { return Address(rbp, (slots - index + 1) * wordSize); };
  auto object = [&](Register dst, int index) { __ movptr(dst, java_slot(index)); };
  auto integer = [&](Register dst, int index) { __ movl(dst, java_slot(index)); };
  auto layout = [&](InstanceKlass** klass) {
    __ lea(rscratch1, ExternalAddress(reinterpret_cast<address>(klass)));
    __ cmpptr(Address(rscratch1, 0), 0);
    __ jcc(Assembler::equal, failed);
  };
  auto field_address = [&](Register dst, Register base, int* offset) {
    __ lea(rscratch1, ExternalAddress(reinterpret_cast<address>(offset)));
    __ movl(rscratch1, Address(rscratch1, 0));
    __ testl(rscratch1, rscratch1);
    __ jcc(Assembler::negative, failed);
    __ lea(dst, Address(base, rscratch1, Address::times_1));
  };
  auto field = [&](Register dst, Register base, int* offset) {
    field_address(rscratch1, base, offset);
    __ load_heap_oop(dst, Address(rscratch1, 0), rscratch2);
  };
  auto int_field = [&](Register dst, Register base, int* offset) {
    field_address(rscratch1, base, offset);
    __ movl(dst, Address(rscratch1, 0));
  };
  auto elements = [&](Register array, BasicType type) {
    __ addptr(array, arrayOopDesc::base_offset_in_bytes(type));
  };
  auto bytes = [&](Register dst, int array, int offset) {
    object(dst, array);
    integer(rscratch1, offset);
    __ lea(dst, Address(dst, rscratch1, Address::times_1, arrayOopDesc::base_offset_in_bytes(T_BYTE)));
  };
  auto argument = [&](int index, Register value) {
#ifdef _WIN64
    const Register registers[] = { c_rarg0, c_rarg1, c_rarg2, c_rarg3 };
    if (index >= 4) {
      __ movptr(Address(rsp, frame::arg_reg_save_area_bytes + (index - 4) * wordSize), value);
      return;
    }
#else
    const Register registers[] = { c_rarg0, c_rarg1, c_rarg2, c_rarg3, c_rarg4, c_rarg5 };
    if (index >= 6) {
      __ movptr(Address(rsp, (index - 6) * wordSize), value);
      return;
    }
#endif
    if (registers[index] != value) __ movptr(registers[index], value);
  };
  auto bounded = [&](int index) {
    integer(rscratch1, index);
    __ testl(rscratch1, rscratch1);
    __ jcc(Assembler::lessEqual, failed);
    __ cmpl(rscratch1, CommonIntrinsics::max_leaf_elements);
    __ jcc(Assembler::greater, failed);
  };
  auto overlap = [&](bool disjoint) {
    Label different;
    object(rscratch1, 1);
    object(rscratch2, 4);
    __ cmpptr(rscratch1, rscratch2);
    __ jcc(Assembler::notEqual, different);
    if (disjoint) {
      __ jmp(failed);
    } else {
      integer(rscratch1, 2);
      integer(rscratch2, 5);
      __ cmpl(rscratch1, rscratch2);
      __ jcc(Assembler::notEqual, failed);
    }
    __ bind(different);
  };
  auto aes_key = [&]() {
    layout(&CommonIntrinsics::aescrypt_klass);
    layout(&CommonIntrinsics::feedback_cipher_klass);
    field(key, mode, &CommonIntrinsics::embedded_cipher_offset);
    __ testptr(key, key);
    __ jcc(Assembler::zero, failed);
    __ load_klass(rscratch1, key, rscratch2);
    __ lea(rscratch2, ExternalAddress(reinterpret_cast<address>(&CommonIntrinsics::aescrypt_klass)));
    __ cmpptr(rscratch1, Address(rscratch2, 0));
    __ jcc(Assembler::notEqual, failed);
    field(key, key, decrypting ? &CommonIntrinsics::aes_decrypt_key_offset
                               : &CommonIntrinsics::aes_encrypt_key_offset);
  };
  if (block) {
    layout(&CommonIntrinsics::aescrypt_klass);
    object(mode, 0);
    field(key, mode, decrypting ? &CommonIntrinsics::aes_decrypt_key_offset
                                : &CommonIntrinsics::aes_encrypt_key_offset);
    entry_slot = decrypting ? StubRoutines::aescrypt_decryptBlock_entry_address()
                            : StubRoutines::aescrypt_encryptBlock_entry_address();
  } else if (ecb || cbc || ctr) {
    bounded(3);
    overlap(cbc && decrypting);
    object(mode, 0);
    aes_key();
    if (cbc) {
      layout(&CommonIntrinsics::cbc_klass);
      field(rate, mode, &CommonIntrinsics::cbc_r_offset);
      entry_slot = decrypting ? StubRoutines::cipherBlockChaining_decryptAESCrypt_entry_address()
                              : StubRoutines::cipherBlockChaining_encryptAESCrypt_entry_address();
    } else if (ctr) {
      layout(&CommonIntrinsics::ctr_klass);
      field(counter, mode, &CommonIntrinsics::ctr_counter_offset);
      field(encrypted, mode, &CommonIntrinsics::ctr_encrypted_offset);
      field_address(used, mode, &CommonIntrinsics::ctr_used_offset);
      entry_slot = StubRoutines::counterMode_AESCrypt_entry_address();
    } else {
      entry_slot = decrypting ? StubRoutines::electronicCodeBook_decryptAESCrypt_entry_address()
                              : StubRoutines::electronicCodeBook_encryptAESCrypt_entry_address();
    }
  } else if (gcm) {
    bounded(2);
    object(rscratch1, 0);
    object(rscratch2, 5);
    __ cmpptr(rscratch1, rscratch2);
    __ jcc(Assembler::equal, failed);
    object(mode, 7);
    aes_key();
    layout(&CommonIntrinsics::ctr_klass);
    field(counter, mode, &CommonIntrinsics::ctr_counter_offset);
    layout(&CommonIntrinsics::ghash_klass);
    object(mode, 8);
    field(state, mode, &CommonIntrinsics::ghash_state_offset);
    field(htable, mode, &CommonIntrinsics::ghash_key_offset);
    entry_slot = StubRoutines::galoisCounterMode_AESCrypt_entry_address();
  } else {
    int* offset = nullptr;
    switch (id) {
      case vmIntrinsics::_md5_implCompress:
        layout(&CommonIntrinsics::md5_klass);
        offset = &CommonIntrinsics::md5_state_offset;
        entry_slot = StubRoutines::md5_implCompress_entry_address();
        break;
      case vmIntrinsics::_sha_implCompress:
        layout(&CommonIntrinsics::sha1_klass);
        offset = &CommonIntrinsics::sha1_state_offset;
        entry_slot = StubRoutines::sha1_implCompress_entry_address();
        break;
      case vmIntrinsics::_sha2_implCompress:
        layout(&CommonIntrinsics::sha256_klass);
        offset = &CommonIntrinsics::sha256_state_offset;
        entry_slot = StubRoutines::sha256_implCompress_entry_address();
        break;
      case vmIntrinsics::_sha5_implCompress:
        layout(&CommonIntrinsics::sha512_klass);
        offset = &CommonIntrinsics::sha512_state_offset;
        entry_slot = StubRoutines::sha512_implCompress_entry_address();
        break;
      case vmIntrinsics::_sha3_implCompress:
        layout(&CommonIntrinsics::sha3_klass);
        offset = &CommonIntrinsics::sha3_state_offset;
        entry_slot = StubRoutines::sha3_implCompress_entry_address();
        break;
      default: ShouldNotReachHere();
    }
    object(mode, 0);
    field(state, mode, offset);
    if (id == vmIntrinsics::_sha3_implCompress) {
      layout(&CommonIntrinsics::digest_base_klass);
      int_field(rate, mode, &CommonIntrinsics::digest_block_size_offset);
    }
  }

  // All barriered oop loads precede the raw addresses passed to the stub.
  if (gcm) {
    elements(counter, T_BYTE); argument(7, counter);
    elements(htable, T_LONG); argument(6, htable);
    elements(state, T_LONG); argument(5, state);
    elements(key, T_INT); argument(4, key);
    bytes(c_rarg3, 5, 6);
    bytes(c_rarg2, 3, 4);
    integer(c_rarg1, 2);
    bytes(c_rarg0, 0, 1);
  } else if (ctr) {
    argument(6, used);
    elements(encrypted, T_BYTE); argument(5, encrypted);
    elements(counter, T_BYTE); argument(3, counter);
    elements(key, T_INT); argument(2, key);
    integer(rscratch2, 3); argument(4, rscratch2);
    bytes(c_rarg1, 4, 5);
    bytes(c_rarg0, 1, 2);
  } else if (block || ecb || cbc) {
    if (cbc) {
      integer(rscratch2, 3); argument(4, rscratch2);
      elements(rate, T_BYTE); argument(3, rate);
    } else if (ecb) {
      integer(rscratch2, 3); argument(3, rscratch2);
    }
    elements(key, T_INT); argument(2, key);
    bytes(c_rarg1, block ? 3 : 4, block ? 4 : 5);
    bytes(c_rarg0, 1, 2);
  } else {
    if (id == vmIntrinsics::_sha3_implCompress) argument(2, rate);
    elements(state, id == vmIntrinsics::_sha5_implCompress || id == vmIntrinsics::_sha3_implCompress ? T_LONG : T_INT);
    argument(1, state);
    bytes(c_rarg0, 1, 2);
  }
  __ lea(rscratch2, ExternalAddress(entry_slot));
  __ movptr(rscratch2, Address(rscratch2, 0));
  __ testptr(rscratch2, rscratch2);
  __ jcc(Assembler::zero, failed);
  __ call(rscratch2);
#ifdef _WIN64
  __ movptr(rsi, Address(rbp, -wordSize));
  __ movptr(rdi, Address(rbp, -2 * wordSize));
#endif
  __ leave();
  __ jmp(done);
  __ bind(failed);
#ifdef _WIN64
  __ movptr(rsi, Address(rbp, -wordSize));
  __ movptr(rdi, Address(rbp, -2 * wordSize));
#endif
  __ leave();
  __ jmp(slow_path);
  __ bind(done);
}

void TemplateInterpreterGenerator::generate_array_entry(vmIntrinsics::ID id, Label& slow_path) {
  int slots = 0;
  address entry_slot = nullptr;
  Label failed, done;
  __ enter();
  __ andptr(rsp, -16);
#ifdef _WIN64
  __ subptr(rsp, 48);
#endif
  auto java_slot = [&](int index) { return Address(rbp, (slots - index + 1) * wordSize); };
  auto argument = [&](int index, Register value) {
#ifdef _WIN64
    const Register registers[] = { c_rarg0, c_rarg1, c_rarg2, c_rarg3 };
    if (index == 4) {
      __ movptr(Address(rsp, frame::arg_reg_save_area_bytes), value);
      return;
    }
#else
    const Register registers[] = { c_rarg0, c_rarg1, c_rarg2, c_rarg3, c_rarg4 };
#endif
    __ movptr(registers[index], value);
  };
  auto pointer = [&](int arg, int index, BasicType type, int offset = -1) {
    __ movptr(rscratch2, java_slot(index));
    if (offset >= 0) {
      __ movslq(rscratch1, java_slot(offset));
      __ lea(rscratch2, Address(rscratch2, rscratch1, Address::times_1, arrayOopDesc::base_offset_in_bytes(type)));
    } else {
      __ addptr(rscratch2, arrayOopDesc::base_offset_in_bytes(type));
    }
    argument(arg, rscratch2);
  };
  auto word = [&](int arg, int index) {
    __ movslq(rscratch2, java_slot(index));
    argument(arg, rscratch2);
  };
  auto bounded = [&](int index, int maximum) {
    __ movl(rscratch1, java_slot(index));
    __ testl(rscratch1, rscratch1);
    __ jcc(Assembler::lessEqual, failed);
    __ cmpl(rscratch1, maximum);
    __ jcc(Assembler::greater, failed);
  };
  auto distinct = [&](int first, int second) {
    __ movptr(rscratch1, java_slot(first));
    __ cmpptr(rscratch1, java_slot(second));
    __ jcc(Assembler::equal, failed);
  };
  switch (id) {
    case vmIntrinsics::_ghash_processBlocks:
      slots = 5;
      bounded(2, CommonIntrinsics::max_leaf_elements / 16);
      word(3, 2);
      pointer(2, 0, T_BYTE, 1);
      pointer(1, 4, T_LONG);
      pointer(0, 3, T_LONG);
      entry_slot = StubRoutines::ghash_processBlocks_entry_address();
      break;
    case vmIntrinsics::_chacha20Block:
      slots = 2;
      pointer(1, 1, T_BYTE);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::chacha20Block_entry_address();
      break;
    case vmIntrinsics::_poly1305_processBlocks:
      slots = 6;
      __ movl(rscratch1, java_slot(3));
      __ cmpl(rscratch1, CommonIntrinsics::max_leaf_elements);
      __ jcc(Assembler::greater, failed);
      pointer(3, 5, T_LONG);
      pointer(2, 4, T_LONG);
      word(1, 3);
      pointer(0, 1, T_BYTE, 2);
      entry_slot = StubRoutines::poly1305_processBlocks_entry_address();
      break;
    case vmIntrinsics::_intpoly_montgomeryMult_P256:
      slots = 4;
      pointer(2, 3, T_LONG);
      pointer(1, 2, T_LONG);
      pointer(0, 1, T_LONG);
      entry_slot = StubRoutines::intpoly_montgomeryMult_P256_entry_address();
      break;
    case vmIntrinsics::_intpoly_assign:
      slots = 3;
      __ movptr(rscratch1, java_slot(1));
      __ movl(rscratch2, Address(rscratch1, arrayOopDesc::length_offset_in_bytes()));
      __ cmpl(rscratch2, CommonIntrinsics::max_leaf_elements);
      __ jcc(Assembler::greater, failed);
      argument(3, rscratch2);
      pointer(2, 2, T_LONG);
      pointer(1, 1, T_LONG);
      word(0, 0);
      entry_slot = StubRoutines::intpoly_assign_entry_address();
      break;
    case vmIntrinsics::_double_keccak:
      slots = 2;
      distinct(1, 0);
      pointer(1, 1, T_LONG);
      pointer(0, 0, T_LONG);
      entry_slot = StubRoutines::double_keccak_entry_address();
      break;
    case vmIntrinsics::_quad_keccak:
      slots = 4;
      distinct(1, 0);
      distinct(2, 0);
      distinct(2, 1);
      distinct(3, 0);
      distinct(3, 1);
      distinct(3, 2);
      pointer(3, 3, T_LONG);
      pointer(2, 2, T_LONG);
      pointer(1, 1, T_LONG);
      pointer(0, 0, T_LONG);
      entry_slot = StubRoutines::quad_keccak_entry_address();
      break;
    case vmIntrinsics::_kyberNtt:
      slots = 2;
      pointer(1, 1, T_SHORT);
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberNtt_entry_address();
      break;
    case vmIntrinsics::_kyberInverseNtt:
      slots = 2;
      pointer(1, 1, T_SHORT);
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberInverseNtt_entry_address();
      break;
    case vmIntrinsics::_kyberNttMult:
      slots = 4;
      pointer(3, 3, T_SHORT);
      pointer(2, 2, T_SHORT);
      pointer(1, 1, T_SHORT);
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberNttMult_entry_address();
      break;
    case vmIntrinsics::_kyberAddPoly_2:
      slots = 3;
      pointer(2, 2, T_SHORT);
      pointer(1, 1, T_SHORT);
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberAddPoly_2_entry_address();
      break;
    case vmIntrinsics::_kyberAddPoly_3:
      slots = 4;
      pointer(3, 3, T_SHORT);
      pointer(2, 2, T_SHORT);
      pointer(1, 1, T_SHORT);
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberAddPoly_3_entry_address();
      break;
    case vmIntrinsics::_kyber12To16:
      slots = 4;
      bounded(3, (CommonIntrinsics::max_leaf_elements / 192) * 128);
      __ testl(rscratch1, 1);
      __ jcc(Assembler::notZero, failed);
      word(3, 3);
      pointer(2, 2, T_SHORT);
      word(1, 1);
      pointer(0, 0, T_BYTE);
      entry_slot = StubRoutines::kyber12To16_entry_address();
      break;
    case vmIntrinsics::_kyberBarrettReduce:
      slots = 1;
      pointer(0, 0, T_SHORT);
      entry_slot = StubRoutines::kyberBarrettReduce_entry_address();
      break;
    case vmIntrinsics::_dilithiumAlmostNtt:
      slots = 2;
      pointer(1, 1, T_INT);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::dilithiumAlmostNtt_entry_address();
      break;
    case vmIntrinsics::_dilithiumAlmostInverseNtt:
      slots = 2;
      pointer(1, 1, T_INT);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::dilithiumAlmostInverseNtt_entry_address();
      break;
    case vmIntrinsics::_dilithiumNttMult:
      slots = 3;
      pointer(2, 2, T_INT);
      pointer(1, 1, T_INT);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::dilithiumNttMult_entry_address();
      break;
    case vmIntrinsics::_dilithiumMontMulByConstant:
      slots = 2;
      word(1, 1);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::dilithiumMontMulByConstant_entry_address();
      break;
    case vmIntrinsics::_dilithiumDecomposePoly:
      slots = 5;
      word(4, 4);
      word(3, 3);
      pointer(2, 2, T_INT);
      pointer(1, 1, T_INT);
      pointer(0, 0, T_INT);
      entry_slot = StubRoutines::dilithiumDecomposePoly_entry_address();
      break;
    default: ShouldNotReachHere();
  }
  __ lea(rscratch2, ExternalAddress(entry_slot));
  __ movptr(rscratch2, Address(rscratch2, 0));
  __ testptr(rscratch2, rscratch2);
  __ jcc(Assembler::zero, failed);
  __ call(rscratch2);
  __ leave();
  __ jmp(done);
  __ bind(failed);
  __ leave();
  __ jmp(slow_path);
  __ bind(done);
}

void TemplateInterpreterGenerator::generate_digest_entry(Label& slow_path) {
  Label failed, done;
  __ enter();
#ifdef _WIN64
  __ push(rsi);
  __ push(rdi);
#endif
  __ andptr(rsp, -16);
#ifdef _WIN64
  __ subptr(rsp, 48);
#endif
  auto java_slot = [&](int index) { return Address(rbp, (5 - index) * wordSize); };
  auto layout = [&](InstanceKlass** klass, Register dst, Label& absent) {
    __ lea(rscratch1, ExternalAddress(reinterpret_cast<address>(klass)));
    __ movptr(dst, Address(rscratch1, 0));
    __ testptr(dst, dst);
    __ jcc(Assembler::zero, absent);
  };
  auto field_address = [&](int* offset) {
    __ lea(rscratch1, ExternalAddress(reinterpret_cast<address>(offset)));
    __ movl(rscratch1, Address(rscratch1, 0));
    __ testl(rscratch1, rscratch1);
    __ jcc(Assembler::negative, failed);
    __ lea(rscratch1, Address(rdi, rscratch1, Address::times_1));
  };
  layout(&CommonIntrinsics::digest_base_klass, rcx, failed);
  __ movptr(rdi, java_slot(0));
  field_address(&CommonIntrinsics::digest_block_size_offset);
  __ movl(r9, Address(rscratch1, 0));
  __ movl(rscratch1, java_slot(2));
  __ movl(rscratch2, java_slot(3));
  __ cmpl(rscratch2, rscratch1);
  __ jcc(Assembler::less, failed);
  __ subl(rscratch2, rscratch1);
  __ movl(rscratch1, CommonIntrinsics::max_leaf_elements);
  __ subl(rscratch1, r9);
  __ cmpl(rscratch2, rscratch1);
  __ jcc(Assembler::greater, failed);
  InstanceKlass** classes[] = { &CommonIntrinsics::md5_klass, &CommonIntrinsics::sha1_klass,
                              &CommonIntrinsics::sha256_klass, &CommonIntrinsics::sha512_klass, &CommonIntrinsics::sha3_klass };
  int* offsets[] = { &CommonIntrinsics::md5_state_offset, &CommonIntrinsics::sha1_state_offset,
                   &CommonIntrinsics::sha256_state_offset, &CommonIntrinsics::sha512_state_offset, &CommonIntrinsics::sha3_state_offset };
  address entries[] = { StubRoutines::md5_implCompressMB_entry_address(), StubRoutines::sha1_implCompressMB_entry_address(),
                        StubRoutines::sha256_implCompressMB_entry_address(), StubRoutines::sha512_implCompressMB_entry_address(),
                        StubRoutines::sha3_implCompressMB_entry_address() };
  for (int i = 0; i < 5; i++) {
    Label next, matches;
    layout(classes[i], rcx, next);
    __ movptr(rdi, java_slot(0));
    __ load_klass(rax, rdi, rscratch2);
    // These provider classes are primary superclasses, including for their subclasses.
    __ check_klass_subtype_fast_path(rax, rcx, rdx, &matches, &next, &next);
    __ bind(matches);
    __ movptr(rdi, java_slot(0));
    if (i == 4) {
      field_address(&CommonIntrinsics::digest_block_size_offset);
      __ movl(r9, Address(rscratch1, 0));
    }
    field_address(offsets[i]);
    __ load_heap_oop(rax, Address(rscratch1, 0), rscratch2);
    __ addptr(rax, arrayOopDesc::base_offset_in_bytes(i >= 3 ? T_LONG : T_INT));
    if (i == 4) {
#ifdef _WIN64
      __ movslq(rscratch2, java_slot(3));
      __ movptr(Address(rsp, frame::arg_reg_save_area_bytes), rscratch2);
#else
      __ movslq(c_rarg4, java_slot(3));
#endif
      __ movptr(c_rarg2, r9);
      __ movslq(c_rarg3, java_slot(2));
    } else {
      __ movslq(c_rarg3, java_slot(3));
      __ movslq(c_rarg2, java_slot(2));
    }
    __ movptr(c_rarg1, rax);
    __ movptr(c_rarg0, java_slot(1));
    __ movslq(rscratch1, java_slot(2));
    __ lea(c_rarg0, Address(c_rarg0, rscratch1, Address::times_1, arrayOopDesc::base_offset_in_bytes(T_BYTE)));
    __ lea(rscratch2, ExternalAddress(entries[i]));
    __ movptr(rscratch2, Address(rscratch2, 0));
    __ testptr(rscratch2, rscratch2);
    __ jcc(Assembler::zero, failed);
    __ call(rscratch2);
    __ jmp(done);
    __ bind(next);
  }
  __ bind(failed);
#ifdef _WIN64
  __ movptr(rsi, Address(rbp, -wordSize));
  __ movptr(rdi, Address(rbp, -2 * wordSize));
#endif
  __ leave();
  __ jmp(slow_path);
  __ bind(done);
#ifdef _WIN64
  __ movptr(rsi, Address(rbp, -wordSize));
  __ movptr(rdi, Address(rbp, -2 * wordSize));
#endif
  __ leave();
}

void TemplateInterpreterGenerator::generate_hash_entry(Label& slow_path) {
  Label failed, done;
  __ enter();
  __ andptr(rsp, -16);
#ifdef _WIN64
  __ subptr(rsp, frame::arg_reg_save_area_bytes);
#endif
  auto java_slot = [&](int index) { return Address(rbp, (6 - index) * wordSize); };
  __ movptr(rax, java_slot(0));
  __ testptr(rax, rax);
  __ jcc(Assembler::zero, failed);
  __ movl(rdx, java_slot(1));
  __ testl(rdx, rdx);
  __ jcc(Assembler::negative, failed);
  __ movl(rcx, java_slot(2));
  __ testl(rcx, rcx);
  __ jcc(Assembler::negative, failed);
  __ cmpl(rcx, CommonIntrinsics::max_hash_elements);
  __ jcc(Assembler::greater, failed);
  const BasicType tags[] = { T_BOOLEAN, T_BYTE, T_SHORT, T_CHAR, T_CHAR, T_INT };
  const BasicType arrays[] = { T_BYTE, T_BYTE, T_SHORT, T_CHAR, T_BYTE, T_INT };
  const address entries[] = { CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_unsigned_bytes), CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_bytes),
                        CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_shorts), CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_chars),
                        CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_chars), CAST_FROM_FN_PTR(address, CommonIntrinsics::hash_ints) };
  for (int i = 0; i < 6; i++) {
    BasicType type = tags[i];
    int shift = type == T_INT ? 2 : (type == T_SHORT || type == T_CHAR) ? 1 : 0;
    Label next;
    __ movl(rscratch1, java_slot(4));
    __ cmpl(rscratch1, type);
    __ jcc(Assembler::notEqual, next);
    __ load_klass(rscratch1, rax, rscratch2);
    __ mov_metadata(rscratch2, Universe::typeArrayKlass(arrays[i]));
    __ cmpptr(rscratch1, rscratch2);
    __ jcc(Assembler::notEqual, next);
    __ movl(r8, Address(rax, arrayOopDesc::length_offset_in_bytes()));
    if (type == T_CHAR && arrays[i] == T_BYTE) __ shrl(r8, 1);
    __ cmpl(rdx, r8);
    __ jcc(Assembler::greater, failed);
    __ subl(r8, rdx);
    __ cmpl(rcx, r8);
    __ jcc(Assembler::greater, failed);
    __ lea(rax, Address(rax, rdx, static_cast<Address::ScaleFactor>(shift), arrayOopDesc::base_offset_in_bytes(arrays[i])));
    __ movl(c_rarg1, java_slot(2));
    __ movl(c_rarg2, java_slot(3));
    __ movptr(c_rarg0, rax);
    __ lea(rscratch2, RuntimeAddress(entries[i]));
    __ call(rscratch2);
    __ jmp(done);
    __ bind(next);
  }
  __ bind(failed);
  __ leave();
  __ jmp(slow_path);
  __ bind(done);
  __ leave();
}

address TemplateInterpreterGenerator::generate_common_intrinsic_entry(vmIntrinsics::ID id) {
  address entry = __ pc();
  Label slow_path;
  if (JvmtiExport::can_post_interpreter_events()) {
    __ cmpl(Address(r15_thread, JavaThread::interp_only_mode_offset()), 0);
    __ jcc(Assembler::notEqual, slow_path);
  }
  __ safepoint_poll(slow_path, false /* at_return */, false /* in_nmethod */);
#if INCLUDE_JVMTI
  // Breakpoint events alone do not put the thread in interpreter-only mode.
  Label no_breakpoints;
  __ movptr(rscratch1, Address(rbx, Method::method_counters_offset()));
  __ testptr(rscratch1, rscratch1);
  __ jcc(Assembler::zero, no_breakpoints);
  __ cmpw(Address(rscratch1, in_bytes(MethodCounters::number_of_breakpoints_offset())), 0);
  __ jcc(Assembler::notEqual, slow_path);
  __ bind(no_breakpoints);
#endif
  if (CommonIntrinsics::is_scalar(id)) {
    bool binary = CommonIntrinsics::is_binary_scalar(id);
    bool wide = CommonIntrinsics::scalar_is_wide(id);
    int offset = binary ? (wide ? 3 : 2) * wordSize : wordSize;
    __ movq(rax, Address(rsp, offset));
    if (binary) __ movq(rcx, Address(rsp, wordSize));
    common_scalar_intrinsic(_masm, id, rax, rax, binary ? rcx : noreg, rdx, rsi, &slow_path);
    __ pop(rcx);
    __ mov(rsp, r13);
    __ jmp(rcx);
    __ bind(slow_path);
    __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::zerolocals));
    return entry;
  }
  if (CommonIntrinsics::needs_compiler_stubs(id)) {
    __ lea(rscratch1, ExternalAddress(StubRoutines::compiler_stubs_initialized_address()));
    __ cmpb(Address(rscratch1, 0), 0);
    __ jcc(Assembler::equal, slow_path);
  }
  if (CommonIntrinsics::is_big_integer(id)) {
    generate_big_integer_entry(id, slow_path);
  } else if (CommonIntrinsics::is_array_kernel(id)) {
    generate_array_entry(id, slow_path);
  } else if (id == vmIntrinsics::_digestBase_implCompressMB) {
    generate_digest_entry(slow_path);
  } else if (CommonIntrinsics::is_crypto(id)) {
    generate_crypto_entry(id, slow_path);
  } else {
    assert(id == vmIntrinsics::_vectorizedHashCode, "typed hash helper");
    generate_hash_entry(slow_path);
  }
  __ pop(rcx);
  __ mov(rsp, r13);
  __ jmp(rcx);
  __ bind(slow_path);
  __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::zerolocals));
  return entry;
}

address TemplateInterpreterGenerator::generate_currentThread() {

  address entry_point = __ pc();

  __ movptr(rax, Address(r15_thread, JavaThread::vthread_offset()));

  __ resolve_oop_handle(rax, rscratch1);

  __ pop(rcx);
  __ mov(rsp, r13);
  __ jmp(rcx);

  return entry_point;
}
