#!/usr/bin/env python3
#
# Copyright (c) 2026, re-thc. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
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
"""Isolated native experiment; this does not qualify Java/JIT dispatch."""
import argparse
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import shlex
import shutil
import statistics
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "serial-equality-output"
BASE = "da3ae24b030d8c9c0694bbb5b33412f76c27780c"
WORD_BASE = "93cd4e57e2f3828a583a0b6485ef208805622c24"
VENDOR = "src/java.base/share/native/libjava/stringzilla"
COMPARE = VENDOR + "/stringzilla/compare/serial.h"

WRAPPER = r"""
#define CAT_I(a, b) a##b
#define CAT(a, b) CAT_I(a, b)
#define JVM_StringZillaCapabilities CAT(VARIANT, _capabilities)
#define JVM_RegisterStringZillaKernels CAT(VARIANT, _register)
#define StringZilla_initialize CAT(VARIANT, _initialize)
#include "StringZillaKernels.c"
#if SZ_USE_MISALIGNED_LOADS != 0 || SZ_SWAR_THRESHOLD != 24
#error Unexpected portable-load configuration
#endif
JNIEXPORT jint JNICALL JVM_StringZillaCapabilities(void) { return JVM_STRINGZILLA_SERIAL; }
JNIEXPORT void JNICALL JVM_RegisterStringZillaKernels(const void* ignored) { (void)ignored; }
__attribute__((noinline)) int CAT(VARIANT, _equal)(const char* a, const char* b, int n) {
    return serial_kernels.equal(a, b, n);
}
"""

UNIT = r"""
#include "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    int failure = check_kernels();
    if (failure != 0) {
        fprintf(stderr, "Native kernel check failed at line %d\n", failure);
        return 1;
    }
    puts("Production native kernel contract checks passed");
    return 0;
}
"""

DRIVER = r"""
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int current_equal(const char*, const char*, int);
int word_equal(const char*, const char*, int);
int patched_equal(const char*, const char*, int);
int probe_equal(const char*, const char*, int);
typedef int (*equal_fn)(const char*, const char*, int);
static volatile unsigned int sink;

static uint64_t now_ns(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t) != 0) abort();
    return (uint64_t)t.tv_sec * 1000000000u + (uint64_t)t.tv_nsec;
}

static uint64_t elapsed(equal_fn fn, const char* a, const char* b, int n, unsigned int iterations) {
    unsigned int sum = 0;
    uint64_t start = now_ns();
    for (unsigned int i = 0; i < iterations; i++) sum += (unsigned int)fn(a, b, n);
    uint64_t duration = now_ns() - start;
    sink += sum;
    return duration;
}

static unsigned int calibrate(equal_fn fn, const char* a, const char* b, int n) {
    unsigned int iterations = 1024;
    while (elapsed(fn, a, b, n, iterations) < 3000000u && iterations < (1u << 24)) iterations *= 2;
    return iterations;
}

int main(int argc, char** argv) {
    const int lengths[] = {0, 1, 7, 8, 15, 16, 23, 24, 25, 31, 32, 33, 63, 64, 65,
                           127, 128, 129, 255, 256, 257, 1024, 4096};
    const int offsets[][2] = {{0, 0}, {1, 1}, {1, 3}, {7, 0}};
    const equal_fn functions[] = {current_equal, word_equal, patched_equal, probe_equal};
    const char* names[] = {"current", "word", "patched", "probe"};
    int check_only = argc == 2 && strcmp(argv[1], "--check") == 0;
    unsigned int case_id = 0;
    if (!check_only) puts("case,length,source_offset,target_offset,mismatch,round,order,variant,iterations,elapsed_ns,ns_per_op");
    for (unsigned int l = 0; l < sizeof(lengths) / sizeof(lengths[0]); l++) {
        int n = lengths[l];
        const int mismatches[] = {-1, 0, 7, 31, n / 2, n - 1};
        for (unsigned int o = 0; o < sizeof(offsets) / sizeof(offsets[0]); o++) {
            int a_offset = offsets[o][0], b_offset = offsets[o][1];
            size_t a_size = (size_t)(n + a_offset), b_size = (size_t)(n + b_offset);
            void* a_memory = NULL;
            void* b_memory = NULL;
            if (check_only) {
                a_memory = malloc(a_size != 0 ? a_size : 1);
                b_memory = malloc(b_size != 0 ? b_size : 1);
            } else {
                if (posix_memalign(&a_memory, 64, a_size != 0 ? a_size : 1) != 0 ||
                    posix_memalign(&b_memory, 64, b_size != 0 ? b_size : 1) != 0) abort();
                if ((((uintptr_t)a_memory | (uintptr_t)b_memory) & 63) != 0) abort();
            }
            if (a_memory == NULL || b_memory == NULL) abort();
            char* a_base = a_memory;
            char* b_base = b_memory;
            char* a = a_base + a_offset;
            char* b = b_base + b_offset;
            for (unsigned int m = 0; m < sizeof(mismatches) / sizeof(mismatches[0]); m++) {
                int mismatch = mismatches[m], duplicate = 0;
                if (mismatch >= n || mismatch < -1) continue;
                for (unsigned int previous = 0; previous < m; previous++)
                    if (mismatches[previous] == mismatch) duplicate = 1;
                if (duplicate) continue;
                for (int i = 0; i < n; i++) a[i] = b[i] = (char)((i * 13 + 7) & 255);
                if (mismatch >= 0) b[mismatch] ^= 1;
                for (int variant = 0; variant < 4; variant++) {
                    int actual = functions[variant](a, b, n);
                    if (actual != (mismatch < 0)) {
                        fprintf(stderr, "Bad result case=%u variant=%d n=%d mismatch=%d actual=%d\n",
                                case_id, variant, n, mismatch, actual);
                        return 1;
                    }
                }
                if (!check_only) {
                    unsigned int counts[4];
                    for (int variant = 0; variant < 4; variant++)
                        counts[variant] = calibrate(functions[variant], a, b, n);
                    for (int round = 0; round < 12; round++) {
                        for (int order = 0; order < 4; order++) {
                            int variant = ((int)case_id + round + order) & 3;
                            uint64_t duration = elapsed(functions[variant], a, b, n, counts[variant]);
                            printf("%u,%d,%d,%d,%d,%d,%d,%s,%u,%llu,%.9f\n",
                                   case_id, n, a_offset, b_offset, mismatch, round, order,
                                   names[variant], counts[variant],
                                   (unsigned long long)duration, (double)duration / counts[variant]);
                        }
                    }
                }
                case_id++;
            }
            free(a_base);
            free(b_base);
        }
    }
    if (check_only) printf("Native equality fixture checks passed: %u cases, exact-size allocations\n", case_id);
    return 0;
}
"""


def run(command, log, env=None):
    with (OUT / log).open("w") as output:
        output.write("$ " + shlex.join(map(str, command)) + "\n")
        output.flush()
        result = subprocess.run(list(map(str, command)), cwd=ROOT, env=env,
                                stdout=output, stderr=subprocess.STDOUT)
    if result.returncode:
        print((OUT / log).read_text(), flush=True)
        raise SystemExit(result.returncode)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", required=True)
    parser.add_argument("--boot-jdk", required=True)
    args = parser.parse_args()
    OUT.mkdir(exist_ok=True)
    current = subprocess.check_output(["git", "show", BASE + ":" + COMPARE], cwd=ROOT)
    if hashlib.sha256(current).hexdigest() != "ceb88e426198029f8464b1ccca6ae7e185af94a89b8726c620d883ad6c2a3164":
        raise SystemExit("Unexpected original serial equality source")
    word_header = subprocess.check_output(["git", "show", WORD_BASE + ":" + COMPARE], cwd=ROOT)
    if hashlib.sha256(word_header).hexdigest() != "8e18de2d906c45754e39e59421ccfc30d50caf7fb22c914a163415981827526d":
        raise SystemExit("Unexpected first-candidate equality header")
    indexed_header = (ROOT / COMPARE).read_text()
    probe_header = indexed_header.replace(
        "SZ_API_COMPTIME sz_bool_t sz_equal_serial(sz_cptr_t a, sz_cptr_t b, sz_size_t length) {\n",
        "SZ_API_COMPTIME sz_bool_t sz_equal_serial(sz_cptr_t a, sz_cptr_t b, sz_size_t length) {\n"
        "    if (length == 0) return sz_true_k;\n"
        "    if (a[0] != b[0]) return sz_false_k;\n")
    if probe_header == indexed_header:
        raise SystemExit("First-byte probe variant was not generated")
    for variant in ("current", "word", "patched", "probe"):
        destination = OUT / variant / "vendor"
        shutil.copytree(ROOT / VENDOR, destination, dirs_exist_ok=True)
        if variant == "current":
            (destination / "stringzilla/compare/serial.h").write_bytes(current)
        elif variant == "word":
            (destination / "stringzilla/compare/serial.h").write_bytes(word_header)
        elif variant == "probe":
            (destination / "stringzilla/compare/serial.h").write_text(probe_header)
    patch_stage = OUT / "patch-verification"
    (patch_stage / "stringzilla/compare").mkdir(parents=True, exist_ok=True)
    (patch_stage / "stringzilla/compare/serial.h").write_bytes(current)
    patch_result = subprocess.run(["patch", "--batch", "--forward", "--fuzz=0", "-p1", "-d", str(patch_stage)],
                                  input=(ROOT / VENDOR / "patches/0003-portable-serial-equality.patch").read_bytes(),
                                  stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (OUT / "patch-application.log").write_bytes(patch_result.stdout)
    if patch_result.returncode or (patch_stage / "stringzilla/compare/serial.h").read_bytes() != (ROOT / COMPARE).read_bytes():
        raise SystemExit("Tracked equality patch did not reproduce the candidate header")
    (OUT / "wrapper.c").write_text(WRAPPER)
    (OUT / "unit.c").write_text(UNIT)
    (OUT / "driver.c").write_text(DRIVER)
    allowed = sorted(os.sched_getaffinity(0))
    os.sched_setaffinity(0, {allowed[0]})
    print("NATIVE_EQUALITY_CPU " + str(allowed[0]), flush=True)
    version = subprocess.check_output([args.compiler, "--version"], text=True)
    (OUT / "compiler.txt").write_text(version)
    if Path(args.compiler).name.startswith("gcc"):
        run([args.compiler, "-Q", "--help=target"], "compiler-target-flags.log")
    else:
        run([args.compiler, "-###", "-x", "c", "-c", "/dev/null"], "compiler-target-flags.log")
    metadata = {
        "scope": "native serial equality experiment; not whole-image Java/JIT evidence",
        "production_base": BASE,
        "experiment_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "compiler": version, "cpu": allowed[0], "architecture": os.uname().machine,
        "rounds": 12, "minimum_calibration_ns": 3000000,
        "original_header_sha256": hashlib.sha256(current).hexdigest(),
        "word_header_sha256": hashlib.sha256(word_header).hexdigest(),
        "probe_header_sha256": hashlib.sha256(probe_header.encode()).hexdigest(),
        "patched_header_sha256": hashlib.sha256((ROOT / COMPARE).read_bytes()).hexdigest(),
        "portable_loads": 0, "word_threshold": 24,
        "timing_allocation": "64-byte-aligned allocations plus recorded offsets",
        "sanitizer_allocation": "exact-size malloc allocations plus recorded offsets",
        "timing_flags": ["-std=c11", "-O3"],
        "sanitizers": ["address", "undefined", "alignment"],
    }
    (OUT / "metadata.json").write_text(json.dumps(metadata, indent=2) + "\n")
    shared = ["-std=c11", "-Wno-unknown-pragmas", "-I" + str(ROOT),
              "-I" + str(ROOT / "src/java.base/share/native/libjava"),
              "-I" + str(ROOT / "src/hotspot/share/include"),
              "-I" + str(ROOT / "src/hotspot/os/posix/include"),
              "-I" + str(Path(args.boot_jdk) / "include"),
              "-I" + str(Path(args.boot_jdk) / "include/linux")]
    sanitizer = ["-O2", "-g", "-fno-omit-frame-pointer", "-fsanitize=address,undefined,alignment",
                 "-fno-sanitize-recover=all"]
    test_env = os.environ.copy()
    test_env["ASAN_OPTIONS"] = "abort_on_error=1:detect_leaks=1:strict_string_checks=1"
    test_env["UBSAN_OPTIONS"] = "halt_on_error=1:print_stacktrace=1"
    for variant in ("current", "word", "patched", "probe"):
        include = ["-I" + str(OUT / variant / "vendor")]
        for mode, flags in (("optimized", ["-O3"]), ("sanitized", sanitizer)):
            obj = OUT / variant / (mode + ".o")
            run([args.compiler, *include, *shared, *flags, "-DVARIANT=" + variant, "-c",
                 OUT / "wrapper.c", "-o", obj], variant + "-" + mode + "-build.log")
        run([args.compiler, *include, *shared, "-O3", "-DVARIANT=" + variant, "-S",
             OUT / "wrapper.c", "-o", OUT / variant / "optimized.s"], variant + "-assembly-build.log")
        run([args.compiler, *include, *shared, *sanitizer, OUT / "unit.c", "-o",
             OUT / variant / "native-contract"], variant + "-contract-build.log")
        run([OUT / variant / "native-contract"], variant + "-contract-run.log", test_env)
        print("NATIVE_EQUALITY_CONTRACT " + variant + " passed", flush=True)
    run([args.compiler, "-std=c11", "-O3", OUT / "driver.c", OUT / "current/optimized.o", OUT / "word/optimized.o",
         OUT / "patched/optimized.o", OUT / "probe/optimized.o", "-o", OUT / "benchmark"], "benchmark-build.log")
    run([args.compiler, "-std=c11", *sanitizer, OUT / "driver.c", OUT / "current/sanitized.o", OUT / "word/sanitized.o",
         OUT / "patched/sanitized.o", OUT / "probe/sanitized.o", "-o", OUT / "sanitized-fixtures"], "fixture-build.log")
    run([OUT / "sanitized-fixtures", "--check"], "fixture-sanitizer-run.log", test_env)
    print("NATIVE_EQUALITY_EXACT_ALLOCATIONS passed", flush=True)
    result = subprocess.run([str(OUT / "benchmark")], cwd=ROOT, text=True, capture_output=True)
    (OUT / "benchmark-stderr.txt").write_text(result.stderr)
    if result.returncode:
        raise SystemExit(result.returncode)
    (OUT / "raw.csv").write_text(result.stdout)
    groups = {}
    for row in csv.DictReader(io.StringIO(result.stdout)):
        key = (int(row["case"]), int(row["length"]), int(row["source_offset"]),
               int(row["target_offset"]), int(row["mismatch"]))
        groups.setdefault(key, {"current": [], "word": [], "patched": [], "probe": []})[row["variant"]].append(float(row["ns_per_op"]))
    summary = []
    slower = {"word": 0, "patched": 0, "probe": 0}
    print("NATIVE_EQUALITY_SUMMARY_HEADER case,length,source_offset,target_offset,mismatch,current_ns,word_ns,indexed_ns,probe_ns,current_over_word,current_over_indexed,current_over_probe,word_slower,indexed_slower,probe_slower", flush=True)
    for key, samples in groups.items():
        if any(len(values) != 12 for values in samples.values()):
            raise SystemExit("Incomplete paired samples")
        means = {variant: statistics.mean(values) for variant, values in samples.items()}
        record = dict(zip(("case", "length", "source_offset", "target_offset", "mismatch"), key))
        record["means_ns"] = means
        record["standard_deviations_ns"] = {variant: statistics.stdev(values) for variant, values in samples.items()}
        record["higher_than_current"] = {variant: means[variant] > means["current"] for variant in slower}
        for variant in slower:
            slower[variant] += record["higher_than_current"][variant]
        summary.append(record)
        values = (*key, *(round(means[variant], 6) for variant in ("current", "word", "patched", "probe")),
                  *(round(means["current"] / means[variant], 6) for variant in slower),
                  *(int(record["higher_than_current"][variant]) for variant in slower))
        print("NATIVE_EQUALITY_CASE " + ",".join(map(str, values)), flush=True)
    (OUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print("NATIVE_EQUALITY_TOTAL " + json.dumps({"cases": len(summary), "higher_means": slower}), flush=True)
    for variant in ("current", "word", "patched", "probe"):
        lines = (OUT / variant / "optimized.s").read_text().splitlines()
        start = next((i for i, line in enumerate(lines) if line.startswith(variant + "_equal:")), None)
        if start is not None:
            end = next((i for i in range(start + 1, len(lines))
                        if ".size" in lines[i] and variant + "_equal" in lines[i]), min(start + 120, len(lines)))
            print("NATIVE_EQUALITY_ASSEMBLY_BEGIN " + variant, flush=True)
            print("\n".join(lines[start:end + 1]), flush=True)
            print("NATIVE_EQUALITY_ASSEMBLY_END " + variant, flush=True)
    hashes = {str(p.relative_to(OUT)): hashlib.sha256(p.read_bytes()).hexdigest()
              for p in sorted(OUT.rglob("*")) if p.is_file()}
    (OUT / "sha256.json").write_text(json.dumps(hashes, indent=2) + "\n")


if __name__ == "__main__":
    main()
