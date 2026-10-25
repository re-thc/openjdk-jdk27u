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
#

"""Check internal Żmij table/decimal contracts before installing an update.

The driver compiles the production metadata method with the staged vendor.
Python integer/rational arithmetic supplies independent table and flag oracles.
"""
import argparse
from decimal import Decimal
from fractions import Fraction
import os
from pathlib import Path
import random
import shlex
import struct
import subprocess
import tempfile


def fixtures():
    values = set(range(257))
    for exponent in range(2048):
        for fraction in (0, 1, 2, (1 << 51) - 1, 1 << 51, (1 << 52) - 2, (1 << 52) - 1):
            values.add((exponent << 52) | fraction)
        values.update((exponent << 52) + delta for delta in range(-2, 3)
                      if (exponent << 52) + delta >= 0)
    for exponent in range(-323, 309):
        value = float('1e' + str(exponent))
        bits = struct.unpack('>Q', struct.pack('>d', value))[0]
        values.update(bits + delta for delta in range(-2, 3))
    rng = random.Random(9271)
    values.update(rng.randrange(0x7ff0000000000000) for _ in range(10000))
    rng = random.Random(0xF70A111)
    values.update(rng.getrandbits(64) for _ in range(12000))
    values.update((0x8000000000000000, 0x7ff0000000000000, 0xfff0000000000000,
                   0x7ff8000000000000, 0x7ff8000000000001, 0x7ff0000000000001, 0xffffffffffffffff))
    return sorted(values)


def pow10(exponent):
    return Fraction(10 ** exponent) if exponent >= 0 else Fraction(1, 10 ** -exponent)


def verify(output, values):
    tables = set()
    seen = set()
    exact_count = away_count = 0
    for line in output.splitlines():
        kind, *fields = line.split()
        if kind == 'T':
            exponent = int(fields[0])
            hi, lo = int(fields[1], 16), int(fields[2], 16)
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
        if kind != 'M':
            raise AssertionError('Unexpected checker output')
        bits, packed = int(fields[0], 16), int(fields[1], 16)
        sig, exp = int(fields[2]), int(fields[3])
        if bits in seen:
            raise AssertionError('Duplicate fixture coverage')
        seen.add(bits)
        if bits <= 128 or bits >= 0x7ff0000000000000:
            if packed != 0:
                raise AssertionError(f'Fallback/totality contract changed for {bits:016x}')
            continue
        value = struct.unpack('>d', struct.pack('>Q', bits))[0]
        if not 0 < sig < 10 ** 17 or not -400 <= exp <= 400:
            raise AssertionError(f'Decimal representation changed for {bits:016x}')
        if float(str(sig) + 'e' + str(exp)) != value:
            raise AssertionError(f'Decimal does not round-trip for {bits:016x}')
        # Python's independent shortest formatter supplies a digit-count bound.
        # Java considers two-digit candidates when one digit would round-trip.
        digits = len(str(sig).rstrip('0'))
        original_digits = len(''.join(map(str, Decimal(repr(value)).as_tuple().digits)).rstrip('0'))
        if digits > max(2, original_digits):
            raise AssertionError(f'Decimal is no longer shortest for {bits:016x}')
        bq = bits >> 52
        q = bq - 1075 if bq else -1074
        c = (bits & ((1 << 52) - 1)) | ((1 << 52) if bq else 0)
        irregular = c == 1 << 52 and q != -1074
        k = (q * 661971961083 - (274743187321 if irregular else 0)) >> 41
        h = q + ((-k * 913124641741) >> 38) + 2
        if not -292 <= -k <= 324 or not 0 <= h < 64 or (c << (2 + h)) >= 1 << 64:
            raise AssertionError(f'Bridge power/shift bounds changed for {bits:016x}')
        if exp < k or sig * 10 ** (exp - k) >= 1 << 57:
            raise AssertionError(f'Decimal cannot be represented by the bridge for {bits:016x}')
        f = sig * 10 ** (exp - k)
        exact_value = Fraction(c << q) if q >= 0 else Fraction(c, 1 << -q)
        decimal_value = f * pow10(k)
        exact, away = decimal_value == exact_value, decimal_value > exact_value
        expected = f | (int(exact) << 62) | (int(away) << 63)
        exact_count += exact
        away_count += away
        if packed != expected:
            raise AssertionError(f'Metadata changed for {bits:016x}: {packed:016x} != {expected:016x}')
    if (tables != set(range(-307, 342)) or seen != set(values)
            or not exact_count or not away_count):
        raise AssertionError('Missing table/fixture coverage')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('staged', type=Path, help='patched zmij.cc/zmij.h directory')
    parser.add_argument('--cxx', default=os.environ.get('CXX', 'c++'), help='host C++ compiler and flags')
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    if 'return hotspot_zmij_decimal_metadata(bits);' not in (root / 'src/hotspot/share/utilities/zmij.cpp').read_text():
        raise RuntimeError('Review checker binding after changing Zmij::decimal')
    values = fixtures()
    with tempfile.TemporaryDirectory() as temporary:
        directory = Path(temporary)
        source = root / 'make/data/zmij/verify-metadata.cpp'
        for profile, flags in (('full-table', []),
                               ('shortest-table', ['-DZMIJ_HOTSPOT_SHORTEST_ONLY=1']),
                               ('shortest-compressed', ['-DZMIJ_HOTSPOT_SHORTEST_ONLY=1', '-DZMIJ_OPTIMIZE_SIZE=1'])):
            binary = directory / profile
            subprocess.run(shlex.split(args.cxx) + ['-std=c++17', '-O2',
                           '-fsanitize=undefined', '-fno-sanitize-recover=undefined',
                           '-I' + str(args.staged.resolve()),
                           '-I' + str(root / 'src/hotspot/share'), *flags,
                           str(source), '-o', str(binary)], check=True)
            result = subprocess.run([str(binary)], input=''.join(f'{v:x}\n' for v in values),
                                    capture_output=True, text=True, check=True)
            verify(result.stdout, values)
            print(f'{profile}: 649 exact power tables and {len(values)} metadata/round-trip fixtures passed')


if __name__ == '__main__':
    main()
