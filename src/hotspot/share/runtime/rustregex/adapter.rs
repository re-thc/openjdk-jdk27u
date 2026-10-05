/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 *
 */

// Immutable, bounded DFA searches: no allocation or locks on the normal path.
use regex_automata::{
    dfa::{dense, Automaton},
    nfa::thompson,
    util::prefilter::Prefilter,
    Input, MatchKind,
};
use std::{
    panic::{catch_unwind, AssertUnwindSafe},
    slice, str,
};

type Dfa = dense::DFA<Vec<u32>>;

fn compile(pattern: &str) -> Option<Dfa> {
    let hir = regex_syntax::ParserBuilder::new()
        .unicode(false)
        .utf8(false)
        .dot_matches_new_line(true)
        .build()
        .parse(pattern)
        .ok()?;
    // Filtering expressions that can match without consuming input is pointless.
    // Use the parsed properties instead of constructing a separate regex engine.
    if hir.properties().minimum_len() == Some(0) {
        return None;
    }
    let pre = Prefilter::from_hir_prefix(MatchKind::LeftmostFirst, &hir);
    let nfa = thompson::Compiler::new()
        .configure(
            thompson::Config::new()
                .utf8(false)
                .which_captures(thompson::WhichCaptures::None)
                .nfa_size_limit(Some(2 * 1024 * 1024)),
        )
        .build_from_hir(&hir)
        .ok()?;
    dense::Builder::new()
        .configure(
            dense::Config::new()
                .prefilter(pre)
                .dfa_size_limit(Some(2 * 1024 * 1024))
                .determinize_size_limit(Some(4 * 1024 * 1024)),
        )
        .build_from_nfa(&nfa)
        .ok()
}

/// # Safety
/// `pattern` must point to `len` readable bytes for this call.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_compile(pattern: *const u8, len: usize) -> *mut Dfa {
    if pattern.is_null() || len > 4096 {
        return std::ptr::null_mut();
    }
    catch_unwind(AssertUnwindSafe(|| {
        let pattern = str::from_utf8(slice::from_raw_parts(pattern, len)).ok()?;
        compile(pattern).map(|dfa| Box::into_raw(Box::new(dfa)))
    }))
    .ok()
    .flatten()
    .unwrap_or(std::ptr::null_mut())
}

/// # Safety
/// `handle` must be null or a live compile result, with no active searches.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_free(handle: *mut Dfa) {
    // A destructor panic must not escape through the Cleaner's C ABI call.
    let _ = catch_unwind(AssertUnwindSafe(|| {
        if !handle.is_null() {
            drop(Box::from_raw(handle));
        }
        #[cfg(test)]
        tests::panic_if_requested(tests::PanicPoint::Free);
    }));
}

/// # Safety
/// `handle` must be null or a live compile result. `bytes` must point to
/// `len` readable bytes (at most 65536); neither may be freed during the call.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_may_match(
    handle: *const Dfa,
    bytes: *const u8,
    len: usize,
) -> u8 {
    if handle.is_null() || bytes.is_null() || len > 65536 {
        return 1;
    }
    // Errors and panics must fail open. Only a proven absence can bypass Java.
    catch_unwind(AssertUnwindSafe(|| {
        #[cfg(test)]
        tests::panic_if_requested(tests::PanicPoint::Search);
        match (*handle)
            .try_search_fwd(&Input::new(slice::from_raw_parts(bytes, len)).earliest(true))
        {
            Ok(None) => 0,
            _ => 1,
        }
    }))
    .unwrap_or(1)
}

#[cfg(test)]
mod tests {
    use super::*;
    use regex::bytes::RegexBuilder;
    use std::cell::Cell;

    #[derive(Clone, Copy, PartialEq)]
    pub(super) enum PanicPoint {
        Search,
        Free,
    }

    thread_local! {
        static PANIC_POINT: Cell<Option<PanicPoint>> = const { Cell::new(None) };
    }

    pub(super) fn panic_if_requested(point: PanicPoint) {
        PANIC_POINT.with(|requested| {
            if requested.get() == Some(point) {
                requested.set(None);
                panic!("injected Rust regex FFI panic");
            }
        });
    }

    #[test]
    fn ffi_panics_are_contained() {
        unsafe {
            let pattern = b"error[0-9]+";
            let handle = jdk_regex_compile(pattern.as_ptr(), pattern.len());
            assert!(!handle.is_null());
            PANIC_POINT.with(|point| point.set(Some(PanicPoint::Search)));
            assert_eq!(jdk_regex_may_match(handle, b"normal".as_ptr(), 6), 1);
            // A failed search does not poison or free the shared DFA.
            assert_eq!(jdk_regex_may_match(handle, b"normal".as_ptr(), 6), 0);
            assert_eq!(jdk_regex_may_match(handle, b"error123".as_ptr(), 8), 1);
            PANIC_POINT.with(|point| point.set(Some(PanicPoint::Free)));
            jdk_regex_free(handle);
            PANIC_POINT.with(|point| assert!(point.get().is_none()));
            jdk_regex_free(std::ptr::null_mut());
        }
    }

    #[test]
    fn reject_and_fail_open() {
        unsafe {
            let p = b"error[0-9]+";
            let h = jdk_regex_compile(p.as_ptr(), p.len());
            assert!(!h.is_null());
            assert_eq!(jdk_regex_may_match(h, b"normal".as_ptr(), 6), 0);
            assert_eq!(jdk_regex_may_match(h, b"error123".as_ptr(), 8), 1);
            assert_eq!(jdk_regex_may_match(h, b"".as_ptr(), 65537), 1);
            assert_eq!(jdk_regex_may_match(std::ptr::null(), b"".as_ptr(), 0), 1);
            jdk_regex_free(h);
        }
        assert!(compile("a*").is_none());
        assert!(compile("(?=a)").is_none());
    }
    #[test]
    fn all_latin1_bytes_and_dot_superset() {
        let dfa = compile("a.b").unwrap();
        for byte in 0..=255u8 {
            assert!(dfa
                .try_search_fwd(&Input::new(&[b'a', byte, b'b']))
                .unwrap()
                .is_some());
        }
    }

    #[test]
    fn compile_limits_and_empty_matches() {
        for pattern in ["", "a*", "(?:a|)", "a{0}", "(?:ab)?"] {
            assert!(compile(pattern).is_none(), "{pattern}");
        }
        // The NFA must be bounded before determinization starts.
        assert!(compile("a{1000000000}").is_none());
    }

    #[test]
    fn parsed_nfa_matches_reference() {
        let mut seed = 0x12345678_u32;
        for pattern in [
            "error[0-9]+",
            "(error|warn): (\\w+)",
            "[0-9]{3}-[0-9]{2}-[0-9]{4}",
            "a.*b",
            "(?:a|bc)+d",
            "[a-z]+[0-9]+",
            "[^x]+z",
            "\\D+q",
            "[]a]x",
            "a{2,4}?b",
            "x*+x",
        ] {
            let reference = RegexBuilder::new(pattern)
                .unicode(false)
                .dot_matches_new_line(true)
                .build()
                .unwrap();
            let dfa = compile(pattern).unwrap();
            for length in 0..128 {
                let mut input = Vec::new();
                for _ in 0..length {
                    seed ^= seed << 13;
                    seed ^= seed >> 17;
                    seed ^= seed << 5;
                    input.push(seed as u8);
                }
                for suffix in [
                    b"".as_slice(),
                    b" error123 warn: foo 123-45-6789 a\nb aaab bcd abc123 z q ]x xx".as_slice(),
                ] {
                    input.extend_from_slice(suffix);
                    let actual = dfa
                        .try_search_fwd(&Input::new(&input).earliest(true))
                        .unwrap()
                        .is_some();
                    assert_eq!(
                        actual,
                        reference.is_match(&input),
                        "{pattern} length={length}"
                    );
                }
            }
        }
    }
}
