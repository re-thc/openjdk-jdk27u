#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Execute the existing dispatch, physical-bounds, overlap and safepoint tests."""
from pathlib import Path
import os
import subprocess

root=Path.cwd()
out=root/'jtreg-evidence';out.mkdir()
exe='.exe' if os.name=='nt' else ''
tests=sorted((root/'test/hotspot/jtreg/compiler/intrinsics/string').glob('TestStringZilla*.java'))
tests += [root/'test/jdk/java/lang/String'/n for n in ('StringZillaSearch.java','StringZillaBounded.java')]
args=[str(root/('pair/original/bin/java'+exe)),'-jar',str(root/'jtreg/installed/lib/jtreg.jar'),
      '-jdk:'+str(root/'pair/fork'),'-w:'+str(out/'work'),'-r:'+str(out/'report'),
      '-javaoption:-XX:ActiveProcessorCount=2',*[str(p) for p in tests]]
with (out/'run.log').open('w') as log:
    subprocess.run(args,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=1800)
