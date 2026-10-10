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

#ifndef CPU_AARCH64_COMMONINTRINSICS_AARCH64_INLINE_HPP
#define CPU_AARCH64_COMMONINTRINSICS_AARCH64_INLINE_HPP

#include "asm/macroAssembler.hpp"
#include "runtime/commonIntrinsics.hpp"
#include "runtime/globals.hpp"

static void common_scalar_intrinsic(MacroAssembler* masm, vmIntrinsics::ID id,
                                    Register dst, Register src, Register rhs, Register tmp1, Register tmp2,
                                    FloatRegister vtmp, Label* slow) {
  bool wide = CommonIntrinsics::scalar_is_wide(id);
  switch (id) {
    case vmIntrinsics::_numberOfLeadingZeros_i:
      masm->clzw(dst, src);
      break;
    case vmIntrinsics::_numberOfLeadingZeros_l:
      masm->clz(dst, src);
      break;
    case vmIntrinsics::_numberOfTrailingZeros_i:
      masm->rbitw(tmp1, src);
      masm->clzw(dst, tmp1);
      break;
    case vmIntrinsics::_numberOfTrailingZeros_l:
      masm->rbit(tmp1, src);
      masm->clz(dst, tmp1);
      break;
    case vmIntrinsics::_bitCount_i:
    case vmIntrinsics::_bitCount_l:
      if (wide) {
        masm->mov(tmp1, src);
      } else {
        masm->movw(tmp1, src);
      }
      masm->mov(vtmp, Assembler::D, 0, tmp1);
      masm->cnt(vtmp, Assembler::T8B, vtmp);
      masm->addv(vtmp, Assembler::T8B, vtmp);
      masm->mov(dst, vtmp, Assembler::D, 0);
      break;
    case vmIntrinsics::_reverse_i:
      masm->rbitw(dst, src);
      break;
    case vmIntrinsics::_reverse_l:
      masm->rbit(dst, src);
      break;
    case vmIntrinsics::_reverseBytes_i:
      masm->revw(dst, src);
      break;
    case vmIntrinsics::_reverseBytes_l:
      masm->rev(dst, src);
      break;
    case vmIntrinsics::_reverseBytes_s:
      masm->rev16w(dst, src);
      masm->sxth(dst, dst);
      break;
    case vmIntrinsics::_reverseBytes_c:
      masm->rev16w(dst, src);
      masm->uxth(dst, dst);
      break;
    case vmIntrinsics::_iabs:
    case vmIntrinsics::_labs:
      if (wide) {
        masm->cmp(src, zr);
        masm->cneg(dst, src, Assembler::LT);
      } else {
        masm->cmpw(src, 0);
        masm->cnegw(dst, src, Assembler::LT);
      }
      break;
    case vmIntrinsics::_min:
    case vmIntrinsics::_max:
    case vmIntrinsics::_min_strict:
    case vmIntrinsics::_max_strict:
    case vmIntrinsics::_minL:
    case vmIntrinsics::_maxL:
      {
      bool minimum = id == vmIntrinsics::_min || id == vmIntrinsics::_min_strict ||
                     id == vmIntrinsics::_minL;
      Assembler::Condition cond = minimum ? Assembler::LE : Assembler::GE;
      if (wide) {
        masm->cmp(src, rhs);
        masm->csel(dst, src, rhs, cond);
      } else {
        masm->cmpw(src, rhs);
        masm->cselw(dst, src, rhs, cond);
      }
      break;
    }
    case vmIntrinsics::_compareUnsigned_i:
    case vmIntrinsics::_compareUnsigned_l:
      if (wide) {
        masm->cmp(src, rhs);
      } else {
        masm->cmpw(src, rhs);
      }
      masm->csetw(tmp1, Assembler::LO);
      masm->csetw(dst, Assembler::HI);
      masm->subw(dst, dst, tmp1);
      break;
    case vmIntrinsics::_multiplyHigh:
      masm->smulh(dst, src, rhs);
      break;
    case vmIntrinsics::_unsignedMultiplyHigh:
      masm->umulh(dst, src, rhs);
      break;
    case vmIntrinsics::_divideUnsigned_i:
    case vmIntrinsics::_divideUnsigned_l:
    case vmIntrinsics::_remainderUnsigned_i:
    case vmIntrinsics::_remainderUnsigned_l:
      {
      if (wide) {
        masm->cbz(rhs, *slow);
      } else {
        masm->cbzw(rhs, *slow);
      }
      bool remainder = id == vmIntrinsics::_remainderUnsigned_i || id == vmIntrinsics::_remainderUnsigned_l;
      Register quotient = remainder ? tmp1 : dst;
      assert(!remainder || (tmp1 != src && tmp1 != rhs), "remainder inputs survive quotient calculation");
      if (wide) {
        masm->udiv(quotient, src, rhs);
      } else {
        masm->udivw(quotient, src, rhs);
      }
      if (remainder) {
        if (wide) {
          masm->msub(dst, quotient, rhs, src);
        } else {
          masm->msubw(dst, quotient, rhs, src);
        }
      }
      break;
    }
    case vmIntrinsics::_addExactI:
    case vmIntrinsics::_addExactL:
      if (wide) {
        masm->adds(dst, src, rhs);
      } else {
        masm->addsw(dst, src, rhs);
      }
      masm->br(Assembler::VS, *slow);
      break;
    case vmIntrinsics::_subtractExactI:
    case vmIntrinsics::_subtractExactL:
      if (wide) {
        masm->subs(dst, src, rhs);
      } else {
        masm->subsw(dst, src, rhs);
      }
      masm->br(Assembler::VS, *slow);
      break;
    case vmIntrinsics::_multiplyExactI:
      masm->smull(tmp1, src, rhs);
      masm->sxtw(dst, tmp1);
      masm->cmp(dst, tmp1);
      masm->br(Assembler::NE, *slow);
      break;
    case vmIntrinsics::_multiplyExactL:
      assert(tmp1 != src && tmp1 != rhs, "multiply inputs survive high-product calculation");
      masm->smulh(tmp1, src, rhs);
      masm->mul(dst, src, rhs);
      masm->cmp(tmp1, dst, Assembler::ASR, 63);
      masm->br(Assembler::NE, *slow);
      break;
    case vmIntrinsics::_incrementExactI:
    case vmIntrinsics::_incrementExactL:
      if (wide) {
        masm->adds(dst, src, 1);
      } else {
        masm->addsw(dst, src, 1);
      }
      masm->br(Assembler::VS, *slow);
      break;
    case vmIntrinsics::_decrementExactI:
    case vmIntrinsics::_decrementExactL:
      if (wide) {
        masm->subs(dst, src, 1);
      } else {
        masm->subsw(dst, src, 1);
      }
      masm->br(Assembler::VS, *slow);
      break;
    case vmIntrinsics::_negateExactI:
    case vmIntrinsics::_negateExactL:
      if (wide) {
        masm->subs(dst, zr, src);
      } else {
        masm->subsw(dst, zr, src);
      }
      masm->br(Assembler::VS, *slow);
      break;
    default: ShouldNotReachHere();
  }
}

#endif // CPU_AARCH64_COMMONINTRINSICS_AARCH64_INLINE_HPP
