/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

#include "runtime/tmfyStringCoding.hpp"
#include "classfile/moduleEntry.hpp"
#include "classfile/vmSymbols.hpp"
#include "interpreter/bytecodes.hpp"
#include "oops/constantPool.hpp"
#include "oops/instanceKlass.hpp"
#include "oops/method.inline.hpp"
#include "utilities/bytes.hpp"
#include "runtime/tmfyStringCodingTooling.hpp"
#include "tmfy/kernels.h"
#include "tmfy/tmfyKernelPolicy.hpp"
#include "oops/typeArrayOop.inline.hpp"
#include "prims/jvmtiExport.hpp"
#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/init.hpp"
#include "runtime/vm_version.hpp"

Atomic<jlong> TmfyStringCoding::_counters[TmfyStringCoding::counter_count];
Atomic<uint8_t> TmfyStringCoding::_initialized{0};

// This proof runs before Rewriter changes constant-pool indexes. Keep the
// admitted prefix identical to ciStringUtf8's existing compiler-origin proof.
// There is no class resolution, initialization or per-call VM transition here.
bool TmfyStringCoding::can_rewrite_cold_utf16_encode(Method* method) {
#if defined(AMD64) && !defined(ZERO)
  InstanceKlass* holder = method->method_holder();
  if (!RewriteBytecodes || holder->name() != vmSymbols::java_lang_String() ||
      !method->name()->equals("encodeUTF8_UTF16") ||
      !method->signature()->equals("([BLjava/lang/Class;)[B") ||
      !method->is_static() || !method->is_private() || method->is_native() ||
      method->is_abstract() || method->is_synchronized() || method->is_old() ||
      method->number_of_breakpoints() != 0 || method->code_size() != 514 ||
      method->max_locals() != 10 || method->exception_table_length() != 0) return false;
  if (holder->class_loader() != nullptr || holder->has_been_transformed() ||
      holder->has_been_redefined() || holder->module() == nullptr ||
      holder->module() != ModuleEntryTable::javabase_moduleEntry() ||
      holder->module()->is_patched()) return false;

  static const u1 encode_shape[] = {
    Bytecodes::_iconst_0, // 0
    Bytecodes::_istore_2, // 1
    Bytecodes::_iconst_0, // 2
    Bytecodes::_istore_3, // 3
    Bytecodes::_aload_0, // 4
    Bytecodes::_arraylength, // 5
    Bytecodes::_iconst_1, // 6
    Bytecodes::_ishr, // 7
    Bytecodes::_istore, 4, // 8
    Bytecodes::_iload, 4, // 10
    Bytecodes::_iconst_3, // 12
    Bytecodes::_imul, // 13
    Bytecodes::_ifge, 0, 11, // 14
    Bytecodes::_aload_0, // 17
    Bytecodes::_aload_1, // 18
    Bytecodes::_invokestatic, 0, 0, // 19
    Bytecodes::_goto, 0, 7, // 22
    Bytecodes::_iload, 4, // 25
    Bytecodes::_iconst_3, // 27
    Bytecodes::_imul, // 28
    Bytecodes::_istore, 5, // 29
    Bytecodes::_iload, 5, // 31
    Bytecodes::_newarray, 8, // 33
    Bytecodes::_astore, 6, // 35
    Bytecodes::_iload, 4, // 37
    Bytecodes::_bipush, 16, // 39
    Bytecodes::_if_icmplt, 0, 121, // 41
    Bytecodes::_aload_0, // 44
    Bytecodes::_arraylength, // 45
    Bytecodes::_sipush, 16, 0, // 46
    Bytecodes::_if_icmpgt, 0, 113, // 49
    Bytecodes::_aload_1, // 52
    Bytecodes::_ifnonnull, 0, 109, // 53
    Bytecodes::_aload_0, // 56
    Bytecodes::_arraylength, // 57
    Bytecodes::_sipush, 4, 0, // 58
    Bytecodes::_if_icmpge, 0, 9, // 61
    Bytecodes::_getstatic, 0, 0, // 64
    Bytecodes::_ifeq, 0, 95, // 67
    Bytecodes::_invokestatic, 0, 0, // 70
    Bytecodes::_ifeq, 0, 89, // 73
    Bytecodes::_aload_0, // 76
    Bytecodes::_iconst_0, // 77
    Bytecodes::_aload_0, // 78
    Bytecodes::_arraylength, // 79
    Bytecodes::_aload, 6, // 80
    Bytecodes::_iconst_0, // 82
    Bytecodes::_aload, 6, // 83
    Bytecodes::_arraylength, // 85
    Bytecodes::_invokestatic, 0, 0, // 86
    Bytecodes::_istore, 7, // 89
    Bytecodes::_iload, 7, // 91
    Bytecodes::_iload, 4, // 93
    Bytecodes::_if_icmplt, 0, 32, // 95
    Bytecodes::_iload, 7, // 98
    Bytecodes::_aload, 6, // 100
    Bytecodes::_arraylength, // 102
    Bytecodes::_if_icmpgt, 0, 24, // 103
    Bytecodes::_iload, 7, // 106
    Bytecodes::_aload, 6, // 108
    Bytecodes::_arraylength, // 110
    Bytecodes::_if_icmpne, 0, 8, // 111
    Bytecodes::_aload, 6, // 114
    Bytecodes::_goto, 0, 10, // 116
    Bytecodes::_aload, 6, // 119
    Bytecodes::_iload, 7, // 121
    Bytecodes::_invokestatic, 0, 0, // 123
    Bytecodes::_areturn, // 126
    Bytecodes::_iload, 7, // 127
    Bytecodes::_iconst_m1, // 129
    Bytecodes::_if_icmpeq, 0, 32, // 130
    Bytecodes::_new, 0, 0, // 133
    Bytecodes::_dup, // 136
    Bytecodes::_new, 0, 0, // 137
    Bytecodes::_dup, // 140
    Bytecodes::_invokespecial, 0, 0, // 141
    Bytecodes::_ldc_w, 0, 0, // 144
    Bytecodes::_invokevirtual, 0, 0, // 147
    Bytecodes::_iload, 7, // 150
    Bytecodes::_invokevirtual, 0, 0, // 152
    Bytecodes::_invokevirtual, 0, 0, // 155
    Bytecodes::_invokespecial, 0, 0, // 158
    Bytecodes::_athrow, // 161
  };
  static_assert(sizeof(encode_shape) == utf16_encode_java_bci, "String encode admission shape");
  ConstantPool* cp = method->constants();
  const address bytes = method->code_base();
  for (int bci = 0; bci < utf16_encode_java_bci;) {
    Bytecodes::Code code = static_cast<Bytecodes::Code>(bytes[bci]);
    if (code != encode_shape[bci]) return false;
    int length = Bytecodes::length_for(code);
    if (length <= 0 || bci + length > utf16_encode_java_bci) return false;
    if (Bytecodes::is_invoke(code) || code == Bytecodes::_getstatic) {
      int index = Bytes::get_Java_u2(bytes + bci + 1);
      if (index <= 0 || index >= cp->length() ||
          (code == Bytecodes::_getstatic ? !cp->tag_at(index).is_field() :
                                          !cp->tag_at(index).is_method())) return false;
      const char* owner;
      const char* name;
      const char* signature;
      switch (bci) {
        case 19: owner = "java/lang/String"; name = "encodedLengthUTF8_UTF16"; signature = "([BLjava/lang/Class;)I"; break;
        case 64: owner = "java/lang/StringCoding"; name = "utf8Ready"; signature = "Z"; break;
        case 70: owner = "java/lang/StringCoding"; name = "utf8Ready"; signature = "()Z"; break;
        case 86: owner = "java/lang/StringCoding"; name = "encodeUtf16Utf80"; signature = "([BII[BII)I"; break;
        case 123: owner = "java/util/Arrays"; name = "copyOf"; signature = "([BI)[B"; break;
        case 141: owner = "java/lang/StringBuilder"; name = "<init>"; signature = "()V"; break;
        case 147: owner = "java/lang/StringBuilder"; name = "append"; signature = "(Ljava/lang/String;)Ljava/lang/StringBuilder;"; break;
        case 152: owner = "java/lang/StringBuilder"; name = "append"; signature = "(I)Ljava/lang/StringBuilder;"; break;
        case 155: owner = "java/lang/StringBuilder"; name = "toString"; signature = "()Ljava/lang/String;"; break;
        case 158: owner = "java/lang/InternalError"; name = "<init>"; signature = "(Ljava/lang/String;)V"; break;
        default: return false;
      }
      if (!cp->klass_name_at(cp->uncached_klass_ref_index_at(index))->equals(owner) ||
          !cp->uncached_name_ref_at(index)->equals(name) ||
          !cp->uncached_signature_ref_at(index)->equals(signature)) return false;
    } else if (code == Bytecodes::_new || code == Bytecodes::_ldc_w) {
      int index = Bytes::get_Java_u2(bytes + bci + 1);
      if (index <= 0 || index >= cp->length()) return false;
      if (code == Bytecodes::_new) {
        const char* name = bci == 133 ? "java/lang/InternalError" : "java/lang/StringBuilder";
        if (!cp->tag_at(index).is_klass_or_reference() || !cp->klass_name_at(index)->equals(name)) return false;
      } else if (!cp->tag_at(index).is_string() ||
                 strcmp(cp->string_at_noresolve(index), "UTF-16 UTF-8 conversion failed: ") != 0) {
        return false;
      }
    } else {
      for (int i = 1; i < length; ++i) {
        if (bytes[bci + i] != encode_shape[bci + i]) return false;
      }
    }
    bci += length;
  }
  // The suffix may evolve independently only while it cannot re-enter the
  // matched prefix with changed locals. Reject unfamiliar control-flow forms
  // and every suffix branch back into the admission/allocation region.
  for (int bci = utf16_encode_java_bci; bci < method->code_size();) {
    Bytecodes::Code code = static_cast<Bytecodes::Code>(bytes[bci]);
    if (!Bytecodes::is_java_code(code)) return false;
    int length = Bytecodes::length_for(code);
    if (length <= 0 || bci + length > method->code_size() ||
        code == Bytecodes::_jsr || code == Bytecodes::_jsr_w || code == Bytecodes::_ret) return false;
    if ((code >= Bytecodes::_ifeq && code <= Bytecodes::_goto) ||
        code == Bytecodes::_ifnull || code == Bytecodes::_ifnonnull || code == Bytecodes::_goto_w) {
      int offset = code == Bytecodes::_goto_w ? (int32_t)Bytes::get_Java_u4(bytes + bci + 1) :
                                               (int16_t)Bytes::get_Java_u2(bytes + bci + 1);
      if ((int64_t)bci + offset < utf16_encode_java_bci) return false;
    }
    bci += length;
  }
  return true;
#else
  return false;
#endif
}

bool TmfyStringCoding::initialize() {
  if (_initialized.load_acquire() != 0) return true;
  if (!is_init_completed()) return false;
  uint32_t mask = 0;
#ifdef AMD64
  // The pinned library's target attributes are stricter than its metadata.
  // Admit complete groups using effective VM settings and OS signal support.
  bool westmere = UseSSE >= 4 && VM_Version::supports_sse3() &&
      VM_Version::supports_ssse3() && VM_Version::supports_sse4_1() &&
      VM_Version::supports_sse4_2() && VM_Version::supports_popcnt();
  if (westmere) mask |= TMFY_ISA_SSE42;
  bool haswell = westmere && UseAVX >= 2 && VM_Version::supports_avx2() &&
      VM_Version::supports_bmi1() && VM_Version::supports_bmi2() &&
      VM_Version::supports_lzcnt() && VM_Version::supports_external_avx_vectors();
  if (haswell) mask |= TMFY_ISA_AVX2 | TMFY_ISA_BMI1 | TMFY_ISA_BMI2;
  bool icelake = haswell && UseAVX >= 3 && VM_Version::supports_evex() &&
      VM_Version::supports_avx512dq() && VM_Version::supports_avx512cd() &&
      VM_Version::supports_avx512bw() && VM_Version::supports_avx512vl() &&
      VM_Version::supports_avx512_vbmi() && VM_Version::supports_avx512_vbmi2() &&
      VM_Version::supports_avx512_vpopcntdq() && VM_Version::supports_clmul();
  if (icelake) {
    mask |= TMFY_ISA_AVX512F | TMFY_ISA_AVX512DQ | TMFY_ISA_AVX512CD |
            TMFY_ISA_AVX512BW | TMFY_ISA_AVX512VL | TMFY_ISA_AVX512VBMI2 |
            TMFY_ISA_AVX512VPOPCNTDQ | TMFY_ISA_PCLMULQDQ;
  }
#endif
  // Other platforms use the portable engine until their VM/OS ISA policy has
  // been audited. Ordinary JNI remains available without borrowed pointers.
  if (tmfy_runtime_initialize_with_isa(mask) != 0) return false;
  _initialized.release_store(1);
  return true;
}

JRT_ENTRY(jint, TmfyStringCoding::initialize_from_java(JavaThread* current))
  return initialize() ? 1 : 0;
JRT_END

bool TmfyStringCoding::is_intrinsic(vmIntrinsics::ID id) {
  switch (id) {
#define TMFY_CASE(name, shape, helper, bound, audited) case vmIntrinsics::_tmfy_##name:
    TMFY_KERNELS_DO(TMFY_CASE)
#undef TMFY_CASE
      return true;
    default: return false;
  }
}

bool TmfyStringCoding::is_supported(vmIntrinsics::ID id) {
#if defined(LINUX) && (defined(AMD64) || defined(AARCH64))
  if (!UseTmfyStringCoding || !UseG1GC || DTraceMethodProbes || TmfyStringCodingTooling::revoked()) return false;
#ifdef AMD64
  if (!TMFY_X86_AUDITED) return false;
#else
  if (!TMFY_AARCH64_AUDITED) return false;
#endif
  // Tooling-aware native frames take precedence over boundary experiments.
  if (JvmtiExport::can_post_interpreter_events() || JvmtiExport::should_post_native_method_bind()) return false;
  switch (id) {
#define TMFY_AUDIT(name, shape, helper, bound, audited) case vmIntrinsics::_tmfy_##name: return audited;
    TMFY_KERNELS_DO(TMFY_AUDIT)
#undef TMFY_AUDIT
    default: return false;
  }
#else
  return false;
#endif
}

int TmfyStringCoding::signature(vmIntrinsics::ID id, BasicType* args, BasicType* result) {
  assert(is_intrinsic(id), "String conversion intrinsic required");
  *result = T_INT;
  args[0] = T_OBJECT; args[1] = T_INT; args[2] = T_INT;
  args[3] = T_OBJECT; args[4] = T_INT; args[5] = T_INT;
  return 6;
}

address TmfyStringCoding::entry_for(vmIntrinsics::ID id) {
  switch (id) {
#define TMFY_ENTRY(name, shape, helper, bound, audited) case vmIntrinsics::_tmfy_##name: return CAST_FROM_FN_PTR(address, TmfyStringCoding::helper);
    TMFY_KERNELS_DO(TMFY_ENTRY)
#undef TMFY_ENTRY
    default: ShouldNotReachHere(); return nullptr;
  }
}

bool TmfyStringCoding::is_entry(address entry) {
#define TMFY_IS_ENTRY(name, shape, helper, bound, audited) if (entry == CAST_FROM_FN_PTR(address, TmfyStringCoding::helper)) return true;
  TMFY_KERNELS_DO(TMFY_IS_ENTRY)
#undef TMFY_IS_ENTRY
  return false;
}

void TmfyStringCoding::count(Counter counter) {
  if (TmfyStringCodingCounters) _counters[counter].fetch_then_add((jlong)1, memory_order_relaxed);
}

jlong TmfyStringCoding::counter(Counter counter) {
  return _counters[counter].load_relaxed();
}

// Signed subtraction follows nonnegative checks, so offset+length cannot wrap.
// No raw element pointer is formed before all range/work checks have succeeded.
static bool valid_range(typeArrayOopDesc* input, jint offset, jint length) {
  return input != nullptr && offset >= 0 && length >= 0 &&
         offset <= input->length() && length <= input->length() - offset;
}

static jint reject(jint status) {
  TmfyStringCoding::count(TmfyStringCoding::rejections);
  return status;
}


jint TmfyStringCoding::encode_latin1_utf8(typeArrayOopDesc* input, jint offset, jint length,
                                    typeArrayOopDesc* output, jint output_offset, jint capacity) {
  NoSafepointVerifier nsv;
  if (!valid_range(input, offset, length) || !valid_range(output, output_offset, capacity) ||
      input == output || length > capacity / 2) return reject(TMFY_BAD_ARGUMENT);
  if ((uint32_t)length > TMFY_CONVERT_MAX_BYTES) return reject(TMFY_NEEDS_GENERAL);
  count(leaf_calls);
  const uint8_t* bytes = length == 0 ? nullptr : (const uint8_t*)input->byte_at_addr(offset);
  uint8_t* destination = capacity == 0 ? nullptr : (uint8_t*)output->byte_at_addr(output_offset);
  return tmfy_encode_latin1_utf8(bytes, length, destination, capacity);
}

jint TmfyStringCoding::encode_utf16_utf8(typeArrayOopDesc* input, jint offset, jint length,
                                       typeArrayOopDesc* output, jint output_offset, jint capacity) {
  NoSafepointVerifier nsv;
  if (!valid_range(input, offset, length) || !valid_range(output, output_offset, capacity) ||
      input == output || (offset & 1) != 0 || (length & 1) != 0 ||
      (jlong)(length / 2) * 3 > capacity) return reject(TMFY_BAD_ARGUMENT);
  if ((uint32_t)length > TMFY_CONVERT_MAX_BYTES) return reject(TMFY_NEEDS_GENERAL);
  count(leaf_calls);
  const uint8_t* bytes = length == 0 ? nullptr : (const uint8_t*)input->byte_at_addr(offset);
  uint8_t* destination = capacity == 0 ? nullptr : (uint8_t*)output->byte_at_addr(output_offset);
  return tmfy_encode_utf16_utf8(bytes, length, destination, capacity);
}

jint TmfyStringCoding::decode_utf8_utf16(typeArrayOopDesc* input, jint offset, jint length,
                                       typeArrayOopDesc* output, jint output_offset, jint capacity) {
  NoSafepointVerifier nsv;
  if (!valid_range(input, offset, length) || !valid_range(output, output_offset, capacity) ||
      input == output || (output_offset & 1) != 0 || (capacity & 1) != 0 ||
      length > capacity / 2) return reject(TMFY_BAD_ARGUMENT);
  if ((uint32_t)length > TMFY_CONVERT_MAX_BYTES) return reject(TMFY_NEEDS_GENERAL);
  count(leaf_calls);
  const uint8_t* bytes = length == 0 ? nullptr : (const uint8_t*)input->byte_at_addr(offset);
  uint8_t* destination = capacity == 0 ? nullptr : (uint8_t*)output->byte_at_addr(output_offset);
  return tmfy_decode_utf8_utf16(bytes, length, destination, capacity);
}
