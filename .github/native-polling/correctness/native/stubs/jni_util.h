/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#include <stddef.h>
#include "jni.h"
void JNU_ThrowIllegalArgumentException(JNIEnv *, const char *);
void JNU_ThrowIOException(JNIEnv *, const char *);
void JNU_ThrowIOExceptionWithLastError(JNIEnv *, const char *);
