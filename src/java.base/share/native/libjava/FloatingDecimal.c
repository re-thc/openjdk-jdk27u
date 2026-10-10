/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

#include "jni.h"
#include "jvm.h"
#include "jdk_internal_math_FloatingDecimal.h"

JNIEXPORT jboolean JNICALL
Java_jdk_internal_math_FloatingDecimal_isFastFloatEnabled0(JNIEnv *env, jclass unused) {
    return JVM_IsFastFloatEnabled();
}

JNIEXPORT jdouble JNICALL
Java_jdk_internal_math_FloatingDecimal_parseFastFloat(JNIEnv *env, jclass unused,
                                                    jstring s, jint ix) {
    return JVM_ParseFastFloat(env, s, ix);
}

JNIEXPORT jdouble JNICALL
Java_jdk_internal_math_FloatingDecimal_parseFastFloatDigits(JNIEnv *env, jclass unused,
                                                          jbyteArray digits, jint length,
                                                          jint decExp) {
    return JVM_ParseFastFloatDigits(env, digits, length, decExp);
}
