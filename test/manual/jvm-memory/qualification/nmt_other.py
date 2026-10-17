# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Offline, fail-closed accounting for this frozen JDK's NMT detail scale=1.

No subprocesses, sampling, frame-name filtering, or default-to-zero paths.
Unknown report syntax is inconclusive. Only absolute snapshots are accepted.
"""
import re


class NmtDataError(ValueError):
    """Missing, malformed, unsupported, or unreconciled accounting data."""


PEAK = r"(?: \(at peak\)| \(peak=\d+ #\d+\))?"
COUNTER = r"\(malloc=(?P<bytes>\d+) tag=(?P<tag>[^()#]+?)(?: #(?P<count>\d+))?\)"
SUMMARY_MALLOC = re.compile(COUNTER + PEAK)
DETAIL_MALLOC = re.compile(r"\(" + COUNTER + PEAK + r"\)")
DETAIL_VIRTUAL = re.compile(r"\(reserved=\d+, committed=\d+ Tag=[A-Za-z][A-Za-z ]*\)")
FRAME = re.compile(r"\[0x[0-9a-fA-F]+\].*")
CATEGORY = re.compile(r"-\s+(.+?) \(reserved=(\d+), committed=(\d+)\)")
TAGS = frozenset({
    'Java Heap', 'Class', 'Thread', 'Thread Stack', 'Code', 'GC', 'GCCardSet',
    'Compiler', 'Internal', 'Other', 'Symbol', 'Native Memory Tracking',
    'Shared class space', 'Arena Chunk', 'Test', 'Tracing', 'Logging', 'Statistics',
    'Arguments', 'Module', 'Safepoint', 'Synchronization', 'Serviceability',
    'Metaspace', 'String Deduplication', 'Object Monitors', 'JNI', 'Unknown',
})  # Exact names reviewed against this frozen source's nmt/memTag.hpp.


def _fail(message):
    raise NmtDataError(message)


def _counter(match, context):
    if match['tag'] not in TAGS or match['tag'] == 'Unknown':
        _fail(context + ': unknown/invalid memory tag')
    size = int(match['bytes'])
    count = int(match['count'] or '0')
    # The frozen workload has no zero-sized native allocation requests.
    # Never infer a positive allocation count from bytes or peak counts.
    if (size == 0) != (count == 0):
        _fail(context + ': inconsistent/missing current byte or count field')
    return {'bytes': size, 'count': count}


def parse_other_snapshot(text):
    """Return reconciled live Other counters, or raise (never an implicit zero).

    Parse EVERY detail block, including other tags, so an unrecognized/truncated
    allocation record cannot disappear because its tag/frame was damaged.
    Historic peaks are syntax-checked but never added to current counters.
    """
    if not isinstance(text, str) or not text.endswith('\n\n'):
        _fail('missing snapshot or incomplete final report block')
    if '\x00' in text or '\r' in text:
        _fail('unsupported NMT transport characters')
    lines = text.splitlines()
    if not lines or not re.fullmatch(r'[1-9]\d*:', lines[0]):
        _fail('missing jcmd PID receipt')
    if lines.count('Native Memory Tracking:') != 1:
        _fail('missing/duplicate NMT header')
    if lines.count('Virtual memory map:') != 1 or lines.count('Details:') != 1:
        _fail('missing/duplicate absolute detail sections')
    map_index, detail_index = lines.index('Virtual memory map:'), lines.index('Details:')
    if not (lines.index('Native Memory Tracking:') < map_index < detail_index):
        _fail('NMT sections out of order')
    summary = lines[:map_index]
    totals = [line for line in summary if line.startswith('Total:')]
    if len(totals) != 1 or not re.fullmatch(r'Total: reserved=\d+, committed=\d+', totals[0]):
        _fail('missing/malformed scale=1 absolute totals')
    if any('omitt' in line.lower() for line in lines):
        _fail('omitted allocation data is not a zero')
    if not any(re.fullmatch(r'\[0x[0-9a-fA-F]+ - 0x[0-9a-fA-F]+\] .+', line)
               for line in lines[map_index + 1:detail_index]):
        _fail('missing virtual memory map records')

    # A zero Other category must be explicitly present; absence is unknown.
    starts = [i for i, line in enumerate(summary) if line.startswith('-')]
    other_sections = []
    for n, start in enumerate(starts):
        header = CATEGORY.fullmatch(summary[start])
        if header is None:
            _fail('malformed scale=1 category header')
        if header[1] not in TAGS:
            _fail('unknown category tag')
        end = starts[n + 1] if n + 1 < len(starts) else len(summary)
        section = [line.strip() for line in summary[start + 1:end] if line.strip()]
        if header[1] == 'Other':
            other_sections.append((header, section))
        elif any(re.search(r'\btag=Other\b', line) for line in section):
            _fail('Other counter outside Other category')
    if len(other_sections) != 1:
        _fail('missing/duplicate Other category')
    header, section = other_sections[0]
    if len(section) != 1:
        _fail('missing/extra Other category fields; fixture expects malloc only')
    match = SUMMARY_MALLOC.fullmatch(section[0])
    if match is None or match['tag'] != 'Other':
        _fail('malformed Other category malloc counter')
    category = _counter(match, 'Other category')
    if int(header[2]) != category['bytes'] or int(header[3]) != category['bytes']:
        _fail('Other reserved/committed totals do not equal requested malloc bytes')

    groups = []
    malloc_groups = virtual_groups = 0
    virtual_started = False
    details = '\n'.join(lines[detail_index + 1:])
    for ordinal, block in enumerate(re.split(r'\n[ \t]*\n', details), 1):
        if not block.strip():
            continue
        record = block.splitlines()
        while record and not record[0].strip():
            record.pop(0)
        footer = record[-1].strip()
        frames = record[:-1]
        if not frames or any(FRAME.fullmatch(frame) is None for frame in frames):
            _fail('detail block %d: missing/malformed stack or footer' % ordinal)
        match = DETAIL_MALLOC.fullmatch(footer)
        if match is not None:
            if virtual_started:
                _fail('malloc group after virtual groups')
            malloc_groups += 1
            counter = _counter(match, 'detail block %d' % ordinal)
            if not counter['bytes']:
                _fail('non-live malloc detail group unsupported by frozen JDK')
            if match['tag'] == 'Other':
                groups.append({**counter, 'frames': frames, 'raw_block': block})
        elif DETAIL_VIRTUAL.fullmatch(footer):
            virtual_started = True
            virtual_groups += 1
            if footer.split(' Tag=', 1)[1][:-1] not in TAGS:
                _fail('unknown virtual allocation tag')
            if re.search(r'\bTag=Other\)', footer):
                _fail('unexpected Other virtual allocation in malloc-only fixture')
        else:
            _fail('detail block %d: unparsed allocation record' % ordinal)
    # Both exist in this fixed 256 MiB Java process even when Other is zero.
    if not malloc_groups or not virtual_groups:
        _fail('missing malloc or virtual detail records')
    summed = {'bytes': sum(g['bytes'] for g in groups),
              'count': sum(g['count'] for g in groups)}
    if summed != category:
        _fail('Other detail/category mismatch: groups=%r category=%r' % (summed, category))
    return {'status': 'reconciled-zero' if category['bytes'] == 0 else 'reconciled-live',
            **category, 'category': category, 'groups': groups,
            'all_malloc_groups_parsed': malloc_groups,
            'all_virtual_groups_parsed': virtual_groups}


def check_accounting(row, before_text, after_text, output, exit_code, stages, stderr=''):
    """Pure oracle shared by the repaired controller and offline fixtures."""
    errors = []
    if (row.get('variant') not in ('B', 'C') or row.get('mode') not in ('leak', 'control')
            or row.get('threshold') not in (None, 0, 65536, 69631, 69632)
            or (row.get('mode') == 'leak' and row.get('threshold') is not None)
            or (row.get('mode') == 'control' and row.get('threshold') is None)):
        errors.append('Unknown or inconsistent frozen accounting case')
    if exit_code != 0:
        errors.append('Fixture did not exit zero; content/alignment checks unproven')
    if stderr:
        errors.append('Unexpected fixture stderr')
    if stages != ['READY', 'POST_EXIT']:
        errors.append('Missing/excess coordination stages')
    receipt = re.fullmatch(
        r'NIO READY iterations=32 size=65536 alignment=4096\n'
        r'NIO POST_EXIT completed=32 misaligned=(\d+)\n', output)
    if receipt is None or not 0 <= int(receipt[1]) <= 32:
        errors.append('Missing/malformed completion/content/alignment receipt')
    elif row.get('mode') == 'leak' and int(receipt[1]) != 32:
        errors.append('All 32 target misalignments were not demonstrated')
    before = after = None
    for label, text in [('before', before_text), ('after', after_text)]:
        try:
            parsed = parse_other_snapshot(text)
            if label == 'before':
                before = parsed
            else:
                after = parsed
        except NmtDataError as exc:
            errors.append(label + ' NMT unknown/inconclusive: ' + str(exc))
    expected = None
    if row.get('variant') == 'C' or row.get('threshold') == 0:
        expected = {'bytes': 0, 'count': 0}
    elif row.get('variant') == 'B' and row.get('mode') == 'leak':
        expected = {'bytes': 2224128, 'count': 32}
    delta = None
    if before is not None and after is not None:
        delta = {key: after[key] - before[key] for key in ('bytes', 'count')}
        # Frozen isolated fixture starts after warmup/cache exit. Reject any
        # live initial Other, including a leak hidden by a zero delta.
        if before['category'] != {'bytes': 0, 'count': 0}:
            errors.append('READY must have explicit zero live Other bytes AND count')
        if expected is not None and after['category'] != expected:
            errors.append('POST_EXIT absolute live Other bytes/count violates fixed oracle')
        if expected is not None and delta != expected:
            errors.append('Reconciled Other delta violates fixed oracle')
    return {'status': 'pass' if not errors else 'failed/inconclusive', 'errors': errors,
            'before_other': before, 'after_other': after,
            'delta_requested': delta, 'expected_after_and_delta': expected,
            'attribution': 'all live Other groups; source/fixture inference, not named Unsafe frame'}
