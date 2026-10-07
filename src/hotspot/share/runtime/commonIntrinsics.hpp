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

#ifndef SHARE_RUNTIME_COMMONINTRINSICS_HPP
#define SHARE_RUNTIME_COMMONINTRINSICS_HPP

#include "classfile/vmIntrinsics.hpp"
#include "memory/allStatic.hpp"
#include "utilities/globalDefinitions.hpp"

// Intrinsic ID, Java parameter slots (including the receiver), result type.
// Keep the interpreter and C1 entry points in one catalogue. Existing
// interpreter/C1 intrinsics deliberately do not appear here.
#define COMMON_INTRINSICS_DO(f)                                \
  f(_multiplyToLen,                        5, T_OBJECT)        \
  f(_squareToLen,                          4, T_OBJECT)        \
  f(_mulAdd,                               5, T_INT)           \
  f(_montgomeryMultiply,                   7, T_OBJECT)        \
  f(_montgomerySquare,                     6, T_OBJECT)        \
  f(_bigIntegerRightShiftWorker,           5, T_VOID)          \
  f(_bigIntegerLeftShiftWorker,            5, T_VOID)          \
  f(_ghash_processBlocks,                  5, T_VOID)          \
  f(_chacha20Block,                        2, T_INT)           \
  f(_poly1305_processBlocks,               6, T_VOID)          \
  f(_intpoly_montgomeryMult_P256,          4, T_VOID)          \
  f(_intpoly_assign,                       3, T_VOID)          \
  f(_double_keccak,                        2, T_INT)           \
  f(_quad_keccak,                          4, T_INT)           \
  f(_kyberNtt,                             2, T_INT)           \
  f(_kyberInverseNtt,                      2, T_INT)           \
  f(_kyberNttMult,                         4, T_INT)           \
  f(_kyberAddPoly_2,                       3, T_INT)           \
  f(_kyberAddPoly_3,                       4, T_INT)           \
  f(_kyber12To16,                          4, T_INT)           \
  f(_kyberBarrettReduce,                   1, T_INT)           \
  f(_dilithiumAlmostNtt,                   2, T_INT)           \
  f(_dilithiumAlmostInverseNtt,            2, T_INT)           \
  f(_dilithiumNttMult,                     3, T_INT)           \
  f(_dilithiumMontMulByConstant,           2, T_INT)           \
  f(_dilithiumDecomposePoly,               5, T_INT)           \
  f(_aescrypt_encryptBlock,                5, T_VOID)          \
  f(_electronicCodeBook_encryptAESCrypt,   6, T_INT)           \
  f(_cipherBlockChaining_encryptAESCrypt,  6, T_INT)           \
  f(_aescrypt_decryptBlock,                5, T_VOID)          \
  f(_electronicCodeBook_decryptAESCrypt,   6, T_INT)           \
  f(_cipherBlockChaining_decryptAESCrypt,  6, T_INT)           \
  f(_counterMode_AESCrypt,                 6, T_INT)           \
  f(_md5_implCompress,                     3, T_VOID)          \
  f(_sha_implCompress,                     3, T_VOID)          \
  f(_sha2_implCompress,                    3, T_VOID)          \
  f(_sha5_implCompress,                    3, T_VOID)          \
  f(_sha3_implCompress,                    3, T_VOID)          \
  f(_digestBase_implCompressMB,            4, T_INT)           \
  f(_galoisCounterMode_AESCrypt,           9, T_INT)           \
  f(_vectorizedHashCode,                   5, T_INT)

#define COMMON_SCALAR_INTRINSICS_DO(f)                         \
  f(_numberOfLeadingZeros_i,               1, T_INT)           \
  f(_numberOfLeadingZeros_l,               2, T_INT)           \
  f(_numberOfTrailingZeros_i,              1, T_INT)           \
  f(_numberOfTrailingZeros_l,              2, T_INT)           \
  f(_bitCount_i,                           1, T_INT)           \
  f(_bitCount_l,                           2, T_INT)           \
  f(_reverse_i,                            1, T_INT)           \
  f(_reverse_l,                            2, T_LONG)          \
  f(_reverseBytes_i,                       1, T_INT)           \
  f(_reverseBytes_l,                       2, T_LONG)          \
  f(_reverseBytes_s,                       1, T_INT)           \
  f(_reverseBytes_c,                       1, T_INT)           \
  f(_iabs,                                 1, T_INT)           \
  f(_labs,                                 2, T_LONG)          \
  f(_negateExactI,                         1, T_INT)           \
  f(_negateExactL,                         2, T_LONG)          \
  f(_incrementExactI,                      1, T_INT)           \
  f(_incrementExactL,                      2, T_LONG)          \
  f(_decrementExactI,                      1, T_INT)           \
  f(_decrementExactL,                      2, T_LONG)

#define COMMON_BINARY_SCALAR_INTRINSICS_DO(f)                  \
  f(_min,                                  2, T_INT)           \
  f(_max,                                  2, T_INT)           \
  f(_min_strict,                           2, T_INT)           \
  f(_max_strict,                           2, T_INT)           \
  f(_compareUnsigned_i,                    2, T_INT)           \
  f(_divideUnsigned_i,                     2, T_INT)           \
  f(_remainderUnsigned_i,                  2, T_INT)           \
  f(_minL,                                 4, T_LONG)          \
  f(_maxL,                                 4, T_LONG)          \
  f(_multiplyHigh,                         4, T_LONG)          \
  f(_unsignedMultiplyHigh,                 4, T_LONG)          \
  f(_divideUnsigned_l,                     4, T_LONG)          \
  f(_remainderUnsigned_l,                  4, T_LONG)          \
  f(_compareUnsigned_l,                    4, T_INT)           \
  f(_addExactI,                            2, T_INT)           \
  f(_addExactL,                            4, T_LONG)          \
  f(_subtractExactI,                       2, T_INT)           \
  f(_subtractExactL,                       4, T_LONG)          \
  f(_multiplyExactI,                       2, T_INT)           \
  f(_multiplyExactL,                       4, T_LONG)

class CommonIntrinsics : AllStatic {
 public:
  // A leaf reads arguments in interpreter expression-stack order. Longs
  // occupy two slots, with the value in the lower-addressed slot. No handle
  // allocation, safepoint, or exception is permitted while these raw oops
  // and array addresses are live.
  //
  // Guards must run before the first write. Returning fallback asks the
  // interpreter to execute the original method, or C1 to deoptimize at the
  // invoke. Successful results are sign-extended ints, oops, or zero for void,
  // so min_jlong cannot be confused with a successful result.
  static constexpr jlong fallback = min_jlong;
  static bool enabled();
  static bool needs_compiler_stubs();
  static bool is_scalar(vmIntrinsics::ID id);
  static bool is_binary_scalar(vmIntrinsics::ID id);
  static bool scalar_is_wide(vmIntrinsics::ID id);
  static bool can_fallback(vmIntrinsics::ID id);
  static bool is_supported(vmIntrinsics::ID id);
  static bool is_available_for_c1(vmIntrinsics::ID id);
  static address entry_for(vmIntrinsics::ID id);
  static int parameter_slots(vmIntrinsics::ID id);
  static BasicType result_type(vmIntrinsics::ID id);
};

#endif // SHARE_RUNTIME_COMMONINTRINSICS_HPP
