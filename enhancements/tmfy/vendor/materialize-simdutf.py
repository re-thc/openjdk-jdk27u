#!/usr/bin/env python3
"""Reproduce checked-in UTF-8/Latin1 amalgamation from the pinned official archive."""
import argparse
import hashlib
from pathlib import Path
import shutil
import subprocess
import tarfile
import tempfile
PIN = 'c08f3dce1cbb7a8bead9eb53bcbda778e8a1c69b7d3a0690682f1b09fbb85c31'
p = argparse.ArgumentParser()
p.add_argument('archive', type=Path)
p.add_argument('--output', type=Path, default=Path(__file__).resolve().parents[3] / 'src/hotspot/share/tmfy/vendor/simdutf')
a = p.parse_args()
if hashlib.sha256(a.archive.read_bytes()).hexdigest() != PIN:
    raise SystemExit('simdutf source archive hash mismatch')
with tempfile.TemporaryDirectory() as temporary:
    with tarfile.open(a.archive) as archive:
        archive.extractall(temporary, filter='data')
    upstream = Path(temporary) / 'simdutf-7.3.6'
    subprocess.run(['python3', str(upstream/'singleheader/amalgamate.py'), '--with-utf8', '--with-latin1', '--no-zip', '--no-readme', '--output-dir', str(a.output)], check=True)
    for name in ('amalgamation_demo.cpp', 'README.md'):
        (a.output/name).unlink(missing_ok=True)
    for name in ('simdutf.cpp', 'simdutf.h'):
        path = a.output/name
        text = path.read_text()
        path.write_text('/* Amalgamated from simdutf v7.3.6, UTF-8 + Latin1 features only. */\n' + text.split('\n', 1)[1])
    for name in ('LICENSE-APACHE', 'LICENSE-MIT'):
        shutil.copyfile(upstream/name, a.output/name)
