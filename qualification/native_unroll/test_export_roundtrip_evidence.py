"""Exercise malformed and unreadable JSON exports without launching a JVM."""
import contextlib
import io
import json
import pathlib
import sys
import tempfile
from unittest import mock

import export_roundtrip_evidence as exporter


def check_case(kind, root):
    blocked = root / 'commands-status.json'
    if kind == 'unreadable-directory':
        blocked.mkdir()
    else:
        blocked.write_text('{' if kind == 'malformed-json' else '[]')
    (root / 'plan.json').write_text('{"later_json": true}')
    sentinels = {
        'unpaired.out': 'RAW_OUT_AFTER_ERROR',
        'failed.log': 'RAW_LOG_AFTER_ERROR',
        'Fixture.jtr': 'test result: Failed. JTR_AFTER_ERROR',
        'text/summary.txt': 'SUMMARY_AFTER_ERROR',
    }
    for name, text in sentinels.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text + '\n')
    reads = []
    original_read = pathlib.Path.read_text

    def read_text(path, *args, **kwargs):
        if path == blocked:
            reads.append(str(path))
            if kind == 'permission-error':
                raise PermissionError(13, 'Permission denied by regression fixture', str(path))
        return original_read(path, *args, **kwargs)

    output = io.StringIO()
    with mock.patch.object(sys, 'argv', ['export_roundtrip_evidence.py', str(root)]), \
         mock.patch.object(pathlib.Path, 'read_text', read_text), contextlib.redirect_stdout(output):
        try:
            exporter.main()
        except SystemExit as error:
            status = error.code
        else:
            status = 0
    text = output.getvalue()
    assert status == 2, status
    invalid = [json.loads(line.split('=', 1)[1]) for line in text.splitlines()
               if line.startswith('ROUNDTRIP_INVALID_JSON=')]
    assert len(invalid) == 1, invalid
    assert invalid[0]['file']['path'] == str(blocked), invalid
    assert len(reads) == 1, reads
    if kind == 'malformed-json':
        assert invalid[0]['text'] == '{' and 'sha256' in invalid[0]['file'], invalid
    else:
        assert invalid[0]['text'] is None, invalid
        assert invalid[0]['file'] == {'path': str(blocked)}, invalid
        assert ('Permission denied' if kind == 'permission-error' else 'Is a directory') in invalid[0]['error']
    assert '"later_json": true' in text
    for sentinel in sentinels.values():
        assert sentinel in text, sentinel
    return dict(case=kind, passed=True, exit_status=status, blocked_read_attempts=len(reads),
                invalid_records=len(invalid), later_evidence_preserved=True)


def main():
    results = []
    with tempfile.TemporaryDirectory(prefix='roundtrip-export-regression-') as temporary:
        for kind in ['malformed-json', 'unreadable-directory', 'permission-error']:
            root = pathlib.Path(temporary) / kind
            root.mkdir()
            try:
                results.append(check_case(kind, root))
            except Exception as error:
                results.append(dict(case=kind, passed=False, error=repr(error)))
    report = dict(fixture_only=True, native_JVMs=0, CPP_builds=0, results=results)
    print(json.dumps(report, indent=2))
    if not all(result['passed'] for result in results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
