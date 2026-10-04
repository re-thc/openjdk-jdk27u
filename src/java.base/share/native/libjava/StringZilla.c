/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
#include "java_lang_StringZilla.h"
#include "StringZillaKernels.h"

JNIEXPORT jboolean JNICALL
Java_java_lang_StringZilla_isEnabled(JNIEnv* env, jclass ignored) {
    StringZilla_initialize();
    return JVM_StringZillaEnabled(env, ignored);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_findLatin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                JNI_FALSE, JNI_FALSE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_findUTF16(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                JNI_TRUE, JNI_FALSE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_rfindLatin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                JNI_FALSE, JNI_TRUE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_rfindUTF16(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                JNI_TRUE, JNI_TRUE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_findUTF16Latin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                2, JNI_FALSE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_rfindUTF16Latin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jbyteArray tgt, jint tgt_length) {
    return JVM_StringZillaSearch(env, ignored, src, offset, length, tgt, tgt_length,
                                2, JNI_TRUE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_findCharLatin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jint ch) {
    return JVM_StringZillaChar(env, ignored, src, offset, length, ch,
                              JNI_FALSE, JNI_FALSE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_findCharUTF16(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jint ch) {
    return JVM_StringZillaChar(env, ignored, src, offset, length, ch,
                              JNI_TRUE, JNI_FALSE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_rfindCharLatin1(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jint ch) {
    return JVM_StringZillaChar(env, ignored, src, offset, length, ch,
                              JNI_FALSE, JNI_TRUE);
}

JNIEXPORT jint JNICALL
Java_java_lang_StringZilla_rfindCharUTF16(JNIEnv* env, jclass ignored, jbyteArray src,
        jint offset, jint length, jint ch) {
    return JVM_StringZillaChar(env, ignored, src, offset, length, ch,
                              JNI_TRUE, JNI_TRUE);
}
