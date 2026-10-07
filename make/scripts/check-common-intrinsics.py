#!/usr/bin/env python3
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
#/

"""Check that the applicability audit covers the current C2 dispatch catalogue."""

import csv
import re
from collections import Counter
from pathlib import Path

root = Path(__file__).resolve().parents[2]
source = (root / "src/hotspot/share/opto/library_call.cpp").read_text()
start = source.index("bool LibraryCallKit::try_to_inline(")
start = source.index("{", start)
depth = 1
end = start + 1
while depth:
    depth += (source[end] == "{") - (source[end] == "}")
    end += 1
c2 = set(re.findall(r"case vmIntrinsics::(\w+):", source[start:end]))

with (root / "doc/common-intrinsics/applicability.csv").open(newline="") as stream:
    rows = list(csv.DictReader(stream))
by_id = {row["id"]: row for row in rows}
assert len(by_id) == len(rows), "duplicate intrinsic in audit"
assert c2 == set(by_id), (
    "C2 catalogue changed: missing=" + str(sorted(c2 - set(by_id)))
    + ", stale=" + str(sorted(set(by_id) - c2))
)

catalogue = (root / "src/hotspot/share/runtime/commonIntrinsics.hpp").read_text()
leaf_section, scalar_section = catalogue.split("#define COMMON_SCALAR_INTRINSICS_DO", 1)
leaf = set(re.findall(r"  f\((\w+),", leaf_section))
scalar = set(re.findall(r"  f\((\w+),", scalar_section))
declarations = (root / "src/hotspot/share/classfile/vmIntrinsics.hpp").read_text()
native = set(re.findall(r"do_intrinsic\(\s*(\w+),[^\n]*,\s*F_[RS]N\)", declarations))
assert not native & (leaf | scalar), "common interpreter catalogue contains a native method"
for ids, status in ((leaf, "Shared leaf adapter"), (scalar, "Shared scalar lowering")):
    audited = {row["id"] for row in rows if row["status"] == status}
    assert ids == audited, "implementation/audit mismatch for " + status
assert all(row["reason"] for row in rows), "missing applicability reason"
assert not {"_base64_encodeBlock", "_base64_decodeBlock",
            "_updateBytesAdler32", "_updateByteBufferAdler32"} & (leaf | scalar), (
    "open PR functionality was reintroduced"
)
print("C2 catalogue: " + str(len(c2)) + " entries")
for status, count in sorted(Counter(row["status"] for row in rows).items()):
    print(str(count) + " " + status)
