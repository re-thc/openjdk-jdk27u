#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Check internal Żmij table/decimal contracts before installing an update.

The driver compiles the production metadata method with the staged vendor.
Python integer/rational arithmetic supplies independent table and flag oracles.
"""
import argparse
from decimal import Decimal
from fractions import Fraction
import math
from pathlib import Path
import random
import re
import shlex
import struct
import subprocess
import tempfile


def fixtures():
    values = set(range(133))
    for exponent in range(2047):
        for fraction in (0, 1, 2, (1 << 51) - 1, 1 << 51, (1 << 52) - 2, (1 << 52) - 1):
            values.add((exponent << 52) | fraction)
    for exponent in range(-323, 309):
        value = float('1e' + str(exponent))
        for adjacent in (math.nextafter(value, 0), value, math.nextafter(value, math.inf)):
            values.add(struct.unpack('>Q', struct.pack('>d', adjacent))[0])
    rng = random.Random(9271)
    values.update(rng.randrange(0x7ff0000000000000) for _ in range(10000))
    values.update((0x8000000000000000, 0x7ff0000000000000, 0xfff0000000000000,
                   0x7ff8000000000000, 0x7ff0000000000001, 0xffffffffffffffff))
    return sorted(values)


def method_body(adapter):
    source = adapter.read_text()
    match = re.search(r'uint64_t Zmij::decimal\(uint64_t bits\)\s*\{', source)
    if match is None:
        raise RuntimeError('Review checker extraction after changing Zmij::decimal signature')
    begin = match.end() - 1
    depth = 1
    end = begin + 1
    while depth and end < len(source):
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    if depth:
        raise RuntimeError('Cannot extract production Zmij::decimal body')
    return 'uint64_t bridge(uint64_t bits) ' + source[begin:end]


def pow10(exponent):
    return Fraction(10 ** exponent) if exponent >= 0 else Fraction(1, 10 ** -exponent)


def verify(output, values):
    tables = set()
    seen = set()
    for line in output.splitlines():
        kind, *fields = line.split()
        if kind == 'T':
            exponent, hi, lo = map(int, fields)
            if exponent in tables:
                raise AssertionError('Duplicate table coverage')
            numerator = 10 ** exponent if exponent >= 0 else 1
            denominator = 1 if exponent >= 0 else 10 ** -exponent
            binary_exponent = numerator.bit_length() - 1 if exponent >= 0 else -denominator.bit_length()
            shift = 127 - binary_exponent
            expected = ((numerator << shift) // denominator if shift >= 0
                        else numerator // (denominator << -shift))
            if ((hi << 64) | lo) != expected:
                raise AssertionError(f'Downward-rounded power table changed at 10**{exponent}')
            tables.add(exponent)
            continue
        if kind != 'B':
            raise AssertionError('Unexpected checker output')
        bits, sig, exp, packed = map(int, fields)
        if bits in seen:
            raise AssertionError('Duplicate fixture coverage')
        seen.add(bits)
        if bits <= 128 or bits >= 0x7ff0000000000000:
            if packed != 0:
                raise AssertionError(f'Fallback/totality contract changed for {bits:016x}')
            continue
        value = struct.unpack('>d', struct.pack('>Q', bits))[0]
        if sig <= 0 or not -400 <= exp <= 400:
            raise AssertionError(f'Decimal representation changed for {bits:016x}')
        if float(str(sig) + 'e' + str(exp)) != value:
            raise AssertionError(f'Decimal does not round-trip for {bits:016x}')
        # Python's independent shortest formatter supplies a digit-count bound.
        # Java allows a minimum of two significant digits.
        digits = len(str(sig).rstrip('0'))
        original_digits = len(''.join(map(str, Decimal(repr(value)).as_tuple().digits)).rstrip('0'))
        if digits > max(2, original_digits):
            raise AssertionError(f'Decimal is no longer shortest for {bits:016x}')
        bq = bits >> 52
        q = bq - 1075 if bq else -1074
        c = (bits & ((1 << 52) - 1)) | ((1 << 52) if bq else 0)
        irregular = c == 1 << 52 and q != -1074
        k = (q * 661971961083 - (274743187321 if irregular else 0)) >> 41
        if exp < k or sig * 10 ** (exp - k) >= 1 << 57:
            if packed != 0:
                raise AssertionError('Unrepresentable metadata did not request Java fallback')
            continue
        f = sig * 10 ** (exp - k)
        exact_value = Fraction(c << q) if q >= 0 else Fraction(c, 1 << -q)
        decimal_value = f * pow10(k)
        expected = f | (int(decimal_value == exact_value) << 62) | (int(decimal_value > exact_value) << 63)
        if packed != expected:
            raise AssertionError(f'Metadata changed for {bits:016x}: {packed:016x} != {expected:016x}')
    if tables != set(range(-307, 342)) or seen != set(values):
        raise AssertionError('Missing table/fixture coverage')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('staged', type=Path, help='patched zmij.cc/zmij.h directory')
    parser.add_argument('--cxx', default='c++', help='host C++ compiler and flags')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    body = method_body(root / 'src/hotspot/share/utilities/zmij.cpp')
    values = fixtures()
    driver = '#include <cstdio>\n#include <cinttypes>\n#include <cstring>\n#include "zmij.cc"\n' + body + r'''
int main() {
  for (int e = -307; e <= 341; ++e) {
    auto p = static_data.pow10_significands[e];
    std::printf("T %d %" PRIu64 " %" PRIu64 "\n", e, p.hi, p.lo);
  }
  uint64_t bits;
  while (std::scanf("%" SCNx64, &bits) == 1) {
    uint64_t sig = 0;
    int exp = 0;
    if (bits > 128 && bits < UINT64_C(0x7ff0000000000000)) {
      double value;
      std::memcpy(&value, &bits, sizeof(value));
      auto d = zmij::detail::to_decimal(value);
      sig = d.sig;
      exp = d.exp;
    }
    std::printf("B %" PRIu64 " %" PRIu64 " %d %" PRIu64 "\n", bits, sig, exp, bridge(bits));
  }
}
'''
    with tempfile.TemporaryDirectory() as temporary:
        directory = Path(temporary)
        source = directory / 'check.cpp'
        source.write_text(driver)
        for profile, flags in (('full-table', []),
                               ('shortest-table', ['-DZMIJ_SHORTEST_ONLY=1']),
                               ('shortest-compressed', ['-DZMIJ_SHORTEST_ONLY=1', '-DZMIJ_OPTIMIZE_SIZE=1'])):
            binary = directory / profile
            subprocess.run(shlex.split(args.cxx) + ['-std=c++17', '-O2',
                           '-fsanitize=undefined', '-fno-sanitize-recover=undefined',
                           '-I' + str(args.staged.resolve()), *flags,
                           str(source), '-o', str(binary)], check=True)
            result = subprocess.run([str(binary)], input=''.join(f'{v:x}\n' for v in values),
                                    capture_output=True, text=True, check=True)
            verify(result.stdout, values)
            print(f'{profile}: 649 exact power tables and {len(values)} metadata/round-trip fixtures passed')


if __name__ == '__main__':
    main()
