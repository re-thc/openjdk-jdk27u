#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""Preserve ARM64 code in a Mach-O object and recognize the exact fused rule.

The ten-instruction recognizer works on instruction words, independently of
Darwin disassembler aliases. otool output is retained for human inspection.
It is not a general-purpose ARM disassembler or an allocation/spill analysis.
"""
import re
import struct

REGISTER_FIELDS = 31 | (31 << 5) | (31 << 16)


def macho_object(body):
    """Wrap unchanged little-endian instructions in one __TEXT,__text section."""
    if not body or len(body) % 4:
        raise ValueError("Require nonempty, instruction-aligned ARM64 bytes")
    header_size, command_size = 32, 72 + 80
    offset = header_size + command_size
    header = struct.pack("<8I", 0xfeedfacf, 0x0100000c, 0, 1, 1, command_size, 0, 0)
    segment = struct.pack("<II16sQQQQiiII", 0x19, command_size, b"__TEXT",
                          0, len(body), offset, len(body), 7, 5, 1, 0)
    section = struct.pack("<16s16sQQ8I", b"__text", b"__TEXT", 0, len(body),
                          offset, 2, 0, 0, 0x80000400, 0, 0, 0)
    return header + segment + section + body


def fused_sequences(body):
    """Return exact weight/MOV/DUP/AND/3ADDP/UMOV sequences and register checks."""
    if len(body) % 4:
        raise ValueError("Incomplete ARM64 instruction word")
    words = struct.unpack("<" + "I" * (len(body) // 4), body)
    found = []
    for i in range(len(words) - 9):
        s = words[i:i + 10]
        if s[0] & 0xff800000 != 0xd2800000 or any(w & 0xff800000 != 0xf2800000 for w in s[1:4]):
            continue
        value, shifts = 0, set()
        for word in s[:4]:
            shift = ((word >> 21) & 3) * 16
            shifts.add(shift)
            value |= ((word >> 5) & 65535) << shift
        if value != 0x8040201008040201 or len(shifts) != 4:
            continue
        if (s[4] & ~0x3ff != 0x4e080c00
                or s[5] & ~REGISTER_FIELDS != 0x4e201c00
                or any(w & ~REGISTER_FIELDS != 0x4e20bc00 for w in s[6:9])
                or s[9] & ~0x3ff != 0x0e023c00):
            continue
        rd, tmp, source = s[0] & 31, s[4] & 31, (s[5] >> 5) & 31
        valid = (rd != 31 and all(w & 31 == rd for w in s[:4])
                 and (s[4] >> 5) & 31 == rd
                 and s[5] & 31 == tmp and (s[5] >> 16) & 31 == tmp
                 and source != tmp
                 and all(w & 31 == tmp and (w >> 5) & 31 == tmp
                         and (w >> 16) & 31 == tmp for w in s[6:9])
                 and s[9] & 31 == rd and (s[9] >> 5) & 31 == tmp)
        found.append({"address": hex(i * 4), "scalar_result": f"x{rd}",
                      "raw_mask": f"v{source}", "vector_temp": f"v{tmp}",
                      "all_operands_valid": bool(valid),
                      "raw_mask_distinct_from_temp": source != tmp})
    return found


def verify_otool_control(text):
    """Require otool to decode MOVZ x0,#1; RET at the expected byte offsets."""
    instructions = {}
    for line in text.splitlines():
        match = re.match(r"^\s*([0-9a-fA-F]+)\s+(?:(?:[0-9a-fA-F]{8}|(?:[0-9a-fA-F]{2}\s+){3}[0-9a-fA-F]{2})\s+)?(\w+)\s*(.*?)\s*$", line)
        if match:
            instructions[int(match[1], 16)] = (match[2].lower(), re.sub(r"\s+", "", match[3].split(";")[0].split("//")[0]).lower())
    first, second = instructions.get(0), instructions.get(4)
    return (first is not None and first[0] in ("mov", "movz")
            and first[1] in ("x0,#1", "x0,#0x1", "x0,#1,lsl#0", "x0,#0x1,lsl#0")
            and second in (("ret", ""), ("ret", "x30")))
