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

#include <algorithm>
#include <cstdlib>
#include <cstdint>
#include <memory>

#include "jni.h"
#include "hwy/contrib/sort/vqsort.h"
#include "hwy/targets.h"

// Each region access is a separate JNI transition. The array is never pinned;
// GC may move it while the private native buffer is being sorted. Chunking
// bounds the copying work between opportunities to honor a safepoint.
static constexpr jint COPY_CHUNK = 16384;
static constexpr jint MAX_SORT_SIZE = 1 << 20;

template<typename Array, typename T>
static bool sort_range(JNIEnv* env, Array array, jint low, jint size) {
    if (size < 0 || size > MAX_SORT_SIZE) {
        return false;
    }
    std::unique_ptr<T, decltype(&std::free)> storage(
            static_cast<T*>(std::malloc(static_cast<size_t>(size) * sizeof(T))),
            &std::free);
    T* buffer = storage.get();
    if (buffer == nullptr) {
        return false;
    }
    for (jint offset = 0; offset < size; offset += COPY_CHUNK) {
        jint count = std::min(COPY_CHUNK, size - offset);
        if constexpr (sizeof(T) == sizeof(jint)) {
            env->GetIntArrayRegion(reinterpret_cast<jintArray>(array), low + offset,
                                   count, reinterpret_cast<jint*>(buffer + offset));
        } else {
            env->GetLongArrayRegion(reinterpret_cast<jlongArray>(array), low + offset,
                                    count, reinterpret_cast<jlong*>(buffer + offset));
        }
        if (env->ExceptionCheck()) {
            return false;
        }
    }

    // VQSort is allocation-free. Its per-thread seed initialization, runtime
    // dispatch and entire sort execute in ordinary JNI native thread state.
    hwy::VQSort(buffer, static_cast<size_t>(size), hwy::SortAscending());

    for (jint offset = 0; offset < size; offset += COPY_CHUNK) {
        jint count = std::min(COPY_CHUNK, size - offset);
        if constexpr (sizeof(T) == sizeof(jint)) {
            env->SetIntArrayRegion(reinterpret_cast<jintArray>(array), low + offset,
                                   count, reinterpret_cast<jint*>(buffer + offset));
        } else {
            env->SetLongArrayRegion(reinterpret_cast<jlongArray>(array), low + offset,
                                    count, reinterpret_cast<jlong*>(buffer + offset));
        }
        if (env->ExceptionCheck()) {
            return false;
        }
    }
    return true;
}

extern "C" {
JNIEXPORT jboolean JNICALL Java_java_util_PrimitiveSort_supported(JNIEnv*, jclass) noexcept {
    try {
        return (hwy::SupportedTargets() & HWY_AVX2) != 0;
    } catch (...) {
        return false;
    }
}

JNIEXPORT jboolean JNICALL Java_java_util_PrimitiveSort_sortInts(
        JNIEnv* env, jclass, jintArray array, jint low, jint size) noexcept {
    try {
        return sort_range<jintArray, int32_t>(env, array, low, size);
    } catch (...) {
        return false;
    }
}

JNIEXPORT jboolean JNICALL Java_java_util_PrimitiveSort_sortLongs(
        JNIEnv* env, jclass, jlongArray array, jint low, jint size) noexcept {
    try {
        return sort_range<jlongArray, int64_t>(env, array, low, size);
    } catch (...) {
        return false;
    }
}
}
