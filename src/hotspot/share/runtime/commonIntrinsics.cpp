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
#include "oops/typeArrayKlass.hpp"
#include "oops/typeArrayOop.inline.hpp"
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

// Bound time spent without a safepoint. The general limit also admits GCM's
// 1 MiB SPLIT_LEN chunks; quadratic arithmetic uses smaller limb budgets.
constexpr jint max_hash_elements = 65536;

bool all_digest_intrinsics_enabled() {
  return vmIntrinsics::is_intrinsic_available(vmIntrinsics::_md5_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha2_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha5_implCompress) &&
         vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha3_implCompress);
}

class Arguments {
  const intptr_t* _args;
  int _remaining;
 public:
  Arguments(const intptr_t* args, int slots) : _args(args), _remaining(slots) {}
  oop object() { return cast_to_oop(_args[--_remaining]); }
  jint integer() { return static_cast<jint>(_args[--_remaining]); }
};

bool array_range(oop array, BasicType type, jint offset, jlong length) {
  // Bound all variable-length leaves; larger Java loops can safepoint.
  return length <= CommonIntrinsics::max_leaf_elements && array != nullptr && array->is_typeArray() &&
         TypeArrayKlass::cast(array->klass())->element_type() == type &&
         offset >= 0 && length >= 0 &&
         static_cast<jlong>(offset) + length <= typeArrayOop(array)->length();
}

template <typename T> T* elements(oop array) {
  return static_cast<T*>(typeArrayOop(array)->base(TypeArrayKlass::cast(array->klass())->element_type()));
}

// Generated stubs use machine-word argument slots and can read the full
// register for a Java int. Darwin's C ABI leaves the upper half unspecified
// for a jint argument, so extend it before
// crossing into generated code.
intptr_t stub_argument(jint arg) { return arg; }

template <typename T>
T stub_argument(T arg) { return arg; }

template <typename R, typename... Args>
R invoke_stub(address entry, Args... args) {
  return CAST_TO_FN_PTR(R (*)(decltype(stub_argument(args))...), entry)(stub_argument(args)...);
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

JRT_LEAF(jlong, common_ghash_processBlocks(const intptr_t* args))
  Arguments a(args, 5);
  oop src = a.object();
  jint offset = a.integer();
  jint blocks = a.integer();
  oop state = a.object();
  oop key = a.object();
  address stub = StubRoutines::ghash_processBlocks();
  if (stub == nullptr || blocks <= 0 ||
      !array_range(src, T_BYTE, offset, static_cast<jlong>(blocks) * 16) ||
      !array_range(state, T_LONG, 0, 2) || !array_range(key, T_LONG, 0, 18)) {
    return CommonIntrinsics::fallback;
  }
  invoke_stub<void>(stub, elements<jlong>(state), elements<jlong>(key), elements<jbyte>(src) + offset, blocks);
  return 0;
JRT_END

JRT_LEAF(jlong, common_chacha20Block(const intptr_t* args))
  Arguments a(args, 2);
  oop state = a.object();
  oop out = a.object();
  address stub = StubRoutines::chacha20Block();
  // The AVX-512 stub can generate sixteen 64-byte blocks in one call.
  if (stub == nullptr || !array_range(state, T_INT, 0, 16) ||
      !array_range(out, T_BYTE, 0, 1024)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(state), elements<jbyte>(out));
JRT_END

JRT_LEAF(jlong, common_poly1305_processBlocks(const intptr_t* args))
  Arguments a(args, 6);
  oop receiver = a.object();
  oop src = a.object();
  jint offset = a.integer();
  jint len = a.integer();
  oop acc = a.object();
  oop r = a.object();
  address stub = StubRoutines::poly1305_processBlocks();
  if (stub == nullptr || receiver == nullptr || len <= 0 || (len & 15) != 0 ||
      !array_range(src, T_BYTE, offset, len) || !array_range(acc, T_LONG, 0, 5) ||
      !array_range(r, T_LONG, 0, 5)) {
    return CommonIntrinsics::fallback;
  }
  invoke_stub<void>(stub, elements<jbyte>(src) + offset, len, elements<jlong>(acc), elements<jlong>(r));
  return 0;
JRT_END

JRT_LEAF(jlong, common_intpoly_montgomeryMult_P256(const intptr_t* args))
  Arguments a(args, 4);
  oop receiver = a.object();
  oop x = a.object();
  oop y = a.object();
  oop out = a.object();
  address stub = StubRoutines::intpoly_montgomeryMult_P256();
  if (stub == nullptr || receiver == nullptr || !array_range(x, T_LONG, 0, 5) ||
      !array_range(y, T_LONG, 0, 5) || !array_range(out, T_LONG, 0, 5)) {
    return CommonIntrinsics::fallback;
  }
  invoke_stub<void>(stub, elements<jlong>(x), elements<jlong>(y), elements<jlong>(out));
  return 0;
JRT_END

JRT_LEAF(jlong, common_intpoly_assign(const intptr_t* args))
  Arguments a(args, 3);
  jint set = a.integer();
  oop x = a.object();
  oop y = a.object();
  address stub = StubRoutines::intpoly_assign();
  if (stub == nullptr || !array_range(x, T_LONG, 0, 0) ||
      !array_range(y, T_LONG, 0, typeArrayOop(x)->length())) {
    return CommonIntrinsics::fallback;
  }
  invoke_stub<void>(stub, set, elements<jlong>(x), elements<jlong>(y), typeArrayOop(x)->length());
  return 0;
JRT_END

JRT_LEAF(jlong, common_double_keccak(const intptr_t* args))
  Arguments a(args, 2);
  oop s0 = a.object();
  oop s1 = a.object();
  address stub = StubRoutines::double_keccak();
  if (stub == nullptr || s0 == s1 ||
      !array_range(s0, T_LONG, 0, 25) || !array_range(s1, T_LONG, 0, 25)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jlong>(s0), elements<jlong>(s1));
JRT_END

JRT_LEAF(jlong, common_quad_keccak(const intptr_t* args))
  Arguments a(args, 4);
  oop s0 = a.object();
  oop s1 = a.object();
  oop s2 = a.object();
  oop s3 = a.object();
  address stub = StubRoutines::quad_keccak();
  // Parallel permutations cannot implement Java's sequential aliased updates.
  if (stub == nullptr || s0 == s1 || s0 == s2 || s0 == s3 || s1 == s2 || s1 == s3 || s2 == s3 ||
      !array_range(s0, T_LONG, 0, 25) || !array_range(s1, T_LONG, 0, 25) ||
      !array_range(s2, T_LONG, 0, 25) || !array_range(s3, T_LONG, 0, 25)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jlong>(s0), elements<jlong>(s1), elements<jlong>(s2), elements<jlong>(s3));
JRT_END

JRT_LEAF(jlong, common_kyberNtt(const intptr_t* args))
  Arguments a(args, 2);
  oop poly = a.object();
  oop zetas = a.object();
  address stub = StubRoutines::kyberNtt();
  if (stub == nullptr || !array_range(poly, T_SHORT, 0, 256) ||
      !array_range(zetas, T_SHORT, 0, 896)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(poly), elements<jshort>(zetas));
JRT_END

JRT_LEAF(jlong, common_kyberInverseNtt(const intptr_t* args))
  Arguments a(args, 2);
  oop poly = a.object();
  oop zetas = a.object();
  address stub = StubRoutines::kyberInverseNtt();
  if (stub == nullptr || !array_range(poly, T_SHORT, 0, 256) ||
      !array_range(zetas, T_SHORT, 0, 896)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(poly), elements<jshort>(zetas));
JRT_END

JRT_LEAF(jlong, common_kyberNttMult(const intptr_t* args))
  Arguments a(args, 4);
  oop out = a.object();
  oop x = a.object();
  oop y = a.object();
  oop zetas = a.object();
  address stub = StubRoutines::kyberNttMult();
  if (stub == nullptr || !array_range(out, T_SHORT, 0, 256) ||
      !array_range(x, T_SHORT, 0, 256) ||
      !array_range(y, T_SHORT, 0, 256) ||
      !array_range(zetas, T_SHORT, 0, 128)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(out), elements<jshort>(x), elements<jshort>(y), elements<jshort>(zetas));
JRT_END

JRT_LEAF(jlong, common_kyberAddPoly_2(const intptr_t* args))
  Arguments a(args, 3);
  oop out = a.object();
  oop x = a.object();
  oop y = a.object();
  address stub = StubRoutines::kyberAddPoly_2();
  if (stub == nullptr || !array_range(out, T_SHORT, 0, 256) ||
      !array_range(x, T_SHORT, 0, 256) ||
      !array_range(y, T_SHORT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(out), elements<jshort>(x), elements<jshort>(y));
JRT_END

JRT_LEAF(jlong, common_kyberAddPoly_3(const intptr_t* args))
  Arguments a(args, 4);
  oop out = a.object();
  oop x = a.object();
  oop y = a.object();
  oop z = a.object();
  address stub = StubRoutines::kyberAddPoly_3();
  if (stub == nullptr || !array_range(out, T_SHORT, 0, 256) ||
      !array_range(x, T_SHORT, 0, 256) ||
      !array_range(y, T_SHORT, 0, 256) ||
      !array_range(z, T_SHORT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(out), elements<jshort>(x), elements<jshort>(y), elements<jshort>(z));
JRT_END

JRT_LEAF(jlong, common_kyberBarrettReduce(const intptr_t* args))
  Arguments a(args, 1);
  oop poly = a.object();
  address stub = StubRoutines::kyberBarrettReduce();
  if (stub == nullptr || !array_range(poly, T_SHORT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jshort>(poly));
JRT_END

JRT_LEAF(jlong, common_dilithiumAlmostNtt(const intptr_t* args))
  Arguments a(args, 2);
  oop poly = a.object();
  oop zetas = a.object();
  address stub = StubRoutines::dilithiumAlmostNtt();
  if (stub == nullptr || !array_range(poly, T_INT, 0, 256) ||
      !array_range(zetas, T_INT, 0, 1024)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(poly), elements<jint>(zetas));
JRT_END

JRT_LEAF(jlong, common_dilithiumAlmostInverseNtt(const intptr_t* args))
  Arguments a(args, 2);
  oop poly = a.object();
  oop zetas = a.object();
  address stub = StubRoutines::dilithiumAlmostInverseNtt();
  if (stub == nullptr || !array_range(poly, T_INT, 0, 256) ||
      !array_range(zetas, T_INT, 0, 1024)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(poly), elements<jint>(zetas));
JRT_END

JRT_LEAF(jlong, common_dilithiumNttMult(const intptr_t* args))
  Arguments a(args, 3);
  oop out = a.object();
  oop x = a.object();
  oop y = a.object();
  address stub = StubRoutines::dilithiumNttMult();
  if (stub == nullptr || !array_range(out, T_INT, 0, 256) ||
      !array_range(x, T_INT, 0, 256) ||
      !array_range(y, T_INT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(out), elements<jint>(x), elements<jint>(y));
JRT_END

JRT_LEAF(jlong, common_kyber12To16(const intptr_t* args))
  Arguments a(args, 4);
  oop src = a.object();
  jint offset = a.integer();
  oop out = a.object();
  jint len = a.integer();
  address stub = StubRoutines::kyber12To16();
  jlong chunks = (static_cast<jlong>(len) + 127) / 128;
  if (stub == nullptr || len <= 0 || (len & 1) != 0 ||
      !array_range(src, T_BYTE, offset, chunks * 192) ||
      !array_range(out, T_SHORT, 0, chunks * 128)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jbyte>(src), offset, elements<jshort>(out), len);
JRT_END

JRT_LEAF(jlong, common_dilithiumMontMulByConstant(const intptr_t* args))
  Arguments a(args, 2);
  oop poly = a.object();
  jint constant = a.integer();
  address stub = StubRoutines::dilithiumMontMulByConstant();
  if (stub == nullptr || !array_range(poly, T_INT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(poly), constant);
JRT_END

JRT_LEAF(jlong, common_dilithiumDecomposePoly(const intptr_t* args))
  Arguments a(args, 5);
  oop src = a.object();
  oop low = a.object();
  oop high = a.object();
  jint gamma = a.integer();
  jint multiplier = a.integer();
  address stub = StubRoutines::dilithiumDecomposePoly();
  if (stub == nullptr || !array_range(src, T_INT, 0, 256) ||
      !array_range(low, T_INT, 0, 256) || !array_range(high, T_INT, 0, 256)) {
    return CommonIntrinsics::fallback;
  }
  return invoke_stub<jint>(stub, elements<jint>(src), elements<jint>(low), elements<jint>(high), gamma, multiplier);
JRT_END

JRT_LEAF(jlong, common_digestBase_implCompressMB(const intptr_t* args))
  Arguments a(args, 4);
  oop receiver = a.object();
  oop src = a.object();
  jint offset = a.integer();
  jint limit = a.integer();
  address stub = nullptr;
  oop state = nullptr;
  BasicType type = T_INT;
  jint words = 0;
  if (receiver == nullptr || AtomicAccess::load_acquire(&CommonIntrinsics::digest_base_klass) == nullptr ||
      CommonIntrinsics::digest_block_size_offset < 0) {
    return CommonIntrinsics::fallback;
  }
  jint block = receiver->int_field(CommonIntrinsics::digest_block_size_offset);
  auto digest_state = [&](InstanceKlass** slot, int* offset) -> oop {
    InstanceKlass* klass = AtomicAccess::load_acquire(slot);
    return klass != nullptr && receiver->is_a(klass) && AtomicAccess::load(offset) >= 0
           ? receiver->obj_field(AtomicAccess::load(offset)) : nullptr;
  };
  if (receiver == nullptr || block <= 0 || block > 200 || (block & 7) != 0 || limit < offset ||
      !array_range(src, T_BYTE, offset, static_cast<jlong>(limit) - offset + block)) {
    return CommonIntrinsics::fallback;
  }
  if ((state = digest_state(&CommonIntrinsics::md5_klass, &CommonIntrinsics::md5_state_offset)) != nullptr && vmIntrinsics::is_intrinsic_available(vmIntrinsics::_md5_implCompress)) {
    stub = StubRoutines::md5_implCompressMB();
    words = 4;
  } else if ((state = digest_state(&CommonIntrinsics::sha1_klass, &CommonIntrinsics::sha1_state_offset)) != nullptr && vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha_implCompress)) {
    stub = StubRoutines::sha1_implCompressMB();
    words = 5;
  } else if ((state = digest_state(&CommonIntrinsics::sha256_klass, &CommonIntrinsics::sha256_state_offset)) != nullptr && vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha2_implCompress)) {
    stub = StubRoutines::sha256_implCompressMB();
    words = 8;
  } else if ((state = digest_state(&CommonIntrinsics::sha512_klass, &CommonIntrinsics::sha512_state_offset)) != nullptr && vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha5_implCompress)) {
    stub = StubRoutines::sha512_implCompressMB();
    words = 8;
    type = T_LONG;
  } else if ((state = digest_state(&CommonIntrinsics::sha3_klass, &CommonIntrinsics::sha3_state_offset)) != nullptr && vmIntrinsics::is_intrinsic_available(vmIntrinsics::_sha3_implCompress)) {
    stub = StubRoutines::sha3_implCompressMB();
    words = 25;
    type = T_LONG;
    if (stub == nullptr || !array_range(state, type, 0, words)) {
      return CommonIntrinsics::fallback;
    }
    return invoke_stub<jint>(stub, elements<jbyte>(src) + offset, elements<jlong>(state), block, offset, limit);
  }
  if (stub == nullptr || !array_range(state, type, 0, words)) {
    return CommonIntrinsics::fallback;
  }
  // Both state element types use the same pointer ABI.
  return invoke_stub<jint>(stub, elements<jbyte>(src) + offset,
                           typeArrayOop(state)->base(type), offset, limit);
JRT_END

JRT_LEAF(jlong, common_vectorizedHashCode(const intptr_t* args))
  Arguments a(args, 5);
  oop array = a.object();
  jint offset = a.integer();
  jint len = a.integer();
  jint initial = a.integer();
  jint type = a.integer();
  if (len > max_hash_elements) {
    return CommonIntrinsics::fallback;
  }
  switch (type) {
    case T_BOOLEAN:
      if (array_range(array, T_BYTE, offset, len)) {
        return polynomial_hash(elements<uint8_t>(array) + offset, len, initial);
      }
      break;
    case T_BYTE:
      if (array_range(array, T_BYTE, offset, len)) {
        return polynomial_hash(elements<jbyte>(array) + offset, len, initial);
      }
      break;
    case T_SHORT:
      if (array_range(array, T_SHORT, offset, len)) {
        return polynomial_hash(elements<jshort>(array) + offset, len, initial);
      }
      break;
    case T_CHAR:
      if (array_range(array, T_CHAR, offset, len) ||
          (offset >= 0 && offset <= max_jint / 2 &&
           array_range(array, T_BYTE, offset * 2, static_cast<jlong>(len) * 2))) {
        return polynomial_hash(elements<jchar>(array) + offset, len, initial);
      }
      break;
    case T_INT:
      if (array_range(array, T_INT, offset, len)) {
        return polynomial_hash(elements<jint>(array) + offset, len, initial);
      }
      break;
  }
  return CommonIntrinsics::fallback;
JRT_END

} // namespace

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
  return enabled() && !is_scalar(id) && id != vmIntrinsics::_vectorizedHashCode &&
         id != vmIntrinsics::_vectorizedHashCodeLeaf &&
         (is_big_integer(id) || is_crypto(id) || entry_for(id) != nullptr);
#else
  return false;
#endif
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
  return is_big_integer(id) || is_crypto(id) || entry_for(id) != nullptr;
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
    case vmIntrinsics::_vectorizedHashCodeLeaf:
      return true;
    default: return false;
  }
}

address CommonIntrinsics::entry_for(vmIntrinsics::ID id) {
  if (id == vmIntrinsics::_vectorizedHashCodeLeaf) {
    id = vmIntrinsics::_vectorizedHashCode;
  }
  switch (id) {
#define COMMON_ENTRY(id, slots, result) \
    case vmIntrinsics::id: return CAST_FROM_FN_PTR(address, common##id);
    COMMON_INTRINSICS_DO(COMMON_ENTRY)
#undef COMMON_ENTRY
    default: return nullptr;
  }
}

int CommonIntrinsics::parameter_slots(vmIntrinsics::ID id) {
  if (id == vmIntrinsics::_vectorizedHashCodeLeaf) id = vmIntrinsics::_vectorizedHashCode;
  switch (id) {
#define COMMON_SLOTS(id, slots, result) case vmIntrinsics::id: return slots;
    COMMON_INTRINSICS_DO(COMMON_SLOTS)
    COMMON_SCALAR_INTRINSICS_DO(COMMON_SLOTS)
    COMMON_BINARY_SCALAR_INTRINSICS_DO(COMMON_SLOTS)
#undef COMMON_SLOTS
    default: ShouldNotReachHere(); return 0;
  }
}

BasicType CommonIntrinsics::result_type(vmIntrinsics::ID id) {
  if (id == vmIntrinsics::_vectorizedHashCodeLeaf) id = vmIntrinsics::_vectorizedHashCode;
  switch (id) {
#define COMMON_RESULT(id, slots, result) case vmIntrinsics::id: return result;
    COMMON_INTRINSICS_DO(COMMON_RESULT)
    COMMON_SCALAR_INTRINSICS_DO(COMMON_RESULT)
    COMMON_BINARY_SCALAR_INTRINSICS_DO(COMMON_RESULT)
#undef COMMON_RESULT
    default: ShouldNotReachHere(); return T_ILLEGAL;
  }
}
