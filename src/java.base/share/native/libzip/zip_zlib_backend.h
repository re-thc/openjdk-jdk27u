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
#define deflate jdk_ng_deflate
#define deflateEnd jdk_ng_deflateEnd
#define deflateReset jdk_ng_deflateReset
#define deflateParams jdk_ng_deflateParams
#define deflateSetDictionary jdk_ng_deflateSetDictionary
#define deflateSetHeader jdk_ng_deflateSetHeader
#define deflateInit2_ jdk_ng_deflateInit2_
#define inflate jdk_ng_inflate
#define inflateEnd jdk_ng_inflateEnd
#define inflateReset jdk_ng_inflateReset
#define inflateSetDictionary jdk_ng_inflateSetDictionary
#define inflateInit2_ jdk_ng_inflateInit2_
#define crc32 jdk_ng_crc32
#define adler32 jdk_ng_adler32
#define deflateBound jdk_ng_deflateBound
#endif
#endif
