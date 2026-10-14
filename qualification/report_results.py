#!/usr/bin/env python3
import collections, json, pathlib, statistics, subprocess, sys
root=pathlib.Path(sys.argv[1])
for path in sorted(root.rglob('artifact-provenance.json')):
    print('ARTIFACT_PROVENANCE',path,json.dumps(json.loads(path.read_text()),sort_keys=True))
for commands in sorted(root.rglob('commands.jsonl')):
    folder=commands.parent
    subprocess.run([sys.executable,str(pathlib.Path(__file__).with_name('summarize.py')),str(folder)],check=True)
    metadata=json.loads((folder/'metadata.json').read_text())
    print('COHORT_METADATA',folder,json.dumps({k:v for k,v in metadata.items() if k!='driver_files'},sort_keys=True))
    print('HARDWARE',folder,(folder/'cpu.txt').read_text().replace('\n',' | '))
    summary=json.loads((folder/'summary.json').read_text())
    print('STATUS_COUNTS',folder,json.dumps(summary['status_counts'],sort_keys=True))
    for row in summary['results']:
        if row['phase'] in ['class_load','class_init','first','primed','early','steady','warmup','calibration'] or row['phase'].startswith('call'):
            print('RESULT_JSON',json.dumps({k:v for k,v in row.items() if k!='replicates'},sort_keys=True))
    codes=collections.defaultdict(list)
    for row in json.loads((folder/'compilation-records.json').read_text()):
        if row.get('compiler')=='c2':
            method=row['method'].split()[1]; image=row['label'].split('-')[0]
            codes[image,method,row.get('compile_kind','normal')].append(row['main_code_bytes'])
    for key,values in sorted(codes.items()):
        print('CODE_JSON',json.dumps({'image':key[0],'method':key[1],'kind':key[2],'count':len(values),'median_bytes':statistics.median(values),'min_bytes':min(values),'max_bytes':max(values)},sort_keys=True))
