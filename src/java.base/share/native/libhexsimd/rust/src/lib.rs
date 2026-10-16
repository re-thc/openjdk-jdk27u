// Copyright (c) 2026, Harry Chan. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

use hex_simd::AsciiCase;

// Private leaf ABI. The caller supplies disjoint, valid ranges and keeps them
// alive until return. No pointer escapes, Rust allocation or callback occurs.
// JNI copies each successful bounded chunk into a private Java destination.
// Java exposes the result only after complete conversion; failed native decode
// is replayed by the Java parser. No Rust object crosses the C boundary.

/// Encode `len` input bytes to exactly `2 * len` ASCII bytes.
///
/// # Safety
/// Both pointers must address the stated ranges, without overlap. `2 * len`
/// must fit in usize. `upper` must be zero (lower case) or one (upper case).
#[no_mangle]
pub unsafe extern "C" fn jdk_hex_encode(src: *const u8, dst: *mut u8, len: u32, upper: u32) {
    let case = if upper == 0 {
        AsciiCase::Lower
    } else {
        AsciiCase::Upper
    };
    hex_simd::encode_raw(src, len as usize, dst, case);
}

/// Decode `len` ASCII bytes to exactly `len / 2` binary bytes; return 1 on
/// success or 0 on invalid input. Failure may write part of the output.
///
/// # Safety
/// Both pointers must address the stated ranges, without overlap. `len` must
/// be even. The caller must discard all output on failure.
#[no_mangle]
pub unsafe extern "C" fn jdk_hex_decode(src: *const u8, dst: *mut u8, len: u32) -> i32 {
    i32::from(hex_simd::decode_raw(src, len as usize, dst).is_ok())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn offsets_lengths_cases_and_invalid_input() {
        for len in 0..=260usize {
            let input: Vec<u8> = (0..len).map(|i| i as u8).collect();
            for upper in 0..=1 {
                let mut encoded = vec![0x9b; 2 * len + 16];
                let mut decoded = vec![0x9b; len + 16];
                unsafe {
                    jdk_hex_encode(
                        input.as_ptr(),
                        encoded.as_mut_ptr().add(7),
                        len as u32,
                        upper,
                    );
                    assert_eq!(
                        jdk_hex_decode(
                            encoded.as_ptr().add(7),
                            decoded.as_mut_ptr().add(7),
                            (2 * len) as u32
                        ),
                        1
                    );
                }
                assert_eq!(&decoded[7..7 + len], input.as_slice());
                assert!(encoded[..7]
                    .iter()
                    .chain(&encoded[7 + 2 * len..])
                    .all(|&x| x == 0x9b));
                assert!(decoded[..7]
                    .iter()
                    .chain(&decoded[7 + len..])
                    .all(|&x| x == 0x9b));
                assert!(encoded[7..7 + 2 * len].iter().all(|&x| x.is_ascii_digit()
                    || if upper == 0 {
                        (b'a'..=b'f').contains(&x)
                    } else {
                        (b'A'..=b'F').contains(&x)
                    }));
                if len != 0 {
                    encoded[7 + len] = b'g';
                    unsafe {
                        assert_eq!(
                            jdk_hex_decode(
                                encoded.as_ptr().add(7),
                                decoded.as_mut_ptr().add(7),
                                (2 * len) as u32
                            ),
                            0
                        );
                    }
                }
            }
        }
    }
}
