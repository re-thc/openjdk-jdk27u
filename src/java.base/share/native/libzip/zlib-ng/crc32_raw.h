/* Experimental raw inflate CRC state. Not part of the public stream layout.
 * Copyright (C) 2026 Teamoffy Pte. Ltd.
 * For conditions of distribution and use, see copyright notice in zlib.h.
 */
#ifndef CRC32_RAW_H_
#define CRC32_RAW_H_

/* CRC-only translation units do not include the public stream headers. */
#ifdef ZLIB_COMPAT
#  include "zlib_name_mangling.h"
#else
#  include "zlib_name_mangling-ng.h"
#endif
typedef struct crc32_raw_state crc32_raw_state;
struct crc32_raw_state {
    uint8_t fold[64];
    uint32_t value;
    int hardware;
    int finished;
    void (*copy)(crc32_raw_state *, uint8_t *, const uint8_t *, size_t);
    void (*update)(crc32_raw_state *, const uint8_t *, size_t);
};
#ifdef X86_PCLMULQDQ_CRC
Z_INTERNAL void crc32_raw_copy_pclmulqdq(crc32_raw_state *, uint8_t *, const uint8_t *, size_t);
Z_INTERNAL void crc32_raw_update_pclmulqdq(crc32_raw_state *, const uint8_t *, size_t);
Z_INTERNAL uint32_t crc32_raw_final_pclmulqdq(crc32_raw_state *);
#endif
#ifdef X86_VPCLMULQDQ_AVX2
Z_INTERNAL void crc32_raw_copy_avx2(crc32_raw_state *, uint8_t *, const uint8_t *, size_t);
Z_INTERNAL void crc32_raw_update_avx2(crc32_raw_state *, const uint8_t *, size_t);
#endif
#ifdef X86_VPCLMULQDQ_AVX512
Z_INTERNAL void crc32_raw_copy_avx512(crc32_raw_state *, uint8_t *, const uint8_t *, size_t);
Z_INTERNAL void crc32_raw_update_avx512(crc32_raw_state *, const uint8_t *, size_t);
#endif
#endif
