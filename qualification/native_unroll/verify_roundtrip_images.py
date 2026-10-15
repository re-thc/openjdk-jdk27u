"""Verify consumer-local extracted images against pinned native build records."""
import argparse
import json
import os
import pathlib
import subprocess

from run_release_causal import B3, record


def git(*args):
    return subprocess.check_output(['git', *args], text=True).strip()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--built', type=pathlib.Path, required=True)
    p.add_argument('--candidate', type=pathlib.Path, required=True)
    p.add_argument('--control', type=pathlib.Path, required=True)
    p.add_argument('--expected-build-head', help='Explicit immutable image source head when reusing reviewed builds')
    p.add_argument('--expected-level', choices=['release', 'fastdebug'], help='Required image level for this consumer role')
    a = p.parse_args()
    plan = json.loads((a.built / 'matched-build-plan.json').read_text())
    results = json.loads((a.built / 'matched-build-results.json').read_text())
    current_head = git('rev-parse', 'HEAD')
    workflow_head = os.environ.get('GITHUB_SHA')
    if workflow_head and current_head != workflow_head:
        raise RuntimeError('Checkout differs from the executing workflow head')
    expected_head = a.expected_build_head or workflow_head or current_head
    if plan['source']['candidate']['head'] != expected_head:
        raise RuntimeError('Build belongs to a different head')
    if plan['execution'] != 'completed' or plan['toolchain_unchanged_after_each_build'] is not True:
        raise RuntimeError('Incomplete or unmatched native build')
    if a.expected_level and plan['level'] != a.expected_level:
        raise RuntimeError('Build has the wrong release/debug level')
    if plan['source']['rebuilt_b3']['head'] != B3 or set(results) != {'candidate', 'rebuilt_b3'}:
        raise RuntimeError('Missing exact-b3 control or candidate image')
    trees = ['src', 'test', 'make', 'bin']
    if git('status', '--porcelain', '--', *trees):
        raise RuntimeError('Uncommitted product or test changes')
    for tree in trees:
        if git('rev-parse', 'HEAD:' + tree) != git('rev-parse', expected_head + ':' + tree):
            raise RuntimeError('Checkout differs from built source tree: ' + tree)
    if plan['source']['candidate']['src_tree'] != git('rev-parse', 'HEAD:src'):
        raise RuntimeError('Build source tree does not match checkout')
    for label, directory in [('candidate', a.candidate), ('rebuilt_b3', a.control)]:
        if set(results[label]['image']) != {'bin/java', 'lib/server/libjvm.so', 'lib/modules', 'release'}:
            raise RuntimeError('Incomplete image record: ' + label)
        for relative, expected in results[label]['image'].items():
            actual = record(directory / relative)
            if actual['sha256'] != expected['sha256'] or actual['bytes'] != expected['bytes']:
                raise RuntimeError('Extracted image hash mismatch: ' + label + '/' + relative)
    candidate, control = (results[x]['commands'] for x in ['candidate', 'rebuilt_b3'])
    if candidate['configure'][2:] != control['configure'][2:] or candidate['make'] != control['make'] or candidate['compiler_env'] != control['compiler_env']:
        raise RuntimeError('Unmatched native build configuration')
    if '--with-debug-level=' + plan['level'] not in candidate['configure']:
        raise RuntimeError('Build level disagrees with configuration')
    print('ROUNDTRIP_IMAGE_SOURCE_BINDING_JSON=' + json.dumps(dict(
        workflow_head=current_head, built_head=expected_head, level=plan['level'], verified_trees=trees)), flush=True)
    print('ROUNDTRIP_MATCHED_IMAGES_VERIFIED=true')


if __name__ == '__main__':
    main()
