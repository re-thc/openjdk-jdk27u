/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
#include <jni.h>
#include <stdint.h>
#include <stddef.h>

extern int64_t jdk_instant_speedate_parse(const uint8_t *, size_t);

#ifndef INSTANT_SPEEDATE_NO_SYMBOL
JNIEXPORT jlong JNICALL Java_java_time_InstantParser_parse0
  (JNIEnv *env, jclass cls, jstring text) {
    (void)cls;
#ifdef INSTANT_SPEEDATE_FORCE_FAILURE
    return INT64_MIN;
#else
    if (text == NULL) return INT64_MIN;
    jsize len = (*env)->GetStringLength(env, text);
    if (!(len == 20 || (len >= 22 && len <= 27))) return INT64_MIN;
    jchar chars[27];
    uint8_t ascii[27];
    (*env)->GetStringRegion(env, text, 0, len, chars);
    /* Never clear JVM exceptions. Bounds are checked above on immutable String. */
    if ((*env)->ExceptionCheck(env)) return INT64_MIN;
    for (jsize i = 0; i < len; i++) {
        if (chars[i] > 127) return INT64_MIN;
        ascii[i] = (uint8_t)chars[i];
    }
    return (jlong)jdk_instant_speedate_parse(ascii, (size_t)len);
#endif
}
#endif
