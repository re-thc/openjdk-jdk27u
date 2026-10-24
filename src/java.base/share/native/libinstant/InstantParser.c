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
