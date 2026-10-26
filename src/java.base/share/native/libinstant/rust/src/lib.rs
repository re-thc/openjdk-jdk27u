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

use speedate::{DateTime, MicrosecondsPrecisionOverflowBehavior, TimeConfig};
use std::panic::{AssertUnwindSafe, catch_unwind};

const MISS: i64 = i64::MIN;
const SCALE: i64 = 1 << 20;

fn parse(bytes: &[u8]) -> i64 {
    // Speedate also accepts these spellings; ISO_INSTANT does not. Classify
    // only the two delimiter positions, leaving parsing and validation to it.
    if matches!(bytes.get(10), Some(b' ' | b'_')) || bytes.get(19) == Some(&b',') {
        return MISS;
    }
    let config = TimeConfig::builder()
        .microseconds_precision_overflow_behavior(MicrosecondsPrecisionOverflowBehavior::Error)
        .build();
    let value = match DateTime::parse_bytes_rfc3339_with_config(bytes, &config) {
        Ok(value) => value,
        Err(_) => return MISS,
    };
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
/// readable and unmodified until return. JNI borrows compact storage or supplies
/// a UTF-8 conversion. Public routing selects UTC strings before this boundary.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jdk_instant_speedate_parse(bytes: *const u8, len: usize) -> i64 {
    if bytes.is_null() || !(20..=27).contains(&len) {
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
    fn java_grammar_and_precision() {
        for separator in ['T', 't'] {
            for zone in ['Z', 'z'] {
                let text = format!("1969-12-31{separator}23:59:59.000001{zone}");
                assert_eq!(parse(text.as_bytes()), -SCALE + 1);
            }
        }
        for bytes in [
            b"1969-12-31 23:59:59Z".as_slice(),
            b"1969-12-31_23:59:59.000001Z",
            b"1969-12-31T23:59:59,000001Z",
            b"1900-02-29_00:00:00Z",
            b"1900-02-29T00:00:00,1Z",
            b"2000-01-01T00:00:00.1234567Z".as_slice(),
            b"2000-01-01T00:00:00.Z",
            b"2000-01-01T24:00:00Z",
            b"2000-01-01T23:59:60Z",
            b"2000-01-01T00:00:00ZZ",
            b"2000-01-01T00:00:00Z!",
            b"2000-01-01T/::00:00Z",
        ] {
            assert_eq!(parse(bytes), MISS);
        }
        assert_eq!(contained(|| panic!("probe")), MISS);
    }
}
