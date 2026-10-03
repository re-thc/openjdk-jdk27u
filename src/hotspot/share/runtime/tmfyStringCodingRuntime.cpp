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
