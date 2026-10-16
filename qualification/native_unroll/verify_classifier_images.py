"""Verify fresh candidate source and historical correctness controls independently."""
import argparse
import json
from pathlib import Path

from classifier_images import historical_binding, pins, source_binding, verify_candidate


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source', type=Path, default=Path('.'))
    for name in ['candidate-built', 'candidate', 'historical-built', 'control', 'boot-built', 'boot-jdk']:
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--level', choices=['release', 'fastdebug'], required=True)
    a = p.parse_args()
    pin = pins()
    current = source_binding(a.source, pin)
    control = historical_binding(a.historical_built, a.control, a.level, pin)
    boot = historical_binding(a.boot_built, a.boot_jdk, 'release', pin)
    verified = verify_candidate(a.candidate_built, a.candidate, a.level, current, control, boot, pin)
    print('CLASSIFIER_IMAGE_BINDING_JSON=' + json.dumps(verified))


if __name__ == '__main__':
    main()
