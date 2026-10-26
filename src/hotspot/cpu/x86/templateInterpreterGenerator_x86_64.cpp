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
#include "classfile/javaClasses.hpp"
#include "compiler/disassembler.hpp"
#include "interpreter/interp_masm.hpp"
#include "interpreter/interpreter.hpp"
#include "interpreter/interpreterRuntime.hpp"
#include "interpreter/templateInterpreterGenerator.hpp"
#include "runtime/sharedRuntime.hpp"
#include "runtime/simdutfSupport.hpp"
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

address TemplateInterpreterGenerator::generate_currentThread() {

  address entry_point = __ pc();

  __ movptr(rax, Address(r15_thread, JavaThread::vthread_offset()));

  __ resolve_oop_handle(rax, rscratch1);

  __ pop(rcx);
  __ mov(rsp, r13);
  __ jmp(rcx);

  return entry_point;
}

// The Java arguments stay on the expression stack, including exClass, so the
// ordinary bytecode entry can handle short input or malformed UTF-16 unchanged.
address TemplateInterpreterGenerator::generate_String_utf8_entry(AbstractInterpreter::MethodKind kind) {
  const bool utf16 = kind == Interpreter::java_lang_String_encodeUTF8UTF16;
  const bool decode = kind == Interpreter::java_lang_String_decodeUTF8UTF16 ||
                      kind == Interpreter::java_lang_String_decodeUTF8UTF16OrThrow;
  const int maximum = 1024 * 1024;
  if (!SimdUTF::available() || SIMDUTFMinLength > maximum) {
    return nullptr;
  }
  address entry = __ pc();
  Label slow;
  __ safepoint_poll(slow, false, false);
  const int args = utf16 || decode ? 5 : 4;
  const int dst_slot = decode ? 2 : args - 2;
  const int dp_slot = decode ? 1 : args - 3;
  const Register src = c_rarg0;
  const Register length = c_rarg1;
  const Register dst = c_rarg2;
  __ movptr(src, Address(rsp, args * wordSize));
  if (decode) {
    __ movl(length, Address(rsp, 3 * wordSize));
  } else {
    __ movl(length, Address(src, arrayOopDesc::length_offset_in_bytes()));
  }
  if (utf16) {
    __ shrl(length, 1);
  }
  __ subl(length, Address(rsp, (args - 1) * wordSize));
  __ cmpl(length, (int)SIMDUTFMinLength);
  __ jcc(Assembler::below, slow);
  __ cmpl(length, maximum);
  __ jcc(Assembler::above, slow);
  __ movptr(dst, Address(rsp, dst_slot * wordSize));
  if (utf16) {
    __ movl(rax, Address(dst, arrayOopDesc::length_offset_in_bytes()));
    __ subl(rax, Address(rsp, dp_slot * wordSize));
    __ leal(r10, Address(length, length, Address::times_2));
    __ cmpl(rax, r10);
    __ jcc(Assembler::less, slow);
  }
  __ movl2ptr(r10, Address(rsp, (args - 1) * wordSize));
  __ lea(src, Address(src, r10, utf16 ? Address::times_2 : Address::times_1,
                     arrayOopDesc::base_offset_in_bytes(T_BYTE)));
  __ movl2ptr(r10, Address(rsp, dp_slot * wordSize));
  __ lea(dst, Address(dst, r10, decode ? Address::times_2 : Address::times_1, arrayOopDesc::base_offset_in_bytes(T_BYTE)));
  __ super_call_VM_leaf(decode ? CAST_FROM_FN_PTR(address, SimdUTF::decode_utf8_utf16)
                              : utf16 ? CAST_FROM_FN_PTR(address, SimdUTF::encode_utf16_utf8)
                              : CAST_FROM_FN_PTR(address, SimdUTF::encode_latin1_utf8),
                        src, length, dst);
  if (utf16 || decode) {
    __ testl(rax, rax);
    __ jcc(Assembler::negative, slow);
  }
  __ addl(rax, Address(rsp, dp_slot * wordSize));
  __ pop(rdi);
  __ mov(rsp, r13);
  __ jmp(rdi);
  __ bind(slow);
  __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::zerolocals));
  return entry;
}

// Existing Java entry arguments remain intact for the short-input fallback.
address TemplateInterpreterGenerator::generate_bulk_entry(AbstractInterpreter::MethodKind kind) {
  const bool search = kind == Interpreter::java_lang_StringLatin1_indexOfChar ||
                      kind == Interpreter::java_lang_StringUTF16_indexOfChar;
  const bool wide = kind == Interpreter::java_lang_StringUTF16_indexOfChar;
  const bool mime = kind == Interpreter::java_util_Base64_decode0;
  const bool decode = mime || kind == Interpreter::java_util_Base64_decodeBlock;
  if (!SimdUTF::available() || SIMDUTFMinLength > 1024 * 1024 ||
      (mime && !UseBASE64Intrinsics)) return nullptr;
  address entry = __ pc();
  Label slow, done;
  __ safepoint_poll(slow, false, false);
  if (decode && !mime) {
    __ cmpl(Address(rsp, wordSize), 0); // isMIME
    __ jcc(Assembler::notEqual, slow);
  }
  if (mime) {
    __ movptr(r10, Address(rsp, 5 * wordSize));
    __ cmpb(Address(r10, java_util_Base64_Decoder::isMIME_offset()), 0);
    __ jcc(Assembler::equal, slow);
  }
  // Offsets count from the return address; Base64 includes its receiver.
  const int src_slot = search ? 4 : mime ? 4 : decode ? 7 : 6;
  const int start_slot = search ? 2 : src_slot - 1;
  const int limit_slot = search ? 1 : src_slot - 2;
  const int dst_slot = mime ? 1 : decode ? 4 : 3;
  const int dp_slot = decode ? 3 : 2;
  __ movptr(c_rarg0, Address(rsp, src_slot * wordSize));
  __ movl(c_rarg1, Address(rsp, limit_slot * wordSize));
  __ subl(c_rarg1, Address(rsp, start_slot * wordSize));
  __ cmpl(c_rarg1, (int)SIMDUTFMinLength);
  __ jcc(Assembler::below, slow);
  __ cmpl(c_rarg1, 1024 * 1024);
  __ jcc(Assembler::above, slow);
  if (search) {
    __ movl(c_rarg2, Address(rsp, 3 * wordSize));
    if (wide) {
      __ testl(c_rarg2, c_rarg2);
      __ jcc(Assembler::negative, slow);
    }
  } else {
    __ movptr(c_rarg2, Address(rsp, dst_slot * wordSize));
    if (decode) {
      __ cmpptr(c_rarg0, c_rarg2);
      __ jcc(Assembler::equal, slow);
      __ movl(c_rarg3, Address(c_rarg2, arrayOopDesc::length_offset_in_bytes()));
      if (!mime) __ subl(c_rarg3, Address(rsp, dp_slot * wordSize));
    } else {
      __ movl(c_rarg3, Address(rsp, wordSize));
    }
    if (mime) { __ xorptr(r10, r10); }
    else { __ movl2ptr(r10, Address(rsp, dp_slot * wordSize)); }
    __ lea(c_rarg2, Address(c_rarg2, r10, Address::times_1, arrayOopDesc::base_offset_in_bytes(T_BYTE)));
  }
  __ movl2ptr(r10, Address(rsp, start_slot * wordSize));
  __ lea(c_rarg0, Address(c_rarg0, r10, wide ? Address::times_2 : Address::times_1,
                         arrayOopDesc::base_offset_in_bytes(T_BYTE)));
  address leaf = search ? (wide ? CAST_FROM_FN_PTR(address, SimdUTF::index_of_utf16)
                               : CAST_FROM_FN_PTR(address, SimdUTF::index_of_latin1))
                        : mime ? CAST_FROM_FN_PTR(address, SimdUTF::decode_base64_mime)
                        : decode ? CAST_FROM_FN_PTR(address, SimdUTF::decode_base64)
                                 : CAST_FROM_FN_PTR(address, SimdUTF::encode_base64);
  if (decode && !mime) {
#ifdef _WIN64
    // The fifth C argument follows the four-register shadow area. Preserve
    // sender_sp while using its callee-saved register to restore alignment.
    __ movl(r10, Address(rsp, 2 * wordSize));
    __ push(r13);
    __ movptr(r13, rsp);
    __ andptr(rsp, -16);
    __ subptr(rsp, 6 * wordSize);
    __ movl(Address(rsp, 4 * wordSize), r10);
    __ call(RuntimeAddress(leaf));
    __ movptr(rsp, r13);
    __ pop(r13);
#else
    __ movl(c_rarg4, Address(rsp, 2 * wordSize));
    __ super_call_VM_leaf(leaf, c_rarg0, c_rarg1, c_rarg2, c_rarg3);
#endif
  } else if (search) {
    __ super_call_VM_leaf(leaf, c_rarg0, c_rarg1, c_rarg2);
  } else {
    __ super_call_VM_leaf(leaf, c_rarg0, c_rarg1, c_rarg2, c_rarg3);
  }
  if (decode) {
    __ testl(rax, rax);
    __ jcc(Assembler::negative, slow);
  }
  if (search) {
    __ testl(rax, rax);
    __ jcc(Assembler::negative, done);
    __ addl(rax, Address(rsp, start_slot * wordSize));
  }
  __ bind(done);
  __ pop(rdi);
  __ mov(rsp, r13);
  __ jmp(rdi);
  __ bind(slow);
  __ jump_to_entry(Interpreter::entry_for_kind(Interpreter::zerolocals));
  return entry;
}
