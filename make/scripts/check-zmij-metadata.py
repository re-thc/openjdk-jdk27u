#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Verify the production decimal bridge against a staged Żmij implementation."""
import argparse
import os
from pathlib import Path
import random
import shlex
import struct
import subprocess
import tempfile


def verify(source, compiler):
    root = Path(__file__).resolve().parents[2]
    samples = set(range(257))
    samples.update((0x7ff0000000000000, 0x7ff8000000000001,
                    0x8000000000000000, 0xfff0000000000000))
    for bq in range(2048):
        for delta in range(-2, 3):
            bits = (bq << 52) + delta
            if 0 <= bits < 1 << 64:
                samples.add(bits)
    for exponent in range(-323, 309):
        value = float('1e' + str(exponent))
        bits = struct.unpack('>Q', struct.pack('>d', value))[0]
        samples.update(bits + delta for delta in range(-2, 3))
    random_source = random.Random(0xF70A111)
    samples.update(random_source.getrandbits(64) for _ in range(12000))
    with tempfile.TemporaryDirectory() as temporary:
        executable = Path(temporary) / 'verify-metadata'
        subprocess.run(shlex.split(compiler) + [
            '-std=c++17', '-O2', '-I' + str(source),
            '-I' + str(root / 'src/hotspot/share'),
            str(root / 'make/data/zmij/verify-metadata.cpp'),
            '-o', str(executable)], check=True)
        output = subprocess.check_output([str(executable)], text=True,
                                         input=''.join(f'{b:x}\n' for b in sorted(samples)))
    powers, records = 0, 0
    exact_count, away_count = 0, 0
    seen = set()
    for line in output.splitlines():
        fields = line.split()
        if fields[0] == 'T':
            exponent = int(fields[1])
            actual = (int(fields[2], 16) << 64) | int(fields[3], 16)
            numerator = 10 ** max(exponent, 0)
            denominator = 10 ** max(-exponent, 0)
            binary_exp = numerator.bit_length() - denominator.bit_length()
            if (numerator < denominator << binary_exp if binary_exp >= 0
                    else numerator << -binary_exp < denominator):
                binary_exp -= 1
            shift = 127 - binary_exp
            expected = ((numerator << shift) // denominator if shift >= 0
                        else numerator // (denominator << -shift))
            if actual != expected:
                raise ValueError(f'10**{exponent}: power cache is not rounded down to 128 bits')
            powers += 1
            continue
        bits, packed = int(fields[1], 16), int(fields[2], 16)
        if bits not in samples or bits in seen:
            raise ValueError('Missing or duplicate bridge input')
        seen.add(bits)
        records += 1
        if bits <= 128 or bits >= 0x7ff0000000000000:
            if packed != 0:
                raise ValueError(f'{bits:x}: invalid-input fallback changed')
            continue
        sig, exponent = int(fields[3]), int(fields[4])
        if not 0 < sig < 10 ** 17:
            raise ValueError(f'{bits:x}: unexpected decimal significand width')
        value = float(str(sig) + 'e' + str(exponent))
        recovered = struct.unpack('>Q', struct.pack('>d', value))[0]
        if recovered != bits:
            raise ValueError(f'{bits:x}: vendor decimal representation does not round-trip')
        bq = bits >> 52
        q = -1074 if bq == 0 else bq - 1075
        c = bits & 0xfffffffffffff
        if bq != 0:
            c |= 1 << 52
        irregular = c == 1 << 52 and q != -1074
        k = (q * 661971961083 - (274743187321 if irregular else 0)) >> 41
        h = q + ((-k * 913124641741) >> 38) + 2
        if not -292 <= -k <= 324 or not 0 <= h < 64 or (c << (2 + h)) >= 1 << 64:
            raise ValueError(f'{bits:x}: bridge power/shift bounds changed')
        f = sig * 10 ** (exponent - k) if exponent >= k else 1 << 57
        if f >= 1 << 57 or packed & ((1 << 57) - 1) != f:
            raise ValueError(f'{bits:x}: decimal cannot be represented by the bridge')
        decimal_num = sig * 10 ** max(exponent, 0)
        decimal_den = 10 ** max(-exponent, 0)
        binary_num = c << max(q, 0)
        binary_den = 1 << max(-q, 0)
        difference = decimal_num * binary_den - binary_num * decimal_den
        exact, away = difference == 0, difference > 0
        if bool(packed & (1 << 62)) != exact or bool(packed & (1 << 63)) != away:
            raise ValueError(f'{bits:x}: exactness/rounding direction differs from exact arithmetic')
        exact_count += exact
        away_count += away
    if powers != 649 or seen != samples or not exact_count or not away_count:
        raise ValueError('Incomplete table/metadata verification')
    print(f'Żmij bridge verified: {powers} exact power entries, {records} inputs; '
          f'{exact_count} exact and {away_count} rounded away from zero.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path, help='directory containing patched zmij.cc and zmij.h')
    parser.add_argument('--cxx', default=os.environ.get('CXX', 'c++'))
    arguments = parser.parse_args()
    verify(arguments.source.resolve(), arguments.cxx)
