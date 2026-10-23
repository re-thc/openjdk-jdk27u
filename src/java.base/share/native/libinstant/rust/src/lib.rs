// Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

use speedate::{DateTime, MicrosecondsPrecisionOverflowBehavior, TimeConfig};
use std::panic::{AssertUnwindSafe, catch_unwind};

const MISS: i64 = i64::MIN;
const SCALE: i64 = 1 << 20;

fn parse(bytes: &[u8]) -> i64 {
    // Narrow speedate's grammar; it validates digits, field ranges and dates.
    if !matches!(bytes.len(), 20 | 22..=27)
        || bytes[4] != b'-'
        || bytes[7] != b'-'
        || bytes[10] != b'T'
        || bytes[13] != b':'
        || bytes[16] != b':'
        || bytes[bytes.len() - 1] != b'Z'
        || (bytes.len() > 20 && bytes[19] != b'.')
    {
        return MISS;
    }
    let config = TimeConfig::builder()
        .microseconds_precision_overflow_behavior(MicrosecondsPrecisionOverflowBehavior::Error)
        .build();
    let Ok(value) = DateTime::parse_bytes_rfc3339_with_config(bytes, &config) else {
        return MISS;
    };
    if value.time.tz_offset != Some(0) {
        return MISS;
    }
    // Multiplication rather than a C left shift of a negative signed value.
    // Range [-62167219200, 253402300799] seconds needs fewer than 39 signed bits.
    value.timestamp_tz() * SCALE + i64::from(value.time.microsecond)
}

fn contained(f: impl FnOnce() -> i64) -> i64 {
    catch_unwind(AssertUnwindSafe(f)).unwrap_or(MISS)
}

/// No pointer is retained; no Rust unwind crosses the C ABI.
///
/// # Safety
/// Unless null, `bytes` must point to at least `len` initialized bytes that remain
/// readable and unmodified until return. JNI supplies a caller-owned stack copy.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jdk_instant_speedate_parse(bytes: *const u8, len: usize) -> i64 {
    if bytes.is_null() || !matches!(len, 20 | 22..=27) {
        return MISS;
    }
    contained(|| parse(unsafe { std::slice::from_raw_parts(bytes, len) }))
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn negative_fraction_and_year_zero() {
        assert_eq!(parse(b"1969-12-31T23:59:59.999999Z"), -SCALE + 999999);
        assert_eq!(parse(b"1970-01-01T00:00:00.000001Z"), 1);
        assert_ne!(parse(b"0000-02-29T00:00:00Z"), MISS);
        assert_eq!(parse(b"1900-02-29T00:00:00Z"), MISS);
        assert_eq!(parse(b"2000-04-31T00:00:00Z"), MISS);
    }
    #[test]
    fn excluded_grammar_and_panic() {
        for bytes in [
            b"2000-01-01T00:00:00.1234567Z".as_slice(),
            b"2000-01-01T00:00:00.Z",
            b"2000-01-01t00:00:00Z",
            b"2000-01-01T24:00:00Z",
            b"2000-01-01T23:59:60Z",
            b"2000-01-01T00:00:00,1Z",
            b"2000-01-01T00:00:00+00:00",
        ] {
            assert_eq!(parse(bytes), MISS);
        }
        assert_eq!(contained(|| panic!("probe")), MISS);
    }

    #[test]
    fn malformed_positions() {
        for fraction in ["", ".1", ".12", ".123", ".1234", ".12345", ".123456"] {
            let valid = format!("2000-02-29T12:34:56{fraction}Z").into_bytes();
            assert_ne!(parse(&valid), MISS);
            for (position, &original) in valid.iter().enumerate() {
                for replacement in 0..=u8::MAX {
                    if replacement == original
                        || (original.is_ascii_digit() && replacement.is_ascii_digit())
                    {
                        continue;
                    }
                    let mut invalid = valid.clone();
                    invalid[position] = replacement;
                    assert_eq!(parse(&invalid), MISS, "position {position}: {invalid:?}");
                }
            }
        }
    }

    #[test]
    fn out_of_range_time_fields() {
        for (position, first_invalid) in [(11, 24), (14, 60), (17, 60)] {
            for value in first_invalid..=99 {
                let mut invalid = *b"2000-02-29T12:34:56.123456Z";
                invalid[position] = b'0' + value / 10;
                invalid[position + 1] = b'0' + value % 10;
                assert_eq!(parse(&invalid), MISS, "{invalid:?}");
            }
        }
    }
}
