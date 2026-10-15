"""Export bounded, sufficient textual evidence if artifact byte transfer is unavailable."""
import argparse
import json
import pathlib

from run_release_causal import record


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('root', type=pathlib.Path)
    p.add_argument('--full', action='store_true')
    a = p.parse_args()
    if not a.root.exists():
        print('ROUNDTRIP_EVIDENCE_ABSENT=' + str(a.root))
        return
    invalid = []
    cached = {}

    def read_json(path):
        if path not in cached:
            text = None
            try:
                text = path.read_text()
                cached[path] = json.loads(text)
            except (ValueError, OSError) as error:
                cached[path] = None
                invalid.append(str(path))
                file = dict(path=str(path)) if isinstance(error, OSError) else record(path)
                print('ROUNDTRIP_INVALID_JSON=' + json.dumps(dict(file=file,
                    error=str(error), text=text)), flush=True)
        return cached[path]
    for name in ['preflight-gate.json', 'chain-compilation-results.json', 'commands-status.json',
                 'full-result.json', 'status.json', 'plan.json', 'summary.json', 'initial-gate.json',
                 'assembly-index.json', 'assembly-run-status.json', 'installed-assembly-gate.json']:
        path = a.root / name
        if path.exists():
            value = read_json(path)
            if value is not None:
                print('ROUNDTRIP_RESULT_JSON=' + json.dumps(dict(file=record(path), value=value)), flush=True)
    for path in sorted(a.root.rglob('*.jtr')):
        text = path.read_text()
        if a.full:
            value = dict(file=record(path), status=[x for x in text.splitlines() if x.startswith(('execStatus=', 'test result:', 'ROUNDTRIP_', 'EDGE_TIER'))])
            if 'test result: Failed' in text or 'test result: Error' in text:
                value['text'] = text
        else:
            value = dict(file=record(path), text=text)
        print('ROUNDTRIP_JTR_JSON=' + json.dumps(value), flush=True)
    for path in sorted(a.root.rglob('pid-*-output.log')):
        selected = '\n'.join(x for x in path.read_text().splitlines() if x.startswith(('EDGE_TIER', 'ROUNDTRIP_')))
        if selected:
            print('ROUNDTRIP_TEST_VM_MARKERS_JSON=' + json.dumps(dict(file=record(path), text=selected)), flush=True)
    for path in sorted(a.root.glob('*.log')):
        text = path.read_text()
        if not a.full:
            selected = text
        else:
            selected = '\n'.join(x for x in text.splitlines() if x.startswith((
                'conversion,', 'rawBits,', 'directBits,', 'arithmetic,', 'signatureArgs,',
                'osrAccumulator,', 'LOCAL_INSERT_', 'LOCAL_PROFILED_OSR', 'OSR entry @',
                'ROUNDTRIP_', 'EDGE_TIER')))
        if selected:
            print('ROUNDTRIP_PROCESS_TEXT_JSON=' + json.dumps(dict(file=record(path), text=selected)), flush=True)
    # A process can exit0 but fail workload/compilation/checksum validation before
    # a pair is recorded. Preserve these raw windows as well as nonzero exits.
    for path in sorted(a.root.glob('*.out')):
        print('ROUNDTRIP_RAW_PROCESS_TEXT_JSON=' + json.dumps(dict(file=record(path), text=path.read_text())), flush=True)
    for filename in ['status.json', 'commands-status.json']:
        state = a.root / filename
        if state.exists():
            values = read_json(state)
            if values is None:
                continue
            for item in values:
                raw = a.root / (item['name'] + '.log')
                if item.get('exit_status') and raw.exists():
                    print('ROUNDTRIP_FAILED_PROCESS_JSON=' + json.dumps(dict(file=record(raw), text=raw.read_text())), flush=True)
    for path in sorted(a.root.glob('*.status.json')):
        status = read_json(path)
        if status is None:
            continue
        raw = a.root / (path.name.removesuffix('.status.json') + '.out')
        if status.get('exit_status') and raw.exists():
            print('ROUNDTRIP_FAILED_PROCESS_JSON=' + json.dumps(dict(file=record(raw), text=raw.read_text())), flush=True)
    for path in sorted(a.root.rglob('text/summary.txt')):
        print('ROUNDTRIP_SUITE_SUMMARY_JSON=' + json.dumps(dict(file=record(path), text=path.read_text())), flush=True)
    if invalid:
        raise SystemExit(2)


if __name__ == '__main__':
    main()
