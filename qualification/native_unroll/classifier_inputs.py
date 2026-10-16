"""Check pinned artifact metadata and consumer bytes; safely unpack saved images."""
import argparse
import datetime
import json
from pathlib import Path
import tarfile
import zipfile

from classifier_images import pins, record, require


def main():
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(dest='operation', required=True)
    meta = sub.add_parser('metadata')
    meta.add_argument('path', type=Path)
    meta.add_argument('--artifact-id', type=int, required=True)
    extract = sub.add_parser('extract')
    extract.add_argument('archive', type=Path)
    extract.add_argument('destination', type=Path)
    jtreg = sub.add_parser('jtreg')
    jtreg.add_argument('directory', type=Path)
    a = p.parse_args()
    pin = pins()
    if a.operation == 'metadata':
        actual = json.loads(a.path.read_text())
        expected = pin['inputs'][str(a.artifact_id)]
        require(all(actual.get(k) == expected[k] for k in ('id', 'name', 'size_in_bytes', 'digest')),
                'Artifact metadata differs from pin')
        require(actual['workflow_run']['id'] == expected['run_id'] and
                actual['workflow_run']['head_sha'] == expected['head_sha'], 'Artifact source run/head differs')
        require(actual['expired'] is False and datetime.datetime.fromisoformat(actual['expires_at'].replace('Z', '+00:00'))
                > datetime.datetime.now(datetime.timezone.utc), 'Artifact expired')
    elif a.operation == 'extract':
        require(not a.destination.exists(), 'Extraction destination must be new')
        a.destination.mkdir(parents=True)
        with tarfile.open(a.archive) as archive:
            archive.extractall(a.destination, filter='data')
    else:
        expected = pin['jtreg_consumer_jars']
        actual = {path.relative_to(a.directory).as_posix():record(path)
                  for path in sorted((a.directory / 'lib').glob('*.jar'))}
        require(actual == expected, 'Consumer jtreg JAR bytes differ from reviewed equivalent')
        with zipfile.ZipFile(a.directory / 'lib/jtreg.jar') as archive:
            require('jtreg-VersionString: 8.2.1-dev+1' in archive.read('META-INF/MANIFEST.MF').decode(),
                    'Unexpected jtreg version')
    print('CLASSIFIER_INPUT_VERIFIED=' + a.operation)


if __name__ == '__main__':
    main()
