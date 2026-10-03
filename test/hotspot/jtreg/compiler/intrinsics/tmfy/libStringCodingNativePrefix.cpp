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
#include <atomic>
#include <cstdio>
#include <cstring>
#include <vector>

static std::vector<unsigned char> replacement;
static std::atomic<int> transformed(0);

static void JNICALL on_class_file_load(jvmtiEnv* tooling, JNIEnv*, jclass redefining,
                                       jobject loader, const char* name, jobject,
                                       jint, const unsigned char*, jint* new_length,
                                       unsigned char** new_bytes) {
    if (name == nullptr || std::strcmp(name, "java/lang/StringCoding") != 0) return;
    if (loader != nullptr || redefining != nullptr || transformed.load() != 0) {
        transformed.store(-1);
        return;
    }
    unsigned char* bytes = nullptr;
    if (tooling->Allocate(replacement.size(), &bytes) != JVMTI_ERROR_NONE) {
        transformed.store(-1);
        return;
    }
    std::memcpy(bytes, replacement.data(), replacement.size());
    *new_length = static_cast<jint>(replacement.size());
    *new_bytes = bytes;
    transformed.store(1);
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char* options, void*) {
    if (options == nullptr) return JNI_ERR;
    FILE* file = std::fopen(options, "rb");
    if (file == nullptr) return JNI_ERR;
    unsigned char buffer[4096];
    size_t count;
    while ((count = std::fread(buffer, 1, sizeof(buffer), file)) != 0) {
        replacement.insert(replacement.end(), buffer, buffer + count);
    }
    bool failed = std::ferror(file) != 0;
    std::fclose(file);
    if (failed || replacement.empty() || replacement.size() > 1024 * 1024) return JNI_ERR;

    jvmtiEnv* tooling = nullptr;
    if (vm->GetEnv(reinterpret_cast<void**>(&tooling), JVMTI_VERSION_1_2) != JNI_OK) return JNI_ERR;
    jvmtiCapabilities capabilities = {};
    capabilities.can_generate_all_class_hook_events = 1;
    capabilities.can_generate_early_class_hook_events = 1;
    capabilities.can_set_native_method_prefix = 1;
    // NativeMethodBind capability would independently revoke the leaves and
    // conceal a missing catalogue-mismatch revocation in the bridge.
    if (tooling->AddCapabilities(&capabilities) != JVMTI_ERROR_NONE ||
            tooling->SetNativeMethodPrefix("tmfy_prefix_") != JVMTI_ERROR_NONE) return JNI_ERR;
    jvmtiEventCallbacks callbacks = {};
    callbacks.ClassFileLoadHook = on_class_file_load;
    if (tooling->SetEventCallbacks(&callbacks, sizeof(callbacks)) != JVMTI_ERROR_NONE ||
            tooling->SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_CLASS_FILE_LOAD_HOOK, nullptr)
                    != JVMTI_ERROR_NONE) return JNI_ERR;
    return JNI_OK;
}

extern "C" JNIEXPORT jint JNICALL
Java_compiler_intrinsics_tmfy_TestStringCodingNativePrefix_transformed0(JNIEnv*, jclass) {
    return transformed.load();
}
