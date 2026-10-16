"""Derived diagnostic images without CDS archives; original payload stays intact."""
from pathlib import Path
import shutil

from common import save, sha, snapshot

ARCHIVES = {f'lib/server/classes{suffix}.jsa' for suffix in
            ['', '_fourbyte', '_nocoh', '_nocoops', '_nocoops_fourbyte', '_nocoops_nocoh']}


def prepare_images(payload, destination, evidence=None):
    payload, destination = Path(payload), Path(destination)
    destination.mkdir(parents=True, exist_ok=False)
    record = {'policy': 'diagnostic-no-default-cds-v1',
              'source_manifest_sha256': sha(payload / 'native-manifest.json'), 'images': {}}
    for arm in ['before', 'current', 'repair']:
        source = payload / 'images' / arm
        original = snapshot(source)
        archives = {name for name in original if name.endswith('.jsa')}
        if archives != ARCHIVES or any(original[name]['type'] != 'file' for name in ARCHIVES):
            raise ValueError('Unexpected CDS archive inventory: ' + arm)
        def exclude(directory, names):
            relative = Path(directory).relative_to(source)
            return [name for name in names if (relative / name).as_posix() in ARCHIVES]
        target = destination / 'images' / arm
        shutil.copytree(source, target, symlinks=True, ignore=exclude)
        expected = {name: item for name, item in original.items() if name not in ARCHIVES}
        actual = snapshot(target)
        if actual != expected or snapshot(source) != original:
            raise ValueError('Derived image changed files outside CDS archive omission: ' + arm)
        record['images'][arm] = {'source': str(source), 'runtime': str(target),
                                 'omitted': {name: original[name] for name in sorted(ARCHIVES)},
                                 'files': actual}
        save(destination / 'derivation.json', record)
        if evidence is not None:
            save(evidence, record)
    return destination / 'images'
