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

// Immutable, bounded DFA searches: no allocation or locks in the leaf entry.
use regex::bytes::RegexBuilder;
use regex_automata::{
    dfa::{dense, Automaton},
    util::{prefilter::Prefilter, syntax},
    Input, MatchKind,
};
use std::{
    panic::{catch_unwind, AssertUnwindSafe},
    slice, str,
};

type Dfa = dense::DFA<Vec<u32>>;

fn compile(pattern: &str) -> Option<Dfa> {
    // Reject empty languages with empty matches: filtering them is pointless.
    let re = RegexBuilder::new(pattern)
        .unicode(false)
        .dot_matches_new_line(true)
        .size_limit(2 * 1024 * 1024)
        .build()
        .ok()?;
    if re.is_match(b"") {
        return None;
    }
    let hir = regex_syntax::ParserBuilder::new()
        .unicode(false)
        .utf8(false)
        .dot_matches_new_line(true)
        .build()
        .parse(pattern)
        .ok()?;
    let pre = Prefilter::from_hir_prefix(MatchKind::LeftmostFirst, &hir);
    dense::Builder::new()
        .configure(
            dense::Config::new()
                .prefilter(pre)
                .dfa_size_limit(Some(2 * 1024 * 1024))
                .determinize_size_limit(Some(4 * 1024 * 1024)),
        )
        .syntax(
            syntax::Config::new()
                .unicode(false)
                .utf8(false)
                .dot_matches_new_line(true),
        )
        .build(pattern)
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
    if !handle.is_null() {
        drop(Box::from_raw(handle));
    }
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
    // Search errors must fail open. Only a proven absence can bypass Java.
    match (*handle).try_search_fwd(&Input::new(slice::from_raw_parts(bytes, len)).earliest(true)) {
        Ok(None) => 0,
        _ => 1,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
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
}
