#!/usr/bin/env python3
"""Exact-once, manifest-gated runner for the proposed A/E/U comparison.

This file is scaffolding only. It refuses to launch unless a later frozen
preparation, independent ready-to-execute review, and separate authority file
bind exact hashes. It has no default image paths or command construction.
"""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import selectors
import signal
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
PROPOSAL_DEFAULT = Path('/workspace/pr57-xss-integration-plan-20261023/PROTOTYPE-AND-DECISIVE-COMPARISON-PROPOSAL.json')
PROPOSAL_SHA256 = '90a633c85adcc5fc1230399c0c5a4b67b9629e2a378b17ea2e0a9797bb0c7a2a'
ROLES = ('A', 'E', 'U')
PAIRS = (('E', 'A'), ('U', 'A'), ('U', 'E'))
BUDGET = {
    'JVMs': 36, 'triplets': 12, 'triplets_per_history': 3,
    'measured_sorts': 18432, 'conditioning_sorts': 9216,
    'global_warmups': 720, 'validated_sorts': 28368, 'explicit_GC': 0,
    'collection_cap_seconds': 600, 'per_JVM_seconds': 45,
    'cleanup_seconds': 5,
}
OUTPUT_LIMIT = 64 * 1024 * 1024
CSV_HEADER = ['kind', 'phase', 'history', 'case_id', 'size', 'pattern', 'ordinal',
              'sort_ns', 'reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes']


def sha(path: str | Path) -> str:
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def is_sha256(value: object) -> bool:
    return isinstance(value, str) and len(value) == 64 and all(
        ch in '0123456789abcdef' for ch in value)


def atomic_json(path: Path, value: object) -> None:
    tmp = path.with_name(path.name + '.tmp')
    fd = os.open(tmp, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    try:
        with os.fdopen(fd, 'w', encoding='utf-8') as f:
            json.dump(value, f, indent=2, sort_keys=True)
            f.write('\n')
            f.flush()
            os.fsync(f.fileno())
        os.replace(tmp, path)
        dirfd = os.open(path.parent, os.O_RDONLY | getattr(os, 'O_DIRECTORY', 0))
        try:
            os.fsync(dirfd)
        finally:
            os.close(dirfd)
    except BaseException:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass
        raise


def plan_from_proposal(proposal: dict) -> tuple[list[dict], list[tuple[int, str]]]:
    cp = proposal['one_fixed_comparison_proposal']
    cases = [(int(c['longs']), str(c['pattern'])) for c in cp['cases']]
    slots = []
    index = 0
    groups = cp['groups']
    source_slots = cp['slots']
    if len(cases) != 32 or len(groups) != 12 or len(source_slots) != 36:
        raise ValueError('proposal case/triplet/role-slot counts changed')
    histories = [int(g['history']) for g in groups]
    if set(histories) != {0, 3, 4, 5} or any(histories.count(h) != 3 for h in (0, 3, 4, 5)):
        raise ValueError('proposal must contain three triplets per retained history')
    position_counts = {role: [0, 0, 0] for role in ROLES}
    for group in groups:
        order = tuple(group['order'])
        if len(order) != 3 or set(order) != set(ROLES):
            raise ValueError(f"bad role order in group {group.get('group')}")
        group_slots = sorted((s for s in source_slots if s['group'] == group['group']),
                             key=lambda s: s['slot'])
        if [s['role'] for s in group_slots] != list(order):
            raise ValueError(f"proposal slot order differs from group {group['group']}")
        for position, role in enumerate(order):
            position_counts[role][position] += 1
            src = group_slots[position]
            expected = {'slot': index, 'group': int(group['group']),
                        'history': int(group['history']), 'position': position,
                        'role': role, 'seconds': 45}
            if int(src['slot']) != index or int(src['history']) != expected['history']:
                raise ValueError(f'proposal role slot mismatch at {index}')
            slots.append(expected)
            index += 1
    if index != 36:
        raise ValueError('proposal does not contain exactly 36 role slots')
    if any(count != 4 for counts in position_counts.values() for count in counts):
        raise ValueError(f'role-position order is not balanced: {position_counts}')
    derived_budget = {
        'JVMs': len(slots),
        'triplets': len(groups),
        'triplets_per_history': 3,
        'measured_sorts': len(slots) * len(cases) * 16,
        'conditioning_sorts': len(slots) * len(cases) * 8,
        'global_warmups': len(slots) * 20,
        'validated_sorts': len(slots) * (len(cases) * 24 + 20),
        'explicit_GC': 0,
        'collection_cap_seconds': 600,
        'per_JVM_seconds': 45,
        'cleanup_seconds': 5,
    }
    proposal_budget_fields = {
        'JVMs': cp['JVMs'], 'triplets': cp['balanced_triplets'],
        'triplets_per_history': cp['triplets_per_history'],
        'measured_sorts': cp['measured_sorts'],
        'conditioning_sorts': cp['conditioning_sorts'],
        'global_warmups': cp['global_warmup_sorts'],
        'validated_sorts': cp['total_validated_sorts'],
        'explicit_GC': cp['explicit_GC'],
        'collection_cap_seconds': cp['collection_cap_seconds'],
        'per_JVM_seconds': cp['per_JVM_seconds'],
        'cleanup_seconds': cp['cleanup_seconds'],
    }
    if derived_budget != BUDGET or proposal_budget_fields != BUDGET:
        raise ValueError('proposal, derived workload, and runner budgets disagree')
    return slots, cases


def _check_hash_map(files: dict[str, str]) -> None:
    if not isinstance(files, dict) or not files:
        raise ValueError('missing frozen file hash map')
    for raw_path, expected in files.items():
        path = Path(raw_path)
        if not path.is_absolute() or not is_sha256(expected):
            raise ValueError(f'invalid frozen file/hash entry: {path}')
        if not path.is_file() or sha(path) != expected:
            raise ValueError(f'frozen file hash mismatch: {path}')


def canonical_hash(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(',', ':')).encode()
    return hashlib.sha256(payload).hexdigest()


def _hash_artifact(path: object, expected: object, what: str,
                   under: Path | None = None) -> tuple[Path, str]:
    if not isinstance(path, str) or not Path(path).is_absolute() or not is_sha256(expected):
        raise ValueError(f'invalid path/digest for {what}')
    p = Path(path)
    resolved = p.resolve()
    if under is not None and resolved != under.resolve() and under.resolve() not in resolved.parents:
        raise ValueError(f'{what} is outside its image root')
    if not p.is_file() or sha(p) != expected:
        raise ValueError(f'{what} content hash mismatch: {p}')
    return p, expected


def _require_magic(path: Path, magic: bytes, what: str) -> None:
    with path.open('rb') as f:
        if f.read(len(magic)) != magic:
            raise ValueError(f'{what} has an unexpected binary signature: {path}')


def _hash_files_map(value: object, what: str) -> dict[str, str]:
    if not isinstance(value, dict) or not value:
        raise ValueError(f'missing {what} file hashes')
    result = {}
    for path, digest in value.items():
        p, digest = _hash_artifact(path, digest, what)
        result[str(p)] = digest
    if canonical_hash(result) != canonical_hash(value):
        raise ValueError(f'{what} paths are not canonical absolute paths')
    return result


def _implementation_delta(source_commit: str) -> dict:
    return {
        'source_commit': source_commit,
        'native_abi': {
            'arguments': ['array_base', 'low', 'high', 'stack_limit'],
            'result': 'bool',
            'shared_recursion_depth': 8,
            'stack_limit_argument': 'current_thread_stack_overflow_limit',
            'heap_policy': 'in-place; no input-sized allocation',
            'guards': [
                'nonnull-array',
                '0<=low<=high<=array.length',
                '512<=high-low<=8192',
                'stack-reserve-before-mutation',
                'return-false-before-mutation-on-decline',
            ],
        },
    }


def _validate_build_and_activation_receipts(manifest: dict, proposal: dict) -> dict[str, dict]:
    bindings = manifest['role_bindings']
    source_commit = manifest.get('implementation_delta', {}).get('source_commit')
    if not isinstance(source_commit, str) or len(source_commit) != 40 or any(
            c not in '0123456789abcdef' for c in source_commit):
        raise ValueError('missing frozen prototype source commit')
    if source_commit == proposal['identities']['public_fork_master_verified']:
        raise ValueError('prototype source must be distinct from current-master A source')
    if manifest.get('implementation_delta') != _implementation_delta(source_commit):
        raise ValueError('implementation delta ABI/guard contract differs from reviewed source')
    receipts = {}
    required_hotspot = {'bin/java', 'lib/server/libjvm.so', 'lib/modules'}
    expected_backends = {'A': 'stock-default', 'E': 'embedded', 'U': 'upstream'}
    all_file_hashes = manifest.get('file_hashes')
    if not isinstance(all_file_hashes, dict):
        raise ValueError('missing complete frozen file hash map')
    overlay_identity = None
    eu_hotspot_hashes = None
    eu_toolchain = None
    eu_source_tree_sha = None
    for role in ROLES:
        binding = bindings[role]
        receipt_path = binding.get('build_receipt_path')
        receipt_digest = binding.get('build_receipt_sha256')
        p, digest = _hash_artifact(receipt_path, receipt_digest, f'{role} build receipt')
        if all_file_hashes.get(str(p)) != digest:
            raise ValueError(f'{role} build receipt is not linked from frozen file hashes')
        receipt = json.loads(p.read_text())
        if receipt.get('schema') != 'xss-comparison-build-receipt-v1':
            raise ValueError(f'{role} build receipt missing required schema')
        if receipt.get('role') != role or receipt.get('backend') != expected_backends[role]:
            raise ValueError(f'{role} build receipt role/backend mismatch')
        expected_source = (proposal['identities']['public_fork_master_verified']
                           if role == 'A' else source_commit)
        if (receipt.get('source_commit') != expected_source
                or receipt.get('source_dirty') is not False
                or not is_sha256(receipt.get('source_tree_sha256'))):
            raise ValueError(f'{role} receipt does not bind clean frozen source')
        if (binding.get('backend') != expected_backends[role]
                or binding.get('source_commit') != expected_source
                or binding.get('source_tree_sha256') != receipt.get('source_tree_sha256')):
            raise ValueError(f'{role} manifest source/backend identity differs from its receipt')
        root = Path(binding.get('image_root', ''))
        if not root.is_absolute() or not root.is_dir() or str(root.resolve()) != receipt.get('image_root'):
            raise ValueError(f'{role} receipt image root mismatch')
        if binding.get('java') is None or not Path(binding['java']).is_absolute():
            raise ValueError(f'{role} Java executable path is missing')
        hotspot = receipt.get('java_hotspot_files')
        if not isinstance(hotspot, dict) or set(hotspot) != required_hotspot:
            raise ValueError(f'{role} receipt must pin bin/java, libjvm.so, and lib/modules')
        hotspot_hashes = {}
        for relpath, item in hotspot.items():
            if not isinstance(item, dict):
                raise ValueError(f'{role} has malformed Java/HotSpot entry {relpath}')
            artifact, artifact_digest = _hash_artifact(
                item.get('path'), item.get('sha256'), f'{role} {relpath}', root)
            if relpath in ('bin/java', 'lib/server/libjvm.so'):
                _require_magic(artifact, b'\x7fELF', f'{role} {relpath}')
            if all_file_hashes.get(str(artifact)) != artifact_digest:
                raise ValueError(f'{role} Java/HotSpot file is not in frozen file hashes: {relpath}')
            if relpath == 'bin/java' and not os.access(artifact, os.X_OK):
                raise ValueError(f'{role} bin/java is not executable')
            hotspot_hashes[relpath] = artifact_digest
            if relpath == 'bin/java' and artifact.resolve() != Path(binding['java']).resolve():
                raise ValueError(f'{role} command Java path differs from receipt bin/java')
        hotspot_digest = canonical_hash(hotspot_hashes)
        if binding.get('java_hotspot_sha256') != hotspot_digest:
            raise ValueError(f'{role} Java/HotSpot aggregate digest mismatch')
        overlay = receipt.get('java_overlay')
        if not isinstance(overlay, dict):
            raise ValueError(f'{role} receipt lacks Java fixture overlay artifact')
        overlay_path, overlay_sha = _hash_artifact(
            overlay.get('path'), overlay.get('sha256'), f'{role} Java fixture overlay')
        if all_file_hashes.get(str(overlay_path)) != overlay_sha:
            raise ValueError(f'{role} fixture overlay is not in frozen file hashes')
        classpath_entry = overlay.get('classpath_entry')
        if not isinstance(classpath_entry, str) or not Path(classpath_entry).is_absolute():
            raise ValueError(f'{role} fixture overlay lacks an absolute classpath entry')
        classpath_path = Path(classpath_entry).resolve()
        if not classpath_path.exists():
            raise ValueError(f'{role} fixture classpath entry is missing')
        if overlay_path.suffix == '.class':
            _require_magic(overlay_path, b'\xca\xfe\xba\xbe', f'{role} fixture class')
            if classpath_path != overlay_path.resolve().parent:
                raise ValueError(f'{role} fixture classpath does not contain the pinned class file')
        elif overlay_path.suffix == '.jar':
            import zipfile
            if not zipfile.is_zipfile(overlay_path) or classpath_path != overlay_path.resolve():
                raise ValueError(f'{role} fixture jar/classpath binding mismatch')
        else:
            raise ValueError(f'{role} overlay must be a pinned .class or .jar artifact')
        identity = (str(overlay_path.resolve()), overlay_sha, str(classpath_path))
        if overlay_identity is None:
            overlay_identity = identity
        elif identity != overlay_identity:
            raise ValueError('all roles must use the same exact Java fixture overlay artifact')
        if binding.get('java_overlay_sha256') != overlay_sha:
            raise ValueError(f'{role} fixture overlay digest mismatch')
        toolchain = receipt.get('toolchain')
        configuration = receipt.get('configuration')
        if not isinstance(toolchain, dict) or not isinstance(configuration, dict):
            raise ValueError(f'{role} receipt lacks actual toolchain/configuration records')
        toolchain_files = _hash_files_map(toolchain.get('files'), f'{role} toolchain')
        config_files = _hash_files_map(configuration.get('files'), f'{role} configuration')
        if canonical_hash(toolchain_files) != toolchain.get('sha256'):
            raise ValueError(f'{role} toolchain aggregate hash mismatch')
        if canonical_hash(config_files) != configuration.get('sha256'):
            raise ValueError(f'{role} configuration aggregate hash mismatch')
        if (binding.get('toolchain_sha256') != toolchain.get('sha256')
                or binding.get('configuration_sha256') != configuration.get('sha256')):
            raise ValueError(f'{role} frozen toolchain/configuration identity mismatch')
        for path, artifact_digest in {**toolchain_files, **config_files}.items():
            if all_file_hashes.get(path) != artifact_digest:
                raise ValueError(f'{role} toolchain/config input is not frozen: {path}')
        if role in ('E', 'U'):
            if receipt.get('implementation_delta') != manifest['implementation_delta']:
                raise ValueError(f'{role} receipt implementation delta differs from frozen contract')
            dso = receipt.get('range_dso')
            if not isinstance(dso, dict):
                raise ValueError(f'{role} receipt lacks exact range DSO')
            dso_path, dso_sha = _hash_artifact(
                dso.get('path'), dso.get('sha256'), f'{role} production range DSO', root)
            _require_magic(dso_path, b'\x7fELF', f'{role} production range DSO')
            if (binding.get('range_dso_path') != str(dso_path)
                    or binding.get('range_dso_sha256') != dso_sha
                    or all_file_hashes.get(str(dso_path)) != dso_sha):
                raise ValueError(f'{role} exact range DSO path/hash is not frozen')
            if role == 'E':
                eu_hotspot_hashes = hotspot_hashes
                eu_toolchain = toolchain_files
                eu_source_tree_sha = receipt['source_tree_sha256']
            else:
                if hotspot_hashes != eu_hotspot_hashes:
                    raise ValueError('E/U Java, HotSpot, and modules component hashes differ')
                if toolchain_files != eu_toolchain:
                    raise ValueError('E/U toolchain file hashes differ')
                if receipt['source_tree_sha256'] != eu_source_tree_sha:
                    raise ValueError('E/U prototype source tree hashes differ')
        else:
            if receipt.get('range_dso') is not None:
                raise ValueError('A current-master baseline must use the stock embedded path')
            if binding.get('range_dso_path') is not None or binding.get('range_dso_sha256') is not None:
                raise ValueError('A role cannot claim a new range DSO')
        receipts[role] = receipt

    activation_path = manifest.get('activation_review_path')
    activation_sha = manifest.get('activation_review_sha256')
    activation_file, activation_digest = _hash_artifact(
        activation_path, activation_sha, 'native activation review receipt')
    if all_file_hashes.get(str(activation_file)) != activation_digest:
        raise ValueError('native activation review receipt is not in frozen file hashes')
    activation = json.loads(activation_file.read_text())
    if (activation.get('schema') != 'xss-range-activation-review-v1'
            or activation.get('status') != 'PASS'
            or activation.get('source_commit') != source_commit
            or activation.get('scope') != 'ordinary-c2-native-entry'):
        raise ValueError('native activation review is missing a passed ordinary-entry qualification')
    role_evidence = activation.get('roles')
    if not isinstance(role_evidence, dict) or set(role_evidence) != {'E', 'U'}:
        raise ValueError('activation receipt must cover E and U separately')
    for role in ('E', 'U'):
        evidence = role_evidence[role]
        binding = bindings[role]
        if (evidence.get('backend') != expected_backends[role]
                or evidence.get('production_dso_path') != binding['range_dso_path']
                or evidence.get('production_dso_sha256') != binding['range_dso_sha256']
                or evidence.get('java_hotspot_sha256') != binding['java_hotspot_sha256']
                or evidence.get('java_overlay_sha256') != binding['java_overlay_sha256']
                or not isinstance(evidence.get('entry_symbol'), str)
                or not evidence['entry_symbol']
                or type(evidence.get('entry_count')) is not int
                or evidence['entry_count'] <= 0
                or evidence.get('entry_verified') is not True
                or evidence.get('compiled_helper_verified') is not True):
            raise ValueError(f'{role} native activation receipt does not prove the production entry')
        for path_key, sha_key in (
                ('diagnostic_source_path', 'diagnostic_source_sha256'),
                ('diagnostic_shim_path', 'diagnostic_shim_sha256')):
            diagnostic_path, diagnostic_sha = _hash_artifact(
                evidence.get(path_key), evidence.get(sha_key), f'{role} {path_key}')
            if path_key == 'diagnostic_shim_path':
                _require_magic(diagnostic_path, b'\x7fELF', f'{role} diagnostic shim')
            if all_file_hashes.get(str(diagnostic_path)) != diagnostic_sha:
                raise ValueError(f'{role} diagnostic activation artifact is not frozen')
    return receipts


def validate_authority(prepared_path: Path, manifest: dict, authority_path: Path,
                       review_path: Path) -> dict:
    if manifest.get('execution_authorized') is not True:
        raise ValueError('prepared manifest does not authorize execution')
    authority = json.loads(authority_path.read_text())
    prepared_sha = sha(prepared_path)
    review_sha = sha(review_path)
    review = json.loads(review_path.read_text())
    if authority.get('prepared_manifest_sha256') != prepared_sha:
        raise ValueError('authority does not bind this prepared manifest')
    if authority.get('review_path') != str(review_path.resolve()):
        raise ValueError('authority review path mismatch')
    if authority.get('review_sha256') != review_sha:
        raise ValueError('authority does not bind the review')
    if authority.get('execution_authorized') is not True:
        raise ValueError('execution authority is absent')
    if review.get('ready_to_execute') is not True:
        raise ValueError('independent review does not mark executor ready')
    if review.get('prepared_manifest_sha256') != prepared_sha:
        raise ValueError('independent review does not bind this prepared manifest')
    if review.get('activation_review_sha256') != manifest.get('activation_review_sha256'):
        raise ValueError('independent review does not bind the native activation receipt')
    return {'prepared_sha256': prepared_sha, 'review_sha256': review_sha,
            'authority_sha256': sha(authority_path)}


def validate_prepared(manifest: dict, proposal: dict, proposal_path: Path,
                      prepared_path: Path, authority_path: Path | None = None,
                      review_path: Path | None = None, check_disk: bool = True) -> list[dict]:
    if manifest.get('schema') != 'xss-in-place-comparison-prepared-v2':
        raise ValueError('unexpected preparation schema')
    slots, cases = plan_from_proposal(proposal)
    cp = proposal['one_fixed_comparison_proposal']
    if proposal_path.resolve() != PROPOSAL_DEFAULT.resolve():
        raise ValueError('proposal path differs from the reviewed fixed proposal')
    if sha(proposal_path) != PROPOSAL_SHA256:
        raise ValueError('reviewed fixed proposal content changed')
    if manifest.get('proposal_path') != str(proposal_path.resolve()):
        raise ValueError('proposal path mismatch')
    if manifest.get('proposal_sha256') != sha(proposal_path):
        raise ValueError('proposal hash mismatch')
    if manifest.get('slots') != slots or manifest.get('cases') != [
            {'longs': n, 'pattern': p} for n, p in cases]:
        raise ValueError('frozen slots/cases differ from reviewed proposal')
    if manifest.get('budget') != BUDGET:
        raise ValueError('frozen budget differs from reviewed proposal')
    if manifest.get('output_directory') is None:
        raise ValueError('missing unique output directory')
    out = Path(manifest['output_directory'])
    if not out.is_absolute():
        raise ValueError('output directory must be absolute')
    resolved_out = out.resolve()
    if resolved_out == HERE or HERE in resolved_out.parents:
        raise ValueError('collection output must be outside the pinned harness directory')
    if out.exists() or out.is_symlink():
        raise ValueError(f'output directory already exists: {out}')
    if set(manifest.get('role_bindings', {})) != set(ROLES):
        raise ValueError('role binding set must be A/E/U')
    bindings = manifest['role_bindings']
    if bindings['A'].get('source_commit') != proposal['identities']['public_fork_master_verified']:
        raise ValueError('A is not bound to the reviewed current-master source')
    if bindings['E'].get('java_hotspot_sha256') != bindings['U'].get('java_hotspot_sha256'):
        raise ValueError('E/U Java+HotSpot bytes differ')
    if bindings['E'].get('java_overlay_sha256') != bindings['U'].get('java_overlay_sha256'):
        raise ValueError('E/U Java overlays differ')
    if bindings['E'].get('range_dso_sha256') == bindings['U'].get('range_dso_sha256'):
        raise ValueError('E and U must use distinct pinned range DSOs')
    if bindings['E'].get('range_dso_path') == bindings['U'].get('range_dso_path'):
        raise ValueError('E and U must use distinct exact range DSO paths')
    build_receipts = _validate_build_and_activation_receipts(manifest, proposal)
    if manifest.get('slot_commands') is None or len(manifest['slot_commands']) != len(slots):
        raise ValueError('expected one frozen command per role slot')
    commands = []
    normalized_argv = set()
    common_env = None
    for spec, slot in zip(manifest['slot_commands'], slots):
        if spec.get('slot') != slot:
            raise ValueError(f"command slot mismatch at {slot['slot']}")
        argv = spec.get('argv')
        env = spec.get('env')
        if not isinstance(argv, list) or not argv or any(not isinstance(a, str) for a in argv):
            raise ValueError(f"invalid argv at slot {slot['slot']}")
        if not isinstance(env, dict) or any(not isinstance(k, str) or not isinstance(v, str)
                                             for k, v in env.items()):
            raise ValueError(f"invalid environment at slot {slot['slot']}")
        if any(a.startswith(('-XX:UseAVX=', '-XX:DisableIntrinsic=',
                             '-XX:CompileCommand', '-XX:TieredStopAtLevel=',
                             '-agentlib:', '-agentpath:', '-javaagent:'))
               or a in ('-Xint', '-Xcomp', '-Xbatch')
               for a in argv):
            raise ValueError('comparison command overrides default compilation/ISA policy or adds instrumentation')
        if (any(k in env for k in ('BOUNDED_LONG_BACKEND', 'JAVA_TOOL_OPTIONS',
                                   '_JAVA_OPTIONS', 'JDK_JAVA_OPTIONS', 'CLASSPATH'))
                or any(k.startswith('LD_') and k != 'LD_LIBRARY_PATH' for k in env)):
            raise ValueError('comparison environment injects a backend, JVM flags, or preload library')
        java = bindings[slot['role']].get('java')
        if not java or argv.count(java) != 1:
            raise ValueError(f"slot {slot['slot']} is not bound to its role Java image")
        cp_flags = [i for i, arg in enumerate(argv) if arg in ('-cp', '-classpath')]
        if len(cp_flags) != 1 or cp_flags[0] + 1 >= len(argv):
            raise ValueError(f"slot {slot['slot']} lacks one explicit fixture classpath")
        classpath = argv[cp_flags[0] + 1].split(os.pathsep)
        expected_entry = build_receipts[slot['role']]['java_overlay']['classpath_entry']
        if str(Path(expected_entry).resolve()) not in {
                str(Path(entry).resolve()) for entry in classpath}:
            raise ValueError(f"slot {slot['slot']} classpath omits its pinned fixture overlay")
        if 'XssPublicBench' not in argv or '{history}' not in argv:
            raise ValueError(f"slot {slot['slot']} lacks fixture/history arguments")
        if '{output_csv}' not in argv:
            raise ValueError(f"slot {slot['slot']} lacks output placeholder")
        normalized_argv.add(tuple('$ROLE_JAVA' if arg == java else arg for arg in argv))
        normalized_environment = {k: v for k, v in env.items()
                                  if k not in ('JAVA_HOME', 'LD_LIBRARY_PATH')}
        if common_env is None:
            common_env = normalized_environment
        elif normalized_environment != common_env:
            raise ValueError('JVM environment differs beyond role-specific Java/library paths')
        commands.append({'slot': slot, 'argv': argv, 'env': env})
    if len(normalized_argv) != 1:
        raise ValueError('all slots must use the same command/flags apart from the bound Java image')
    for role in ROLES:
        b = bindings[role]
        if (not b.get('java') or not Path(b['java']).is_absolute()
                or not b.get('image_root') or not Path(b['image_root']).is_absolute()):
            raise ValueError(f'incomplete role image binding: {role}')
        if (not b.get('build_receipt_path') or not b.get('build_receipt_sha256')
                or b.get('backend') not in ('stock-default', 'embedded', 'upstream')
                or not b.get('source_commit') or not b.get('source_tree_sha256')
                or not b.get('toolchain_sha256') or not b.get('configuration_sha256')):
            raise ValueError(f'missing immutable build receipt for {role}')
        if not b.get('java_hotspot_sha256') or not b.get('java_overlay_sha256'):
            raise ValueError(f'missing Java/HotSpot or overlay identity for {role}')
        if not is_sha256(b['java_hotspot_sha256']) or not is_sha256(b['java_overlay_sha256']):
            raise ValueError(f'invalid Java/HotSpot or overlay digest for {role}')
        if role in ('E', 'U') and (not is_sha256(b.get('range_dso_sha256'))
                                   or not b.get('range_dso_path')):
            raise ValueError(f'invalid range DSO digest for {role}')
    if len({bindings[r]['java_overlay_sha256'] for r in ROLES}) != 1:
        raise ValueError('all roles must use the same compiled benchmark fixture')
    if check_disk:
        harness_hashes = manifest.get('harness_sha256')
        expected_files = {
            'XssPublicBench.java': HERE / 'XssPublicBench.java',
            'run_comparison.py': HERE / 'run_comparison.py',
            'analyze_results.py': HERE / 'analyze_results.py',
            'test_offline.py': HERE / 'test_offline.py',
            'CONTRACT.md': HERE / 'CONTRACT.md',
        }
        if set(harness_hashes or {}) != set(expected_files):
            raise ValueError('harness hash set mismatch')
        for name, path in expected_files.items():
            if sha(path) != harness_hashes[name]:
                raise ValueError(f'harness content changed: {name}')
        frozen_inputs = manifest.get('file_hashes')
        if not isinstance(frozen_inputs, dict) or not frozen_inputs:
            raise ValueError('missing frozen build/preparation file hashes')
        all_files = dict(frozen_inputs)
        for path, digest in [(str(proposal_path.resolve()), manifest['proposal_sha256'])]:
            if path in all_files and all_files[path] != digest:
                raise ValueError(f'conflicting frozen digest for {path}')
            all_files[path] = digest
        _check_hash_map(all_files)
    if authority_path is not None or review_path is not None:
        if authority_path is None or review_path is None:
            raise ValueError('authority and independent review must be supplied together')
        validate_authority(prepared_path, manifest, authority_path, review_path)
    return commands


def snapshot(pid: int, sorter_tid: int | None = None) -> dict:
    proc = Path(f'/proc/{pid}')
    result = {'time_ns': time.monotonic_ns(), 'pid': pid, 'files': {}, 'sorter': {}}
    for name in ('status', 'cmdline', 'maps', 'smaps_rollup'):
        result['files'][name] = (proc / name).read_text(errors='replace')
    if sorter_tid is not None:
        thread = proc / 'task' / str(sorter_tid)
        result['sorter'] = {
            'tid': sorter_tid,
            'status': (thread / 'status').read_text(errors='replace'),
            'schedstat': (thread / 'schedstat').read_text(errors='replace'),
            'affinity': sorted(os.sched_getaffinity(sorter_tid)),
        }
    cgroup = Path('/sys/fs/cgroup')
    result['cgroup'] = {}
    for name in ('cpu.stat', 'cpu.max', 'memory.current', 'memory.max'):
        p = cgroup / name
        if p.is_file():
            result['cgroup'][name] = p.read_text()
    return result


def write_event(journal, current_path: Path, row: dict) -> None:
    row = dict(row)
    row['controller_monotonic_ns'] = time.monotonic_ns()
    journal.write(json.dumps(row, sort_keys=True) + '\n')
    journal.flush()
    os.fsync(journal.fileno())
    atomic_json(current_path, row)


def expand_command(spec: dict, slot: dict, stem: Path) -> tuple[list[str], dict[str, str]]:
    replacements = {'{output_csv}': str(stem.with_suffix('.csv')),
                    '{history}': str(slot['history']), '{role}': slot['role'],
                    '{slot}': str(slot['slot'])}
    def subst(v: str) -> str:
        for key, value in replacements.items():
            v = v.replace(key, value)
        if '{' in v or '}' in v:
            raise ValueError(f'unknown command placeholder: {v}')
        return v
    return [subst(s) for s in spec['argv']], {k: subst(v) for k, v in spec['env'].items()}


def count_slot_files(out: Path, stem: Path) -> int:
    return sum(p.stat().st_size for p in out.glob(stem.name + '.*') if p.is_file())


def kill_bounded(proc: subprocess.Popen, grace: int = 3, kill_wait: int = 2) -> int | None:
    if proc.poll() is not None:
        return proc.returncode
    try:
        os.killpg(proc.pid, signal.SIGTERM)
    except ProcessLookupError:
        pass
    try:
        return proc.wait(timeout=grace)
    except subprocess.TimeoutExpired:
        try:
            os.killpg(proc.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        try:
            return proc.wait(timeout=kill_wait)
        except subprocess.TimeoutExpired:
            return None


def run_one(command: list[str], env: dict[str, str], slot: dict, out: Path,
            stem: Path, seconds: float) -> dict:
    receipt = {'slot': slot, 'state': 'launch_reserved', 'argv': command,
               'env': env, 'start_monotonic_ns': time.monotonic_ns()}
    receipt_path = stem.with_suffix('.receipt.json')
    if receipt_path.exists() or stem.with_suffix('.csv').exists() or stem.with_suffix('.log').exists():
        raise FileExistsError(f"slot {slot['slot']} has prior artifacts; never retry")
    atomic_json(receipt_path, receipt)
    proc = None
    selector = None
    stage = 0
    sorter_tid = None
    deadline = time.monotonic() + seconds
    with stem.with_suffix('.log').open('xb') as log:
        try:
            proc = subprocess.Popen(command, env=env, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                    shell=False, start_new_session=True)
            receipt.update(state='running', pid=proc.pid)
            atomic_json(receipt_path, receipt)
            selector = selectors.DefaultSelector()
            selector.register(proc.stdout, selectors.EVENT_READ)
            pending = b''
            while True:
                if count_slot_files(out, stem) > OUTPUT_LIMIT:
                    raise RuntimeError('per-slot output cap exceeded')
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    raise TimeoutError('per-JVM deadline; preserve failure, no retry')
                events = selector.select(min(.25, remaining))
                if not events:
                    if proc.poll() is not None:
                        break
                    continue
                chunk = os.read(proc.stdout.fileno(), 65536)
                if not chunk:
                    break
                log.write(chunk); log.flush()
                pending += chunk
                lines = pending.split(b'\n')
                pending = lines.pop()
                for raw in lines:
                    line = raw.decode('utf-8', 'replace')
                    tag = line.split(' ', 1)[0]
                    expected = ('BOOT', 'READY', 'DONE')[stage] if stage < 3 else None
                    if tag in ('BOOT', 'READY', 'DONE'):
                        if tag != expected:
                            raise RuntimeError(f'bad handshake order: expected {expected}, got {tag}')
                        words = line.split()
                        if len(words) != 3 or int(words[1]) != proc.pid:
                            raise RuntimeError(f'malformed process handshake: {line!r}')
                        tid = int(words[2])
                        if tag == 'BOOT':
                            receipt['boot'] = snapshot(proc.pid)
                            receipt['sorter_tid'] = tid
                        elif tag == 'READY':
                            sorter_tid = tid
                            comm = Path(f'/proc/{proc.pid}/task/{tid}/comm').read_text().strip()
                            if comm != 'xss-sorter':
                                raise RuntimeError(f'unexpected sorter thread name {comm!r}')
                            allowed = os.sched_getaffinity(0)
                            if 2 not in allowed:
                                raise RuntimeError('CPU 2 unavailable for sorter pin')
                            os.sched_setaffinity(tid, {2})
                            if os.sched_getaffinity(tid) != {2}:
                                raise RuntimeError('sorter affinity pin failed')
                            receipt['ready'] = snapshot(proc.pid, tid)
                        else:
                            receipt['done'] = snapshot(proc.pid, tid)
                        stage += 1
                        receipt['last_protocol_stage'] = tag
                        atomic_json(receipt_path, receipt)
                        proc.stdin.write(b'\n'); proc.stdin.flush()
            selector.close()
            rc = proc.wait(timeout=max(.001, deadline - time.monotonic()))
            receipt.update(exit_code=rc, end_monotonic_ns=time.monotonic_ns(),
                           protocol_stages=stage)
            if rc != 0 or stage != 3:
                raise RuntimeError(f'process incomplete: exit={rc}, protocol_stages={stage}')
            receipt['state'] = 'process_complete'
            atomic_json(receipt_path, receipt)
            return receipt
        except BaseException as e:
            rc = kill_bounded(proc) if proc is not None else None
            receipt.update(state='uncertain_live_process' if proc is not None and rc is None else 'failed',
                           exit_code=rc, exception=repr(e), protocol_stages=stage,
                           failure_monotonic_ns=time.monotonic_ns())
            atomic_json(receipt_path, receipt)
            raise
        finally:
            if selector is not None:
                selector.close()
            if proc is not None:
                for stream in (proc.stdin, proc.stdout):
                    try:
                        stream.close()
                    except OSError:
                        pass


def case_schedule(history: int, cases: list[tuple[int, str]]) -> list[tuple[int, str]]:
    if len(cases) != 32:
        raise ValueError('expected 32 fixed cases')
    original = cases[:18]
    return [original[(i + 3 * history) % 18] for i in range(18)] + cases[18:]


def validate_data_file(path: Path, history: int, cases: list[tuple[int, str]]) -> dict:
    import csv
    with path.open(newline='') as f:
        reader = csv.DictReader(f)
        if reader.fieldnames != CSV_HEADER:
            raise ValueError(f'{path}: unexpected CSV header {reader.fieldnames!r}')
        rows = list(reader)
    expected = [(0, -1, 1048576, 'random', i) for i in range(20)]
    for cid, (size, pattern) in enumerate(case_schedule(history, cases)):
        expected.extend((1, cid, size, pattern, i) for i in range(8))
        expected.extend((2, cid, size, pattern, i) for i in range(16))
    if len(rows) != len(expected):
        raise ValueError(f'{path}: expected {len(expected)} sort rows, got {len(rows)}')
    for row, want in zip(rows, expected):
        actual = (int(row['phase']), int(row['case_id']), int(row['size']),
                  row['pattern'], int(row['ordinal']))
        if actual != want or int(row['history']) != history:
            raise ValueError(f'{path}: row identity mismatch {actual} != {want}')
        for key in ('sort_ns', 'reset_alloc_bytes', 'sort_alloc_bytes', 'validation_alloc_bytes'):
            if int(row[key]) < 0:
                raise ValueError(f'{path}: negative {key}')
        if int(row['sort_ns']) <= 0:
            raise ValueError(f'{path}: non-positive sort duration')
    return {'valid': True, 'sort_rows': len(rows), 'measured': 32 * 16,
            'conditioning': 32 * 8, 'global_warmups': 20,
            'explicit_GC': 0, 'csv_sha256': sha(path)}


def main(argv: list[str]) -> int:
    if len(argv) != 5:
        raise SystemExit('usage: run_comparison.py PREPARED.json AUTHORITY.json REVIEW.json PROPOSAL.json')
    prepared_path, authority_path, review_path, proposal_path = map(Path, argv[1:])
    prepared = json.loads(prepared_path.read_text())
    proposal = json.loads(proposal_path.read_text())
    commands = validate_prepared(prepared, proposal, proposal_path.resolve(),
                                 prepared_path.resolve(), authority_path.resolve(),
                                 review_path.resolve(), check_disk=True)
    authorization = validate_authority(prepared_path.resolve(), prepared,
                                       authority_path.resolve(), review_path.resolve())
    slots, cases = plan_from_proposal(proposal)
    if not {0, 1, 2, 3, 4}.issubset(os.sched_getaffinity(0)):
        raise RuntimeError('required CPUs 0..4 are not available')
    out = Path(prepared['output_directory']).resolve()
    if out.exists() or out.is_symlink():
        raise FileExistsError(f'collection output already exists: {out}')
    out.mkdir(parents=True, exist_ok=False)
    harness_names = ('XssPublicBench.java', 'run_comparison.py', 'analyze_results.py',
                     'test_offline.py', 'CONTRACT.md')
    atomic_json(out / 'FROZEN.json', {'prepared': prepared, 'authorization': authorization,
                                      'proposal_sha256': sha(proposal_path),
                                      'harness_sha256': {name: sha(HERE / name)
                                                         for name in harness_names}})
    start = time.monotonic()
    deadline = start + BUDGET['collection_cap_seconds']
    with (out / 'events.jsonl').open('x', encoding='utf-8') as journal:
        for command_spec, slot in zip(commands, slots):
            global_remaining = deadline - time.monotonic()
            if global_remaining <= BUDGET['cleanup_seconds']:
                write_event(journal, out / 'CURRENT.json', {
                    **slot, 'state': 'stopped_global_cap',
                    'reason': 'insufficient budget for another slot plus cleanup',
                    'elapsed_seconds': time.monotonic() - start})
                return 2
            process_seconds = min(BUDGET['per_JVM_seconds'],
                                  global_remaining - BUDGET['cleanup_seconds'])
            remaining_seconds = global_remaining
            stem = out / f"{slot['slot']:02d}-{slot['role']}"
            write_event(journal, out / 'CURRENT.json', {**slot, 'state': 'reserved',
                        'remaining_seconds': remaining_seconds,
                        'process_deadline_seconds': process_seconds})
            cmd, env = expand_command(command_spec, slot, stem)
            try:
                receipt = run_one(cmd, env, slot, out, stem, process_seconds)
                data_receipt = validate_data_file(stem.with_suffix('.csv'), slot['history'], cases)
                receipt.update(data=data_receipt, state='complete')
                atomic_json(stem.with_suffix('.receipt.json'), receipt)
                if count_slot_files(out, stem) > OUTPUT_LIMIT:
                    raise RuntimeError('slot output cap exceeded after completion')
                if time.monotonic() > deadline:
                    raise TimeoutError('global cap reached; no extension or replacement')
                write_event(journal, out / 'CURRENT.json', {**slot, 'state': 'complete',
                            'data': data_receipt, 'elapsed_seconds': time.monotonic() - start})
            except BaseException as e:
                write_event(journal, out / 'CURRENT.json', {**slot, 'state': 'stopped',
                            'exception': repr(e), 'elapsed_seconds': time.monotonic() - start})
                raise
        write_event(journal, out / 'CURRENT.json', {'state': 'finished', **BUDGET,
                    'elapsed_seconds': time.monotonic() - start})
    return 0


if __name__ == '__main__':
    raise SystemExit(main(sys.argv))
