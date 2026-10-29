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
#include <stdint.h>
#include "export.h"

#ifdef _MSC_VER
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE __attribute__((noinline))
#endif

// Both entry paths call this exact function, including its pointer loads.
EXPORT NOINLINE int64_t shared_arena_five(const int64_t* a, const int64_t* b,
        const int64_t* c, const int64_t* d, const int64_t* e) {
    return 1000 + (a ? *a : 0) + (b ? *b : 0) + (c ? *c : 0)
                + (d ? *d : 0) + (e ? *e : 0);
}

JNIEXPORT jlong JNICALL Java_org_openjdk_bench_java_lang_foreign_SharedArenaCall_jniFive(
        JNIEnv* env, jclass cls, jlong target,
        jlong a, jlong b, jlong c, jlong d, jlong e) {
    typedef int64_t (*Fn)(const int64_t*, const int64_t*, const int64_t*,
                         const int64_t*, const int64_t*);
    return ((Fn)(uintptr_t)target)((const int64_t*)(uintptr_t)a,
            (const int64_t*)(uintptr_t)b, (const int64_t*)(uintptr_t)c,
            (const int64_t*)(uintptr_t)d, (const int64_t*)(uintptr_t)e);
}
