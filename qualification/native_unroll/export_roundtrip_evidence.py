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
    for name in ['preflight-gate.json', 'chain-compilation-results.json', 'commands-status.json',
                 'full-result.json', 'status.json']:
        path = a.root / name
        if path.exists():
            print('ROUNDTRIP_RESULT_JSON=' + json.dumps(dict(file=record(path), value=json.loads(path.read_text()))), flush=True)
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
    for filename in ['status.json', 'commands-status.json']:
        state = a.root / filename
        if state.exists():
            for item in json.loads(state.read_text()):
                raw = a.root / (item['name'] + '.log')
                if item.get('exit_status') and raw.exists():
                    print('ROUNDTRIP_FAILED_PROCESS_JSON=' + json.dumps(dict(file=record(raw), text=raw.read_text())), flush=True)
    for path in sorted(a.root.glob('*.status.json')):
        status = json.loads(path.read_text())
        raw = a.root / (path.name.removesuffix('.status.json') + '.out')
        if status.get('exit_status') and raw.exists():
            print('ROUNDTRIP_FAILED_PROCESS_JSON=' + json.dumps(dict(file=record(raw), text=raw.read_text())), flush=True)
    for path in sorted(a.root.rglob('text/summary.txt')):
        print('ROUNDTRIP_SUITE_SUMMARY_JSON=' + json.dumps(dict(file=record(path), text=path.read_text())), flush=True)


if __name__ == '__main__':
    main()
