# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Read-only binding to reviewed build receipts; no process discovery."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import matrix as m

PRODUCT = 'dfa1a6da1979dcbf40af88e1900175e582aae6cd'
HARNESS_SOURCE = '1c344bde55df568fe4c06e774c87f4446f5ae310'
PACKAGE_FILES = {'Bench.java', 'Protected.java', 'FirstUse.java', 'matrix.py',
                 'compare.py', 'identity.py', 'TestPreflight.py', 'README.md'}
REQUIRED_HARNESS = {'classes/Bench.class', 'classes/Protected.class',
                    'classes/FirstUse.class', 'patch/java/util/HexFormatReference.class',
                    'reference/HexFormat.original', 'reference/java/util/HexFormatReference.java'}


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for part in iter(lambda: stream.read(4 * 1024**2), b''):
            h.update(part)
    return h.hexdigest()


def git(path, *args):
    import os
    env = os.environ.copy()
    for key in ['GIT_DIR', 'GIT_WORK_TREE', 'GIT_INDEX_FILE', 'GIT_COMMON_DIR',
                'GIT_OBJECT_DIRECTORY', 'GIT_ALTERNATE_OBJECT_DIRECTORIES']:
        env.pop(key, None)
    env['GIT_OPTIONAL_LOCKS'] = '0'
    return subprocess.check_output(['git', '-c', 'core.fsmonitor=false', '-c', 'gc.auto=0',
            '-c', 'maintenance.auto=false', '-C', str(path), *args], timeout=30, env=env)


def relative_file(root, relative):
    p = Path(relative)
    m.require(not p.is_absolute() and '..' not in p.parts,
              'invalid receipt-relative path: ' + relative)
    return root / p


def verify_hashes(root, hashes):
    m.require(isinstance(hashes, dict) and hashes, 'missing identity hashes: ' + str(root))
    for relative, expected in hashes.items():
        m.require(isinstance(expected, str) and re.fullmatch('[0-9a-f]{64}', expected),
                  'invalid SHA-256 in receipt: ' + relative)
        path = relative_file(root, relative)
        m.require(path.is_file() and sha(path) == expected, 'identity mismatch: ' + str(path))


def settings(text):
    return {key: value.strip() for key, value in
            re.findall(r'^([A-Za-z0-9_]+)[ \t]*:=[ \t]*([^\n]*)$', text, re.M)}


class FrozenInputs:
    def __init__(self, receipt, receipt_sha256, package, package_revision,
                 baseline, candidate, harness, output, system, machine, git_read=git):
        self.receipt, self.expected_receipt = Path(receipt), receipt_sha256
        self.package, self.package_revision = Path(package).resolve(), package_revision
        self.images = {'baseline': Path(baseline).resolve(), 'candidate': Path(candidate).resolve()}
        self.harness, self.output = Path(harness).resolve(), Path(output)
        self.system, self.machine, self.git = system, machine, git_read

    def verify(self, checkpoint):
        m.require(re.fullmatch('[0-9a-f]{40}', self.package_revision) is not None,
                  'full reviewed package revision required')
        m.require(re.fullmatch('[0-9a-f]{64}', self.expected_receipt) is not None and
                  sha(self.receipt) == self.expected_receipt, 'build receipt SHA-256 differs')
        receipt = json.loads(self.receipt.read_text())
        m.require(receipt['revision'] == PRODUCT and receipt['baseline'] == m.BASE,
                  'build receipt source revisions differ')
        package_root = Path(self.git(self.package, 'rev-parse', '--show-toplevel').decode().strip())
        m.require(self.git(package_root, 'rev-parse', 'HEAD').decode().strip() == self.package_revision,
                  'execution package checkout differs from reviewed revision')
        self.clean(package_root)
        source_file = self.package / 'SOURCE.json'
        relative = source_file.relative_to(package_root).as_posix()
        m.require(source_file.read_bytes() == self.git(package_root, 'show',
                  self.package_revision + ':' + relative), 'SOURCE.json differs from reviewed Git object')
        source = json.loads(source_file.read_text())
        m.require(source['product'] == PRODUCT and source['baseline'] == m.BASE and
                  source['harness_source'] == HARNESS_SOURCE, 'package source pins differ')
        m.require(set(source['source_files']) == PACKAGE_FILES, 'package source inventory differs')
        verify_hashes(self.package, source['source_files'])
        for name in ['Bench.java', 'Protected.java', 'FirstUse.java']:
            m.require(receipt['package_sha256'][name] == source['source_files'][name],
                      'compiled Java workload source differs: ' + name)
        roots = Path(receipt['source_tree_root'])
        suffix = '.dylib' if self.system == 'Darwin' else '.so'
        cpu = {'arm64': 'aarch64', 'aarch64': 'aarch64', 'x86_64': 'x86_64'}.get(self.machine)
        m.require(self.system in {'Linux', 'Darwin'} and cpu is not None and
                  (self.system != 'Darwin' or cpu == 'aarch64'), 'unsupported native host')
        pins = {'baseline': m.BASE, 'candidate': PRODUCT}
        for state, image in self.images.items():
            tree = roots / state
            m.require(self.git(tree, 'rev-parse', 'HEAD').decode().strip() == pins[state],
                      'source checkout differs: ' + state)
            self.clean(tree)
            artifact = receipt['artifacts'][state]
            m.require(Path(artifact['retained_path']).resolve() == image,
                      'image path differs from retained receipt: ' + state)
            hashes = artifact['sha256']
            required = {'release', 'bin/java', 'jmods/java.base.jmod', 'lib/modules',
                        'lib/server/libjvm' + suffix, 'lib/libjava' + suffix}
            if state == 'candidate':
                required.add('lib/libhexsimd' + suffix)
            else:
                m.require(not list((image / 'lib').glob('libhexsimd.*')),
                          'baseline unexpectedly contains HexFormat library')
            required.update(str(p.relative_to(image)) for p in (image / 'lib/server').glob('*.jsa'))
            m.require(required <= set(hashes), 'incomplete module/library image receipt: ' + state)
            verify_hashes(image, hashes)
            spec = receipt['spec-' + state]
            m.require(sha(Path(spec['path'])) == spec['sha256'] and
                      sha(image.parents[1] / 'spec.gmk') == spec['sha256'],
                      'configured spec differs from build receipt: ' + state)
            cfg = settings(Path(spec['path']).read_text())
            features = cfg.get('JVM_FEATURES_server', '').split()
            m.require(cfg.get('DEBUG_LEVEL') == 'release' and cfg.get('JVM_VARIANTS') == 'server' and
                      cfg.get('JVM_VARIANT_MAIN') == 'server' and {'compiler2', 'cds'} <= set(features) and
                      sorted(x for x in features if x.endswith('gc')) == ['g1gc', 'serialgc', 'zgc'],
                      'build profile differs: ' + state)
            m.require(Path(cfg['TOPDIR']).resolve() == tree.resolve() and
                      cfg['OPENJDK_TARGET_CPU'] == cpu and
                      cfg['OPENJDK_TARGET_OS'] == ('macosx' if self.system == 'Darwin' else 'linux'),
                      'native build target differs: ' + state)
            m.require(cfg.get('ENABLE_HEX_SIMD', 'false') == ('true' if state == 'candidate' else 'false'),
                      'configured native option differs: ' + state)
        lock = roots / 'candidate/src/java.base/share/native/libhexsimd/rust/Cargo.lock'
        m.require(sha(lock) == m.LOCK_SHA, 'pinned Cargo.lock differs')
        hashes = receipt['harness_sha256']
        actual = {str(p.relative_to(self.harness)) for p in self.harness.rglob('*') if p.is_file()}
        m.require(REQUIRED_HARNESS <= set(hashes) and actual == set(hashes),
                  'compiled harness/reference patch inventory differs')
        verify_hashes(self.harness, hashes)
        original = self.git(roots / 'baseline', 'show',
                            m.BASE + ':src/java.base/share/classes/java/util/HexFormat.java')
        m.require((self.harness / 'reference/HexFormat.original').read_bytes() == original,
                  'reference differs from baseline Git source')
        reference = re.sub(r'\bHexFormat\b', 'HexFormatReference', original.decode())
        m.require((self.harness / 'reference/java/util/HexFormatReference.java').read_text() == reference,
                  'reference renaming differs')
        result = {'checkpoint': checkpoint, 'receipt_sha256': self.expected_receipt,
                  'package_revision': self.package_revision, 'source_pins': pins,
                  'images': receipt['artifacts'], 'harness_sha256': hashes,
                  'source_sha256': source['source_files']}
        m.write_json(self.output / ('identity-' + checkpoint + '.json'), result)
        return result

    def clean(self, root):
        m.require(not self.git(root, 'status', '--porcelain', '--untracked-files=all').strip(),
                  'source tree is dirty: ' + str(root))


def record_receipt(args, package, system, machine):
    """Freeze normal build/compile outputs; does not build, test or measure."""
    m.require(not args.record_receipt.exists(), 'receipt output already exists')
    suffix = '.dylib' if system == 'Darwin' else '.so'
    receipt = {'revision': PRODUCT, 'baseline': m.BASE,
               'source_tree_root': str(args.source_root.resolve()), 'artifacts': {},
               'package_sha256': {n: sha(package / n)
                    for n in ['Bench.java', 'Protected.java', 'FirstUse.java']},
               'harness_sha256': {str(p.relative_to(args.harness)): sha(p)
                    for p in args.harness.rglob('*') if p.is_file()}}
    for state, image in [('baseline', args.baseline), ('candidate', args.candidate)]:
        paths = ['release', 'bin/java', 'jmods/java.base.jmod', 'lib/modules',
                 'lib/server/libjvm' + suffix, 'lib/libjava' + suffix]
        paths.extend(str(p.relative_to(image)) for p in (image / 'lib/server').glob('*.jsa'))
        if state == 'candidate':
            paths.append('lib/libhexsimd' + suffix)
        receipt['artifacts'][state] = {'retained_path': str(image),
                                      'sha256': {p: sha(image / p) for p in paths}}
        spec = image.parents[1] / 'spec.gmk'
        receipt['spec-' + state] = {'path': str(spec), 'sha256': sha(spec)}
    m.write_json(args.record_receipt, receipt)
    frozen = FrozenInputs(args.record_receipt, sha(args.record_receipt), package,
        args.package_revision, args.baseline, args.candidate, args.harness,
        args.record_receipt.parent, system, machine)
    frozen.verify('recorded')
    print(sha(args.record_receipt))


if __name__ == '__main__':
    import argparse
    import platform
    p = argparse.ArgumentParser(description='Record existing native build outputs; no rebuild or measurement')
    for name in ['record-receipt', 'source-root', 'baseline', 'candidate', 'harness']:
        p.add_argument('--' + name, required=True, type=Path)
    p.add_argument('--package-revision', required=True)
    args = p.parse_args()
    for name in ['record_receipt', 'source_root', 'baseline', 'candidate', 'harness']:
        setattr(args, name, getattr(args, name).resolve())
    record_receipt(args, Path(__file__).resolve().parent, platform.system(), platform.machine())
