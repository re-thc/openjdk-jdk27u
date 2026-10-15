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
#include <fcntl.h>
#include <unistd.h>
#include <sys/random.h>
#ifndef GRND_NONBLOCK
#define GRND_NONBLOCK 0x0001
#endif
#ifndef GRND_INSECURE
#define GRND_INSECURE 0x0004
#endif
#elif !defined(__APPLE__)
#error "No random number generator for this platform"
#endif

/* The size of the stack buffer the random bytes are generated into. */
#define BUF_SIZE 8192

#if defined(__linux__)

static const char *
deviceName(jboolean urandom)
{
    return urandom ? "/dev/urandom" : "/dev/random";
}

/* Whether errno says that a seccomp filter or the kernel lacks getrandom(). */
static int
isGetrandomBlocked(int err)
{
    return err == ENOSYS || err == EPERM;
}

/*
 * Reads len bytes from /dev/urandom or /dev/random, as NativePRNG did before
 * it used getrandom(). Returns 0 on success, or -1 with errno set.
 */
static int
readDevice(char *buf, size_t len, jboolean urandom)
{
    int fd = open(deviceName(urandom), O_RDONLY | O_CLOEXEC);
    if (fd < 0) {
        return -1;
    }
    while (len > 0) {
        ssize_t n = read(fd, buf, len);
        if (n <= 0) {
            if (n < 0 && errno == EINTR) {
                continue;
            }
            int err = (n < 0) ? errno : EIO;
            close(fd);
            errno = err;
            return -1;
        }
        buf += n;
        len -= n;
    }
    close(fd);
    return 0;
}

#endif

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
    /*
     * GRND_INSECURE needs Linux 5.6, where /dev/random behaves like flags 0.
     * Older kernels reject it. Then GRND_NONBLOCK gets the bytes once the
     * random number generator is initialized, and /dev/urandom before.
     * Where getrandom() is not available, the device files are read.
     */
    unsigned int flags = urandom ? GRND_INSECURE : 0;

    while (len > 0) {
        ssize_t n = getrandom(buf, len, flags);
        if (n < 0) {
            if (errno == EINTR) {
                continue;
            }
            if (errno == EINVAL && flags == GRND_INSECURE) {
                flags = GRND_NONBLOCK;
                continue;
            }
            if (errno == EAGAIN && flags == GRND_NONBLOCK) {
                return readDevice(buf, len, JNI_TRUE);
            }
            if (isGetrandomBlocked(errno)) {
                return readDevice(buf, len, urandom);
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
 * Returns whether the operating system provides random bytes, like
 * /dev/urandom if urandom is true and like /dev/random otherwise.
 * This does not block.
 */
JNIEXPORT jboolean JNICALL
Java_sun_security_provider_NativePRNG_isAvailable0(JNIEnv *env, jclass cls,
                                                   jboolean urandom)
{
#if defined(__linux__)
    char c;
    if (getrandom(&c, 0, GRND_NONBLOCK) >= 0 || errno == EAGAIN) {
        return JNI_TRUE;
    }
    if (isGetrandomBlocked(errno)) {
        return access(deviceName(urandom), R_OK) == 0;
    }
    return JNI_FALSE;
#else
    return JNI_TRUE;
#endif
}

JNIEXPORT void JNICALL
Java_sun_security_provider_NativePRNG_getRandomBytes(JNIEnv *env, jclass cls,
                                                     jbyteArray bytes,
                                                     jboolean urandom)
{
    char buf[BUF_SIZE];
    jint len = (*env)->GetArrayLength(env, bytes);
    jint off = 0;

    while (off < len) {
        jint n = (len - off < BUF_SIZE) ? len - off : BUF_SIZE;
        if (getRandomBytes(buf, n, urandom) < 0) {
            JNU_ThrowIOExceptionWithMessageAndLastError(env,
                                                        "getrandom failed");
            return;
        }
        (*env)->SetByteArrayRegion(env, bytes, off, n, (jbyte *)buf);
        off += n;
    }
}
