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
 *
 */

#include "classfile/javaClasses.inline.hpp"
#include "memory/allocation.hpp"
#include "oops/typeArrayOop.inline.hpp"
#include "runtime/globals.hpp"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/pcre2Regex.hpp"

#if INCLUDE_PCRE2_REGEX
extern "C" {
  void* jdk_regex_compile(const unsigned char* pattern, size_t length, unsigned int flags, size_t groups, bool jit, unsigned int threshold);
  void* jdk_regex_compile16(const unsigned char*, size_t, unsigned int, size_t, bool, unsigned int);
  void jdk_regex_free(void* handle);
  void jdk_regex_free16(void* handle);
  void jdk_regex_memory_stats(int64_t* values);
  void jdk_regex_route_stats(const void*, const void*, int64_t*);
  int jdk_regex_match16_safepoint(const void*, const uint16_t*, size_t, int*, size_t);
  int jdk_regex_match(const void* handle, const unsigned char* bytes, int* state);
  int jdk_regex_match_safepoint(const void* handle, const unsigned char* bytes, size_t length,
                              int* state, size_t state_length);
}
#endif

JRT_LEAF(jint, Pcre2Regex::match(jlong handle, address bytes, address state))
#if INCLUDE_PCRE2_REGEX
  if (handle != 0) {
    return jdk_regex_match(reinterpret_cast<void*>(static_cast<intptr_t>(handle)), bytes,
                           reinterpret_cast<int*>(state));
  }
#endif
  return -1;
JRT_END

JNI_ENTRY(jboolean, RR_enabled(JNIEnv* env, jclass cls))
  return INCLUDE_PCRE2_REGEX && UsePcre2Regex;
JNI_END

JNI_ENTRY(jint, RR_javaTier(JNIEnv* env, jclass cls))
  return !UseCompiler ? 0 : (TieredCompilation && TieredStopAtLevel < 4 ? 1 : 2);
JNI_END

JNI_ENTRY(jlong, RR_compile(JNIEnv* env, jclass cls, jbyteArray pattern, jint flags, jint groups))
#if INCLUDE_PCRE2_REGEX
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
    handle = jdk_regex_compile(copy, length, flags, groups, UsePcre2RegexJIT, Pcre2RegexJITThreshold);
  }
  return static_cast<jlong>(reinterpret_cast<intptr_t>(handle));
#else
  return 0;
#endif
JNI_END

JNI_ENTRY(jlong, RR_compile16(JNIEnv* env, jclass cls, jbyteArray pattern, jint flags, jint groups))
#if INCLUDE_PCRE2_REGEX
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
    handle = jdk_regex_compile16(copy, length, flags, groups, UsePcre2RegexJIT, Pcre2RegexJITThreshold);
  }
  return static_cast<jlong>(reinterpret_cast<intptr_t>(handle));
#else
  return 0;
#endif
JNI_END

JNI_ENTRY(void, RR_free(JNIEnv* env, jclass cls, jlong handle))
#if INCLUDE_PCRE2_REGEX
  ThreadToNativeFromVM ttn(THREAD);
  jdk_regex_free(reinterpret_cast<void*>(static_cast<intptr_t>(handle)));
#endif
JNI_END

JNI_ENTRY(void, RR_free16(JNIEnv* env, jclass cls, jlong handle))
#if INCLUDE_PCRE2_REGEX
  ThreadToNativeFromVM ttn(THREAD);
  jdk_regex_free16(reinterpret_cast<void*>(static_cast<intptr_t>(handle)));
#endif
JNI_END

JNI_ENTRY(jint, RR_match(JNIEnv* env, jclass cls, jlong handle, jbyteArray input, jintArray state))
  typeArrayOop bytes = typeArrayOop(JNIHandles::resolve_non_null(input));
  typeArrayOop slots = typeArrayOop(JNIHandles::resolve_non_null(state));
  return Pcre2Regex::match(handle, reinterpret_cast<address>(bytes->base(T_BYTE)),
                         reinterpret_cast<address>(slots->base(T_INT)));
JNI_END

JNI_ENTRY(jint, RR_matchSafepoint(JNIEnv* env, jclass cls, jlong handle, jbyteArray input, jintArray state))
#if INCLUDE_PCRE2_REGEX
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

JNI_ENTRY(jint, RR_match16Safepoint(JNIEnv* env, jclass cls, jlong handle, jstring input, jintArray state, jboolean qualified_bmp))
#if INCLUDE_PCRE2_REGEX
  if (handle == 0) return -1;
  jint copy_state[70];
  int slots, base, from, length;
  {
    oop string = JNIHandles::resolve_non_null(input);
    typeArrayOop output = typeArrayOop(JNIHandles::resolve_non_null(state));
    slots = output->length();
    if (slots < 6 || slots > 70) return -1;
    base = slots - 4;
    memcpy(copy_state, output->base(T_INT), slots * sizeof(jint));
    from = copy_state[base];
    int to = copy_state[base+1];
    int start = copy_state[base+2];
    int mode = copy_state[base+3];
    if (java_lang_String::is_latin1(string) || from < 0 || to < from ||
        to > java_lang_String::length(string) || to - from > 65536 ||
        start < from || start > to || mode < 0 || mode > 2) return -1;
    length = to - from;
  }
  uint16_t* copy = NEW_C_HEAP_ARRAY_RETURN_NULL(uint16_t, MAX2(length, 1), mtInternal);
  if (copy == nullptr) return -1;
  bool qualified = true;
  {
    typeArrayOop bytes = java_lang_String::value(JNIHandles::resolve_non_null(input));
    // StringUTF16 uses native-order code units. No heap pointer is retained,
    // and qualification visits only the opaque region being copied.
    if (qualified_bmp) {
      memcpy(copy, bytes->char_at_addr(from), length * sizeof(uint16_t));
    } else for (int i = 0; i < length; i++) {
      uint16_t c = bytes->char_at(from + i);
      if ((c >= 0xd800 && c <= 0xdfff) || c == 0x2028 || c == 0x2029) {
        qualified = false;
        break;
      }
      copy[i] = c;
    }
  } // No raw oop or heap address survives the native transition.
  if (!qualified) { FREE_C_HEAP_ARRAY(copy); return -3; }
  copy_state[base] = 0;
  copy_state[base+1] = length;
  copy_state[base+2] -= from;
  int result;
  {
    ThreadToNativeFromVM ttn(THREAD);
    result = jdk_regex_match16_safepoint(reinterpret_cast<void*>(static_cast<intptr_t>(handle)),
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

JNI_ENTRY(jlongArray, RR_memoryStats(JNIEnv* env, jclass cls))
  jlong values[5] = {0, 0, 0, 0, 0};
#if INCLUDE_PCRE2_REGEX
  int64_t snapshot[5];
  jdk_regex_memory_stats(snapshot);
  for (int i = 0; i < 5; i++) values[i] = snapshot[i];
#endif
  jlongArray result = env->NewLongArray(5);
  if (result != nullptr) env->SetLongArrayRegion(result, 0, 5, values);
  return result;
JNI_END

JNI_ENTRY(jlongArray, RR_routeStats(JNIEnv* env, jclass cls, jlong narrow, jlong wide))
  jlong values[24] = {};
#if INCLUDE_PCRE2_REGEX
  int64_t snapshot[24];
  jdk_regex_route_stats(reinterpret_cast<void*>(static_cast<intptr_t>(narrow)),
                       reinterpret_cast<void*>(static_cast<intptr_t>(wide)), snapshot);
  for (int i = 0; i < 24; i++) values[i] = snapshot[i];
#endif
  jlongArray result = env->NewLongArray(24);
  if (result != nullptr) env->SetLongArrayRegion(result, 0, 24, values);
  return result;
JNI_END

extern "C" void JNICALL JVM_RegisterPcre2RegexMethods(JNIEnv* env, jclass cls) {
  static const JNINativeMethod methods[] = {
    {const_cast<char*>("routeStats0"), const_cast<char*>("(JJ)[J"), CAST_FROM_FN_PTR(void*, RR_routeStats)},
    {const_cast<char*>("nativeMemoryStats"), const_cast<char*>("()[J"), CAST_FROM_FN_PTR(void*, RR_memoryStats)},
    {const_cast<char*>("enabled0"), const_cast<char*>("()Z"), CAST_FROM_FN_PTR(void*, RR_enabled)},
    {const_cast<char*>("javaTier0"), const_cast<char*>("()I"), CAST_FROM_FN_PTR(void*, RR_javaTier)},
    {const_cast<char*>("compile0"), const_cast<char*>("([BII)J"), CAST_FROM_FN_PTR(void*, RR_compile)},
    {const_cast<char*>("compile16_0"), const_cast<char*>("([BII)J"), CAST_FROM_FN_PTR(void*, RR_compile16)},
    {const_cast<char*>("free16_0"), const_cast<char*>("(J)V"), CAST_FROM_FN_PTR(void*, RR_free16)},
    {const_cast<char*>("match16Safepoint0"), const_cast<char*>("(JLjava/lang/String;[IZ)I"), CAST_FROM_FN_PTR(void*, RR_match16Safepoint)},
    {const_cast<char*>("free0"), const_cast<char*>("(J)V"), CAST_FROM_FN_PTR(void*, RR_free)},
    {const_cast<char*>("match0"), const_cast<char*>("(J[B[I)I"), CAST_FROM_FN_PTR(void*, RR_match)},
    {const_cast<char*>("matchSafepoint0"), const_cast<char*>("(J[B[I)I"), CAST_FROM_FN_PTR(void*, RR_matchSafepoint)}
  };
  env->RegisterNatives(cls, methods, sizeof(methods) / sizeof(methods[0]));
}
