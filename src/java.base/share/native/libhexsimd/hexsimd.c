// Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

#include <stdint.h>
#include "jni.h"

/* The Rust ABI contains no JNI values. Only stack-buffer pointers, valid for
 * this call, cross it. No allocation, callbacks, or retained pointers occur. */
extern void jdk_hex_encode(const uint8_t *, uint8_t *, uint32_t, uint32_t);
extern int32_t jdk_hex_decode(const uint8_t *, uint8_t *, uint32_t);
extern int32_t jdk_hex_is_supported(void);

#define HEX_CHUNK 4096

static jboolean JNICALL
encode(JNIEnv *env, jclass cls, jbyteArray src, jint from, jint len,
       jbyteArray dst, jboolean upper) {
    jsize src_len, dst_len;
    jint i;
    uint8_t input[HEX_CHUNK];
    uint8_t output[2 * HEX_CHUNK];

    if (src == NULL || dst == NULL || (*env)->IsSameObject(env, src, dst)) {
        return JNI_FALSE;
    }
    src_len = (*env)->GetArrayLength(env, src);
    dst_len = (*env)->GetArrayLength(env, dst);
    if (from < 0 || len < 0 || from > src_len || len > src_len - from ||
        (jlong)len * 2 != dst_len) {
        return JNI_FALSE;
    }
    for (i = 0; i < len; ) {
        jint n = len - i < HEX_CHUNK ? len - i : HEX_CHUNK;
        (*env)->GetByteArrayRegion(env, src, from + i, n, (jbyte *)input);
        if ((*env)->ExceptionCheck(env)) return JNI_FALSE;
        jdk_hex_encode(input, output, (uint32_t)n, upper ? 1 : 0);
        (*env)->SetByteArrayRegion(env, dst, 2 * i, 2 * n, (jbyte *)output);
        if ((*env)->ExceptionCheck(env)) return JNI_FALSE;
        i += n;
    }
    return JNI_TRUE;
}

static jint JNICALL
decode(JNIEnv *env, jclass cls, jbyteArray src, jbyteArray dst) {
    jsize len, dst_len;
    jint i;
    uint8_t input[2 * HEX_CHUNK];
    uint8_t output[HEX_CHUNK];

    if (src == NULL || dst == NULL || (*env)->IsSameObject(env, src, dst)) {
        return -1;
    }
    len = (*env)->GetArrayLength(env, src);
    dst_len = (*env)->GetArrayLength(env, dst);
    if ((len & 1) != 0 || len / 2 != dst_len) return -1;
    for (i = 0; i < len; ) {
        jint n = len - i < 2 * HEX_CHUNK ? len - i : 2 * HEX_CHUNK;
        (*env)->GetByteArrayRegion(env, src, i, n, (jbyte *)input);
        if ((*env)->ExceptionCheck(env)) return -1;
        // Failed chunks never leave native scratch. Prior successful chunks
        // remain in a private Java array until the entire operation succeeds.
        if (!jdk_hex_decode(input, output, (uint32_t)n)) return i;
        (*env)->SetByteArrayRegion(env, dst, i / 2, n / 2, (jbyte *)output);
        if ((*env)->ExceptionCheck(env)) return -1;
        i += n;
    }
    return len;
}

JNIEXPORT jint JNICALL
Java_jdk_internal_util_HexFormatSupport_init0(JNIEnv *env, jclass cls) {
    JNINativeMethod methods[] = {
        { "encode0", "([BII[BZ)Z", (void *)encode },
        { "decode0", "([B[B)I", (void *)decode }
    };
    // Registration is the ABI handshake: a wrong/incomplete library cannot
    // advertise availability and fail later at the first conversion.
    return jdk_hex_is_supported() && (*env)->RegisterNatives(env, cls, methods, 2) == 0 ? 1 : 0;
}
