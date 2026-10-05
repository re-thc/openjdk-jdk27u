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

// A native matching engine, with captures and bounded pooled search caches.
use regex_automata::{
    meta::{Cache, Regex},
    util::{captures::Captures, pool::Pool},
    Anchored, Input, PatternID,
};
use regex_syntax::hir::{Hir, HirKind, Look};
use std::{
    panic::{catch_unwind, AssertUnwindSafe},
    slice, str,
    sync::atomic::{AtomicUsize, Ordering},
};

const MIB: usize = 1024 * 1024;
const MAX_ENGINE_BYTES: usize = 4 * MIB;
const MAX_BUILD_BYTES: usize = 16 * MIB;
const MAX_CACHE_BYTES: usize = 16 * MIB;
const HYBRID_CAPACITY: usize = 32 * 1024;
const MAX_INPUT: usize = 65536;
const FALLBACK: i32 = -1;
static LIVE_MEMORY: Budget = Budget::new(64 * MIB);

#[cfg(test)]
thread_local! {
    static PANIC_STAGE: std::cell::Cell<u8> = const { std::cell::Cell::new(0) };
}
#[cfg(test)]
fn inject_panic(stage: u8) {
    PANIC_STAGE.with(|value| {
        if value.get() == stage {
            value.set(0);
            panic!("injected adapter panic");
        }
    });
}

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

struct SearchCache<'a> {
    cache: Cache,
    captures: Captures,
    full: Option<(Cache, Captures)>,
    _reservation: Reservation<'a>,
}

type CacheFactory<'a> = Box<dyn Fn() -> Option<SearchCache<'a>> + Send + Sync + 'a>;

// Drop engines and caches before returning their accounting reservations.
pub struct Handle<'a> {
    regex: Regex,
    full: Option<Regex>,
    pool: Pool<Option<SearchCache<'a>>, CacheFactory<'a>>,
    groups: usize,
    _reservation: Reservation<'a>,
}

// Fixed-width expressions and a fixed-width prefix followed by a greedy
// repetition of a fixed-width nonempty unit already choose the longest prefix.
// Other expressions need an explicit end assertion to implement matches().
fn full_from_primary(hir: &Hir) -> bool {
    fn fixed(hir: &Hir) -> bool {
        hir.properties().minimum_len().is_some()
            && hir.properties().minimum_len() == hir.properties().maximum_len()
    }
    if fixed(hir) {
        return true;
    }
    match hir.kind() {
        HirKind::Capture(capture) => full_from_primary(&capture.sub),
        HirKind::Concat(parts) => {
            let (last, prefix) = parts.split_last().unwrap();
            prefix.iter().all(fixed) && full_from_primary(last)
        }
        HirKind::Repetition(repeat) => {
            repeat.greedy
                && fixed(&repeat.sub)
                && repeat.sub.properties().minimum_len().unwrap() > 0
        }
        _ => false,
    }
}

fn compile(pattern: &str, flags: u32) -> Option<(Regex, Option<Regex>)> {
    let hir = regex_syntax::ParserBuilder::new()
        .unicode(false)
        .utf8(false)
        .case_insensitive(flags & 2 != 0)
        .build()
        .parse(pattern)
        .ok()?;
    let build = |hir: &Hir| {
        Regex::builder()
            .configure(
                Regex::config()
                    .utf8_empty(false)
                    .nfa_size_limit(Some(2 * MIB))
                    .onepass_size_limit(Some(MIB / 2))
                    .hybrid_cache_capacity(HYBRID_CAPACITY)
                    .dfa(false)
                    .backtrack(false)
                    .pool_capacity(1),
            )
            .build_from_hir(hir)
            .ok()
    };
    let regex = build(&hir)?;
    // Separate patterns preserve the primary engine's one-pass capture path.
    // Common greedy tails need only the primary engine, saving compilation,
    // retained automata and a second search cache.
    let full = if full_from_primary(&hir) {
        None
    } else {
        Some(build(&Hir::concat(vec![hir, Hir::look(Look::End)]))?)
    };
    Some((regex, full))
}

impl SearchCache<'_> {
    fn memory_usage(&self) -> usize {
        self.cache.memory_usage()
            + self
                .full
                .as_ref()
                .map_or(0, |(cache, _)| cache.memory_usage())
    }
}

fn new_cache<'a>(
    regex: &Regex,
    full: Option<&Regex>,
    budget: &'a Budget,
) -> Option<SearchCache<'a>> {
    // Reserve before allocating fixed slot tables and bounded lazy DFAs.
    let engine_bytes = regex
        .memory_usage()
        .checked_add(full.map_or(0, Regex::memory_usage))?;
    let slots = regex
        .group_info()
        .slot_len()
        .checked_add(full.map_or(0, |r| r.group_info().slot_len()))?;
    let lazy_bytes = (if full.is_some() { 4 } else { 2 }) * HYBRID_CAPACITY;
    let upper = engine_bytes
        .checked_mul(slots.checked_mul(2)?.checked_add(32)?)?
        .checked_add(lazy_bytes + 8192)?;
    if upper > MAX_CACHE_BYTES {
        return None;
    }
    let reservation = budget.reserve(upper)?;
    let mut cache = SearchCache {
        cache: regex.create_cache(),
        captures: regex.create_captures(),
        full: full.map(|r| (r.create_cache(), r.create_captures())),
        _reservation: reservation,
    };
    let bytes = cache
        .memory_usage()
        .checked_add(engine_bytes.checked_mul(8)?)?
        .checked_add(lazy_bytes)?
        .checked_add(slots * std::mem::size_of::<usize>())?
        .checked_add(std::mem::size_of::<SearchCache<'static>>() + 4096)?;
    if bytes > cache._reservation.bytes {
        return None;
    }
    cache._reservation.shrink(bytes);
    Some(cache)
}

fn compile_handle<'a>(
    pattern: &str,
    flags: u32,
    groups: usize,
    budget: &'a Budget,
) -> Option<Box<Handle<'a>>> {
    let mut reservation = budget.reserve(MAX_BUILD_BYTES)?;
    #[cfg(test)]
    inject_panic(1);
    let (regex, full) = compile(pattern, flags)?;
    if groups == 0 || groups > 33 || regex.group_info().group_len(PatternID::ZERO) != groups {
        return None;
    }
    let bytes = regex
        .memory_usage()
        .checked_add(full.as_ref().map_or(0, Regex::memory_usage))?
        .checked_add(std::mem::size_of::<Handle<'static>>() + 1024)?;
    if bytes > MAX_ENGINE_BYTES {
        return None;
    }
    reservation.shrink(bytes);
    let pooled = regex.clone();
    let pooled_full = full.clone();
    let factory: CacheFactory<'a> =
        Box::new(move || new_cache(&pooled, pooled_full.as_ref(), budget));
    let handle = Box::new(Handle {
        regex,
        full,
        pool: Pool::with_capacity(1, factory),
        groups,
        _reservation: reservation,
    });
    // Admit and initialize the first cache while compilation is in native
    // thread state. A selected backend must be ready for its first match.
    if handle.pool.get().is_none() {
        return None;
    }
    Some(handle)
}

/// # Safety
/// `pattern` must reference `len` readable bytes containing translated ASCII
/// subset syntax. `groups` includes the implicit group zero.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_compile(
    pattern: *const u8,
    len: usize,
    flags: u32,
    groups: usize,
) -> *mut Handle<'static> {
    if pattern.is_null() || len > 16384 {
        return std::ptr::null_mut();
    }
    catch_unwind(AssertUnwindSafe(|| {
        let pattern = str::from_utf8(slice::from_raw_parts(pattern, len)).ok()?;
        compile_handle(pattern, flags, groups, &LIVE_MEMORY).map(Box::into_raw)
    }))
    .ok()
    .flatten()
    .unwrap_or(std::ptr::null_mut())
}

/// # Safety
/// `handle` must be null or a live compile result, with no active searches.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_free(handle: *mut Handle<'static>) {
    let _ = catch_unwind(AssertUnwindSafe(|| {
        if !handle.is_null() {
            drop(Box::from_raw(handle));
        }
        #[cfg(test)]
        inject_panic(3);
    }));
}

/// # Safety
/// `handle` is live; `bytes` covers the specified region. `state` has
/// 2*groups capture slots followed by region start/end, search start and mode.
/// The Java wrapper validates these lengths before entering the intrinsic.
#[no_mangle]
pub unsafe extern "C" fn jdk_regex_match(
    handle: *const Handle<'_>,
    bytes: *const u8,
    state: *mut i32,
) -> i32 {
    if handle.is_null() || bytes.is_null() || state.is_null() {
        return FALLBACK;
    }
    catch_unwind(AssertUnwindSafe(|| {
        let handle = &*handle;
        let output = slice::from_raw_parts_mut(state, handle.groups * 2 + 4);
        let args = &output[handle.groups * 2..];
        let (from, to, start, mode) = (args[0], args[1], args[2], args[3]);
        if from < 0
            || to < from
            || start < from
            || start > to
            || !(0..=2).contains(&mode)
            || (to - from) as usize > MAX_INPUT
        {
            return FALLBACK;
        }
        let region = slice::from_raw_parts(bytes.add(from as usize), (to - from) as usize);
        let input = Input::new(region)
            .span((start - from) as usize..region.len())
            .anchored(match mode {
                1 => Anchored::Yes,
                2 => Anchored::Yes,
                _ => Anchored::No,
            });
        let mut pooled = handle.pool.get();
        let Some(cache) = pooled.as_mut() else {
            return FALLBACK;
        };
        #[cfg(test)]
        inject_panic(2);
        let (regex, engine_cache, captures) = if mode == 2 {
            if let (Some(full), Some((full_cache, full_captures))) = (&handle.full, &mut cache.full)
            {
                (full, full_cache, full_captures)
            } else {
                (&handle.regex, &mut cache.cache, &mut cache.captures)
            }
        } else {
            (&handle.regex, &mut cache.cache, &mut cache.captures)
        };
        let mut search = |trial: &Input<'_>| {
            if handle.groups == 1 {
                regex.search_with(engine_cache, trial)
            } else {
                regex.search_captures_with(engine_cache, trial, captures);
                captures.get_match()
            }
        };
        // An anchored first candidate avoids a boundary-finding DFA pass on
        // early positives and permits direct one-pass capture matching. Keep
        // general variable/alternative expressions on their normal search path.
        let probe_first = mode == 0 && handle.full.is_none();
        let mut matched = if probe_first {
            search(&input.clone().anchored(Anchored::Yes))
        } else {
            search(&input)
        };
        if matched.is_none() && probe_first {
            matched = search(&input);
        }
        let found = if let Some(m) = matched.filter(|m| mode != 2 || m.end() == region.len()) {
            if handle.groups == 1 {
                output[0] = m.start() as i32 + from;
                output[1] = m.end() as i32 + from;
            } else {
                for i in 0..handle.groups {
                    let span = captures.get_group(i);
                    output[2 * i] = span.map_or(-1, |s| s.start as i32 + from);
                    output[2 * i + 1] = span.map_or(-1, |s| s.end as i32 + from);
                }
            }
            true
        } else {
            false
        };
        if cache.memory_usage() > cache._reservation.bytes {
            return FALLBACK;
        }
        i32::from(found)
    }))
    .unwrap_or(FALLBACK)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(handle: &Handle<'_>, text: &[u8], mode: i32) -> (i32, Vec<i32>) {
        let mut state = vec![-1; handle.groups * 2 + 4];
        state[handle.groups * 2..].copy_from_slice(&[0, text.len() as i32, 0, mode]);
        let ptr = handle as *const Handle<'_>;
        let result = unsafe { jdk_regex_match(ptr, text.as_ptr(), state.as_mut_ptr()) };
        (result, state)
    }

    #[test]
    fn direct_matches_and_captures() {
        let budget = Budget::new(64 * MIB);
        let handle = compile_handle("(?<word>error|warn): ([0-9]+)", 0, 3, &budget).unwrap();
        let (result, groups) = run(&handle, b"x warn: 123 y", 0);
        assert_eq!(result, 1);
        assert_eq!(&groups[..6], &[2, 11, 2, 6, 8, 11]);
        assert_eq!(run(&handle, b"normal", 0).0, 0);
    }

    #[test]
    fn full_match_backtracks_to_later_alternative() {
        let budget = Budget::new(64 * MIB);
        let handle = compile_handle("(a|ab)", 0, 2, &budget).unwrap();
        assert_eq!(&run(&handle, b"ab", 0).1[..4], &[0, 1, 0, 1]);
        assert_eq!(&run(&handle, b"ab", 2).1[..4], &[0, 2, 0, 2]);
        assert_eq!(run(&handle, b"abc", 2).0, 0);
        assert_eq!(run(&handle, b"zab", 1).0, 0);
    }

    #[test]
    fn primary_full_match_selection_agrees_with_end_assertion() {
        let budget = Budget::new(64 * MIB);
        for source in [
            "a*",
            "error([0-9]+)",
            "(?<word>error)(?<code>[0-9]+)",
            "(ab)+",
            "(a|b){1,3}",
            "(?:aa|ab)+",
            "(?:ab|ba)[ab]*",
            "[ab]{2}[ac]*",
            "a{0}",
            "^a*$",
            "(a|ab)",
            "a+?",
            "a.*b",
            "(a?b)+",
            "(a)?b",
        ] {
            let reference = regex::bytes::RegexBuilder::new(&format!("\\A(?:{source})\\z"))
                .unicode(false)
                .build()
                .unwrap();
            let handle = compile_handle(source, 0, reference.captures_len(), &budget).unwrap();
            if source == "error([0-9]+)" || source == "(?<word>error)(?<code>[0-9]+)" {
                assert!(
                    handle.full.is_none(),
                    "simple captures should need only one engine"
                );
            }
            for code in 0..4096u32 {
                let mut word = code;
                let mut text = Vec::new();
                while word != 0 {
                    text.push([b'a', b'b', b'c', 0xff][(word & 3) as usize]);
                    word >>= 2;
                }
                let expected = reference.captures(&text);
                let (matched, captures) = run(&handle, &text, 2);
                assert_eq!(matched, i32::from(expected.is_some()), "{source} {text:?}");
                if let Some(expected) = expected {
                    for i in 0..handle.groups {
                        assert_eq!(
                            captures[2 * i],
                            expected.get(i).map_or(-1, |m| m.start() as i32)
                        );
                        assert_eq!(
                            captures[2 * i + 1],
                            expected.get(i).map_or(-1, |m| m.end() as i32)
                        );
                    }
                }
            }
        }
    }

    #[test]
    fn zero_length_optional_groups_and_ascii_case() {
        let budget = Budget::new(64 * MIB);
        let empty = compile_handle("(a)?", 0, 2, &budget).unwrap();
        assert_eq!(&run(&empty, b"", 2).1[..4], &[0, 0, -1, -1]);
        let ci = compile_handle("error[0-9]+", 2, 1, &budget).unwrap();
        assert_eq!(run(&ci, b"ERROR123", 2).0, 1);
    }

    #[test]
    fn budget_bounds_engines_and_search_caches() {
        let budget = Budget::new(MAX_BUILD_BYTES);
        let handle = compile_handle("error[0-9]+", 0, 1, &budget).unwrap();
        // Existing caches keep working at exhaustion. A new search thread
        // requires its own cache admission, including transient state.
        let occupied = budget
            .reserve(budget.limit - budget.used.load(Ordering::Relaxed))
            .unwrap();
        assert_eq!(run(&handle, b"normal", 0).0, 0);
        std::thread::scope(|scope| {
            let handle = &handle;
            assert_eq!(
                scope
                    .spawn(move || run(handle, b"normal", 0).0)
                    .join()
                    .unwrap(),
                FALLBACK
            );
        });
        let held = budget.used.load(Ordering::Relaxed);
        assert!(held > 0);
        assert!(compile_handle("error[0-9]+", 0, 1, &budget).is_none());
        drop(occupied);
        drop(handle);
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
    }

    #[test]
    fn compilation_errors_and_ffi_arguments_fail_open() {
        let budget = Budget::new(64 * MIB);
        assert!(compile_handle("(?=a)", 0, 1, &budget).is_none());
        assert!(compile_handle("a{1000000000}", 0, 1, &budget).is_none());
        assert!(compile_handle("(a)", 0, 1, &budget).is_none());
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
        unsafe {
            assert_eq!(
                jdk_regex_match(std::ptr::null(), std::ptr::null(), std::ptr::null_mut()),
                FALLBACK
            );
        }
    }

    #[test]
    fn ffi_contains_panics_and_returns_reservations() {
        let before = LIVE_MEMORY.used.load(Ordering::Relaxed);
        let source = b"error([0-9]+)";
        PANIC_STAGE.with(|s| s.set(1));
        let failed = unsafe { jdk_regex_compile(source.as_ptr(), source.len(), 0, 2) };
        assert!(failed.is_null());
        assert_eq!(LIVE_MEMORY.used.load(Ordering::Relaxed), before);
        let handle = unsafe { jdk_regex_compile(source.as_ptr(), source.len(), 0, 2) };
        assert!(!handle.is_null());
        PANIC_STAGE.with(|s| s.set(2));
        assert_eq!(run(unsafe { &*handle }, b"error123", 0).0, FALLBACK);
        assert_eq!(run(unsafe { &*handle }, b"error123", 0).0, 1);
        PANIC_STAGE.with(|s| s.set(3));
        unsafe {
            jdk_regex_free(handle);
        }
        assert_eq!(LIVE_MEMORY.used.load(Ordering::Relaxed), before);
    }

    #[test]
    fn shared_engine_captures_and_atomic_budget_are_isolated() {
        let budget = Budget::new(64 * MIB);
        let handle = compile_handle("error([0-9]+)", 0, 2, &budget).unwrap();
        std::thread::scope(|scope| {
            for worker in 0..4 {
                let (handle, budget) = (&handle, &budget);
                scope.spawn(move || {
                    let text = format!("x error{worker} y");
                    for _ in 0..1000 {
                        let charge = budget.reserve(1024).unwrap();
                        let (matched, groups) = run(handle, text.as_bytes(), 0);
                        assert_eq!(matched, 1);
                        assert_eq!(&groups[..4], &[2, 8, 7, 8]);
                        assert!(budget.used.load(Ordering::Relaxed) <= budget.limit);
                        drop(charge);
                    }
                });
            }
        });
        drop(handle);
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
    }

    #[test]
    fn latin1_searches_agree_with_reference_engine() {
        let budget = Budget::new(64 * MIB);
        let mut seed = 17u64;
        for expression in [
            "(?-u:[a-z]+[0-9]+)",
            "(?-u:[\\x00-\\xff]*?z)",
            "(a|ab)",
            "(ab)+",
            "a*",
            "[^x]+q",
        ] {
            let reference = regex::bytes::RegexBuilder::new(expression)
                .unicode(false)
                .build()
                .unwrap();
            let handle = compile_handle(expression, 0, reference.captures_len(), &budget).unwrap();
            for _ in 0..512 {
                let mut text = vec![0; 32];
                for c in &mut text {
                    seed ^= seed << 13;
                    seed ^= seed >> 7;
                    seed ^= seed << 17;
                    *c = match seed % 8 {
                        0 => b'a',
                        1 => b'b',
                        2 => b'z',
                        3 => b'q',
                        4 => b'3',
                        _ => seed as u8,
                    };
                }
                let (matched, groups) = run(&handle, &text, 0);
                let expected = reference.captures(&text);
                assert_eq!(matched, i32::from(expected.is_some()));
                if let Some(expected) = expected {
                    for i in 0..handle.groups {
                        assert_eq!(
                            groups[2 * i],
                            expected.get(i).map_or(-1, |m| m.start() as i32),
                            "{expression} text={text:?} groups={groups:?}"
                        );
                        assert_eq!(
                            groups[2 * i + 1],
                            expected.get(i).map_or(-1, |m| m.end() as i32),
                            "{expression} text={text:?} groups={groups:?}"
                        );
                    }
                }
            }
        }
    }

    #[test]
    fn report_typical_engine_and_cache_charges() {
        let budget = Budget::new(64 * MIB);
        for (source, groups) in [
            ("error[0-9]+", 1),
            ("(?<word>error)(?<code>[0-9]+)", 3),
            ("[0-9]{3}-[0-9]{2}-[0-9]{4}", 1),
        ] {
            let handle = compile_handle(source, 0, groups, &budget).unwrap();
            let retained = handle._reservation.bytes;
            assert_eq!(
                run(&handle, b"x error123 y", 0).0,
                i32::from(source.starts_with("error") || groups > 1)
            );
            let pooled = handle.pool.get();
            let cache = pooled.as_ref().unwrap();
            println!("{source}: engine_reported={} engine_charge={retained} cache_reported={} cache_charge={} total_charge={}",
                handle.regex.memory_usage() + handle.full.as_ref().map_or(0, Regex::memory_usage), cache.memory_usage(), cache._reservation.bytes,
                budget.used.load(Ordering::Relaxed));
            assert!(cache.memory_usage() <= cache._reservation.bytes);
        }
        assert_eq!(budget.used.load(Ordering::Relaxed), 0);
    }
}
