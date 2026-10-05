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
    sync::atomic::{AtomicUsize, Ordering},
};

type Dfa = dense::DFA<Vec<u32>>;

const MIB: usize = 1024 * 1024;
const MAX_DFA_BYTES: usize = 2 * MIB;
const MAX_PREFILTER_BYTES: usize = 2 * MIB;
const MAX_NFA_BYTES: usize = 2 * MIB;
const MAX_DETERMINIZE_BYTES: usize = 4 * MIB;
const PARSE_ALLOWANCE: usize = 2 * MIB;
// Bound retained filters across all Patterns, including identical expressions.
static LIVE_MEMORY: Budget = Budget::new(64 * MIB);

struct Budget {
    used: AtomicUsize,
    limit: usize,
}

impl Budget {
    const fn new(limit: usize) -> Self {
        Self {
            used: AtomicUsize::new(0),
            limit,
        }
    }

    fn reserve(&self, bytes: usize) -> Option<Reservation<'_>> {
        let mut used = self.used.load(Ordering::Relaxed);
        loop {
            let total = used
                .checked_add(bytes)
                .filter(|&total| total <= self.limit)?;
            match self
                .used
                .compare_exchange_weak(used, total, Ordering::Relaxed, Ordering::Relaxed)
            {
                Ok(_) => break,
                Err(current) => used = current,
            }
        }
        Some(Reservation {
            budget: self,
            bytes,
        })
    }
}

struct Reservation<'a> {
    budget: &'a Budget,
    bytes: usize,
}

impl Reservation<'_> {
    fn shrink(&mut self, bytes: usize) {
        assert!(bytes <= self.bytes);
        self.budget
            .used
            .fetch_sub(self.bytes - bytes, Ordering::Relaxed);
        self.bytes = bytes;
    }
}

impl Drop for Reservation<'_> {
    fn drop(&mut self) {
        self.budget.used.fetch_sub(self.bytes, Ordering::Relaxed);
    }
}

// Drop the DFA before releasing its budget. Searches only read the DFA.
pub struct Handle<'a> {
    dfa: Dfa,
    _reservation: Reservation<'a>,
}

fn compile(pattern: &str) -> Option<(Dfa, usize)> {
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
    let pre_bytes = pre.as_ref().map_or(0, Prefilter::memory_usage);
    if pre_bytes > MAX_PREFILTER_BYTES {
        return None;
    }
    let nfa = thompson::Compiler::new()
        .configure(
            thompson::Config::new()
                .utf8(false)
                .which_captures(thompson::WhichCaptures::None)
                .nfa_size_limit(Some(MAX_NFA_BYTES)),
        )
        .build_from_hir(&hir)
        .ok()?;
    let dfa = dense::Builder::new()
        .configure(
            dense::Config::new()
                .prefilter(pre)
                .dfa_size_limit(Some(MAX_DFA_BYTES))
                .determinize_size_limit(Some(MAX_DETERMINIZE_BYTES)),
        )
        .build_from_nfa(&nfa)
        .ok()?;
    Some((dfa, pre_bytes))
}

const HANDLE_OVERHEAD: usize = std::mem::size_of::<Handle<'static>>() + 256;
// Reserve working state as well as the eventual filter. This bounds concurrent
// preparation without a global lock or permanently rejecting every contender.
const COMPILE_RESERVATION: usize = MAX_DFA_BYTES
    + MAX_PREFILTER_BYTES
    + MAX_NFA_BYTES
    + MAX_DETERMINIZE_BYTES
    + PARSE_ALLOWANCE
    + HANDLE_OVERHEAD;

fn compile_handle<'a>(pattern: &str, budget: &'a Budget) -> Option<Box<Handle<'a>>> {
    // Reserve before constructing native state. Admission failure is permanent
    // for this Pattern and falls back to Java, without allocation or retries.
    let mut reservation = budget.reserve(COMPILE_RESERVATION)?;
    let (dfa, pre_bytes) = compile(pattern)?;
    // DFA::memory_usage excludes the prefilter and the inline handle storage.
    let bytes = dfa
        .memory_usage()
        .checked_add(pre_bytes)?
        .checked_add(HANDLE_OVERHEAD)?;
    if bytes > reservation.bytes {
        return None;
    }
    reservation.shrink(bytes);
    Some(Box::new(Handle {
        dfa,
        _reservation: reservation,
    }))
}

/// # Safety
/// `pattern` must point to `len` readable bytes for this call.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_compile(pattern: *const u8, len: usize) -> *mut Handle<'static> {
    if pattern.is_null() || len > 4096 {
        return std::ptr::null_mut();
    }
    catch_unwind(AssertUnwindSafe(|| {
        let pattern = str::from_utf8(slice::from_raw_parts(pattern, len)).ok()?;
        compile_handle(pattern, &LIVE_MEMORY).map(Box::into_raw)
    }))
    .ok()
    .flatten()
    .unwrap_or(std::ptr::null_mut())
}

/// # Safety
/// `handle` must be null or a live compile result, with no active searches.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_free(handle: *mut Handle<'static>) {
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
    handle: *const Handle<'static>,
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
            .dfa
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
    use std::sync::Mutex;

    static FFI_LOCK: Mutex<()> = Mutex::new(());

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
        let _lock = FFI_LOCK.lock().unwrap();
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
        let _lock = FFI_LOCK.lock().unwrap();
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
        let (dfa, _) = compile("a.b").unwrap();
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
    fn retained_filters_exhaust_and_restore_budget() {
        let pattern = "error[0-9]+";
        let (dfa, pre_bytes) = compile(pattern).unwrap();
        let charged = dfa.memory_usage() + pre_bytes + HANDLE_OVERHEAD;
        let budget = Budget::new(COMPILE_RESERVATION + 3 * charged);
        let mut retained = Vec::new();
        // Identical expressions in distinct Patterns must each be charged.
        for _ in 0..4 {
            retained.push(compile_handle(pattern, &budget).unwrap());
        }
        assert_eq!(budget.used.load(Ordering::Relaxed), 4 * charged);
        assert!(compile_handle(pattern, &budget).is_none());
        assert_eq!(budget.used.load(Ordering::Relaxed), 4 * charged);
        drop(retained.pop());
        retained.push(compile_handle(pattern, &budget).unwrap());
        drop(retained);
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
        // Parsing, size-limit errors and unwinding must return reservations.
        assert!(compile_handle("(?=a)", &budget).is_none());
        assert!(compile_handle("a{1000000000}", &budget).is_none());
        let _ = catch_unwind(AssertUnwindSafe(|| {
            let _reservation = budget.reserve(COMPILE_RESERVATION).unwrap();
            panic!("injected allocation unwind");
        }));
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
    }

    #[test]
    fn concurrent_budget_admission_is_bounded() {
        let budget = Budget::new(1024);
        std::thread::scope(|scope| {
            let mut threads = Vec::new();
            for _ in 0..4 {
                let budget = &budget;
                threads.push(scope.spawn(move || {
                    let mut reservations = Vec::new();
                    while let Some(reservation) = budget.reserve(128) {
                        reservations.push(reservation);
                        assert!(budget.used.load(Ordering::Relaxed) <= budget.limit);
                    }
                    reservations
                }));
            }
            let retained: Vec<_> = threads.into_iter().map(|t| t.join().unwrap()).collect();
            assert_eq!(budget.used.load(Ordering::Relaxed), budget.limit);
            assert!(budget.reserve(1).is_none());
            drop(retained);
        });
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
    }

    #[test]
    fn ffi_budget_exhaustion_fails_open() {
        let _lock = FFI_LOCK.lock().unwrap();
        let retained = LIVE_MEMORY.reserve(LIVE_MEMORY.limit).unwrap();
        unsafe {
            let pattern = b"error[0-9]+";
            let handle = jdk_regex_compile(pattern.as_ptr(), pattern.len());
            assert!(handle.is_null());
            assert_eq!(jdk_regex_may_match(handle, b"error123".as_ptr(), 8), 1);
            drop(retained);
            let handle = jdk_regex_compile(pattern.as_ptr(), pattern.len());
            assert!(!handle.is_null());
            jdk_regex_free(handle);
        }
        assert_eq!(LIVE_MEMORY.used.load(Ordering::Relaxed), 0);
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
            let (dfa, _) = compile(pattern).unwrap();
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
