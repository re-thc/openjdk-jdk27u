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
#include "kernels.h"
#include "vendor/simdutf/simdutf.h"

#include <atomic>

// The library owns these immutable process-lifetime implementation objects.
// Initialization is outside borrowed-heap-pointer calls. Release/acquire makes
// the once-selected implementation available to all Java and JNI callers.
static std::atomic<const simdutf::implementation*> implementation(nullptr);
static_assert(ATOMIC_POINTER_LOCK_FREE == 2, "leaf dispatch requires lock-free pointer loads");

extern "C" int32_t tmfy_runtime_initialize(void) {
  if (implementation.load(std::memory_order_acquire) != nullptr) {
    return 0;
  }
  const simdutf::implementation* selected = nullptr;
  // The upstream list is ordered fastest first. Selecting from the list also
  // excludes its "unsupported" sentinel, whose ISA mask alone is zero.
  for (const simdutf::implementation* candidate : simdutf::get_available_implementations()) {
    if (candidate->supported_by_runtime_system()) {
      selected = candidate;
      break;
    }
  }
  if (selected == nullptr) {
    return TMFY_NOT_INITIALIZED;
  }
  const simdutf::implementation* expected = nullptr;
  implementation.compare_exchange_strong(expected, selected,
                                          std::memory_order_release,
                                          std::memory_order_relaxed);
  return 0;
}

extern "C" const char* tmfy_implementation_name(void) {
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) {
    return "uninitialized";
  }
  // These ISA requirements identify the pinned 7.3.6 implementations without
  // constructing the std::string returned by the upstream metadata API.
  const uint32_t required = selected->required_instruction_sets();
  using namespace simdutf::internal;
  if (required & AVX512BW) return "icelake";
  if (required & AVX2) return "haswell";
  if (required & SSE42) return "westmere";
  if (required & NEON) return "arm64";
  if (required & ALTIVEC) return "ppc64";
  if (required & LASX) return "lasx";
  if (required & LSX) return "lsx";
  if (required & RVV) return "rvv";
  return required == 0 ? "fallback" : "unknown-simdutf-implementation";
}

extern "C" int32_t tmfy_encode_latin1_utf8(const uint8_t* input, size_t length,
                                           uint8_t* output, size_t capacity) {
  if (length > TMFY_CONVERT_MAX_BYTES) {
    return TMFY_NEEDS_GENERAL;
  }
  if (length == 0) {
    return 0;
  }
  if (input == nullptr || output == nullptr || length > capacity / 2) {
    return TMFY_BAD_ARGUMENT;
  }

  const size_t required = 2 * length; // Bounded above before multiplication.
  const uintptr_t source = reinterpret_cast<uintptr_t>(input);
  const uintptr_t target = reinterpret_cast<uintptr_t>(output);
  if (length > UINTPTR_MAX - source || required > UINTPTR_MAX - target ||
      (source <= target ? target - source < length : source - target < required)) {
    return TMFY_BAD_ARGUMENT;
  }
  const simdutf::implementation* selected = implementation.load(std::memory_order_acquire);
  if (selected == nullptr) {
    return TMFY_NOT_INITIALIZED;
  }

  // Every Latin1 byte is valid. The capacity and disjointness checks above are
  // sufficient for this total conversion; there is no error/replay after stores.
  // Direct virtual dispatch avoids simdutf's environment-dependent first-use
  // dispatcher and its initialization on a VM leaf path.
  return static_cast<int32_t>(selected->convert_latin1_to_utf8(
      reinterpret_cast<const char*>(input), length,
      reinterpret_cast<char*>(output)));
}
