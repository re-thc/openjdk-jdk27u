#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

import argparse,pathlib,subprocess
p=argparse.ArgumentParser();p.add_argument('--jdk-source',required=True);p.add_argument('--baseline',default='e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4');p.add_argument('--revision',choices=['e3','e4','e5'],default='e5');a=p.parse_args()
r=pathlib.Path(__file__).resolve().parent.parent
source=subprocess.check_output(['git','-C',a.jdk_source,'show',a.baseline+':src/java.base/share/classes/java/util/DualPivotQuicksort.java'],text=True)
fragment=(r/'src/patch-fragment.java.txt').read_text()
if a.revision in ('e3','e4'):
 import re
 fragment=re.sub(r'    private static boolean highlySkewed\((?:int|long)\[\].*?\n    }\n','',fragment,flags=re.S)
 fragment=fragment.replace('        if (highlySkewed(a,low,size)) return false;\n','')
if a.revision=='e3':fragment=fragment.replace('    @jdk.internal.vm.annotation.DontInline\n','')
source=source.replace('final class DualPivotQuicksort {','final class DualPivotQuicksort {\n'+fragment)
for t in ('int','long'):
 source=source.replace(f'static void sort({t}[] a, int parallelism, int low, int high) {{',f'static void sort({t}[] a, int parallelism, int low, int high) {{\n        if (parallelism <= 1 && experiment(a,low,high)) return;')
src=r/'patch-src/java/util/DualPivotQuicksort.java';src.parent.mkdir(parents=True,exist_ok=True);src.write_text(source)
subprocess.run(['javac','--patch-module',f'java.base={r}/patch-src','-d',str(r/'patch'),str(src)],check=True)
