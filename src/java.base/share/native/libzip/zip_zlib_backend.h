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

#ifndef ZIP_ZLIB_BACKEND_H
#define ZIP_ZLIB_BACKEND_H

#ifdef INCLUDE_ZLIBNG
#include <zlib-ng.h>

/* These aliases stay inside libzip. JNI and ZIP_* pass opaque addresses;
 * no compatibility stream is cast to a native stream. */
typedef zng_stream z_stream;
typedef zng_stream *z_streamp;
typedef zng_gz_header gz_header;
typedef zng_gz_header *gz_headerp;

/* Use the fast encoder for level 1 to preserve zlib's speed/size balance. */
static inline int zip_deflate_level(int level) {
    return level == 1 ? 2 : level;
}

#define deflate zng_deflate
#define deflateEnd zng_deflateEnd
#define deflateReset zng_deflateReset
#define deflateParams(strm, level, strategy) \
    zng_deflateParams((strm), zip_deflate_level(level), (strategy))
#define deflateSetDictionary zng_deflateSetDictionary
#define deflateSetHeader zng_deflateSetHeader
#define deflateInit2(strm, level, method, windowBits, memLevel, strategy) \
    zng_deflateInit2((strm), zip_deflate_level(level), (method), \
                    (windowBits), (memLevel), (strategy))
#define inflate zng_inflate
#define inflateEnd zng_inflateEnd
#define inflateReset zng_inflateReset
#define inflateSetDictionary zng_inflateSetDictionary
#define inflateInit2 zng_inflateInit2
#define crc32 zng_crc32_z
#define adler32 zng_adler32_z
/* Preserve the unsigned-long bound API used by the heap-dump helper. */
#define deflateBound zng_deflateBound
#else
#include <zlib.h>
#endif

#endif /* ZIP_ZLIB_BACKEND_H */
