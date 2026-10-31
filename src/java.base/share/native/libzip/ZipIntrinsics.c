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

#include <stdint.h>
#include "jni.h"
#include "jlong.h"
#include "zip_zlib_backend.h"

JNIEXPORT jint JNICALL ZIP_Inflate(jlong, jlong, jint, jlong, jint);
JNIEXPORT jint JNICALL ZIP_Deflate(jlong, jlong, jint, jlong, jint, jint, jint);
JNIEXPORT jlong JNICALL ZIP_FinishInflate(JNIEnv*, jobject, jlong, jint, jint, jint);
JNIEXPORT jlong JNICALL ZIP_FinishDeflate(JNIEnv*, jobject, jlong, jint, jint, jint, jint);

/* Bits 62 and 63 cannot both be set on a successful result. */
#define ZIP_ERROR ((jlong)0xc000000000000000ULL)

JNIEXPORT jlong JNICALL
ZIP_Process(jboolean inflate, jlong stream,
            jlong input, jint inputLen, jlong output, jint outputLen,
            intptr_t volatile control, jint params) {
    if (inflate) {
        jint status = ZIP_Inflate(stream, input, inputLen, output, outputLen);
        // Inflate has no flush argument. Its control slot instead carries a
        // call-local checksum output, read only at completion. Volatile keeps
        // that value out of registers across ordinary processing calls.
        if (status == Z_OK || status == Z_BUF_ERROR || status == Z_NEED_DICT) {
            return ZIP_FinishInflate(NULL, NULL, stream, inputLen, outputLen, status);
        }
        if (status == Z_STREAM_END) {
            // The scalar belongs to the VM caller's stack and is never retained.
            *(jint *)control = (jint)((z_stream *)jlong_to_ptr(stream))->adler;
            return ZIP_FinishInflate(NULL, NULL, stream, inputLen, outputLen, status);
        }
        return ZIP_ERROR | (jlong)(unsigned int)status;
    }
    jint status = ZIP_Deflate(stream, input, inputLen, output, outputLen, (jint)control, params);
    if ((status != Z_OK && status != Z_STREAM_END && status != Z_BUF_ERROR) ||
        ((params & 1) && status == Z_STREAM_END)) {
        return ZIP_ERROR | (jlong)(unsigned int)status;
    }
    return ZIP_FinishDeflate(NULL, NULL, stream, inputLen, outputLen, params, status);
}

/* Called after the intrinsic has released both pinned arrays. */
JNIEXPORT jlong JNICALL
ZIP_Complete(JNIEnv* env, jboolean inflate, jobject receiver, jlong stream,
             jint inputLen, jint outputLen, jint params, jint status) {
    if (inflate) return ZIP_FinishInflate(env, receiver, stream, inputLen, outputLen, status);
    return ZIP_FinishDeflate(env, receiver, stream, inputLen, outputLen, params, status);
}
