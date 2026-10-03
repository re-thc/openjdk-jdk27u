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
#define TMFY_CHARSET_MAX_UNITS (TMFY_CONVERT_MAX_BYTES / 2u)
#define TMFY_CHARSET_PREVIEW_UNITS 17u
#define TMFY_CHARSET_BYTES_MASK 0x1fffu
#define TMFY_CHARSET_UNITS_SHIFT 13u
#define TMFY_CHARSET_UNITS_MASK 0xfffu
#define TMFY_CHARSET_STATUS_SHIFT 25u

enum tmfy_charset_status {
  TMFY_CHARSET_COMPLETE = 0,
  TMFY_CHARSET_MALFORMED_1 = 1,
  TMFY_CHARSET_INCOMPLETE_HIGH_AT_BLOCK_END = 2
};

enum tmfy_status {
  TMFY_NEEDS_GENERAL = -1,
  TMFY_BAD_ARGUMENT = -2,
  TMFY_NOT_INITIALIZED = -3,
  TMFY_INTERNAL_ERROR = -4
};

/* Values are the pinned simdutf 9.2.1 ISA-mask ABI, not a general CPU feature
 * registry. Some bits overlap across architectures, and AVX512CD/VPOPCNTDQ
 * share a bit upstream. The VM must admit complete backend requirements.
 */
enum tmfy_instruction_set {
  TMFY_ISA_NEON = 0x1,
  TMFY_ISA_AVX2 = 0x4,
  TMFY_ISA_SSE42 = 0x8,
  TMFY_ISA_PCLMULQDQ = 0x10,
  TMFY_ISA_BMI1 = 0x20,
  TMFY_ISA_BMI2 = 0x40,
  TMFY_ISA_ALTIVEC = 0x80,
  TMFY_ISA_AVX512F = 0x100,
  TMFY_ISA_AVX512DQ = 0x200,
  TMFY_ISA_AVX512IFMA = 0x400,
  TMFY_ISA_AVX512PF = 0x800,
  TMFY_ISA_AVX512ER = 0x1000,
  TMFY_ISA_AVX512CD = 0x2000,
  TMFY_ISA_AVX512BW = 0x4000,
  TMFY_ISA_AVX512VL = 0x8000,
  TMFY_ISA_AVX512VBMI2 = 0x10000,
  TMFY_ISA_AVX512VPOPCNTDQ = 0x2000,
  TMFY_ISA_RVV = 0x4000,
  TMFY_ISA_ZVBB = 0x8000,
  TMFY_ISA_LSX = 0x40000,
  TMFY_ISA_LASX = 0x80000,
  TMFY_ISA_SVE = 0x100000,
  TMFY_ISA_SVE2 = 0x200000
};

/* Ordinary VM/JNI initialization only, never a borrowed-pointer leaf call.
 * The VM supplies a CPU/OS/VM-admitted mask. The first immutable selection wins;
 * a later or concurrent incompatible mask returns TMFY_BAD_ARGUMENT without
 * changing that selection. Zero admits the portable fallback implementation.
 * The standalone initializer detects host support for native library tests.
 */
int32_t tmfy_runtime_initialize_with_isa(uint32_t admitted_mask);
int32_t tmfy_runtime_initialize(void);
const char* tmfy_implementation_name(void);

/* Shared byte-span contract:
 * - input length is at most TMFY_CONVERT_MAX_BYTES; a larger span returns -1
 * - stable input and exclusive output remain valid throughout the call
 * - the input and the reserved worst-case output range must not overlap
 * - capacity is in BYTES, at least the stated worst-case reservation
 * - pointer-range overflow, capacity, and overlap are checked before stores
 * - empty input returns zero without examining pointers or initialization
 * - -1/-2/-3 occur before stores; -4 is an internal post-store invariant failure
 *   and MUST NOT cause replay using the same output
 * No pointer is retained; no allocation, locks, callbacks, environment reads,
 * lazy dispatch, syscalls, or C++ unwinding occur in conversion calls.
 * UTF16 byte storage is native endian, matching StringUTF16. Unaligned UTF16
 * spans are accepted through the scalar path. Strict Java callers stay Java.
 */

/* Latin1 -> UTF8. Reserve 2 * length bytes. Return UTF8 BYTES written. */
int32_t tmfy_encode_latin1_utf8(const uint8_t* input, size_t length,
                              uint8_t* output, size_t capacity);

/* UTF16 -> UTF8 with JDK String.getBytes replacement: each unpaired surrogate
 * becomes ASCII '?'. length must be even. Reserve 3 * (length / 2) bytes.
 * Return UTF8 BYTES written.
 */
int32_t tmfy_encode_utf16_utf8(const uint8_t* input, size_t length,
                             uint8_t* output, size_t capacity);

/* Strict CharsetEncoder UTF16 -> UTF8 with prefix progress, no replacement.
 * This has a separate mutable-input contract from the byte-span APIs above:
 * - units is a count of native-endian UTF16 code units, at most 2048
 * - reserve 3 * units output bytes (up to 6144), even on malformed input
 * - input may be mutable, but its storage remains accessible during the call;
 *   selected bytes are copied once into a private, aligned stack snapshot
 *   before validation/conversion; no borrowed pointer is retained
 * - the snapshot need not be an atomic view of concurrent Java char[] writes;
 *   all validation and conversion nevertheless use the SAME captured values
 * - unaligned input is accepted via memcpy, with no typed input dereference
 * - input and reserved output spans must not overlap; range overflow, nulls,
 *   reservation, and initialization are checked before any output store
 * - empty input returns 0 without examining pointers or initialization
 * - nonnegative result = bytes | (consumed_units << 13) | (status << 25)
 *   COMPLETE consumes all units; MALFORMED_1 stops before the first unpaired
 *   surrogate; INCOMPLETE_HIGH_AT_BLOCK_END stops before a final high surrogate
 * - incomplete refers only to this call's requested block, not a preview;
 *   the Java caller decides whether to resume across a chunk boundary or
 *   report underflow/end-of-input malformed according to CharsetEncoder
 * - a 17-unit preview (16 candidates plus one lookahead) can find an early
 *   error without copying the suffix; a high surrogate at its final position
 *   needs the remainder unless it is also the requested block's final unit
 * - bytes contain only the verified valid prefix; no CoderResult or callbacks
 * - -1/-2/-3 are pre-store; -4 is a possible post-store invariant failure and
 *   MUST NOT cause Java replay on the same output
 * No allocation, locks, syscalls, lazy ISA dispatch, or unwinding in this call.
 */
int32_t tmfy_encode_utf16_array_utf8(const uint16_t* input, size_t units,
                                   uint8_t* output, size_t capacity);

/* UTF8 -> UTF16 with JDK String replacement: U+FFFD, consuming each malformed
 * sequence exactly as String.decodeUTF8_UTF16 does. Reserve 2 * length bytes.
 * Return UTF16 CODE UNITS written (half the number of output bytes).
 */
int32_t tmfy_decode_utf8_utf16(const uint8_t* input, size_t length,
                             uint8_t* output, size_t capacity);

#ifdef __cplusplus
}
#endif

#endif // SHARE_TMFY_KERNELS_H
