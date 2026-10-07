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

#ifndef CPU_X86_COMMONINTRINSICS_X86_INLINE_HPP
#define CPU_X86_COMMONINTRINSICS_X86_INLINE_HPP

#include "asm/macroAssembler.hpp"
#include "runtime/commonIntrinsics.hpp"
#include "runtime/globals.hpp"

#ifdef AMD64
static void common_scalar_intrinsic(MacroAssembler* masm, vmIntrinsics::ID id,
                                    Register dst, Register src, Register rhs, Register tmp1, Register tmp2, Label* slow) {
  bool wide = CommonIntrinsics::scalar_is_wide(id);
  if (!CommonIntrinsics::is_binary_scalar(id)) {
    if (wide) masm->movq(dst, src); else masm->movl(dst, src);
  }
  switch (id) {
    case vmIntrinsics::_numberOfLeadingZeros_i:
    case vmIntrinsics::_numberOfLeadingZeros_l:
      if (UseCountLeadingZerosInstruction) {
        if (wide) masm->lzcntq(dst, dst); else masm->lzcntl(dst, dst);
      } else {
        Label nonzero, done;
        if (wide) masm->testq(dst, dst); else masm->testl(dst, dst);
        masm->jcc(Assembler::notZero, nonzero);
        masm->movl(dst, wide ? 64 : 32);
        masm->jmp(done);
        masm->bind(nonzero);
        if (wide) masm->bsrq(dst, dst); else masm->bsrl(dst, dst);
        masm->xorl(dst, wide ? 63 : 31);
        masm->bind(done);
      }
      break;
    case vmIntrinsics::_numberOfTrailingZeros_i:
    case vmIntrinsics::_numberOfTrailingZeros_l:
      if (UseCountTrailingZerosInstruction) {
        if (wide) masm->tzcntq(dst, dst); else masm->tzcntl(dst, dst);
      } else {
        Label nonzero, done;
        if (wide) masm->testq(dst, dst); else masm->testl(dst, dst);
        masm->jcc(Assembler::notZero, nonzero);
        masm->movl(dst, wide ? 64 : 32);
        masm->jmp(done);
        masm->bind(nonzero);
        if (wide) masm->bsfq(dst, dst); else masm->bsfl(dst, dst);
        masm->bind(done);
      }
      break;
    case vmIntrinsics::_bitCount_i:
    case vmIntrinsics::_bitCount_l:
      assert(UsePopCountInstruction, "popcount support checked before lowering");
      if (wide) masm->popcntq(dst, dst); else masm->popcntl(dst, dst);
      break;
    case vmIntrinsics::_reverse_i:
    case vmIntrinsics::_reverse_l: {
      const uint64_t masks[] = {0x5555555555555555ULL, 0x3333333333333333ULL, 0x0f0f0f0f0f0f0f0fULL};
      for (int i = 0; i < 3; i++) {
        int shift = 1 << i;
        if (wide) {
          masm->movq(tmp1, dst);
          masm->shrq(tmp1, shift);
          masm->mov64(tmp2, masks[i]);
          masm->andq(tmp1, tmp2);
          masm->andq(dst, tmp2);
          masm->shlq(dst, shift);
          masm->orq(dst, tmp1);
        } else {
          masm->movl(tmp1, dst);
          masm->shrl(tmp1, shift);
          masm->andl(tmp1, static_cast<int>(masks[i]));
          masm->andl(dst, static_cast<int>(masks[i]));
          masm->shll(dst, shift);
          masm->orl(dst, tmp1);
        }
      }
      if (wide) masm->bswapq(dst); else masm->bswapl(dst);
      break;
    }
    case vmIntrinsics::_reverseBytes_l: masm->bswapq(dst); break;
    case vmIntrinsics::_reverseBytes_i: masm->bswapl(dst); break;
    case vmIntrinsics::_reverseBytes_s:
      masm->bswapl(dst); masm->sarl(dst, 16); break;
    case vmIntrinsics::_reverseBytes_c:
      masm->bswapl(dst); masm->shrl(dst, 16); break;
    case vmIntrinsics::_iabs:
    case vmIntrinsics::_labs:
      if (wide) {
        masm->movq(tmp1, dst); masm->sarq(tmp1, 63);
        masm->xorq(dst, tmp1); masm->subq(dst, tmp1);
      } else {
        masm->movl(tmp1, dst); masm->sarl(tmp1, 31);
        masm->xorl(dst, tmp1); masm->subl(dst, tmp1);
      }
      break;
    case vmIntrinsics::_min:
    case vmIntrinsics::_max:
    case vmIntrinsics::_min_strict:
    case vmIntrinsics::_max_strict:
    case vmIntrinsics::_minL:
    case vmIntrinsics::_maxL: {
      bool minimum = id == vmIntrinsics::_min || id == vmIntrinsics::_min_strict || id == vmIntrinsics::_minL;
      if (wide) masm->cmpq(src, rhs); else masm->cmpl(src, rhs);
      if (dst == rhs) {
        Assembler::Condition take_left = minimum ? Assembler::less : Assembler::greater;
        if (wide) masm->cmovq(take_left, dst, src); else masm->cmovl(take_left, dst, src);
      } else {
        if (wide) masm->movq(dst, src); else masm->movl(dst, src);
        Assembler::Condition take_right = minimum ? Assembler::greater : Assembler::less;
        if (wide) masm->cmovq(take_right, dst, rhs); else masm->cmovl(take_right, dst, rhs);
      }
      break;
    }
    case vmIntrinsics::_compareUnsigned_i:
    case vmIntrinsics::_compareUnsigned_l:
      if (wide) masm->cmpq(src, rhs); else masm->cmpl(src, rhs);
      masm->setcc(Assembler::below, tmp1);
      masm->setcc(Assembler::above, dst);
      masm->subl(dst, tmp1);
      break;
    case vmIntrinsics::_multiplyHigh:
    case vmIntrinsics::_unsignedMultiplyHigh:
      assert(src == rax && rhs == rcx && tmp1 == rdx, "fixed multiply registers");
      if (id == vmIntrinsics::_multiplyHigh) masm->imulq(rhs); else masm->mulq(rhs);
      masm->movq(dst, rdx);
      break;
    case vmIntrinsics::_divideUnsigned_i:
    case vmIntrinsics::_divideUnsigned_l:
    case vmIntrinsics::_remainderUnsigned_i:
    case vmIntrinsics::_remainderUnsigned_l: {
      assert(src == rax && rhs == rcx && tmp1 == rdx, "fixed divide registers");
      if (wide) masm->testq(rhs, rhs); else masm->testl(rhs, rhs);
      masm->jcc(Assembler::zero, *slow);
      masm->xorl(rdx, rdx);
      if (wide) masm->divq(rhs); else masm->divl(rhs);
      Register value = (id == vmIntrinsics::_remainderUnsigned_i || id == vmIntrinsics::_remainderUnsigned_l) ? rdx : rax;
      if (wide) masm->movq(dst, value); else masm->movl(dst, value);
      break;
    }
    case vmIntrinsics::_addExactI:
    case vmIntrinsics::_addExactL:
    case vmIntrinsics::_subtractExactI:
    case vmIntrinsics::_subtractExactL:
    case vmIntrinsics::_multiplyExactI:
    case vmIntrinsics::_multiplyExactL: {
      Register right = rhs;
      if (dst == rhs) {
        if (wide) masm->movq(tmp1, rhs); else masm->movl(tmp1, rhs);
        right = tmp1;
      }
      if (wide) masm->movq(dst, src); else masm->movl(dst, src);
      if (id == vmIntrinsics::_addExactI || id == vmIntrinsics::_addExactL) {
        if (wide) masm->addq(dst, right); else masm->addl(dst, right);
      } else if (id == vmIntrinsics::_subtractExactI || id == vmIntrinsics::_subtractExactL) {
        if (wide) masm->subq(dst, right); else masm->subl(dst, right);
      } else {
        if (wide) masm->imulq(dst, right); else masm->imull(dst, right);
      }
      masm->jcc(Assembler::overflow, *slow);
      break;
    }
    case vmIntrinsics::_incrementExactI:
    case vmIntrinsics::_incrementExactL:
    case vmIntrinsics::_decrementExactI:
    case vmIntrinsics::_decrementExactL:
    case vmIntrinsics::_negateExactI:
    case vmIntrinsics::_negateExactL:
      if (id == vmIntrinsics::_incrementExactI || id == vmIntrinsics::_incrementExactL) {
        if (wide) masm->addq(dst, 1); else masm->addl(dst, 1);
      } else if (id == vmIntrinsics::_decrementExactI || id == vmIntrinsics::_decrementExactL) {
        if (wide) masm->subq(dst, 1); else masm->subl(dst, 1);
      } else {
        if (wide) masm->negq(dst); else masm->negl(dst);
      }
      masm->jcc(Assembler::overflow, *slow);
      break;
    default: ShouldNotReachHere();
  }
}

#endif // AMD64

#endif // CPU_X86_COMMONINTRINSICS_X86_INLINE_HPP
