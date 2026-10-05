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

#include "oops/typeArrayOop.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/rustRegex.hpp"

#if INCLUDE_RUST_REGEX
extern "C" {
  void* jdk_regex_compile(const unsigned char* pattern, size_t length);
  void jdk_regex_free(void* handle);
  unsigned char jdk_regex_may_match(const void* handle, const unsigned char* bytes, size_t length);
}
#endif

JRT_LEAF(jint, RustRegex::may_match(jlong handle, address bytes, jint length))
#if INCLUDE_RUST_REGEX
  if (handle != 0 && length >= 0 && length <= 65536) {
    return jdk_regex_may_match(reinterpret_cast<void*>(static_cast<intptr_t>(handle)), bytes, length);
  }
#endif
  return JNI_TRUE;
JRT_END

JNI_ENTRY(jboolean, RR_enabled(JNIEnv* env, jclass cls))
  return INCLUDE_RUST_REGEX && UseRustRegex;
JNI_END

JNI_ENTRY(jlong, RR_compile(JNIEnv* env, jclass cls, jbyteArray pattern))
#if INCLUDE_RUST_REGEX
  typeArrayOop array = typeArrayOop(JNIHandles::resolve_non_null(pattern));
  int length = array->length();
  if (length > 4096) return 0;
  unsigned char copy[4096];
  memcpy(copy, array->byte_at_addr(0), length);
  void* handle;
  {
    // DFA construction allocates and can be slow; allow GC during compilation.
    ThreadToNativeFromVM ttn(THREAD);
    handle = jdk_regex_compile(copy, length);
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

JNI_ENTRY(jboolean, RR_mayMatch(JNIEnv* env, jclass cls, jlong handle,
                               jbyteArray input, jint offset, jint length))
  typeArrayOop array = typeArrayOop(JNIHandles::resolve_non_null(input));
  if (offset < 0 || length < 0 || length > array->length() - offset) return JNI_TRUE;
  return RustRegex::may_match(handle, reinterpret_cast<address>(array->byte_at_addr(offset)), length);
JNI_END

extern "C" void JNICALL JVM_RegisterRustRegexMethods(JNIEnv* env, jclass cls) {
  static const JNINativeMethod methods[] = {
    {const_cast<char*>("enabled0"), const_cast<char*>("()Z"), CAST_FROM_FN_PTR(void*, RR_enabled)},
    {const_cast<char*>("compile0"), const_cast<char*>("([B)J"), CAST_FROM_FN_PTR(void*, RR_compile)},
    {const_cast<char*>("free0"), const_cast<char*>("(J)V"), CAST_FROM_FN_PTR(void*, RR_free)},
    {const_cast<char*>("mayMatch0"), const_cast<char*>("(J[BII)Z"), CAST_FROM_FN_PTR(void*, RR_mayMatch)}
  };
  env->RegisterNatives(cls, methods, sizeof(methods) / sizeof(methods[0]));
}
