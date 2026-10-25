/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

#include <jni.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>

extern int64_t jdk_instant_speedate_parse(const uint8_t *, size_t);

static jfieldID string_value;
static jfieldID string_coder;

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env;
    (void)reserved;
    if ((*vm)->GetEnv(vm, (void **)&env, JNI_VERSION_1_8) != JNI_OK) {
        return JNI_ERR;
    }
    jclass cls = (*env)->FindClass(env, "java/lang/String");
    if (cls == NULL) return JNI_ERR;
    string_value = (*env)->GetFieldID(env, cls, "value", "[B");
    if (string_value == NULL) return JNI_ERR;
    string_coder = (*env)->GetFieldID(env, cls, "coder", "B");
    if (string_coder == NULL) return JNI_ERR;
    return JNI_VERSION_1_8;
}

#ifndef INSTANT_SPEEDATE_NO_SYMBOL
JNIEXPORT jlong JNICALL Java_java_time_InstantParser_parse0
  (JNIEnv *env, jclass cls, jstring text) {
    (void)cls;
#ifdef INSTANT_SPEEDATE_FORCE_FAILURE
    return INT64_MIN;
#else
    if (text == NULL) return INT64_MIN;
    jbyte coder = (*env)->GetByteField(env, text, string_coder);
    if (coder != 0) {
        jsize len = (*env)->GetStringLength(env, text);
        if (len < 20 || len > 27) return INT64_MIN;
        char utf8[3 * 27 + 1];
        (*env)->GetStringUTFRegion(env, text, 0, len, utf8);
        if ((*env)->ExceptionCheck(env)) return INT64_MIN;
        // HotSpot terminates GetStringUTFRegion's output. Convert UTF-16 only
        // once; the compact representation below needs no conversion or copy.
        return (jlong)jdk_instant_speedate_parse((const uint8_t *)utf8, strlen(utf8));
    }
    jbyteArray value = (*env)->GetObjectField(env, text, string_value);
    if (value == NULL) return INT64_MIN;
    jsize len = (*env)->GetArrayLength(env, value);
    if (len < 20 || len > 27) return INT64_MIN;
    const jbyte *bytes = (*env)->GetPrimitiveArrayCritical(env, value, NULL);
    if (bytes == NULL) return INT64_MIN;
    // Speedate neither retains the pointer nor calls Java while this exact
    // array is pinned. Release the handle we acquired even if StringDedup runs.
    int64_t result = jdk_instant_speedate_parse((const uint8_t *)bytes, (size_t)len);
    (*env)->ReleasePrimitiveArrayCritical(env, value, (void *)bytes, JNI_ABORT);
    return (jlong)result;
#endif
}
#endif
