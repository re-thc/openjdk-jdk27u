// Copyright (c) 2026, re-thc. All rights reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
//
// This code is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License version 2 only, as
// published by the Free Software Foundation.
//
// This code is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// version 2 for more details (a copy is included in the LICENSE file that
// accompanied this code).
//
// You should have received a copy of the GNU General Public License version
// 2 along with this work; if not, write to the Free Software Foundation,
// Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

// Opt-in decomposition on the production engine, cache/capture API, source,
// Cargo lockfile and release profile. It does not measure Java end-flag replay.
use super::*;

#[test]
#[ignore = "explicit diagnostic: reports direct engine and adapter costs"]
fn integration_costs() {
    use std::{hint::black_box, time::Instant};
    for (shape, source, groups, candidate) in [
        ("prefix", "(error)([0-9]+)", 3, "error123"),
        ("digits", "([0-9]+)", 2, "123"),
        (
            "email",
            "(?<user>[a-z0-9_]+)@(?<domain>[a-z0-9_]+)\\.[a-z]{2,4}",
            3,
            "a@b.co",
        ),
        (
            "alternation",
            "(?<level>error|warning|fatal)([0-9]+)",
            3,
            "error123",
        ),
    ] {
        let budget = Budget::new(64 * MIB);
        let handle = compile_handle(source, 0, groups, &budget).unwrap();
        let adapter_call: unsafe extern "C" fn(
            *const Handle<'_>,
            *const u8,
            usize,
            *mut i32,
            usize,
        ) -> i32 = black_box(jdk_regex_match_safepoint as _);
        for length in [16, 64, 256, 4096] {
            for position in ["miss", "early", "late", "full"] {
                let text = match position {
                    "early" => format!("{candidate}{}", "!".repeat(length - candidate.len())),
                    "late" => format!("{}{candidate}", "!".repeat(length - candidate.len())),
                    "full" => match shape {
                        "digits" => "3".repeat(length),
                        "email" => format!("{}@b.co", "a".repeat(length - 5)),
                        _ => format!("error{}", "3".repeat(length - 5)),
                    },
                    _ => "!".repeat(length),
                };
                let input = text.as_bytes();
                let mut cache = handle.regex.create_cache();
                let mut captures = handle.regex.create_captures();
                let mut state = vec![-1; groups * 2 + 4];
                state[groups * 2..].copy_from_slice(&[0, length as i32, 0, 0]);
                handle
                    .regex
                    .search_captures_with(&mut cache, &Input::new(input), &mut captures);
                let found = captures.get_match().is_some();
                let result = unsafe {
                    adapter_call(
                        &*handle,
                        input.as_ptr(),
                        input.len(),
                        state.as_mut_ptr(),
                        state.len(),
                    )
                };
                assert_eq!(result, i32::from(found));
                if found {
                    for g in 0..groups {
                        let span = captures.get_group(g);
                        assert_eq!(state[2 * g], span.map_or(-1, |s| s.start as i32));
                        assert_eq!(state[2 * g + 1], span.map_or(-1, |s| s.end as i32));
                    }
                }
                let iterations = if length < 4096 { 100_000 } else { 10_000 };
                for pair in 0..5 {
                    let order = if pair % 2 == 0 {
                        ["engine", "adapter"]
                    } else {
                        ["adapter", "engine"]
                    };
                    for path in order {
                        let before = Instant::now();
                        let mut checksum = 0;
                        for _ in 0..iterations {
                            if path == "engine" {
                                handle.regex.search_captures_with(
                                    &mut cache,
                                    &Input::new(black_box(input)),
                                    &mut captures,
                                );
                                if let Some(m) = captures.get_match() {
                                    checksum += m.end();
                                    for g in 0..groups {
                                        checksum +=
                                            captures.get_group(g).map_or(0, |s| s.start + s.end);
                                    }
                                }
                            } else {
                                let result = unsafe {
                                    adapter_call(
                                        black_box(&*handle),
                                        black_box(input.as_ptr()),
                                        input.len(),
                                        state.as_mut_ptr(),
                                        state.len(),
                                    )
                                };
                                assert!(result >= 0);
                                if result == 1 {
                                    checksum += state[1] as usize;
                                    for g in 0..groups {
                                        checksum += (state[2 * g] + state[2 * g + 1]) as usize;
                                    }
                                }
                            }
                        }
                        black_box(checksum);
                        println!("{{\"shape\":\"{shape}\",\"length\":{length},\"groups\":{groups},\"position\":\"{position}\",\"path\":\"{path}\",\"pair\":{pair},\"iterations\":{iterations},\"nsPerOp\":{},\"checksum\":{checksum}}}", before.elapsed().as_nanos() as f64 / iterations as f64);
                    }
                }
            }
        }
    }
}
