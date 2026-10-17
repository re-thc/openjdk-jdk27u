#!/usr/bin/env python3
"""Disassemble PrintAssembly hex with installed objdump; no hsdis installation."""
import argparse
from pathlib import Path
import re
import subprocess
import tempfile


def extract(log, target="ColdReturningCall::decodeSequencesRolling"):
    compilations = re.split(r"(?=Compiled method \(c2\))", log)
    normal = [c for c in compilations if c.startswith("Compiled method")
              and target in c.splitlines()[0]
              and "%" not in c.splitlines()[0]]
    if not normal:
        raise ValueError("No normal-entry C2 target found")
    selected = normal[-1]
    bounds = re.search(r"main code\s+\[0x([0-9a-f]+),0x([0-9a-f]+)\]", selected)
    start, end = (int(v, 16) for v in bounds.groups())
    section = selected.split("[MachCode]", 1)[1].split("[/MachCode]", 1)[0]
    data = {}
    for line in section.splitlines():
        match = re.match(r"\s+0x([0-9a-f]+): ([0-9a-f |]+)\s*$", line)
        if not match:
            continue
        address = int(match[1], 16)
        raw = bytes.fromhex(match[2].replace("|", " "))
        for i, byte in enumerate(raw):
            if start <= address + i < end:
                previous = data.setdefault(address + i, byte)
                if previous != byte:
                    raise ValueError("Conflicting code bytes")
    missing = [a for a in range(start, end) if a not in data]
    if missing:
        raise ValueError("Incomplete main code bytes: " + hex(missing[0]))
    return selected.splitlines()[0], start, bytes(data[a] for a in range(start, end))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("log", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--target", default="ColdReturningCall::decodeSequencesRolling")
    args = parser.parse_args()
    header, start, code = extract(args.log.read_text(), args.target)
    with tempfile.TemporaryDirectory(prefix="cold-call-objdump-") as tmp:
        binary = Path(tmp) / "code.bin"
        binary.write_bytes(code)
        result = subprocess.run([
            "objdump", "-D", "-b", "binary", "-m", "i386:x86-64", "-M", "intel",
            "--insn-width=16", "--adjust-vma=" + hex(start), str(binary),
        ], check=True, text=True, capture_output=True)
    lines = result.stdout.split("Disassembly of section .data:", 1)[1]
    args.output.write_text(header + "\n" + lines)
    print(header)
    print("Verified contiguous main-code bytes:", len(code))


if __name__ == "__main__":
    main()
