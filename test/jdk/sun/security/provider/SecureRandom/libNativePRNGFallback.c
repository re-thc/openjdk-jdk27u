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

#include "jni.h"

/* The test runs on Linux only. */
#if defined(__linux__)

#include <errno.h>
#include <stddef.h>
#include <linux/filter.h>
#include <linux/seccomp.h>
#include <sys/prctl.h>
#include <sys/random.h>
#include <sys/syscall.h>
#include <unistd.h>

#ifndef GRND_INSECURE
#define GRND_INSECURE 0x0004
#endif

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
#define FLAGS_OFFSET offsetof(struct seccomp_data, args[2])
#else
#define FLAGS_OFFSET (offsetof(struct seccomp_data, args[2]) + 4)
#endif

#define LOAD(off) BPF_STMT(BPF_LD | BPF_W | BPF_ABS, (off))
#define IF_GETRANDOM(jf) BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_getrandom, 0, (jf))
#define IF_FLAG(flag, jf) BPF_JUMP(BPF_JMP | BPF_JSET | BPF_K, (flag), 0, (jf))
#define FAIL(err) BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ERRNO | ((err) & SECCOMP_RET_DATA))
#define ALLOW BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW)

/*
 * Installs a seccomp filter on all threads of the process:
 *   mode 0: every getrandom() call fails with err
 *   mode 1: getrandom() with GRND_INSECURE fails with EINVAL, as before
 *           Linux 5.6
 *   mode 2: as mode 1, and getrandom() with GRND_NONBLOCK fails with EAGAIN,
 *           as before the kernel's random number generator is initialized
 * Returns 0, or the errno value if the filter could not be installed.
 */
JNIEXPORT jint JNICALL
Java_NativePRNGFallback_install(JNIEnv *env, jclass cls, jint mode, jint err)
{
    struct sock_filter blocked[] = {
        LOAD(offsetof(struct seccomp_data, nr)),
        IF_GETRANDOM(1),
        FAIL(err),
        ALLOW,
    };
    struct sock_filter oldKernel[] = {
        LOAD(offsetof(struct seccomp_data, nr)),
        IF_GETRANDOM(3),
        LOAD(FLAGS_OFFSET),
        IF_FLAG(GRND_INSECURE, 1),
        FAIL(EINVAL),
        ALLOW,
    };
    struct sock_filter uninitialized[] = {
        LOAD(offsetof(struct seccomp_data, nr)),
        IF_GETRANDOM(5),
        LOAD(FLAGS_OFFSET),
        IF_FLAG(GRND_INSECURE, 1),
        FAIL(EINVAL),
        IF_FLAG(GRND_NONBLOCK, 1),
        FAIL(EAGAIN),
        ALLOW,
    };
    struct sock_fprog prog;
    switch (mode) {
    case 0:
        prog.len = sizeof(blocked) / sizeof(blocked[0]);
        prog.filter = blocked;
        break;
    case 1:
        prog.len = sizeof(oldKernel) / sizeof(oldKernel[0]);
        prog.filter = oldKernel;
        break;
    default:
        prog.len = sizeof(uninitialized) / sizeof(uninitialized[0]);
        prog.filter = uninitialized;
        break;
    }
    if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) != 0) {
        return errno;
    }
    if (syscall(SYS_seccomp, SECCOMP_SET_MODE_FILTER,
                SECCOMP_FILTER_FLAG_TSYNC, &prog) != 0) {
        return errno;
    }
    return 0;
}

/* Returns 0 if getrandom() with these flags gets 16 bytes, or errno. */
JNIEXPORT jint JNICALL
Java_NativePRNGFallback_getrandom(JNIEnv *env, jclass cls, jint flags)
{
    char buf[16];
    return getrandom(buf, sizeof(buf), (unsigned int)flags) == sizeof(buf)
            ? 0 : errno;
}

#endif
