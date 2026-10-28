/* crc32_raw_fold_tpl.h -- Persist CRC32 state using parallelized folding
 * approach with the PCLMULQDQ and VPCMULQDQ instructions.
 *
 * A white paper describing this algorithm can be found at:
 *     doc/crc-pclmulqdq.pdf
 *
 * Copyright (C) 2020 Wangyang Guo (wangyang.guo@intel.com) (VPCLMULQDQ support)
 * Copyright (C) 2013 Intel Corporation. All rights reserved.
 * Copyright (C) 2016 Marian Beermann (support for initial value)
 * Authors:
 *     Wajdi Feghali   <wajdi.k.feghali@intel.com>
 *     Jim Guilford    <james.guilford@intel.com>
 *     Vinodh Gopal    <vinodh.gopal@intel.com>
 *     Erdinc Ozturk   <erdinc.ozturk@intel.com>
 *     Jim Kukunas     <james.t.kukunas@linux.intel.com>
 *
 * For conditions of distribution and use, see copyright notice in zlib.h
 */

/* Persistent update adapted from upstream 2.3.3 partial_fold; bulk and final
 * reduction reuse 49323f2 helpers. Default CRC entry points are unchanged. */
#include "crc32_raw.h"
static inline void raw_partial(size_t len, __m128i *a, __m128i *b, __m128i *c,
                               __m128i *d, __m128i part) {
    const __m128i k = _mm_set_epi32(1, 0x54442bd4, 1, 0xc6e41596);
    const __m128i seq = _mm_setr_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    __m128i shl = _mm_add_epi8(seq, _mm_set1_epi8((char)len - 16));
    __m128i shr = _mm_xor_si128(shl, _mm_set1_epi32((int32_t)0x80808080));
    __m128i overflow = _mm_shuffle_epi8(*a, shl);
    *a = _mm_or_si128(_mm_shuffle_epi8(*a, shr), _mm_shuffle_epi8(*b, shl));
    *b = _mm_or_si128(_mm_shuffle_epi8(*b, shr), _mm_shuffle_epi8(*c, shl));
    *c = _mm_or_si128(_mm_shuffle_epi8(*c, shr), _mm_shuffle_epi8(*d, shl));
    *d = _mm_or_si128(_mm_shuffle_epi8(*d, shr), _mm_shuffle_epi8(part, shl));
    *d = z128_xor3_epi64(*d, _mm_clmulepi64_si128(overflow,k,0x01),
                              _mm_clmulepi64_si128(overflow,k,0x10));
}
Z_FORCEINLINE static void raw_update_impl(crc32_raw_state *state, uint8_t *dst,
                                         const uint8_t *src, size_t len, const int COPY) {
    if (len == 0) return;
    __m128i xmm_crc0 = _mm_load_si128((const __m128i *)state->fold);
    __m128i xmm_crc1 = _mm_load_si128((const __m128i *)state->fold + 1);
    __m128i xmm_crc2 = _mm_load_si128((const __m128i *)state->fold + 2);
    __m128i xmm_crc3 = _mm_load_si128((const __m128i *)state->fold + 3);
    __m128i xmm_t0, xmm_t1, xmm_t2, xmm_t3;
    const __m128i xmm_fold4 = _mm_set_epi32(1, 0x54442bd4, 1, 0xc6e41596);
    if (len >= 16) {
        size_t align = ALIGN_DIFF(src, 16);
        if (align) {
            __m128i part = _mm_loadu_si128((const __m128i *)src);
            if (COPY) _mm_storeu_si128((__m128i *)dst, part);
            raw_partial(align, &xmm_crc0,&xmm_crc1,&xmm_crc2,&xmm_crc3,part);
            src += align; len -= align; if (COPY) dst += align;
        }
    }
#if defined(X86_VPCLMULQDQ) && defined(__AVX512F__)
    /* 512-bit VPCLMULQDQ path requires AVX-512F */
    if (len >= 256)
        fold_block_16(&src, &dst, &len, &xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, COPY);
#elif defined(X86_VPCLMULQDQ)
    /* 256-bit VPCLMULQDQ path (doesn't require AVX-512F) */
    if (len >= 128)
        fold_block_8(&src, &dst, &len, &xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4, COPY);
#else
    /* Chorba algorithm for PCLMULQDQ path (when VPCLMULQDQ not available) */
    if (len >= 512 + 64 + (16 * 8))
        fold_block_chorba(&src, &dst, &len, &xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4, COPY);
#endif  /* X86_VPCLMULQDQ */

    while (len >= 64) {
        len -= 64;
        xmm_t0 = _mm_load_si128((__m128i *)src);
        xmm_t1 = _mm_load_si128((__m128i *)src + 1);
        xmm_t2 = _mm_load_si128((__m128i *)src + 2);
        xmm_t3 = _mm_load_si128((__m128i *)src + 3);
        src += 64;

        fold_state_4(&xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4);
        if (COPY) {
            _mm_storeu_si128((__m128i *)dst, xmm_t0);
            _mm_storeu_si128((__m128i *)dst + 1, xmm_t1);
            _mm_storeu_si128((__m128i *)dst + 2, xmm_t2);
            _mm_storeu_si128((__m128i *)dst + 3, xmm_t3);
            dst += 64;
        }

        xmm_crc0 = _mm_xor_si128(xmm_crc0, xmm_t0);
        xmm_crc1 = _mm_xor_si128(xmm_crc1, xmm_t1);
        xmm_crc2 = _mm_xor_si128(xmm_crc2, xmm_t2);
        xmm_crc3 = _mm_xor_si128(xmm_crc3, xmm_t3);
    }

    /*
     * len = num bytes left - 64
     */
    if (len >= 48) {
        len -= 48;

        xmm_t0 = _mm_load_si128((__m128i *)src);
        xmm_t1 = _mm_load_si128((__m128i *)src + 1);
        xmm_t2 = _mm_load_si128((__m128i *)src + 2);
        src += 48;

        fold_state_3(&xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4);
        if (COPY) {
            _mm_storeu_si128((__m128i *)dst, xmm_t0);
            _mm_storeu_si128((__m128i *)dst + 1, xmm_t1);
            _mm_storeu_si128((__m128i *)dst + 2, xmm_t2);
            dst += 48;
        }

        xmm_crc1 = _mm_xor_si128(xmm_crc1, xmm_t0);
        xmm_crc2 = _mm_xor_si128(xmm_crc2, xmm_t1);
        xmm_crc3 = _mm_xor_si128(xmm_crc3, xmm_t2);
    } else if (len >= 32) {
        len -= 32;

        xmm_t0 = _mm_load_si128((__m128i *)src);
        xmm_t1 = _mm_load_si128((__m128i *)src + 1);
        src += 32;

        fold_state_2(&xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4);
        if (COPY) {
            _mm_storeu_si128((__m128i *)dst, xmm_t0);
            _mm_storeu_si128((__m128i *)dst + 1, xmm_t1);
            dst += 32;
        }

        xmm_crc2 = _mm_xor_si128(xmm_crc2, xmm_t0);
        xmm_crc3 = _mm_xor_si128(xmm_crc3, xmm_t1);
    } else if (len >= 16) {
        len -= 16;
        xmm_t0 = _mm_load_si128((__m128i *)src);
        src += 16;

        fold_state_1(&xmm_crc0, &xmm_crc1, &xmm_crc2, &xmm_crc3, xmm_fold4);
        if (COPY) {
            _mm_storeu_si128((__m128i *)dst, xmm_t0);
            dst += 16;
        }

        xmm_crc3 = _mm_xor_si128(xmm_crc3, xmm_t0);
    }

    if (len) {
        __m128i part = _mm_setzero_si128();
        memcpy(&part, src, len);
        if (COPY) memcpy(dst, &part, len);
        raw_partial(len, &xmm_crc0,&xmm_crc1,&xmm_crc2,&xmm_crc3,part);
    }
    _mm_store_si128((__m128i *)state->fold, xmm_crc0);
    _mm_store_si128((__m128i *)state->fold + 1, xmm_crc1);
    _mm_store_si128((__m128i *)state->fold + 2, xmm_crc2);
    _mm_store_si128((__m128i *)state->fold + 3, xmm_crc3);
}
Z_INTERNAL void CRC32_RAW_COPY_NAME(crc32_raw_state *state, uint8_t *dst, const uint8_t *src, size_t len) {
    raw_update_impl(state,dst,src,len,1);
}
Z_INTERNAL void CRC32_RAW_UPDATE_NAME(crc32_raw_state *state, const uint8_t *src, size_t len) {
    raw_update_impl(state,NULL,src,len,0);
}
#ifdef CRC32_RAW_FINAL_NAME
Z_INTERNAL uint32_t CRC32_RAW_FINAL_NAME(crc32_raw_state *state) {
    __m128i xmm_crc0 = _mm_load_si128((const __m128i *)state->fold);
    __m128i xmm_crc1 = _mm_load_si128((const __m128i *)state->fold + 1);
    __m128i xmm_crc2 = _mm_load_si128((const __m128i *)state->fold + 2);
    __m128i xmm_crc3 = _mm_load_si128((const __m128i *)state->fold + 3);
    uint32_t crc;
    const __m128i k12 = _mm_set_epi32(0x00000001, 0x751997d0, 0x00000000, 0xccaa009e);
    const __m128i barrett_k = _mm_set_epi32(0x00000001, 0xdb710640, 0xb4e5b025, 0xf7011641);

    /* Fold 4x128-bit into a single 128-bit value using k1/k2 constants */
    __m128i x_low0  = _mm_clmulepi64_si128(xmm_crc0, k12, 0x01);
    __m128i x_high0 = _mm_clmulepi64_si128(xmm_crc0, k12, 0x10);
    xmm_crc1 = z128_xor3_epi64(xmm_crc1, x_low0, x_high0);

    __m128i x_low1  = _mm_clmulepi64_si128(xmm_crc1, k12, 0x01);
    __m128i x_high1 = _mm_clmulepi64_si128(xmm_crc1, k12, 0x10);
    xmm_crc2 = z128_xor3_epi64(xmm_crc2, x_low1, x_high1);

    __m128i x_low2  = _mm_clmulepi64_si128(xmm_crc2, k12, 0x01);
    __m128i x_high2 = _mm_clmulepi64_si128(xmm_crc2, k12, 0x10);
    xmm_crc3 = z128_xor3_epi64(xmm_crc3, x_low2, x_high2);

    /* Reduce 128-bits to 32-bits using two-stage Barrett reduction */
    __m128i x_tmp0 = _mm_clmulepi64_si128(xmm_crc3, barrett_k, 0x00);
    __m128i x_tmp1 = _mm_clmulepi64_si128(x_tmp0, barrett_k, 0x10);

    x_tmp1 = _mm_blend_epi16(x_tmp1, _mm_setzero_si128(), 0xcf);
    x_tmp0 = _mm_xor_si128(x_tmp1, xmm_crc3);

    __m128i x_res_a = _mm_clmulepi64_si128(x_tmp0, barrett_k, 0x01);
    __m128i x_res_b = _mm_clmulepi64_si128(x_res_a, barrett_k, 0x10);

    crc = ((uint32_t)_mm_extract_epi32(x_res_b, 2));

    return ~crc;
}
#endif
