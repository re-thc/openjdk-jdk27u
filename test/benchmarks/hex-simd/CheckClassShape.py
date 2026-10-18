#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Read classfiles only; verify structural repair, never execute/measure Java."""
import argparse
import json
from pathlib import Path
import zipfile


def read_class(data):
    offset = 8
    def unsigned(size):
        nonlocal offset
        value = int.from_bytes(data[offset:offset + size], 'big')
        offset += size
        return value
    assert data[:4] == b'\xca\xfe\xba\xbe'
    pool, count = [None], unsigned(2)
    while len(pool) < count:
        tag = unsigned(1)
        if tag == 1:
            size = unsigned(2)
            value = data[offset:offset + size].decode('utf-8', errors='replace')
            offset += size
        elif tag in [3, 4]: value = unsigned(4)
        elif tag in [5, 6]:
            pool.extend([(tag, unsigned(8)), None])
            continue
        elif tag in [7, 8, 16, 19, 20]: value = unsigned(2)
        elif tag in [9, 10, 11, 12, 17, 18]: value = (unsigned(2), unsigned(2))
        elif tag == 15: value = (unsigned(1), unsigned(2))
        else: raise ValueError('unknown pool tag: ' + str(tag))
        pool.append((tag, value))
    offset += 6
    count = unsigned(2)
    offset += 2 * count
    def members():
        nonlocal offset
        result = {}
        for _ in range(unsigned(2)):
            access, name, descriptor = unsigned(2), unsigned(2), unsigned(2)
            for _ in range(unsigned(2)):
                attribute, size = unsigned(2), unsigned(4)
                if pool[attribute][1] == 'Code':
                    length = int.from_bytes(data[offset + 4:offset + 8], 'big')
                    result[pool[name][1] + pool[descriptor][1]] = data[offset + 8:offset + 8 + length]
                offset += size
        return result
    members()  # fields
    return pool, members()


def normalized_constant(pool, index):
    tag, value = pool[index]
    if tag == 1: return tag, value.replace('HexFormatReference', 'HexFormat')
    if tag in [7, 8, 16, 19, 20]: return tag, normalized_constant(pool, value)
    if tag in [9, 10, 11, 12]: return tag, tuple(normalized_constant(pool, x) for x in value)
    if tag in [17, 18]: return tag, value[0], normalized_constant(pool, value[1])
    if tag == 15: return tag, value[0], normalized_constant(pool, value[1])
    return tag, value


def normalized_code(pool, code):
    widths = {16: 2, 17: 3, 18: 2, 19: 3, 20: 3, 132: 3, 169: 2,
              185: 5, 186: 5, 188: 2, 197: 4, 200: 5, 201: 5}
    for op in list(range(21, 26)) + list(range(54, 59)): widths[op] = 2
    for op in list(range(153, 169)) + list(range(178, 185)) + [187, 189, 192, 193, 198, 199]: widths[op] = 3
    constants = {18, 19, 20, *range(178, 188), 189, 192, 193, 197}
    result, offset = [], 0
    while offset < len(code):
        op = code[offset]
        size = widths.get(op, 1)
        if op in [170, 171]:
            # Switch payloads align to four bytes from the method's start.
            payload = (offset + 4) & ~3
            if op == 170:
                low = int.from_bytes(code[payload + 4:payload + 8], 'big', signed=True)
                high = int.from_bytes(code[payload + 8:payload + 12], 'big', signed=True)
                size = payload - offset + 12 + 4 * (high - low + 1)
            else:
                count = int.from_bytes(code[payload + 4:payload + 8], 'big')
                size = payload - offset + 8 + 8 * count
        elif op == 196:
            size = 6 if code[offset + 1] == 132 else 4
        operand = code[offset + 1:offset + size]
        if op in constants:
            count = 1 if op == 18 else 2
            operand = normalized_constant(pool, int.from_bytes(operand[:count], 'big')), operand[count:]
        result.append((op, operand))
        offset += size
    assert offset == len(code)
    return result


def check(baseline_jmod, candidate_class, reference_class):
    with zipfile.ZipFile(baseline_jmod) as archive:
        base_pool, base = read_class(archive.read('classes/java/util/HexFormat.class'))
    if Path(candidate_class).suffix == '.jmod':
        with zipfile.ZipFile(candidate_class) as archive:
            candidate_bytes = archive.read('classes/java/util/HexFormat.class')
    else:
        candidate_bytes = Path(candidate_class).read_bytes()
    candidate_pool, candidate = read_class(candidate_bytes)
    reference_pool, reference = read_class(Path(reference_class).read_bytes())
    scalar = 'formatOptDelimiter([BII)Ljava/lang/String;'
    assert normalized_code(base_pool, base[scalar]) == normalized_code(candidate_pool, candidate[scalar]), 'scalar formatter changed'
    normalized_reference = {name.replace('HexFormatReference', 'HexFormat'): code for name, code in reference.items()}
    assert base.keys() == normalized_reference.keys(), 'reference method inventory differs'
    for name, code in base.items():
        assert normalized_code(base_pool, code) == normalized_code(reference_pool, normalized_reference[name]), 'reference bytecode differs: ' + name
    selected = ['formatBytes([BII)Ljava/lang/String;', scalar, 'isPlain()Z', 'parseHex(Ljava/lang/CharSequence;II)[B']
    lengths = {name: len(candidate[name]) for name in selected}
    # These are x64 source defaults, not claims about an actual JIT decision.
    assert lengths['isPlain()Z'] <= 35, 'eligibility helper exceeds MaxInlineSize'
    assert lengths['parseHex(Ljava/lang/CharSequence;II)[B'] < 325, 'range parser exceeds x64 FreqInlineSize'
    return {'scalar_formatter_baseline_normalized_code_equal': True,
            'reference_all_method_normalized_code_equal': True,
            'code_lengths': lengths,
            'scope': 'classfile shape/inline eligibility only; no generated-code or performance claim'}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['baseline-jmod', 'candidate-class', 'reference-class']:
        parser.add_argument('--' + name, type=Path, required=True)
    args = parser.parse_args()
    print(json.dumps(check(args.baseline_jmod, args.candidate_class, args.reference_class), indent=2))
