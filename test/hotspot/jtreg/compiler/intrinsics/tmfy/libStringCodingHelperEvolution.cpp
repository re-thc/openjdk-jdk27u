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
#include <jvmti.h>
#include <vector>
static jvmtiEnv* tooling = nullptr;
extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
    if (vm->GetEnv(reinterpret_cast<void**>(&tooling), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
    jvmtiCapabilities caps = {};
    caps.can_redefine_classes = 1;
    return tooling->AddCapabilities(&caps) == JVMTI_ERROR_NONE ? JNI_OK : JNI_ERR;
}
extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingHelperEvolution_redefine(JNIEnv* env, jclass, jclass holder, jbyteArray bytes) {
    if (tooling == nullptr) return JVMTI_ERROR_INVALID_ENVIRONMENT;
    std::vector<unsigned char> data(env->GetArrayLength(bytes));
    env->GetByteArrayRegion(bytes, 0, static_cast<jsize>(data.size()), reinterpret_cast<jbyte*>(data.data()));
    if (env->ExceptionCheck()) return JVMTI_ERROR_INTERNAL;
    jvmtiClassDefinition definition = {holder, static_cast<jint>(data.size()), data.data()};
    return tooling->RedefineClasses(1, &definition);
}
