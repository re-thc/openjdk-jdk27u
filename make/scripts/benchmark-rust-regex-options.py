#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

"""Compare compiler/engine options in isolated offline copies of the adapter."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "src/hotspot/share/runtime/rustregex"
VARIANTS = {
    "base": (False, False, False, 32768),
    "thin": (True, False, False, 32768),
    "dfa": (False, True, False, 32768),
    "backtrack": (False, False, True, 32768),
    "cache128": (False, False, False, 131072),
}
HARNESS = r'''
#[path = "adapter.rs"]
mod adapter;
use std::{
    hint::black_box,
    time::{Duration, Instant},
};
fn main() {
    let cases = [
        ("prefix-miss", "error[0-9]+", 1, "x ".repeat(2048), 0),
        (
            "prefix-long-digits",
            "error[0-9]+",
            1,
            format!("error{}", "3".repeat(4091)),
            2,
        ),
        (
            "captures",
            "(?<word>error)(?<code>[0-9]+)",
            3,
            format!("error123{}", "x ".repeat(2044)),
            0,
        ),
        (
            "ssn-miss",
            "[0-9]{3}-[0-9]{2}-[0-9]{4}",
            1,
            "x ".repeat(2048),
            0,
        ),
        (
            "ssn-hit",
            "[0-9]{3}-[0-9]{2}-[0-9]{4}",
            1,
            "123-45-6789".to_string(),
            0,
        ),
        (
            "alternation-captures",
            "(a|ab)+(b|c)?",
            3,
            "abababababc".to_string(),
            0,
        ),
        (
            "email-captures",
            "([a-z0-9_]+)@([a-z0-9]+)[.]([a-z]{2,6})",
            4,
            "first_123@example.com".to_string(),
            0,
        ),
        (
            "email-miss",
            "([a-z0-9_]+)@([a-z0-9]+)[.]([a-z]{2,6})",
            4,
            "x ".repeat(2048),
            0,
        ),
        ("nullable-captures", "(a?|b)(c*)", 3, "bccc".to_string(), 0),
        (
            "greedy-alternation",
            "(abc|abd)+[0-9]*",
            2,
            "abcabd1234".to_string(),
            2,
        ),
        (
            "late-capture",
            "(error|warn):([0-9]+)",
            3,
            format!("{}warn:1234", "x ".repeat(2048)),
            0,
        ),
    ];
    let search: for<'a> unsafe extern "C" fn(
        *const adapter::Handle<'a>,
        *const u8,
        *mut i32,
    ) -> i32 = black_box(adapter::jdk_regex_match);
    for (name, regex, groups, text, mode) in cases {
        let t = Instant::now();
        let mut compile_ns = 0;
        for _ in 0..64 {
            let start = Instant::now();
            let h = unsafe { adapter::jdk_regex_compile(regex.as_ptr(), regex.len(), 0, groups) };
            assert!(!h.is_null());
            compile_ns += start.elapsed().as_nanos();
            unsafe { adapter::jdk_regex_free(h) };
        }
        black_box(t);
        let h = unsafe { adapter::jdk_regex_compile(regex.as_ptr(), regex.len(), 0, groups) };
        assert!(!h.is_null());
        let mut state = vec![-1; groups * 2 + 4];
        state[groups * 2..].copy_from_slice(&[0, text.len() as i32, 0, mode]);
        for _ in 0..4096 {
            let result = unsafe { search(h, text.as_ptr(), state.as_mut_ptr()) };
            assert!(result >= 0);
            black_box(result);
        }
        let mut scores = Vec::new();
        for _ in 0..3 {
            let start = Instant::now();
            let mut count = 0u64;
            loop {
                for _ in 0..256 {
                    black_box(unsafe { search(h, text.as_ptr(), state.as_mut_ptr()) });
                }
                count += 256;
                if start.elapsed() >= Duration::from_millis(100) {
                    break;
                }
            }
            scores.push(start.elapsed().as_nanos() as f64 / count as f64);
        }
        println!(
            "{{\"case\":\"{}\",\"compile_ns\":{},\"search_ns\":{:?}}}",
            name,
            compile_ns / 64,
            scores
        );
        unsafe { adapter::jdk_regex_free(h) };
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description="Isolated native regex option audit; not a Java benchmark")
    parser.add_argument("--output", type=Path, default=ROOT / "build/rust-regex-option-audit")
    parser.add_argument("--cargo", default="cargo")
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    for name, (thin, dfa, backtrack, capacity) in VARIANTS.items():
        crate = out / name
        (crate / ".cargo").mkdir(parents=True, exist_ok=True)
        manifest = (SOURCE / "Cargo.toml").read_text().replace(
            'path = "adapter.rs"', 'path = "adapter.rs"\n\n[[bin]]\nname = "optimization-audit"\npath = "audit.rs"')
        if thin:
            manifest += 'lto = "thin"\n'
        (crate / "Cargo.toml").write_text(manifest)
        shutil.copyfile(SOURCE / "Cargo.lock", crate / "Cargo.lock")
        (crate / ".cargo/config.toml").write_text(
            '[source.crates-io]\nreplace-with = "vendored-sources"\n[source.vendored-sources]\ndirectory = '
            + json.dumps(str(SOURCE / "vendor")) + '\n')
        adapter = (SOURCE / "adapter.rs").read_text().replace(
            ".dfa(false)", f".dfa({str(dfa).lower()})").replace(
            ".backtrack(false)", f".backtrack({str(backtrack).lower()})").replace(
            "const HYBRID_CAPACITY: usize = 32 * 1024;", f"const HYBRID_CAPACITY: usize = {capacity};")
        (crate / "adapter.rs").write_text(adapter)
        (crate / "audit.rs").write_text(HARNESS)
        print("Building", name, flush=True)
        with (out / (name + "-build.log")).open("w") as log:
            subprocess.run([args.cargo, "build", "--frozen", "--release", "-j1", "--bin", "optimization-audit",
                            "--target-dir", str(out / "target")], cwd=crate, stdout=log,
                           stderr=subprocess.STDOUT, check=True)
        suffix = ".exe" if os.name == "nt" else ""
        shutil.copy2(out / ("target/release/optimization-audit" + suffix), out / (name + "-audit" + suffix))
    orders = [list(VARIANTS), list(reversed(VARIANTS)), ["dfa", "base", "cache128", "thin", "backtrack"]]
    # Pins only the benchmark child on supported hosts, leaving the user's process unchanged.
    affinity = {min(os.sched_getaffinity(0))} if hasattr(os, "sched_getaffinity") else None
    with (out / "measurements.jsonl").open("w") as records:
        for pair, order in enumerate(orders):
            for name in order:
                print("Measuring", pair, name, flush=True)
                child = {"preexec_fn": lambda: os.sched_setaffinity(0, affinity)} if affinity else {}
                suffix = ".exe" if os.name == "nt" else ""
                result = subprocess.run([str(out / (name + "-audit" + suffix))], check=True,
                                        text=True, stdout=subprocess.PIPE, **child)
                for line in result.stdout.splitlines():
                    records.write(json.dumps({"pair": pair, "variant": name, **json.loads(line)}) + "\n")
                records.flush()


if __name__ == "__main__":
    main()
