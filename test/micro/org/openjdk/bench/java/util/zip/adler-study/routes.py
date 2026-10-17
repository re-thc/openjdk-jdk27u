#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

"""Compiler-selection evidence from separate exact-JMH diagnostic forks."""
import xml.etree.ElementTree as ET


def verify(path, method, expected):
    tree = ET.parse(path)
    if any(e.get('compiler') in ['c2','jvmci'] for e in tree.iter('nmethod')):
        raise ValueError('Unexpected optimizing tier in C1-capped diagnostic fork')
    c1 = {e.get('compile_id') for e in tree.iter('nmethod') if e.get('compiler') == 'c1' and e.get('level') == '1'}
    # Record calls per Java parse owner, then follow the benchmark's actual
    # compilation graph. Source method names alone are not tier evidence.
    edges, decisions, roots = {}, {}, set()
    target = 'updateByteBuffer' if method == 'adlerDirect' else 'updateBytes'
    for task in tree.iter('task'):
        if task.get('compile_id') not in c1 or not any(e.get('success') == '1' for e in task.findall('task_done')):
            continue
        classes = {e.get('id'): e.get('name', '').replace('/', '.') for e in task.iter('klass')}
        methods = {e.get('id'): (classes.get(e.get('holder'), ''), e.get('name')) for e in task.iter('method')}
        for parse in task.iter('parse'):
            owner = methods.get(parse.get('method'), ('', ''))
            if owner == ('org.openjdk.bench.java.util.zip.ChecksumPaths', method):
                roots.add(owner)
            items = list(parse)
            for i, call in enumerate(items):
                if call.tag != 'call':
                    continue
                callee = methods.get(call.get('method'), ('', ''))
                edges.setdefault(owner, set()).add(callee)
                if callee != ('java.util.zip.Adler32', target):
                    continue
                decision = None
                for event in items[i+1:]:
                    if event.tag in ['call', 'parse']:
                        break
                    if event.tag == 'inline_fail' and event.get('reason') == 'native method':
                        decision = 'declined'
                    if event.tag == 'intrinsic' or (event.tag == 'inline_success' and event.get('reason') == 'intrinsic'):
                        decision = 'intrinsic'
                decisions.setdefault(owner, []).append(decision)
    if not roots:
        raise ValueError('No successful C1 compilation/inlined parse of exact benchmark')
    pending, seen, found = list(roots), set(), []
    while pending:
        owner = pending.pop()
        if owner in seen:
            continue
        seen.add(owner); found += decisions.get(owner, [])
        pending += list(edges.get(owner, set()) - seen)
    if not found or any(d != expected for d in found):
        raise ValueError('Unestablished/mixed compiler route: ' + repr(found))
    return dict(tier=1, decisions=found, evidence='Compiler selection in reachable exact-benchmark parses; not native-entry breakpoint proof.')
