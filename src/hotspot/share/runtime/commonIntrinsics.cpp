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

#include "classfile/classLoaderData.hpp"
#include "classfile/symbolTable.hpp"
#include "classfile/vmSymbols.hpp"
#include "oops/instanceKlass.inline.hpp"
#include "oops/method.inline.hpp"
#include "runtime/atomicAccess.hpp"
#include "runtime/commonIntrinsics.hpp"
#include "runtime/fieldDescriptor.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/init.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/stubRoutines.hpp"
#include "runtime/vm_version.hpp"

int CommonIntrinsics::aes_encrypt_key_offset = -1;
int CommonIntrinsics::aes_decrypt_key_offset = -1;
int CommonIntrinsics::cbc_r_offset = -1;
int CommonIntrinsics::ctr_counter_offset = -1;
int CommonIntrinsics::ctr_encrypted_offset = -1;
int CommonIntrinsics::ctr_used_offset = -1;
int CommonIntrinsics::ghash_state_offset = -1;
int CommonIntrinsics::ghash_key_offset = -1;
int CommonIntrinsics::digest_block_size_offset = -1;
int CommonIntrinsics::md5_state_offset = -1;
int CommonIntrinsics::sha1_state_offset = -1;
int CommonIntrinsics::sha256_state_offset = -1;
int CommonIntrinsics::sha512_state_offset = -1;
int CommonIntrinsics::sha3_state_offset = -1;
int CommonIntrinsics::embedded_cipher_offset = -1;
InstanceKlass* CommonIntrinsics::aescrypt_klass = nullptr;
InstanceKlass* CommonIntrinsics::cbc_klass = nullptr;
InstanceKlass* CommonIntrinsics::ctr_klass = nullptr;
InstanceKlass* CommonIntrinsics::ghash_klass = nullptr;
InstanceKlass* CommonIntrinsics::digest_base_klass = nullptr;
InstanceKlass* CommonIntrinsics::md5_klass = nullptr;
InstanceKlass* CommonIntrinsics::sha1_klass = nullptr;
InstanceKlass* CommonIntrinsics::sha256_klass = nullptr;
InstanceKlass* CommonIntrinsics::sha512_klass = nullptr;
InstanceKlass* CommonIntrinsics::sha3_klass = nullptr;
InstanceKlass* CommonIntrinsics::feedback_cipher_klass = nullptr;

namespace {

bool all_digest_intrinsics_enabled() {
  return vmIntrinsics::is_intrinsic_available(vmIntrinsics::_md5_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha2_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha5_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha3_implCompress);
}

// The class is already being linked; do not load or initialize any class here.
int crypto_field_offset(InstanceKlass* holder, const char* name, const char* signature) {
  TempNewSymbol field_name = SymbolTable::probe(name, static_cast<int>(strlen(name)));
  TempNewSymbol field_signature = SymbolTable::probe(signature, static_cast<int>(strlen(signature)));
  fieldDescriptor field;
  if (field_name != nullptr && field_signature != nullptr &&
      holder->find_local_field(field_name, field_signature, &field) && !field.is_static()) {
    return field.offset();
  }
  return -1;
}

template <typename T>
jint polynomial_hash(const T* data, jint len, jint initial) {
  // Four independent lanes avoid a multiply dependency at every element.
  // Unsigned arithmetic implements Java's specified modulo-2^32 overflow.
  uint32_t result = static_cast<uint32_t>(initial);
  uint32_t h0 = 0, h1 = 0, h2 = 0, h3 = 0;
  jint i = 0;
  for (; i <= len - 4; i += 4) {
    h0 = h0 * 923521u + static_cast<uint32_t>(data[i]);
    h1 = h1 * 923521u + static_cast<uint32_t>(data[i + 1]);
    h2 = h2 * 923521u + static_cast<uint32_t>(data[i + 2]);
    h3 = h3 * 923521u + static_cast<uint32_t>(data[i + 3]);
    result *= 923521u;
  }
  result += h0 * 29791u + h1 * 961u + h2 * 31u + h3;
  for (; i < len; i++) {
    result = result * 31u + static_cast<uint32_t>(data[i]);
  }
  return static_cast<jint>(result);
}

} // namespace

JRT_LEAF(jint, CommonIntrinsics::hash_unsigned_bytes(const jubyte* data, jint length, jint initial))
  return polynomial_hash(data, length, initial);
JRT_END

JRT_LEAF(jint, CommonIntrinsics::hash_bytes(const jbyte* data, jint length, jint initial))
  return polynomial_hash(data, length, initial);
JRT_END

JRT_LEAF(jint, CommonIntrinsics::hash_shorts(const jshort* data, jint length, jint initial))
  return polynomial_hash(data, length, initial);
JRT_END

JRT_LEAF(jint, CommonIntrinsics::hash_chars(const jchar* data, jint length, jint initial))
  return polynomial_hash(data, length, initial);
JRT_END

JRT_LEAF(jint, CommonIntrinsics::hash_ints(const jint* data, jint length, jint initial))
  return polynomial_hash(data, length, initial);
JRT_END

bool CommonIntrinsics::enabled() {
#if defined(AMD64) || defined(AARCH64)
  return UseCommonIntrinsics;
#else
  return false;
#endif
}

bool CommonIntrinsics::is_big_integer(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_multiplyToLen:
    case vmIntrinsics::_squareToLen:
    case vmIntrinsics::_mulAdd:
    case vmIntrinsics::_montgomeryMultiply:
    case vmIntrinsics::_montgomerySquare:
    case vmIntrinsics::_bigIntegerLeftShiftWorker:
    case vmIntrinsics::_bigIntegerRightShiftWorker:
      return true;
    default: return false;
  }
}

bool CommonIntrinsics::needs_compiler_stubs(vmIntrinsics::ID id) {
#ifdef COMPILER2
  return enabled() && (is_big_integer(id) || is_crypto(id) || is_array_kernel(id));
#else
  return false;
#endif
}

bool CommonIntrinsics::is_array_kernel(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_ghash_processBlocks:
    case vmIntrinsics::_chacha20Block:
    case vmIntrinsics::_poly1305_processBlocks:
    case vmIntrinsics::_intpoly_montgomeryMult_P256:
    case vmIntrinsics::_intpoly_assign:
    case vmIntrinsics::_double_keccak:
    case vmIntrinsics::_quad_keccak:
    case vmIntrinsics::_kyberNtt:
    case vmIntrinsics::_kyberInverseNtt:
    case vmIntrinsics::_kyberNttMult:
    case vmIntrinsics::_kyberAddPoly_2:
    case vmIntrinsics::_kyberAddPoly_3:
    case vmIntrinsics::_kyber12To16:
    case vmIntrinsics::_kyberBarrettReduce:
    case vmIntrinsics::_dilithiumAlmostNtt:
    case vmIntrinsics::_dilithiumAlmostInverseNtt:
    case vmIntrinsics::_dilithiumNttMult:
    case vmIntrinsics::_dilithiumMontMulByConstant:
    case vmIntrinsics::_dilithiumDecomposePoly:
      return true;
    default: return false;
  }
}

bool CommonIntrinsics::is_crypto(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_aescrypt_encryptBlock:
    case vmIntrinsics::_aescrypt_decryptBlock:
    case vmIntrinsics::_electronicCodeBook_encryptAESCrypt:
    case vmIntrinsics::_electronicCodeBook_decryptAESCrypt:
    case vmIntrinsics::_cipherBlockChaining_encryptAESCrypt:
    case vmIntrinsics::_cipherBlockChaining_decryptAESCrypt:
    case vmIntrinsics::_counterMode_AESCrypt:
    case vmIntrinsics::_galoisCounterMode_AESCrypt:
    case vmIntrinsics::_digestBase_implCompressMB:
    case vmIntrinsics::_md5_implCompress:
    case vmIntrinsics::_sha_implCompress:
    case vmIntrinsics::_sha2_implCompress:
    case vmIntrinsics::_sha5_implCompress:
    case vmIntrinsics::_sha3_implCompress:
      return true;
    default: return false;
  }
}

bool CommonIntrinsics::crypto_layout_ready(vmIntrinsics::ID id) {
  bool aes = AtomicAccess::load_acquire(&aescrypt_klass) != nullptr &&
             aes_encrypt_key_offset >= 0 && aes_decrypt_key_offset >= 0;
  bool feedback = AtomicAccess::load_acquire(&feedback_cipher_klass) != nullptr && embedded_cipher_offset >= 0;
  switch (id) {
    case vmIntrinsics::_digestBase_implCompressMB:
      return AtomicAccess::load_acquire(&digest_base_klass) != nullptr && digest_block_size_offset >= 0;
    case vmIntrinsics::_aescrypt_encryptBlock:
    case vmIntrinsics::_aescrypt_decryptBlock: return aes;
    case vmIntrinsics::_electronicCodeBook_encryptAESCrypt:
    case vmIntrinsics::_electronicCodeBook_decryptAESCrypt: return aes && feedback;
    case vmIntrinsics::_cipherBlockChaining_encryptAESCrypt:
    case vmIntrinsics::_cipherBlockChaining_decryptAESCrypt:
      return aes && feedback && AtomicAccess::load_acquire(&cbc_klass) != nullptr && cbc_r_offset >= 0;
    case vmIntrinsics::_counterMode_AESCrypt:
      return aes && feedback && AtomicAccess::load_acquire(&ctr_klass) != nullptr &&
             ctr_counter_offset >= 0 && ctr_encrypted_offset >= 0 && ctr_used_offset >= 0;
    case vmIntrinsics::_galoisCounterMode_AESCrypt:
      return aes && feedback && AtomicAccess::load_acquire(&ctr_klass) != nullptr && ctr_counter_offset >= 0 &&
             AtomicAccess::load_acquire(&ghash_klass) != nullptr && ghash_state_offset >= 0 && ghash_key_offset >= 0;
    case vmIntrinsics::_md5_implCompress:
      return AtomicAccess::load_acquire(&md5_klass) != nullptr && md5_state_offset >= 0;
    case vmIntrinsics::_sha_implCompress:
      return AtomicAccess::load_acquire(&sha1_klass) != nullptr && sha1_state_offset >= 0;
    case vmIntrinsics::_sha2_implCompress:
      return AtomicAccess::load_acquire(&sha256_klass) != nullptr && sha256_state_offset >= 0;
    case vmIntrinsics::_sha5_implCompress:
      return AtomicAccess::load_acquire(&sha512_klass) != nullptr && sha512_state_offset >= 0;
    case vmIntrinsics::_sha3_implCompress:
      return AtomicAccess::load_acquire(&sha3_klass) != nullptr && sha3_state_offset >= 0 &&
             AtomicAccess::load_acquire(&digest_base_klass) != nullptr && digest_block_size_offset >= 0;
    default: ShouldNotReachHere(); return false;
  }
}

void CommonIntrinsics::prepare(const methodHandle& method) {
  vmIntrinsics::ID id = method->intrinsic_id();
  InstanceKlass* holder = method->method_holder();
  if (enabled() && holder->class_loader_data()->is_the_null_class_loader_data()) {
    Symbol* name = holder->name();
    if (name == vmSymbols::com_sun_crypto_provider_aescrypt() && AtomicAccess::load_acquire(&aescrypt_klass) == nullptr) {
      AtomicAccess::store(&aes_encrypt_key_offset, crypto_field_offset(holder, "sessionKe", "[I"));
      AtomicAccess::store(&aes_decrypt_key_offset, crypto_field_offset(holder, "sessionKd", "[I"));
      AtomicAccess::release_store(&aescrypt_klass, holder);
    }
    if (name == vmSymbols::com_sun_crypto_provider_cipherBlockChaining() && AtomicAccess::load_acquire(&cbc_klass) == nullptr) {
      AtomicAccess::store(&cbc_r_offset, crypto_field_offset(holder, "r", "[B"));
      AtomicAccess::release_store(&cbc_klass, holder);
    }
    if (name == vmSymbols::com_sun_crypto_provider_counterMode() && AtomicAccess::load_acquire(&ctr_klass) == nullptr) {
      AtomicAccess::store(&ctr_counter_offset, crypto_field_offset(holder, "counter", "[B"));
      AtomicAccess::store(&ctr_encrypted_offset, crypto_field_offset(holder, "encryptedCounter", "[B"));
      AtomicAccess::store(&ctr_used_offset, crypto_field_offset(holder, "used", "I"));
      AtomicAccess::release_store(&ctr_klass, holder);
    }
    if (name == vmSymbols::com_sun_crypto_provider_ghash() && AtomicAccess::load_acquire(&ghash_klass) == nullptr) {
      AtomicAccess::store(&ghash_state_offset, crypto_field_offset(holder, "state", "[J"));
      AtomicAccess::store(&ghash_key_offset, crypto_field_offset(holder, "subkeyHtbl", "[J"));
      AtomicAccess::release_store(&ghash_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_digestbase() && AtomicAccess::load_acquire(&digest_base_klass) == nullptr) {
      AtomicAccess::store(&digest_block_size_offset, crypto_field_offset(holder, "blockSize", "I"));
      AtomicAccess::release_store(&digest_base_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_md5() && AtomicAccess::load_acquire(&md5_klass) == nullptr) {
      AtomicAccess::store(&md5_state_offset, crypto_field_offset(holder, "state", "[I"));
      AtomicAccess::release_store(&md5_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_sha() && AtomicAccess::load_acquire(&sha1_klass) == nullptr) {
      AtomicAccess::store(&sha1_state_offset, crypto_field_offset(holder, "state", "[I"));
      AtomicAccess::release_store(&sha1_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_sha2() && AtomicAccess::load_acquire(&sha256_klass) == nullptr) {
      AtomicAccess::store(&sha256_state_offset, crypto_field_offset(holder, "state", "[I"));
      AtomicAccess::release_store(&sha256_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_sha5() && AtomicAccess::load_acquire(&sha512_klass) == nullptr) {
      AtomicAccess::store(&sha512_state_offset, crypto_field_offset(holder, "state", "[J"));
      AtomicAccess::release_store(&sha512_klass, holder);
    }
    if (name == vmSymbols::sun_security_provider_sha3() && AtomicAccess::load_acquire(&sha3_klass) == nullptr) {
      AtomicAccess::store(&sha3_state_offset, crypto_field_offset(holder, "state", "[J"));
      AtomicAccess::release_store(&sha3_klass, holder);
    }
    if ((name == vmSymbols::com_sun_crypto_provider_cipherBlockChaining() ||
         name == vmSymbols::com_sun_crypto_provider_electronicCodeBook() ||
         name == vmSymbols::com_sun_crypto_provider_counterMode()) &&
        AtomicAccess::load_acquire(&feedback_cipher_klass) == nullptr) {
      InstanceKlass* feedback = holder->java_super();
      if (feedback != nullptr && feedback->name()->equals("com/sun/crypto/provider/FeedbackCipher") &&
          feedback->class_loader_data()->is_the_null_class_loader_data()) {
        AtomicAccess::cmpxchg(&embedded_cipher_offset, -1, crypto_field_offset(feedback, "embeddedCipher",
            "Lcom/sun/crypto/provider/SymmetricCipher;"));
        AtomicAccess::release_store(&feedback_cipher_klass, feedback);
      }
    }
  }
  // Linking may allocate and block. Bootstrap calls keep Java until stubs are published.
  if (is_init_completed() && needs_compiler_stubs(id) &&
      is_available_for_interpreter(id) && vmIntrinsics::is_intrinsic_available(id)) {
    StubRoutines::ensure_compiler_stubs_initialized();
  }
}

bool CommonIntrinsics::is_scalar(vmIntrinsics::ID id) {
  switch (id) {
#define COMMON_SCALAR(id, slots, result) case vmIntrinsics::id: return true;
    COMMON_SCALAR_INTRINSICS_DO(COMMON_SCALAR)
    COMMON_BINARY_SCALAR_INTRINSICS_DO(COMMON_SCALAR)
#undef COMMON_SCALAR
    default: return false;
  }
}

bool CommonIntrinsics::is_binary_scalar(vmIntrinsics::ID id) {
  switch (id) {
#define COMMON_BINARY(id, slots, result) case vmIntrinsics::id: return true;
    COMMON_BINARY_SCALAR_INTRINSICS_DO(COMMON_BINARY)
#undef COMMON_BINARY
    default: return false;
  }
}

bool CommonIntrinsics::scalar_is_wide(vmIntrinsics::ID id) {
  return parameter_slots(id) == (is_binary_scalar(id) ? 4 : 2);
}

bool CommonIntrinsics::can_fallback(vmIntrinsics::ID id) {
  switch (id) {
    case vmIntrinsics::_negateExactI:
    case vmIntrinsics::_negateExactL:
    case vmIntrinsics::_incrementExactI:
    case vmIntrinsics::_incrementExactL:
    case vmIntrinsics::_decrementExactI:
    case vmIntrinsics::_decrementExactL:
    case vmIntrinsics::_divideUnsigned_i:
    case vmIntrinsics::_remainderUnsigned_i:
    case vmIntrinsics::_divideUnsigned_l:
    case vmIntrinsics::_remainderUnsigned_l:
    case vmIntrinsics::_addExactI:
    case vmIntrinsics::_addExactL:
    case vmIntrinsics::_subtractExactI:
    case vmIntrinsics::_subtractExactL:
    case vmIntrinsics::_multiplyExactI:
    case vmIntrinsics::_multiplyExactL:
      return true;
    default: return !is_scalar(id);
  }
}

bool CommonIntrinsics::is_supported(vmIntrinsics::ID id) {
  if (!enabled()) {
    return false;
  }
  if (id == vmIntrinsics::_digestBase_implCompressMB && !all_digest_intrinsics_enabled()) {
    return false;
  }
#ifdef AARCH64
  // These kernels have no AArch64 generator. Interpreter entries are built
  // before compiler stubs, so exclude them without inspecting stub pointers.
  switch (id) {
    case vmIntrinsics::_electronicCodeBook_encryptAESCrypt:
    case vmIntrinsics::_electronicCodeBook_decryptAESCrypt:
    case vmIntrinsics::_intpoly_montgomeryMult_P256:
    case vmIntrinsics::_intpoly_assign:
    case vmIntrinsics::_quad_keccak:
      return false;
    default: break;
  }
#endif
#ifdef AMD64
  if ((id == vmIntrinsics::_bitCount_i || id == vmIntrinsics::_bitCount_l) && !UsePopCountInstruction) {
    return false;
  }
#endif
  if (is_scalar(id)) {
    return true;
  }
#ifdef COMPILER2
  return is_big_integer(id) || is_crypto(id) || is_array_kernel(id) || id == vmIntrinsics::_vectorizedHashCode;
#else
  return false;
#endif
}

// Interpreter entries precede compiler stubs, so consult the CPU predicates
// used by their generators rather than the still-empty stub slots. Keep this
// separate from C1 availability, which checks the generated stub slots.
bool CommonIntrinsics::is_available_for_interpreter(vmIntrinsics::ID id) {
  if (!is_supported(id)) {
    return false;
  }
#if defined(AMD64) && !defined(ZERO)
  switch (id) {
    case vmIntrinsics::_bigIntegerRightShiftWorker:
    case vmIntrinsics::_bigIntegerLeftShiftWorker:
      return VM_Version::supports_avx512_vbmi2();
    case vmIntrinsics::_quad_keccak:
      return VM_Version::supports_evex() && VM_Version::supports_avx512vlbw();
    default: break;
  }
#endif
#if defined(AARCH64) && !defined(ZERO)
  if (id == vmIntrinsics::_double_keccak) {
    return UseSIMDForSHA3Intrinsic;
  }
#endif
  return true;
}

// Acquire the completed stub publication before inspecting backend slots.
bool CommonIntrinsics::is_available_for_c1(vmIntrinsics::ID id) {
  if (needs_compiler_stubs(id) && !StubRoutines::compiler_stubs_initialized()) {
    return false;
  }
  if (!is_supported(id)) {
    return false;
  }
  if (is_scalar(id)) {
    return true;
  }
  if (is_crypto(id) && !crypto_layout_ready(id)) {
    return false;
  }
  switch (id) {
    case vmIntrinsics::_multiplyToLen: return StubRoutines::multiplyToLen() != nullptr;
    case vmIntrinsics::_squareToLen: return StubRoutines::squareToLen() != nullptr;
    case vmIntrinsics::_mulAdd: return StubRoutines::mulAdd() != nullptr;
    case vmIntrinsics::_montgomeryMultiply: return StubRoutines::montgomeryMultiply() != nullptr;
    case vmIntrinsics::_montgomerySquare: return StubRoutines::montgomerySquare() != nullptr;
    case vmIntrinsics::_bigIntegerRightShiftWorker: return StubRoutines::bigIntegerRightShift() != nullptr;
    case vmIntrinsics::_bigIntegerLeftShiftWorker: return StubRoutines::bigIntegerLeftShift() != nullptr;
    case vmIntrinsics::_ghash_processBlocks: return StubRoutines::ghash_processBlocks() != nullptr;
    case vmIntrinsics::_chacha20Block: return StubRoutines::chacha20Block() != nullptr;
    case vmIntrinsics::_poly1305_processBlocks: return StubRoutines::poly1305_processBlocks() != nullptr;
    case vmIntrinsics::_intpoly_montgomeryMult_P256: return StubRoutines::intpoly_montgomeryMult_P256() != nullptr;
    case vmIntrinsics::_intpoly_assign: return StubRoutines::intpoly_assign() != nullptr;
    case vmIntrinsics::_double_keccak: return StubRoutines::double_keccak() != nullptr;
    case vmIntrinsics::_quad_keccak: return StubRoutines::quad_keccak() != nullptr;
    case vmIntrinsics::_kyberNtt: return StubRoutines::kyberNtt() != nullptr;
    case vmIntrinsics::_kyberInverseNtt: return StubRoutines::kyberInverseNtt() != nullptr;
    case vmIntrinsics::_kyberNttMult: return StubRoutines::kyberNttMult() != nullptr;
    case vmIntrinsics::_kyberAddPoly_2: return StubRoutines::kyberAddPoly_2() != nullptr;
    case vmIntrinsics::_kyberAddPoly_3: return StubRoutines::kyberAddPoly_3() != nullptr;
    case vmIntrinsics::_kyberBarrettReduce: return StubRoutines::kyberBarrettReduce() != nullptr;
    case vmIntrinsics::_dilithiumAlmostNtt: return StubRoutines::dilithiumAlmostNtt() != nullptr;
    case vmIntrinsics::_dilithiumAlmostInverseNtt: return StubRoutines::dilithiumAlmostInverseNtt() != nullptr;
    case vmIntrinsics::_dilithiumNttMult: return StubRoutines::dilithiumNttMult() != nullptr;
    case vmIntrinsics::_kyber12To16: return StubRoutines::kyber12To16() != nullptr;
    case vmIntrinsics::_dilithiumMontMulByConstant: return StubRoutines::dilithiumMontMulByConstant() != nullptr;
    case vmIntrinsics::_dilithiumDecomposePoly: return StubRoutines::dilithiumDecomposePoly() != nullptr;
    case vmIntrinsics::_aescrypt_encryptBlock: return StubRoutines::aescrypt_encryptBlock() != nullptr;
    case vmIntrinsics::_electronicCodeBook_encryptAESCrypt: return StubRoutines::electronicCodeBook_encryptAESCrypt() != nullptr;
    case vmIntrinsics::_cipherBlockChaining_encryptAESCrypt: return StubRoutines::cipherBlockChaining_encryptAESCrypt() != nullptr;
    case vmIntrinsics::_aescrypt_decryptBlock: return StubRoutines::aescrypt_decryptBlock() != nullptr;
    case vmIntrinsics::_electronicCodeBook_decryptAESCrypt: return StubRoutines::electronicCodeBook_decryptAESCrypt() != nullptr;
    case vmIntrinsics::_cipherBlockChaining_decryptAESCrypt: return StubRoutines::cipherBlockChaining_decryptAESCrypt() != nullptr;
    case vmIntrinsics::_counterMode_AESCrypt: return StubRoutines::counterMode_AESCrypt() != nullptr;
    case vmIntrinsics::_md5_implCompress: return StubRoutines::md5_implCompress() != nullptr;
    case vmIntrinsics::_sha_implCompress: return StubRoutines::sha1_implCompress() != nullptr;
    case vmIntrinsics::_sha2_implCompress: return StubRoutines::sha256_implCompress() != nullptr;
    case vmIntrinsics::_sha5_implCompress: return StubRoutines::sha512_implCompress() != nullptr;
    case vmIntrinsics::_sha3_implCompress: return StubRoutines::sha3_implCompress() != nullptr;
    case vmIntrinsics::_galoisCounterMode_AESCrypt: return StubRoutines::galoisCounterMode_AESCrypt() != nullptr;
    case vmIntrinsics::_digestBase_implCompressMB:
      // The receiver has the abstract DigestBase type. Do not speculate that
      // it is a supported subclass when only some digest kernels are enabled.
      return StubRoutines::md5_implCompressMB() != nullptr &&
             StubRoutines::sha1_implCompressMB() != nullptr &&
             StubRoutines::sha256_implCompressMB() != nullptr &&
             StubRoutines::sha512_implCompressMB() != nullptr &&
             StubRoutines::sha3_implCompressMB() != nullptr &&
             all_digest_intrinsics_enabled();
    case vmIntrinsics::_vectorizedHashCode:
      return true;
    default: return false;
  }
}

int CommonIntrinsics::parameter_slots(vmIntrinsics::ID id) {
  switch (id) {
#define COMMON_SLOTS(id, slots, result) case vmIntrinsics::id: return slots;
    COMMON_SCALAR_INTRINSICS_DO(COMMON_SLOTS)
    COMMON_BINARY_SCALAR_INTRINSICS_DO(COMMON_SLOTS)
#undef COMMON_SLOTS
    default: ShouldNotReachHere(); return 0;
  }
}
