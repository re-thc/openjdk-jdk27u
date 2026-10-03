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

#define TMFY_CHARSET_DECODE_BYTES_MASK 0x1fffu
#define TMFY_CHARSET_DECODE_UNITS_SHIFT 13u
#define TMFY_CHARSET_DECODE_UNITS_MASK 0x1fffu
#define TMFY_CHARSET_DECODE_STATUS_SHIFT 26u

enum tmfy_charset_decode_status {
  TMFY_CHARSET_DECODE_COMPLETE = 0,
  TMFY_CHARSET_DECODE_UNRESOLVED = 1
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

/* UTF8 -> UTF16 with JDK String replacement: U+FFFD, consuming each malformed
 * sequence exactly as String.decodeUTF8_UTF16 does. Reserve 2 * length bytes.
 * Return UTF16 CODE UNITS written (half the number of output bytes).
 */
int32_t tmfy_decode_utf8_utf16(const uint8_t* input, size_t length,
                             uint8_t* output, size_t capacity);

/* Strict CharsetDecoder UTF8 -> UTF16 with valid-prefix progress only.
 * Separate mutable-input contract; existing byte-span APIs are unchanged:
 * - length is a byte count, at most TMFY_CONVERT_MAX_BYTES (4096)
 * - capacity_units is in UTF16 CODE UNITS, and must be at least length,
 *   even when the input is malformed or its actual output would be shorter
 * - output is native-endian UTF16, matching Java char[], and must be aligned
 *   for UTF16 stores; misaligned output is rejected before any store
 * - input storage remains accessible throughout the call; selected bytes are
 *   copied exactly once to a private aligned stack snapshot before validation
 *   or conversion; neither validation nor conversion rereads borrowed input
 * - concurrent Java byte[] writes need not yield an atomic snapshot, but all
 *   validation and conversion operate on the SAME captured byte values
 * - the input and the reserved 2 * length output bytes must not overlap;
 *   nulls, pointer-range overflow, reservation, and initialization are checked
 *   before the snapshot and before any output store
 * - empty input returns zero without examining pointers or initialization
 * - nonnegative result = consumed_bytes | (written_units << 13) | (status << 26)
 *   COMPLETE consumes the entire requested block; UNRESOLVED stops before its
 *   first invalid or incomplete sequence, and produces only the valid prefix
 * - UNRESOLVED does NOT distinguish malformed input from an incomplete block
 *   tail, supply Java's malformed length, or describe output overflow
 * - the Java caller admits at most min(input remaining, output units remaining,
 *   4096), commits this prefix once, and resumes its original scalar loop at
 *   the unresolved sequence or capacity tail using the actual buffer limits;
 *   it must never replay the committed prefix or split a surrogate pair
 * - -1/-2/-3 are pre-store declines; -4 is an invariant failure that can occur
 *   after output stores and MUST NOT cause Java replay on the same output
 * No allocation, locks, syscalls, callbacks, lazy ISA dispatch, retained pointer,
 * or unwinding occurs. Failure-path prefix scanning is bounded by the snapshot.
 */
int32_t tmfy_decode_utf8_array_utf16(const uint8_t* input, size_t length,
                                   uint16_t* output, size_t capacity_units);

#ifdef __cplusplus
}
#endif

#endif // SHARE_TMFY_KERNELS_H
