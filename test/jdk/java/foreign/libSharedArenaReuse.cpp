/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
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
#include <cstdint>
#include <atomic>
#include <thread>

static std::atomic<bool> entered{false};
static std::atomic<bool> released{true};
static std::atomic<int> calls{0};

#if defined(_MSC_VER)
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE __attribute__((noinline))
#endif

static int64_t payload(int64_t tag, const int64_t* a, const int64_t* b,
        const int64_t* c, const int64_t* d, const int64_t* e) {
    calls.fetch_add(1);
    entered.store(true, std::memory_order_release);
    while (!released.load(std::memory_order_acquire)) std::this_thread::yield();
    return tag + (a ? *a : 0) + (b ? *b : 0) + (c ? *c : 0)
               + (d ? *d : 0) + (e ? *e : 0);
}
extern "C" {
JNIEXPORT NOINLINE int64_t shared_reuse_five(const int64_t* a, const int64_t* b,
        const int64_t* c, const int64_t* d, const int64_t* e) {
    return payload(1000, a, b, c, d, e);
}
JNIEXPORT NOINLINE int64_t shared_reuse_five_alt(const int64_t* a, const int64_t* b,
        const int64_t* c, const int64_t* d, const int64_t* e) {
    return payload(2000, a, b, c, d, e);
}
struct ReusePair { int64_t first; int64_t second; };
JNIEXPORT NOINLINE ReusePair shared_reuse_pair(const int64_t* a, const int64_t* b,
        const int64_t* c, const int64_t* d, const int64_t* e) {
    int64_t result = payload(1000, a, b, c, d, e);
    return ReusePair{result, result + 1};
}
JNIEXPORT void JNICALL Java_TestSharedArenaReuse_reset(JNIEnv*, jclass, jboolean block) {
    entered.store(false); released.store(!block); calls.store(0);
}
JNIEXPORT jboolean JNICALL Java_TestSharedArenaReuse_entered(JNIEnv*, jclass) {
    return entered.load(std::memory_order_acquire);
}
JNIEXPORT void JNICALL Java_TestSharedArenaReuse_unblock(JNIEnv*, jclass) { released.store(true); }
JNIEXPORT jint JNICALL Java_TestSharedArenaReuse_calls(JNIEnv*, jclass) { return calls.load(); }
JNIEXPORT jlong JNICALL Java_TestSharedArenaReuse_jniFive(JNIEnv*, jclass, jlong target,
        jlong a, jlong b, jlong c, jlong d, jlong e) {
    using Fn = int64_t (*)(const int64_t*, const int64_t*, const int64_t*, const int64_t*, const int64_t*);
    return reinterpret_cast<Fn>(static_cast<uintptr_t>(target))(
            reinterpret_cast<const int64_t*>(static_cast<uintptr_t>(a)),
            reinterpret_cast<const int64_t*>(static_cast<uintptr_t>(b)),
            reinterpret_cast<const int64_t*>(static_cast<uintptr_t>(c)),
            reinterpret_cast<const int64_t*>(static_cast<uintptr_t>(d)),
            reinterpret_cast<const int64_t*>(static_cast<uintptr_t>(e)));
}
}
