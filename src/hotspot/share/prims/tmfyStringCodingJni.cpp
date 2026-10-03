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

#include "jvm.h"
#include "classfile/javaClasses.hpp"
#include "logging/log.hpp"
#include "tmfy/kernels.h"
#include "runtime/interfaceSupport.inline.hpp"
#include "runtime/tmfyStringCoding.hpp"
#include "runtime/tmfyStringCodingTooling.hpp"
#include "runtime/jniHandles.inline.hpp"
#include "runtime/init.hpp"

static bool jni_range(JNIEnv* env, jarray array, jint offset, jint length) {
  if (array == nullptr || offset < 0 || length < 0) return false;
  jsize size = env->GetArrayLength(array);
  return offset <= size && length <= size - offset;
}

enum class Conversion { latin1_utf8, utf16_utf8, utf8_utf16 };

static jint tmfy_convert(JNIEnv* env, Conversion conversion, jbyteArray input, jint offset, jint length,
                         jbyteArray output, jint output_offset, jint capacity) {
  TmfyStringCoding::count(TmfyStringCoding::jni_calls);
  if (!jni_range(env, input, offset, length) || !jni_range(env, output, output_offset, capacity) ||
      env->IsSameObject(input, output)) return TMFY_BAD_ARGUMENT;
  if (conversion == Conversion::utf16_utf8) {
    if ((offset & 1) != 0 || (length & 1) != 0 ||
        (jlong)(length / 2) * 3 > capacity) return TMFY_BAD_ARGUMENT;
  } else {
    if (length > capacity / 2) return TMFY_BAD_ARGUMENT;
    if (conversion == Conversion::utf8_utf16 &&
        ((output_offset & 1) != 0 || (capacity & 1) != 0)) return TMFY_BAD_ARGUMENT;
  }
  if ((uint32_t)length > TMFY_CONVERT_MAX_BYTES) return TMFY_NEEDS_GENERAL;
  if (length == 0) return 0;
  // Ordinary JNI transition, bounded copies, and no retained or pinned Java
  // pointer. Only the successful converter result is copied into the output.
  uint8_t source[TMFY_CONVERT_MAX_BYTES];
  uint8_t destination[TMFY_CONVERT_MAX_BYTES * 2];
  env->GetByteArrayRegion(input, offset, length, (jbyte*)source);
  if (env->ExceptionCheck()) return TMFY_BAD_ARGUMENT;
  jint result;
  switch (conversion) {
    case Conversion::latin1_utf8:
      result = tmfy_encode_latin1_utf8(source, length, destination, sizeof(destination)); break;
    case Conversion::utf16_utf8:
      result = tmfy_encode_utf16_utf8(source, length, destination, sizeof(destination)); break;
    case Conversion::utf8_utf16:
      result = tmfy_decode_utf8_utf16(source, length, destination, sizeof(destination)); break;
    default: ShouldNotReachHere(); return TMFY_INTERNAL_ERROR;
  }
  if (result >= 0) {
    if (result > (jint)sizeof(destination)) return TMFY_INTERNAL_ERROR;
    jint written = conversion == Conversion::utf8_utf16 ? result * 2 : result;
    if (written > capacity || written > (jint)sizeof(destination)) return TMFY_INTERNAL_ERROR;
    env->SetByteArrayRegion(output, output_offset, written, (const jbyte*)destination);
  }
  return result;
}

static jint JNICALL tmfy_encode_latin1(JNIEnv* env, jclass, jbyteArray input, jint offset, jint length,
                                     jbyteArray output, jint output_offset, jint capacity) {
  return tmfy_convert(env, Conversion::latin1_utf8, input, offset, length, output, output_offset, capacity);
}

static jint JNICALL tmfy_encode_utf16(JNIEnv* env, jclass, jbyteArray input, jint offset, jint length,
                                    jbyteArray output, jint output_offset, jint capacity) {
  return tmfy_convert(env, Conversion::utf16_utf8, input, offset, length, output, output_offset, capacity);
}

static jint JNICALL tmfy_decode_utf8(JNIEnv* env, jclass, jbyteArray input, jint offset, jint length,
                                   jbyteArray output, jint output_offset, jint capacity) {
  return tmfy_convert(env, Conversion::utf8_utf16, input, offset, length, output, output_offset, capacity);
}

static jlongArray JNICALL tmfy_counters(JNIEnv* env, jclass) {
  jlong values[TmfyStringCoding::counter_count];
  for (int i = 0; i < TmfyStringCoding::counter_count; ++i) values[i] = TmfyStringCoding::counter((TmfyStringCoding::Counter)i);
  jlongArray result = env->NewLongArray(TmfyStringCoding::counter_count);
  if (result != nullptr) env->SetLongArrayRegion(result, 0, TmfyStringCoding::counter_count, values);
  return result;
}

static JNINativeMethod tmfy_methods[] = {
  { (char*)"encodeLatin1Utf80", (char*)"([BII[BII)I", (void*)&tmfy_encode_latin1 },
  { (char*)"encodeUtf16Utf80", (char*)"([BII[BII)I", (void*)&tmfy_encode_utf16 },
  { (char*)"decodeUtf8Utf160", (char*)"([BII[BII)I", (void*)&tmfy_decode_utf8 },
  { (char*)"counters0", (char*)"()[J", (void*)&tmfy_counters }
};

static jint JNICALL tmfy_encode_utf16_array(JNIEnv* env, jclass, jcharArray input, jint offset, jint length,
                                          jbyteArray output, jint output_offset, jint capacity) {
  TmfyStringCoding::count(TmfyStringCoding::jni_calls);
  TmfyStringCoding::count(TmfyStringCoding::charset_jni_calls);
  if (!jni_range(env, input, offset, length) || !jni_range(env, output, output_offset, capacity) ||
      (jlong)length * 3 > capacity) return TMFY_BAD_ARGUMENT;
  if ((uint32_t)length > TMFY_CHARSET_MAX_UNITS) return TMFY_NEEDS_GENERAL;
  // Ordinary JNI uses bounded copies; no pin survives a JNI operation. The
  // kernel returns the verified prefix even when its next character is invalid.
  uint16_t source[TMFY_CHARSET_MAX_UNITS];
  uint8_t destination[TMFY_CHARSET_MAX_UNITS * 3];
  if (length != 0) env->GetCharArrayRegion(input, offset, length, (jchar*)source);
  if (env->ExceptionCheck()) return TMFY_BAD_ARGUMENT;
  jint result = tmfy_encode_utf16_array_utf8(source, length, destination, sizeof(destination));
  if (result >= 0) {
    jint written = result & 0x1fff;
    if (written > capacity || written > (jint)sizeof(destination)) return TMFY_INTERNAL_ERROR;
    if (written != 0) env->SetByteArrayRegion(output, output_offset, written, (const jbyte*)destination);
  }
  return result;
}

static JNINativeMethod tmfy_charset_methods[] = {
  { (char*)"encodeUtf16ArrayUtf80", (char*)"([CII[BII)I", (void*)&tmfy_encode_utf16_array }
};

JVM_ENTRY(jboolean, JVM_RegisterTmfyStringCodingMethods(JNIEnv* env, jclass cls))
  if (!is_init_completed() || !TmfyStringCoding::initialize()) return JNI_FALSE;
  if (!TmfyStringCodingTooling::prepare_registration(
          java_lang_Class::as_Klass(JNIHandles::resolve_non_null(cls)),
          tmfy_methods, ARRAY_SIZE(tmfy_methods))) return JNI_FALSE;
  ThreadToNativeFromVM ttnfv(thread);
  if (env->RegisterNatives(cls, tmfy_methods, ARRAY_SIZE(tmfy_methods)) != 0) return JNI_FALSE;
  log_info(tmfy)("UTF-8 conversion backend=%s intrinsic_requested=%s", tmfy_implementation_name(),
                 UseTmfyStringCoding ? "true" : "false");
  return JNI_TRUE;
JVM_END

JVM_ENTRY(jboolean, JVM_RegisterTmfyCharsetEncoderMethods(JNIEnv* env, jclass cls))
  if (!is_init_completed() || !TmfyStringCoding::initialize()) return JNI_FALSE;
  if (!TmfyStringCodingTooling::prepare_registration(
          java_lang_Class::as_Klass(JNIHandles::resolve_non_null(cls)),
          tmfy_charset_methods, ARRAY_SIZE(tmfy_charset_methods))) return JNI_FALSE;
  ThreadToNativeFromVM ttnfv(thread);
  if (env->RegisterNatives(cls, tmfy_charset_methods, ARRAY_SIZE(tmfy_charset_methods)) != 0) return JNI_FALSE;
  return JNI_TRUE;
JVM_END
