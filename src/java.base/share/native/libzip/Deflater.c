/*
 * Copyright (c) 1997, 2024, Oracle and/or its affiliates. All rights reserved.
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

/*
 * Native method support for java.util.zip.Deflater
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "jlong.h"
#include "jni.h"
#include "jni_util.h"
#include "zip_zlib_backend.h"

#include "java_util_zip_Deflater.h"

#define DEF_MEM_LEVEL 8
#define ZIP_SMALL_DEFLATE_LIMIT 1024

/* The z_stream stays first: the packed-return and counter code uses its ABI.
 * A backend is selected before the first operation of each stream. It cannot
 * change after output or dictionary state has been established. */
typedef struct {
    z_stream stream;
    int backend;
    int select_backend;
    int level;
    int strategy;
    int window_bits;
} ZipDeflater;

enum { ZIP_DEFLATE_NONE, ZIP_DEFLATE_STOCK, ZIP_DEFLATE_NG };

/* Deflater has per-stream dispatch. Other libzip consumers retain the
 * startup-selected backend from zip_zlib_backend.h. */
#undef deflate
#undef deflateEnd
#undef deflateReset
#undef deflateParams
#undef deflateSetDictionary
#undef deflateInit2

static int endStream(ZipDeflater *d) {
#ifdef INCLUDE_ZLIBNG
    if (d->backend == ZIP_DEFLATE_NG) return jdk_ng_deflateEnd(&d->stream);
#endif
    if (d->backend == ZIP_DEFLATE_STOCK) return deflateEnd(&d->stream);
    return Z_OK;
}

static int selectBackend(ZipDeflater *d, int backend) {
    int ret;
    if (d->backend == backend) {
        d->select_backend = 0;
        return Z_OK;
    }
    ret = endStream(d);
    /* A freshly reset raw stream may report Z_DATA_ERROR on end even
     * though it has consumed no input. Its allocation is still released. */
    if (ret != Z_OK && ret != Z_DATA_ERROR) return ret;
    memset(&d->stream, 0, sizeof(z_stream));
    d->stream.adler = 1;
    d->backend = ZIP_DEFLATE_NONE;
#ifdef INCLUDE_ZLIBNG
    if (backend == ZIP_DEFLATE_NG) {
        ret = jdk_ng_deflateInit2_(&d->stream, d->level, Z_DEFLATED,
                                  d->window_bits, DEF_MEM_LEVEL, d->strategy,
                                  ZLIB_VERSION, sizeof(z_stream));
    } else
#endif
    {
        ret = deflateInit2_(&d->stream, d->level, Z_DEFLATED,
                           d->window_bits, DEF_MEM_LEVEL, d->strategy,
                           ZLIB_VERSION, sizeof(z_stream));
    }
    if (ret == Z_OK) {
        d->backend = backend;
        d->select_backend = 0;
    }
    return ret;
}

static int setDictionary(ZipDeflater *d, const Bytef *dictionary, uInt length) {
    if (d->select_backend) {
        int ret = selectBackend(d, ZIP_DEFLATE_NG);
        if (ret != Z_OK) return ret;
    }
#ifdef INCLUDE_ZLIBNG
    if (d->backend == ZIP_DEFLATE_NG) {
        return jdk_ng_deflateSetDictionary(&d->stream, dictionary, length);
    }
#endif
    return deflateSetDictionary(&d->stream, dictionary, length);
}

JNIEXPORT jlong JNICALL
Java_java_util_zip_Deflater_init(JNIEnv *env, jclass cls, jint level,
                                 jint strategy, jboolean nowrap)
{
    ZipDeflater *d;
    int ret;
    if (level < Z_DEFAULT_COMPRESSION || level > Z_BEST_COMPRESSION ||
        strategy < Z_DEFAULT_STRATEGY || strategy > Z_FIXED) {
        JNU_ThrowIllegalArgumentException(env, 0);
        return jlong_zero;
    }
    d = calloc(1, sizeof(ZipDeflater));
    if (d == NULL) {
        JNU_ThrowOutOfMemoryError(env, 0);
        return jlong_zero;
    }
    d->level = level;
    d->strategy = strategy;
    d->window_bits = nowrap ? -MAX_WBITS : MAX_WBITS;
    d->stream.adler = 1;
    if (JVM_UseZlibNG()) {
        /* Delay allocation until the input/flush shape is known. This avoids
         * allocating both libraries for a short, single-call stream. */
        d->select_backend = 1;
        return ptr_to_jlong(d);
    }
    ret = selectBackend(d, ZIP_DEFLATE_STOCK);
    if (ret == Z_OK) return ptr_to_jlong(d);
    if (ret == Z_MEM_ERROR) {
        free(d);
        JNU_ThrowOutOfMemoryError(env, 0);
    } else if (ret == Z_STREAM_ERROR) {
        free(d);
        JNU_ThrowIllegalArgumentException(env, 0);
    } else {
        const char *msg = d->stream.msg != NULL ? d->stream.msg :
                         ret == Z_VERSION_ERROR ?
                         "zlib returned Z_VERSION_ERROR: "
                         "compile time and runtime zlib implementations differ" :
                         "unknown error initializing zlib library";
        free(d);
        JNU_ThrowInternalError(env, msg);
    }
    return jlong_zero;
}

static void throwInternalErrorHelper(JNIEnv *env, z_stream *strm, const char *fixmsg) {
    const char *msg = NULL;
    msg = (strm->msg != NULL) ? strm->msg : fixmsg;
    JNU_ThrowInternalError(env, msg);
}

static void checkSetDictionaryResult(JNIEnv *env, jlong addr, jint res)
{
    z_stream *strm = (z_stream *) jlong_to_ptr(addr);
    switch (res) {
    case Z_OK:
        break;
    case Z_STREAM_ERROR:
        JNU_ThrowIllegalArgumentException(env, 0);
        break;
    case Z_MEM_ERROR:
        JNU_ThrowOutOfMemoryError(env, 0);
        break;
    default:
        throwInternalErrorHelper(env, strm, "unknown error in checkSetDictionaryResult");
        break;
    }
}

JNIEXPORT void JNICALL
Java_java_util_zip_Deflater_setDictionary(JNIEnv *env, jclass cls, jlong addr,
                                          jbyteArray b, jint off, jint len)
{
    int res;
    Bytef *buf = (*env)->GetPrimitiveArrayCritical(env, b, 0);
    if (buf == NULL) /* out of memory */
        return;
    res = setDictionary(jlong_to_ptr(addr), buf + off, len);
    (*env)->ReleasePrimitiveArrayCritical(env, b, buf, 0);
    checkSetDictionaryResult(env, addr, res);
}

JNIEXPORT void JNICALL
Java_java_util_zip_Deflater_setDictionaryBuffer(JNIEnv *env, jclass cls, jlong addr,
                                          jlong bufferAddr, jint len)
{
    int res;
    Bytef *buf = jlong_to_ptr(bufferAddr);
    res = setDictionary(jlong_to_ptr(addr), buf, len);
    checkSetDictionaryResult(env, addr, res);
}

static jint doDeflate(JNIEnv *env, jlong addr,
                       jbyte *input, jint inputLen,
                       jbyte *output, jint outputLen,
                       jint flush, jint params)
{
    ZipDeflater *d = jlong_to_ptr(addr);
    z_stream *strm = &d->stream;
    int setParams = params & 1;
    int res;

    if (d->select_backend) {
        int backend = flush == Z_FINISH && inputLen <= ZIP_SMALL_DEFLATE_LIMIT
                      ? ZIP_DEFLATE_STOCK : ZIP_DEFLATE_NG;
        res = selectBackend(d, backend);
        if (res != Z_OK) return res;
    }

    strm->next_in  = (Bytef *) input;
    strm->next_out = (Bytef *) output;
    strm->avail_in  = inputLen;
    strm->avail_out = outputLen;

    if (setParams) {
        int strategy = (params >> 1) & 3;
        int level = params >> 3;
#ifdef INCLUDE_ZLIBNG
        if (d->backend == ZIP_DEFLATE_NG) {
            res = jdk_ng_deflateParams(strm, level, strategy);
        } else
#endif
        {
            res = deflateParams(strm, level, strategy);
        }
        if (res == Z_OK) {
            d->level = level;
            d->strategy = strategy;
        }
    } else {
#ifdef INCLUDE_ZLIBNG
        if (d->backend == ZIP_DEFLATE_NG) return jdk_ng_deflate(strm, flush);
#endif
        res = deflate(strm, flush);
    }
    return res;
}

static jlong checkDeflateStatus(JNIEnv *env, jlong addr,
                        jint inputLen,
                        jint outputLen,
                        jint params, int res)
{
    z_stream *strm = jlong_to_ptr(addr);
    jint inputUsed = 0, outputUsed = 0;
    int finished = 0;
    int setParams = params & 1;

    if (res == Z_MEM_ERROR) {
        JNU_ThrowOutOfMemoryError(env, 0);
        return 0;
    }
    if (setParams) {
        switch (res) {
        case Z_OK:
            setParams = 0;
            /* fall through */
        case Z_BUF_ERROR:
            inputUsed = inputLen - strm->avail_in;
            outputUsed = outputLen - strm->avail_out;
            break;
        default:
            throwInternalErrorHelper(env, strm, "unknown error in checkDeflateStatus, setParams case");
            return 0;
        }
    } else {
        switch (res) {
        case Z_STREAM_END:
            finished = 1;
            /* fall through */
        case Z_OK:
        case Z_BUF_ERROR:
            inputUsed = inputLen - strm->avail_in;
            outputUsed = outputLen - strm->avail_out;
            break;
        default:
            throwInternalErrorHelper(env, strm, "unknown error in checkDeflateStatus");
            return 0;
        }
    }
    return ((jlong)inputUsed) | (((jlong)outputUsed) << 31) | (((jlong)finished) << 62) | (((jlong)setParams) << 63);
}

JNIEXPORT jint JNICALL
ZIP_Deflate(jlong addr, jlong input, jint inputLen, jlong output, jint outputLen,
            jint flush, jint params) {
    return doDeflate(NULL, addr, jlong_to_ptr(input), inputLen,
                     jlong_to_ptr(output), outputLen, flush, params);
}

JNIEXPORT jlong JNICALL
ZIP_FinishDeflate(JNIEnv* env, jobject receiver, jlong addr,
                  jint inputLen, jint outputLen, jint params, jint status) {
    return checkDeflateStatus(env, addr, inputLen, outputLen, params, status);
}

JNIEXPORT jlong JNICALL
Java_java_util_zip_Deflater_deflateBytesBytes(JNIEnv *env, jobject this, jlong addr,
                                         jbyteArray inputArray, jint inputOff, jint inputLen,
                                         jbyteArray outputArray, jint outputOff, jint outputLen,
                                         jint flush, jint params)
{
    jbyte *input = (*env)->GetPrimitiveArrayCritical(env, inputArray, 0);
    jbyte *output;
    jlong retVal;
    jint res;

    if (input == NULL) {
        if (inputLen != 0 && !(*env)->ExceptionCheck(env))
            JNU_ThrowOutOfMemoryError(env, 0);
        return 0L;
    }
    output = (*env)->GetPrimitiveArrayCritical(env, outputArray, 0);
    if (output == NULL) {
        (*env)->ReleasePrimitiveArrayCritical(env, inputArray, input, 0);
        if (outputLen != 0 && !(*env)->ExceptionCheck(env))
            JNU_ThrowOutOfMemoryError(env, 0);
        return 0L;
    }

     res = doDeflate(env, addr, input + inputOff, inputLen,output + outputOff,
                     outputLen, flush, params);

    (*env)->ReleasePrimitiveArrayCritical(env, outputArray, output, 0);
    (*env)->ReleasePrimitiveArrayCritical(env, inputArray, input, 0);

    retVal = checkDeflateStatus(env, addr, inputLen, outputLen, params, res);
    return retVal;
}


JNIEXPORT jlong JNICALL
Java_java_util_zip_Deflater_deflateBytesBuffer(JNIEnv *env, jobject this, jlong addr,
                                         jbyteArray inputArray, jint inputOff, jint inputLen,
                                         jlong outputBuffer, jint outputLen,
                                         jint flush, jint params)
{
    jbyte *input = (*env)->GetPrimitiveArrayCritical(env, inputArray, 0);
    jbyte *output;
    jlong retVal;
    jint res;
    if (input == NULL) {
        if (inputLen != 0 && !(*env)->ExceptionCheck(env))
            JNU_ThrowOutOfMemoryError(env, 0);
        return 0L;
    }
    output = jlong_to_ptr(outputBuffer);

    res = doDeflate(env, addr, input + inputOff, inputLen, output, outputLen,
                    flush, params);

    (*env)->ReleasePrimitiveArrayCritical(env, inputArray, input, 0);

    retVal = checkDeflateStatus(env, addr, inputLen, outputLen, params, res);
    return retVal;
}

JNIEXPORT jlong JNICALL
Java_java_util_zip_Deflater_deflateBufferBytes(JNIEnv *env, jobject this, jlong addr,
                                         jlong inputBuffer, jint inputLen,
                                         jbyteArray outputArray, jint outputOff, jint outputLen,
                                         jint flush, jint params)
{
    jbyte *input = jlong_to_ptr(inputBuffer);
    jbyte *output = (*env)->GetPrimitiveArrayCritical(env, outputArray, 0);
    jlong retVal;
    jint res;
    if (output == NULL) {
        if (outputLen != 0 && !(*env)->ExceptionCheck(env))
            JNU_ThrowOutOfMemoryError(env, 0);
        return 0L;
    }

    res = doDeflate(env, addr, input, inputLen, output + outputOff, outputLen,
                    flush, params);
    (*env)->ReleasePrimitiveArrayCritical(env, outputArray, output, 0);

    retVal = checkDeflateStatus(env, addr, inputLen, outputLen, params, res);
    return retVal;
}

JNIEXPORT jlong JNICALL
Java_java_util_zip_Deflater_deflateBufferBuffer(JNIEnv *env, jobject this, jlong addr,
                                         jlong inputBuffer, jint inputLen,
                                         jlong outputBuffer, jint outputLen,
                                         jint flush, jint params)
{
    jbyte *input = jlong_to_ptr(inputBuffer);
    jbyte *output = jlong_to_ptr(outputBuffer);
    jlong retVal;
    jint res;

    res = doDeflate(env, addr, input, inputLen, output, outputLen, flush, params);
    retVal = checkDeflateStatus(env, addr, inputLen, outputLen, params, res);
    return retVal;
}

JNIEXPORT jint JNICALL
Java_java_util_zip_Deflater_getAdler(JNIEnv *env, jclass cls, jlong addr)
{
    return ((z_stream *)jlong_to_ptr(addr))->adler;
}

JNIEXPORT void JNICALL
Java_java_util_zip_Deflater_reset(JNIEnv *env, jclass cls, jlong addr)
{
    ZipDeflater *d = jlong_to_ptr(addr);
    int ret = Z_OK;
#ifdef INCLUDE_ZLIBNG
    if (d->backend == ZIP_DEFLATE_NG) ret = jdk_ng_deflateReset(&d->stream);
#endif
    if (d->backend == ZIP_DEFLATE_STOCK) ret = deflateReset(&d->stream);
    if (ret != Z_OK) {
        JNU_ThrowInternalError(env, "deflateReset failed");
    } else {
        d->select_backend = JVM_UseZlibNG();
        d->stream.adler = 1;
    }
}

JNIEXPORT void JNICALL
Java_java_util_zip_Deflater_end(JNIEnv *env, jclass cls, jlong addr)
{
    ZipDeflater *d = jlong_to_ptr(addr);
    if (endStream(d) == Z_STREAM_ERROR) {
        JNU_ThrowInternalError(env, "deflateEnd failed");
    } else {
        free(d);
    }
}
