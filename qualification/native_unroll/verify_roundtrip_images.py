"""Verify consumer-local extracted images against this run's build records."""
import argparse
import json
import os
import pathlib
import subprocess

from run_release_causal import record


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--built', type=pathlib.Path, required=True)
    p.add_argument('--candidate', type=pathlib.Path, required=True)
    p.add_argument('--control', type=pathlib.Path, required=True)
    a = p.parse_args()
    data = json.loads((a.built / 'matched-build-results.json').read_text())
    expected_head = os.environ.get('GITHUB_SHA')
    if expected_head and data['plan']['source']['candidate']['head'] != expected_head:
        raise RuntimeError('Build belongs to a different head')
    for label, directory in [('candidate', a.candidate), ('rebuilt_b3', a.control)]:
        for relative, expected in data['results'][label]['image'].items():
            actual = record(directory / relative)
            if actual['sha256'] != expected['sha256'] or actual['bytes'] != expected['bytes']:
                raise RuntimeError('Extracted image hash mismatch: ' + label + '/' + relative)
    candidate, control = (data['results'][x]['commands'] for x in ['candidate', 'rebuilt_b3'])
    if candidate['configure'][2:] != control['configure'][2:] or candidate['make'] != control['make'] or candidate['compiler_env'] != control['compiler_env']:
        raise RuntimeError('Unmatched native build configuration')
    print('ROUNDTRIP_MATCHED_IMAGES_VERIFIED=true')


if __name__ == '__main__':
    main()
