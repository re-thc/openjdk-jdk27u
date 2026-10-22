#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Run the existing production-source native fixture with memory/UB checks."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

p=argparse.ArgumentParser(description=__doc__)
for name in ('source','jdk','compiler','output'):p.add_argument('--'+name,type=Path,required=True)
a=p.parse_args();a.output.mkdir(parents=True,exist_ok=False)
driver=a.output/'driver.c'
driver.write_text('''/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only */
#include "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
#include <stdio.h>
int main(void) {
    for (jint mask = 0; mask < 8; mask++) {
        requested_capabilities = mask;
        test_initialize();
        printf("requested=%d selected=%d executable=%d\\n",
               mask, published->capabilities, can_execute(published->capabilities));
    }
    int failure = check_kernels();
    if (failure != 0) {
        fprintf(stderr, "Native kernel check failed at line %d\\n", failure);
        return 1;
    }
    puts("StringZilla production native kernel checks passed");
    return 0;
}
''')
kernel=a.source/'src/java.base/share/native/libjava'
includes=[a.source,kernel,kernel/'stringzilla',a.source/'src/hotspot/share/include',
    a.source/'src/hotspot/os/posix/include',a.jdk/'include',a.jdk/'include/linux']
cmd=[str(a.compiler),'-std=c11','-O2','-g','-fno-omit-frame-pointer',
    '-fsanitize=address,undefined,alignment','-fno-sanitize-recover=all','-Wno-unknown-pragmas',
    *['-I'+str(path) for path in includes],str(driver),'-o',str(a.output/'native-sanitizers')]
with (a.output/'build.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True)
env=os.environ.copy()
asan=Path(subprocess.check_output([str(a.compiler),'-print-file-name=libasan.so'],text=True).strip()).resolve()
env['LD_LIBRARY_PATH']=str(asan.parent)+(os.pathsep+env['LD_LIBRARY_PATH'] if env.get('LD_LIBRARY_PATH') else '')
env['ASAN_OPTIONS']='abort_on_error=1:detect_leaks=1:strict_string_checks=1'
env['UBSAN_OPTIONS']='halt_on_error=1:print_stacktrace=1'
with (a.output/'run.log').open('w') as log:subprocess.run([str(a.output/'native-sanitizers')],env=env,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=300)
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
files=[driver,kernel/'StringZillaKernels.c',kernel/'StringZillaKernels.h',kernel/'stringzilla/UPSTREAM.json',
       a.source/'test/jdk/java/lang/String/libStringZillaKernelsTest.c',a.jdk/'include/jni.h',a.jdk/'include/linux/jni_md.h']
receipt={'source':subprocess.check_output(['git','-C',str(a.source),'rev-parse','HEAD'],text=True).strip(),
    'compiler':subprocess.check_output([str(a.compiler),'--version'],text=True),'compile_command':cmd,
    'environment':{n:env[n] for n in ('LD_LIBRARY_PATH','ASAN_OPTIONS','UBSAN_OPTIONS')},
    'files':{str(f):sha(f) for f in files},'passed':True}
(a.output/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Address, undefined-behavior and alignment checks passed for the production-source fixture')
