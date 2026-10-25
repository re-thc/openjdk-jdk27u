#!/usr/bin/env python3
"""Source-only identity check for the copied E/U template closure.

Usage: verify_vendor_identity.py <prototype-checkout> <xss-6e-checkout>
Does not compile, run native code, or access the network.
"""
import difflib
import hashlib
import pathlib
import subprocess
import sys

PIN = "6e059b14975df2e3c74260ec905167a1be5a34ca"
UPSTREAM_PATCH_SHA256 = "1c9b2b0b6f49c73c948e15e29404cb265531072d2803ed6be5b11109225eeb8d"
EMBEDDED_PATCH_SHA256 = "d9a6999a8473143038c76a5276316355f0cbc1554eaaeea8ce7e26710d71b192"

UPSTREAM_UNCHANGED = [
    "avx2-32bit-qsort.hpp", "avx2-emu-funcs.hpp", "avx512-64bit-common.h",
    "avx512-64bit-qsort.hpp", "xss-common-comparators.hpp", "xss-common-includes.h",
    "xss-custom-float.h", "xss-network-qsort.hpp", "xss-optimal-networks.hpp",
    "xss-pivot-selection.hpp", "xss-reg-networks.hpp",
]
EMBEDDED_UNCHANGED = [
    "avx512-64bit-qsort.hpp", "xss-common-includes.h", "xss-network-qsort.hpp",
    "xss-optimal-networks.hpp", "xss-pivot-selection.hpp",
]


def fail(message):
    raise SystemExit("FAIL: " + message)


def pinned_file(git_root, relative):
    return subprocess.check_output(
        ["git", "-C", str(git_root), "show", f"{PIN}:src/{relative}"],
        stderr=subprocess.STDOUT,
    )


def patch_digest(original, modified, old_name, new_name):
    old_lines = original.decode().splitlines(keepends=True)
    new_lines = modified.read_text().splitlines(keepends=True)
    diff = "".join(difflib.unified_diff(old_lines, new_lines,
                                         fromfile=old_name, tofile=new_name))
    return hashlib.sha256(diff.encode()).hexdigest()


def main():
    if len(sys.argv) != 3:
        fail("usage: verify_vendor_identity.py <prototype-checkout> <xss-6e-checkout>")
    repo = pathlib.Path(sys.argv[1]).resolve()
    xss = pathlib.Path(sys.argv[2]).resolve()
    head = subprocess.check_output(["git", "-C", str(xss), "rev-parse", "HEAD"], text=True).strip()
    if head != PIN:
        fail(f"upstream checkout is {head}, expected {PIN}")

    vendor = repo / "src/java.base/linux/native/librangesort/upstream"
    for name in UPSTREAM_UNCHANGED:
        source = pinned_file(xss, name).replace(b"\r\n", b"\n")
        copied = (vendor / name).read_bytes().replace(b"\r\n", b"\n")
        if source != copied:
            fail(f"unexpected vendor delta in upstream/{name}")
    if patch_digest(pinned_file(xss, "xss-common-qsort.h"),
                    vendor / "xss-common-qsort.h",
                    "pinned/src/xss-common-qsort.h",
                    "prototype/upstream/xss-common-qsort.h") != UPSTREAM_PATCH_SHA256:
        fail("upstream common-qsort safety patch differs from reviewed patch")
    license_bytes = subprocess.check_output(
        ["git", "-C", str(xss), "show", f"{PIN}:LICENSE.md"], stderr=subprocess.STDOUT)
    if license_bytes != (vendor / "LICENSE.md").read_bytes():
        fail("upstream license differs from pinned source")

    embedded = repo / "src/java.base/linux/native/librangesort/embedded"
    stock = repo / "src/java.base/linux/native/libsimdsort"
    for name in EMBEDDED_UNCHANGED:
        if (stock / name).read_bytes() != (embedded / name).read_bytes():
            fail(f"unexpected embedded copy delta in {name}")
    if patch_digest((stock / "xss-common-qsort.h").read_bytes(),
                    embedded / "xss-common-qsort.h",
                    "baseline/src/java.base/linux/native/libsimdsort/xss-common-qsort.h",
                    "prototype/embedded/xss-common-qsort.h") != EMBEDDED_PATCH_SHA256:
        fail("embedded common-qsort safety patch differs from reviewed patch")
    print("PASS: vendored template identity and reviewed qsort-only deltas match")


if __name__ == "__main__":
    main()
