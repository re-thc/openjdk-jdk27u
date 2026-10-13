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

#include <errno.h>
#include <stdlib.h>

#include "jni.h"
#include "jni_util.h"

#include "sun_security_provider_NativePRNG.h"

#if defined(__linux__)
#include <sys/random.h>
#ifndef GRND_INSECURE
#define GRND_INSECURE 0x0004
#endif
#elif !defined(__APPLE__)
#error "No random number generator for this platform"
#endif

/* The size of the stack buffer the random bytes are generated into. */
#define BUF_SIZE 8192

/*
 * Fills buf with len random bytes from the operating system.
 * If urandom is true, this behaves like /dev/urandom and does not block.
 * Otherwise it behaves like /dev/random and blocks until the random number
 * generator of the operating system is initialized.
 * Returns 0 on success, or -1 with errno set.
 */
static int
getRandomBytes(char *buf, size_t len, jboolean urandom)
{
#if defined(__linux__)
    /* GRND_INSECURE needs Linux 5.6, where /dev/random behaves like flags 0 */
    unsigned int flags = urandom ? GRND_INSECURE : 0;

    while (len > 0) {
        ssize_t n = getrandom(buf, len, flags);
        if (n < 0) {
            if (errno == EINTR) {
                continue;
            }
            return -1;
        }
        buf += n;
        len -= n;
    }
#else
    /* arc4random_buf() does not block */
    arc4random_buf(buf, len);
#endif
    return 0;
}

/*
 * Fills the array with random bytes from the operating system. This blocks
 * until the random number generator of the operating system is initialized.
 */
JNIEXPORT void JNICALL
Java_sun_security_provider_NativePRNG_getBlockingRandomBytes0(JNIEnv *env,
                                                              jclass cls,
                                                              jbyteArray bytes)
{
    char buf[BUF_SIZE];
    jint len = (*env)->GetArrayLength(env, bytes);
    jint off = 0;

    while (off < len) {
        jint n = (len - off < BUF_SIZE) ? len - off : BUF_SIZE;
        if (getRandomBytes(buf, n, JNI_FALSE) < 0) {
            JNU_ThrowIOExceptionWithMessageAndLastError(env,
                                                        "getrandom failed");
            return;
        }
        (*env)->SetByteArrayRegion(env, bytes, off, n, (jbyte *)buf);
        off += n;
    }
}

/*
 * Fills b[off, off + len) with random bytes from the operating system without
 * blocking. Returns 0, or the errno value.
 * The VM replaces this method with a call to os::get_random_bytes() in
 * compiled code.
 */
JNIEXPORT jint JNICALL
Java_sun_security_provider_NativePRNG_getRandomBytes0(JNIEnv *env, jclass cls,
                                                      jbyteArray b,
                                                      jint off, jint len)
{
    char buf[BUF_SIZE];

    while (len > 0) {
        jint n = (len < BUF_SIZE) ? len : BUF_SIZE;
        if (getRandomBytes(buf, n, JNI_TRUE) < 0) {
            return errno;
        }
        (*env)->SetByteArrayRegion(env, b, off, n, (jbyte *)buf);
        off += n;
        len -= n;
    }
    return 0;
}

JNIEXPORT void JNICALL
Java_sun_security_provider_NativePRNG_throwIOException0(JNIEnv *env, jclass cls,
                                                        jint errnum)
{
    errno = errnum;
    JNU_ThrowIOExceptionWithMessageAndLastError(env, "getrandom failed");
}
