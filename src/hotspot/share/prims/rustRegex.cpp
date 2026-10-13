/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 *
 */

#include "memory/allocation.hpp"
#include "oops/typeArrayOop.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/rustRegex.hpp"

#if INCLUDE_RUST_REGEX
extern "C" {
  void* jdk_regex_compile(const unsigned char* pattern, size_t length, unsigned int flags, size_t groups);
  void jdk_regex_free(void* handle);
  int jdk_regex_match(const void* handle, const unsigned char* bytes, int* state);
  int jdk_regex_match_safepoint(const void* handle, const unsigned char* bytes, size_t length,
                              int* state, size_t state_length);
}
#endif

JRT_LEAF(jint, RustRegex::match(jlong handle, address bytes, address state))
#if INCLUDE_RUST_REGEX
  if (handle != 0) {
    return jdk_regex_match(reinterpret_cast<void*>(static_cast<intptr_t>(handle)), bytes,
                           reinterpret_cast<int*>(state));
  }
#endif
  return -1;
JRT_END

JNI_ENTRY(jboolean, RR_enabled(JNIEnv* env, jclass cls))
  return INCLUDE_RUST_REGEX && UseRustRegex;
JNI_END

JNI_ENTRY(jlong, RR_compile(JNIEnv* env, jclass cls, jbyteArray pattern, jint flags, jint groups))
#if INCLUDE_RUST_REGEX
  int length;
  unsigned char copy[16384];
  {
    typeArrayOop array = typeArrayOop(JNIHandles::resolve_non_null(pattern));
    length = array->length();
    if (length > 16384 || groups < 1 || groups > 33) return 0;
    memcpy(copy, array->base(T_BYTE), length);
  } // No raw oop survives the transition to native state.
  void* handle;
  {
    ThreadToNativeFromVM ttn(THREAD);
    handle = jdk_regex_compile(copy, length, flags, groups);
  }
  return static_cast<jlong>(reinterpret_cast<intptr_t>(handle));
#else
  return 0;
#endif
JNI_END

JNI_ENTRY(void, RR_free(JNIEnv* env, jclass cls, jlong handle))
#if INCLUDE_RUST_REGEX
  ThreadToNativeFromVM ttn(THREAD);
  jdk_regex_free(reinterpret_cast<void*>(static_cast<intptr_t>(handle)));
#endif
JNI_END

JNI_ENTRY(jint, RR_match(JNIEnv* env, jclass cls, jlong handle, jbyteArray input, jintArray state))
  typeArrayOop bytes = typeArrayOop(JNIHandles::resolve_non_null(input));
  typeArrayOop slots = typeArrayOop(JNIHandles::resolve_non_null(state));
  return RustRegex::match(handle, reinterpret_cast<address>(bytes->base(T_BYTE)),
                         reinterpret_cast<address>(slots->base(T_INT)));
JNI_END

JNI_ENTRY(jint, RR_matchSafepoint(JNIEnv* env, jclass cls, jlong handle, jbyteArray input, jintArray state))
#if INCLUDE_RUST_REGEX
  if (handle == 0) return -1;
  jint copy_state[70];
  int slots, base, from, length;
  {
    typeArrayOop bytes = typeArrayOop(JNIHandles::resolve_non_null(input));
    typeArrayOop output = typeArrayOop(JNIHandles::resolve_non_null(state));
    slots = output->length();
    if (slots < 6 || slots > 70) return -1;
    base = slots - 4;
    memcpy(copy_state, output->base(T_INT), slots * sizeof(jint));
    from = copy_state[base];
    int to = copy_state[base+1];
    int start = copy_state[base+2];
    int mode = copy_state[base+3];
    if (from < 0 || to < from || to > bytes->length() || to - from > 65536 ||
        start < from || start > to || mode < 0 || mode > 2) return -1;
    length = to - from;
  }
  unsigned char* copy = NEW_C_HEAP_ARRAY_RETURN_NULL(unsigned char, MAX2(length, 1), mtInternal);
  if (copy == nullptr) return -1;
  {
    typeArrayOop bytes = typeArrayOop(JNIHandles::resolve_non_null(input));
    memcpy(copy, bytes->byte_at_addr(from), length);
  } // No raw oop or heap address survives the native transition.
  copy_state[base] = 0;
  copy_state[base+1] = length;
  copy_state[base+2] -= from;
  int result;
  {
    ThreadToNativeFromVM ttn(THREAD);
    result = jdk_regex_match_safepoint(reinterpret_cast<void*>(static_cast<intptr_t>(handle)),
                                     copy, length, copy_state, slots);
  }
  FREE_C_HEAP_ARRAY(copy);
  if (result >= 0) {
    typeArrayOop output = typeArrayOop(JNIHandles::resolve_non_null(state));
    for (int i = 0; i < base; i++) {
      output->int_at_put(i, copy_state[i] < 0 ? copy_state[i] : copy_state[i] + from);
    }
  }
  return result;
#else
  return -1;
#endif
JNI_END

extern "C" void JNICALL JVM_RegisterRustRegexMethods(JNIEnv* env, jclass cls) {
  static const JNINativeMethod methods[] = {
    {const_cast<char*>("enabled0"), const_cast<char*>("()Z"), CAST_FROM_FN_PTR(void*, RR_enabled)},
    {const_cast<char*>("compile0"), const_cast<char*>("([BII)J"), CAST_FROM_FN_PTR(void*, RR_compile)},
    {const_cast<char*>("free0"), const_cast<char*>("(J)V"), CAST_FROM_FN_PTR(void*, RR_free)},
    {const_cast<char*>("match0"), const_cast<char*>("(J[B[I)I"), CAST_FROM_FN_PTR(void*, RR_match)},
    {const_cast<char*>("matchSafepoint0"), const_cast<char*>("(J[B[I)I"), CAST_FROM_FN_PTR(void*, RR_matchSafepoint)}
  };
  env->RegisterNatives(cls, methods, sizeof(methods) / sizeof(methods[0]));
}
