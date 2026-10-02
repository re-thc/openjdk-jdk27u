/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
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
#ifndef SHARE_TMFY_KERNELS_H
#define SHARE_TMFY_KERNELS_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define TMFY_CONVERT_MAX_BYTES 4096u

enum tmfy_status {
  TMFY_NEEDS_GENERAL = -1,
  TMFY_BAD_ARGUMENT = -2,
  TMFY_NOT_INITIALIZED = -3
};

/* Ordinary VM/JNI initialization only. Selects an immortal implementation once;
 * repeated or concurrent calls are harmless. Never called by the leaf entry.
 */
int32_t tmfy_runtime_initialize(void);
/* Static diagnostic label; does not initialize the component. */
const char* tmfy_implementation_name(void);

/* Converts Latin1 into UTF-8. Returns bytes written (at most 2 * length).
 * The caller supplies stable input and exclusive output for the entire call.
 * Input and the reserved output range must not overlap. Capacity must be at
 * least 2 * length, even when the actual output would be smaller.
 * All negative results occur before reading input or writing output. Empty
 * input returns zero without examining either pointer. No pointer is retained.
 * Once conversion starts it finishes, without a fallible/partial-write status.
 * No allocation, locks, callbacks, lazy dispatch, syscalls or C++ unwinding.
 */
int32_t tmfy_encode_latin1_utf8(const uint8_t* input, size_t length,
                                uint8_t* output, size_t capacity);

#ifdef __cplusplus
}
#endif

#endif // SHARE_TMFY_KERNELS_H
