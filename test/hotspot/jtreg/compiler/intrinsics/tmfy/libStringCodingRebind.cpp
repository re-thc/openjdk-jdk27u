/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
#include <jni.h>
#include <atomic>
#include <cstring>
#include <vector>

static std::atomic<jlong> replacement_calls(0);
static std::atomic<jlong> bridge_calls(0);

static jint JNICALL encode(JNIEnv* env, jclass, jbyteArray, jint, jint length,
                           jbyteArray output, jint position, jint capacity) {
    replacement_calls.fetch_add(1);
    jint units = length / 2;
    if (length < 0 || (length & 1) != 0 || output == nullptr || position < 0 ||
        capacity < units || position > env->GetArrayLength(output) - units) return -2;
    std::vector<jbyte> bytes(units, '#');
    env->SetByteArrayRegion(output, position, units, bytes.data());
    return units;
}
static jint JNICALL decode(JNIEnv* env, jclass, jbyteArray, jint, jint length,
                           jbyteArray output, jint position, jint capacity) {
    replacement_calls.fetch_add(1);
    if (length < 0 || output == nullptr || position < 0 || capacity / 2 < length ||
        position > env->GetArrayLength(output) ||
        length > (env->GetArrayLength(output) - position) / 2) return -2;
    std::vector<jchar> chars(length, 0x2603);
    env->SetByteArrayRegion(output, position, length * 2,
                           reinterpret_cast<const jbyte*>(chars.data()));
    return length;
}
static jboolean JNICALL bridge(JNIEnv*, jclass) {
    bridge_calls.fetch_add(1);
    return JNI_FALSE;
}
static jint replace_bridge(JNIEnv* env, jclass holder) {
    JNINativeMethod method = {const_cast<char*>("registerNatives"),
                             const_cast<char*>("()Z"), reinterpret_cast<void*>(bridge)};
    return env->RegisterNatives(holder, &method, 1);
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingRebind_rebind(JNIEnv* env, jclass, jclass holder) {
    JNINativeMethod methods[] = {
        {const_cast<char*>("encodeUtf16Utf80"), const_cast<char*>("([BII[BII)I"), reinterpret_cast<void*>(encode)},
        {const_cast<char*>("decodeUtf8Utf160"), const_cast<char*>("([BII[BII)I"), reinterpret_cast<void*>(decode)}
    };
    return env->RegisterNatives(holder, methods, 2);
}
extern "C" JNIEXPORT jlong JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingRebind_calls(JNIEnv*, jclass) {
    return replacement_calls.load();
}
#define BRIDGE_EXPORTS(CLASS) \
extern "C" JNIEXPORT jint JNICALL Java_compiler_intrinsics_tmfy_##CLASS##_rebindBridge(JNIEnv* env, jclass, jclass holder) { \
    return replace_bridge(env, holder); \
} \
extern "C" JNIEXPORT jlong JNICALL Java_compiler_intrinsics_tmfy_##CLASS##_bridgeCalls(JNIEnv*, jclass) { \
    return bridge_calls.load(); \
}
BRIDGE_EXPORTS(TestStringCodingC1Admission)
BRIDGE_EXPORTS(TestStringCodingTierAdmission)

static jint JNICALL fail_after_store(JNIEnv* env, jclass, jbyteArray, jint, jint,
                                     jbyteArray output, jint position, jint capacity) {
    replacement_calls.fetch_add(1);
    if (output != nullptr && capacity > 0 && position >= 0 && position < env->GetArrayLength(output)) {
        jbyte value = 0x5a;
        env->SetByteArrayRegion(output, position, 1, &value);
    }
    return -2;
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingUtf16Failure_install(JNIEnv* env, jclass, jclass holder) {
    JNINativeMethod methods[] = {
        {const_cast<char*>("encodeUtf16Utf80"), const_cast<char*>("([BII[BII)I"), reinterpret_cast<void*>(fail_after_store)},
        {const_cast<char*>("decodeUtf8Utf160"), const_cast<char*>("([BII[BII)I"), reinterpret_cast<void*>(fail_after_store)}
    };
    return env->RegisterNatives(holder, methods, 2);
}
extern "C" JNIEXPORT jlong JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingUtf16Failure_calls(JNIEnv*, jclass) {
    return replacement_calls.load();
}
