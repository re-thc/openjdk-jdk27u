/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

#ifndef ZIP_ZLIB_BACKEND_H
#define ZIP_ZLIB_BACKEND_H
#include <zlib.h>
#include "jvm.h"

#ifdef INCLUDE_ZLIBNG
/* zlib-ng is built in compatibility mode with a private symbol prefix. */
extern int jdk_ng_deflate(z_streamp, int);
extern int jdk_ng_deflateEnd(z_streamp);
extern int jdk_ng_deflateReset(z_streamp);
extern int jdk_ng_deflateParams(z_streamp, int, int);
extern int jdk_ng_deflateSetDictionary(z_streamp, const Bytef *, uInt);
extern int jdk_ng_deflateSetHeader(z_streamp, gz_headerp);
extern int jdk_ng_deflateInit2_(z_streamp, int, int, int, int, int, const char *, int);
extern int jdk_ng_inflate(z_streamp, int);
extern int jdk_ng_inflateEnd(z_streamp);
extern int jdk_ng_inflateReset(z_streamp);
extern int jdk_ng_inflateSetDictionary(z_streamp, const Bytef *, uInt);
extern int jdk_ng_inflateInit2_(z_streamp, int, const char *, int);
extern uLong jdk_ng_crc32(uLong, const Bytef *, uInt);
extern uLong jdk_ng_adler32(uLong, const Bytef *, uInt);
extern uLong jdk_ng_deflateBound(z_streamp, uLong);
#define deflate(...) (JVM_UseZlibNG() ? jdk_ng_deflate(__VA_ARGS__) : deflate(__VA_ARGS__))
#define deflateEnd(...) (JVM_UseZlibNG() ? jdk_ng_deflateEnd(__VA_ARGS__) : deflateEnd(__VA_ARGS__))
#define deflateReset(...) (JVM_UseZlibNG() ? jdk_ng_deflateReset(__VA_ARGS__) : deflateReset(__VA_ARGS__))
#define deflateParams(...) (JVM_UseZlibNG() ? jdk_ng_deflateParams(__VA_ARGS__) : deflateParams(__VA_ARGS__))
#define deflateSetDictionary(...) (JVM_UseZlibNG() ? jdk_ng_deflateSetDictionary(__VA_ARGS__) : deflateSetDictionary(__VA_ARGS__))
#define deflateSetHeader(...) (JVM_UseZlibNG() ? jdk_ng_deflateSetHeader(__VA_ARGS__) : deflateSetHeader(__VA_ARGS__))
#define inflate(...) (JVM_UseZlibNG() ? jdk_ng_inflate(__VA_ARGS__) : inflate(__VA_ARGS__))
#define inflateEnd(...) (JVM_UseZlibNG() ? jdk_ng_inflateEnd(__VA_ARGS__) : inflateEnd(__VA_ARGS__))
#define inflateReset(...) (JVM_UseZlibNG() ? jdk_ng_inflateReset(__VA_ARGS__) : inflateReset(__VA_ARGS__))
#define inflateSetDictionary(...) (JVM_UseZlibNG() ? jdk_ng_inflateSetDictionary(__VA_ARGS__) : inflateSetDictionary(__VA_ARGS__))
#define crc32(...) (JVM_UseZlibNG() ? jdk_ng_crc32(__VA_ARGS__) : crc32(__VA_ARGS__))
#define adler32(...) (JVM_UseZlibNG() ? jdk_ng_adler32(__VA_ARGS__) : adler32(__VA_ARGS__))
#define deflateBound(...) (JVM_UseZlibNG() ? jdk_ng_deflateBound(__VA_ARGS__) : deflateBound(__VA_ARGS__))
#undef inflateInit2
#define inflateInit2(s, w) (JVM_UseZlibNG() \
    ? jdk_ng_inflateInit2_((s), (w), ZLIB_VERSION, sizeof(z_stream)) \
    : inflateInit2_((s), (w), ZLIB_VERSION, sizeof(z_stream)))
#undef deflateInit2
#define deflateInit2(s, l, m, w, mem, st) (JVM_UseZlibNG() \
    ? jdk_ng_deflateInit2_((s), (l), (m), (w), (mem), (st), ZLIB_VERSION, sizeof(z_stream)) \
    : deflateInit2_((s), (l), (m), (w), (mem), (st), ZLIB_VERSION, sizeof(z_stream)))
#endif
#endif
