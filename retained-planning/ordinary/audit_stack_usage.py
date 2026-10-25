#!/usr/bin/env python3
"""Fail-closed conservative checker for GCC -fstack-usage output.

Future use: audit_stack_usage.py <variant> <32KiB-limit> <file.su> [...].
It intentionally over-counts qsort depth as 9 frames (entry budget 8 plus the
base/progress-fallback frame), then adds the largest non-qsort leaf frame,
kernel/entry frames, and 512 bytes for call/return and reporting allowance.
Unknown or dynamic stack entries on relevant functions fail closed.
This checks source-frame accounting only; disassembly/inline/callsite review
still is required for each E/U binary.
"""
import re
import sys

RECURSIVE = ("qsort_", "xss_qsort")
LEAF = ("partition", "get_pivot", "sort_n", "heap_sort")
KERNEL = "bounded_long_xss_kernel"
ENTRY = "bounded_long_xss_sort"
CALL_ALLOWANCE = 512
RECURSIVE_INVOCATIONS = 9


def fail(message):
    raise SystemExit("FAIL: " + message)


def main():
    if len(sys.argv) < 4:
        fail("usage: audit_stack_usage.py <E|U> <limit-bytes> <file.su> [...]")
    variant = sys.argv[1]
    if variant not in ("E", "U"):
        fail("variant must be E or U")
    limit = int(sys.argv[2], 10)
    rows = []
    for filename in sys.argv[3:]:
        with open(filename, encoding="utf-8") as stream:
            for line in stream:
                fields = line.rstrip("\n").split("\t")
                if len(fields) < 3:
                    continue
                source_function = fields[0]
                match = re.match(r"^(.*):\d+:\d+:(.*)$", source_function)
                if not match:
                    continue
                function = match.group(2)
                try:
                    size = int(fields[1])
                except ValueError:
                    continue
                classification = fields[2]
                relevant = (any(name in function for name in RECURSIVE + LEAF)
                            or KERNEL in function or ENTRY in function)
                if not relevant:
                    continue
                if classification.startswith("dynamic"):
                    fail(f"dynamic/unbounded stack usage for {function} ({filename})")
                if classification != "static":
                    fail(f"unknown stack classification {classification!r} for {function}")
                rows.append((function, size))
    recursive = [size for function, size in rows
                 if any(name in function for name in RECURSIVE)]
    if not recursive:
        fail("no qsort_ / xss_qsort frame found")
    kernel = [size for function, size in rows if KERNEL in function]
    entry = [size for function, size in rows if ENTRY in function]
    if not kernel or not entry:
        fail("missing bounded kernel or guarded entry frame")
    leaves = [size for function, size in rows
              if any(name in function for name in LEAF)
              and not any(name in function for name in RECURSIVE)]
    recursive_frame = max(recursive)
    leaf_frame = max(leaves, default=0)
    kernel_frame = max(kernel)
    entry_frame = max(entry)
    total = (RECURSIVE_INVOCATIONS * recursive_frame + leaf_frame
             + kernel_frame + entry_frame + CALL_ALLOWANCE)
    print(f"variant={variant} recursive_frame={recursive_frame} "
          f"recursive_invocations={RECURSIVE_INVOCATIONS} leaf_frame={leaf_frame} "
          f"kernel_frame={kernel_frame} entry_frame={entry_frame} "
          f"allowance={CALL_ALLOWANCE} conservative_total={total} limit={limit}")
    if total > limit:
        fail("conservative frame sum exceeds stack reserve")
    print("PASS: .su arithmetic is within reserve; binary inspection remains mandatory")


if __name__ == "__main__":
    main()
