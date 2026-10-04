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

#ifndef JAVA_BASE_STRINGZILLA_KERNELS_H
#define JAVA_BASE_STRINGZILLA_KERNELS_H

#include "jni.h"

enum {
    JVM_STRINGZILLA_SERIAL = 0,
    JVM_STRINGZILLA_HASWELL = 1,
    JVM_STRINGZILLA_SKYLAKE = 2,
    JVM_STRINGZILLA_NEON = 4
};

typedef jint (*StringZillaSearchFn)(const char*, jint, const char*, jint);
typedef jint (*StringZillaEqualFn)(const char*, const char*, jint);
typedef jint (*StringZillaCharFn)(const char*, jint, jint);

/* Independent libjava kernels; no JNI, allocation or safepoints on entry. */
typedef struct {
    jint capabilities;
    StringZillaSearchFn findLatin1;
    StringZillaSearchFn findUTF16;
    StringZillaSearchFn findUTF16Latin1;
    StringZillaSearchFn rfindLatin1;
    StringZillaSearchFn rfindUTF16;
    StringZillaSearchFn rfindUTF16Latin1;
    StringZillaCharFn findCharLatin1;
    StringZillaCharFn findCharUTF16;
    StringZillaCharFn rfindCharLatin1;
    StringZillaCharFn rfindCharUTF16;
    StringZillaEqualFn equal;
} StringZillaKernels;

void StringZilla_initialize(void);

#endif /* JAVA_BASE_STRINGZILLA_KERNELS_H */
