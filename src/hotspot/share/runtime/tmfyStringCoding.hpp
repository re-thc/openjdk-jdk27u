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

#ifndef SHARE_RUNTIME_TMFY_HPP
#define SHARE_RUNTIME_TMFY_HPP

#include "classfile/vmIntrinsics.hpp"
#include "memory/allStatic.hpp"
#include "oops/oopsHierarchy.hpp"
#include "runtime/atomic.hpp"

class JavaThread;
class Method;

// VM-only adapters. Portable engines never see oops, JNI or HotSpot headers.
// Machine-facing arguments MUST be raw descriptor pointers: typeArrayOop is a
// nontrivial wrapper under CHECK_UNHANDLED_OOPS and has a different C ABI.
class TmfyStringCoding : AllStatic {
 public:
  enum Counter { leaf_calls, jni_calls, rejections, charset_leaf_calls, charset_jni_calls, counter_count };
  static bool is_intrinsic(vmIntrinsics::ID id);
  static bool is_supported(vmIntrinsics::ID id);
  static int signature(vmIntrinsics::ID id, BasicType* arguments, BasicType* result);
  static address entry_for(vmIntrinsics::ID id);
  static bool is_entry(address entry);
  static void count(Counter counter);
  static jlong counter(Counter counter);
  static bool initialize();
  static jint initialize_from_java(JavaThread* thread);
  // Returns the exact typed target only for the pristine bootstrap policy body.
  // Does not resolve classes, allocate, initialize the backend, or safepoint.
  static Method* charset_admission_target(Method* policy);
  // A non-null return PC restricts interpreter admission to interpreted callers.
  // -1 requests the ordinary Java entry so tooling can observe method events.
  static jint charset_admitted(Method* policy, address caller_pc = nullptr);
  static address initialized_address() {
    return reinterpret_cast<address>(&_initialized) + _initialized.value_offset_in_bytes();
  }

  static jint encode_latin1_utf8(typeArrayOopDesc* input, jint offset, jint length,
                                typeArrayOopDesc* output, jint output_offset, jint capacity);
  static jint encode_utf16_utf8(typeArrayOopDesc* input, jint offset, jint length,
                               typeArrayOopDesc* output, jint output_offset, jint capacity);
  static jint decode_utf8_utf16(typeArrayOopDesc* input, jint offset, jint length,
                               typeArrayOopDesc* output, jint output_offset, jint capacity);
  static jint encode_utf16_array_utf8(typeArrayOopDesc* input, jint offset, jint length,
                                    typeArrayOopDesc* output, jint output_offset, jint capacity);

 private:
  static Atomic<jlong> _counters[counter_count];
  static Atomic<uint8_t> _initialized;
};
#endif // SHARE_RUNTIME_TMFY_HPP
