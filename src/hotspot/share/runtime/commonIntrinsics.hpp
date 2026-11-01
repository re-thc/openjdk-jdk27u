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

class InstanceKlass;
class methodHandle;

class CommonIntrinsics : AllStatic {
 public:
  // Bootstrap layouts are bound at method linking, before any leaf executes.
  static int aes_encrypt_key_offset;
  static int aes_decrypt_key_offset;
  static int cbc_r_offset;
  static int ctr_counter_offset;
  static int ctr_encrypted_offset;
  static int ctr_used_offset;
  static int ghash_state_offset;
  static int ghash_key_offset;
  static int digest_block_size_offset;
  static int md5_state_offset;
  static int sha1_state_offset;
  static int sha256_state_offset;
  static int sha512_state_offset;
  static int sha3_state_offset;
  static int embedded_cipher_offset;
  static InstanceKlass* aescrypt_klass;
  static InstanceKlass* cbc_klass;
  static InstanceKlass* ctr_klass;
  static InstanceKlass* ghash_klass;
  static InstanceKlass* digest_base_klass;
  static InstanceKlass* md5_klass;
  static InstanceKlass* sha1_klass;
  static InstanceKlass* sha256_klass;
  static InstanceKlass* sha512_klass;
  static InstanceKlass* sha3_klass;
  static InstanceKlass* feedback_cipher_klass;

  static constexpr jint max_quadratic_limbs = 2048;
  static constexpr jint max_montgomery_limbs = 512;
  static constexpr jint max_leaf_elements = 1 << 20;
  static constexpr jint max_hash_elements = 65536;
  static jint hash_unsigned_bytes(const jubyte* data, jint length, jint initial);
  static jint hash_bytes(const jbyte* data, jint length, jint initial);
  static jint hash_shorts(const jshort* data, jint length, jint initial);
  static jint hash_chars(const jchar* data, jint length, jint initial);
  static jint hash_ints(const jint* data, jint length, jint initial);
  static bool enabled();
  static bool needs_compiler_stubs(vmIntrinsics::ID id);
  static void prepare(const methodHandle& method);
  static bool is_crypto(vmIntrinsics::ID id);
  static bool is_array_kernel(vmIntrinsics::ID id);
  static bool crypto_layout_ready(vmIntrinsics::ID id);
  static bool is_big_integer(vmIntrinsics::ID id);
  static bool is_scalar(vmIntrinsics::ID id);
  static bool is_binary_scalar(vmIntrinsics::ID id);
  static bool scalar_is_wide(vmIntrinsics::ID id);
  static bool can_fallback(vmIntrinsics::ID id);
  static bool is_supported(vmIntrinsics::ID id);
  static bool is_available_for_interpreter(vmIntrinsics::ID id);
  static bool is_available_for_c1(vmIntrinsics::ID id);
  static int parameter_slots(vmIntrinsics::ID id);
};

#endif // SHARE_RUNTIME_COMMONINTRINSICS_HPP
