#!/usr/bin/env python3
"""Path metadata from the retained benchmark fixture; no timing is performed."""
import collections, json, statistics
from pathlib import Path

root = Path('/workspace/sz-evidence')
pad = ' \t\x1c\n' * 1024
white = dict(empty='', shortBlank=' \t\n ' * 4, shortClean='A' * 16,
    shortPad='  A  ', early=' '*7+'A'+' '*4088,
    prefix8=' '*8+'A'*4096, prefix9=' '*9+'A'*4096,
    suffix8='A'*4096+' '*8, suffix9='A'*4096+' '*9,
    probeAt=' '*32+'A'*4096, probeAfter=' '*33+'A'*4096,
    tailProbeAt='A'*4096+' '*32, tailProbeAfter='A'*4096+' '*33,
    gateBefore=' '*287, gateAt=' '*288, longBlank=pad,
    longClean='A'*4096, longLeading=pad+'A', longTrailing='A'+pad,
    longBoth=pad+'A'+pad, lateNbsp=pad+'\xa0', nul='\0'*4096,
    window=' '*131089+'A', utf16='\u2000'*4096+'A'+'\u2000'*4096)
lines = dict(empty='', short='Abc\r\ndef\nghi\r', immediate='\r\n'+'A'*4096,
    prefix8='A'*8+'\r\n'+'A'*4096, prefix9='A'*9+'\r\n'+'A'*4096,
    probeAt='A'*32+'\r\n'+'A'*4096, probeAfter='A'*33+'\r\n'+'A'*4096,
    lines16=('A'*16+'\r\n')*256, lines80=('A'*80+'\r\n')*256,
    lines128=('A'*128+'\r\n')*256, gateBefore='A'*287, gateAt='A'*288,
    noMatch='A'*4096, longLines=('A'*4096+'\r\n')*4,
    dense='A\r\n'*1024, windowCRLF='A'*65567+'\r\n'+'A'*65536+'\n',
    utf16=('\u0100'*4096+'\r\n')*4)

def path(operation, case):
    text = (lines if operation.startswith('lines') else white)[case]
    latin1 = all(ord(ch) <= 255 for ch in text)
    if not latin1:
        return dict(size=len(text), path='UTF16 control', native=False)
    if not text:
        return dict(size=0, path='empty Java path', native=False)
    if operation.startswith('lines'):
        start=0; native=False; first=None
        while start<len(text):
            end=start
            while end<len(text) and text[end] not in '\r\n': end+=1
            if first is None: first=end-start
            native |= len(text)-start>=288 and end-start>=32
            if operation=='linesFirst': break
            start=end+1+(end+1<len(text) and text[end]=='\r' and text[end+1]=='\n')
        kind='native probe edge' if native and case in ['probeAt','probeAfter'] else 'native bulk/mixed' if native else 'short Java path' if len(text)<288 else 'early-line Java path'
        return dict(size=len(text), path=kind, native=native, first_line_bytes=first)
    predicate=(lambda ch:ord(ch)<=32) if operation=='trim' else (lambda ch:ch in '\t\n\v\f\r\x1c\x1d\x1e\x1f ')
    leading=0; trailing=0
    while leading<len(text) and predicate(text[leading]): leading+=1
    while trailing<len(text) and predicate(text[-1-trailing]): trailing+=1
    forward=len(text)>=288 and leading>=32
    backward=len(text)>=288 and trailing>=32
    if operation=='trim': native=forward or (len(text)-leading>=288 and trailing>=32)
    elif operation=='strip': native=forward or (leading<len(text) and backward)
    elif operation=='stripTrailing': native=backward
    else: native=forward
    relevant=trailing if operation=='stripTrailing' else leading
    if native:
        kind='native probe edge' if case in ['probeAt','probeAfter','tailProbeAt','tailProbeAfter'] else 'native bulk'
    elif relevant==0 and (operation!='trim' or trailing==0) and (operation!='strip' or trailing==0): kind='immediate unchanged/nonblank Java path'
    elif len(text)<288: kind='short Java scan'
    else: kind='early-match Java path'
    return dict(size=len(text), path=kind, native=native, leading=leading, trailing=trailing)

source=json.loads((root/'qualify/c2-avx2/summary.json').read_text())
classified=[]
for row in source:
    result=dict(row)
    result.update(path(row['operation'],row['workload']))
    runs=list(row['per_round'].values())
    result['all_pairs_lose']=all(r['base']<r['candidate'] for r in runs)
    result['off_faster_all_pairs']=all(r['off']<r['candidate'] for r in runs)
    result['paired_candidate_minus_off_ns']=statistics.median(r['candidate']-r['off'] for r in runs)
    classified.append(result)
(root/'final-c2-loss-classification.json').write_text(json.dumps(classified,indent=2)+'\n')
losses=[r for r in classified if r['paired_speedup']<.95]
text=['# C2 losses below 0.95x, final refined fixed study','',
      'All rows below 0.95x are listed. Input metadata follows the benchmark first variant; all 16 variants have the same lengths and predicate positions. Size is bytes for Latin1, chars for UTF16. Native admission describes the enabled candidate, not the off control. These are path classifications, not proofs of JIT causes. Off/candidate below 1 means feature-off is faster. All-pairs means every same-round ratio loses, not statistical significance. Raw five-round values remain in the full table.', '',
      '| Operation | Workload | Size | Path | Base/candidate | All pairs lose | Off/candidate | Candidate minus off ns | Off faster all pairs | Old/candidate | Candidate minus old ns |',
      '|---|---|---:|---|---:|---|---:|---:|---|---:|---:|']
for r in losses:
    text.append(f"| {r['operation']} | {r['workload']} | {r['size']} | {r['path']} | {r['paired_speedup']:.3f} | {r['all_pairs_lose']} | {r['paired_off_speedup']:.3f} | {r['paired_candidate_minus_off_ns']:+.2f} | {r['off_faster_all_pairs']} | {r['paired_old_speedup']:.3f} | {r['paired_candidate_minus_old_ns']:+.2f} |")
text+=['','Counts by operation: '+str(dict(collections.Counter(r['operation'] for r in losses))),
       '', 'Counts by path: '+str(dict(collections.Counter(r['path'] for r in losses)))]
(root/'FINAL-C2-LOSS-CLASSIFICATION.md').write_text('\n'.join(text)+'\n')
print('Classified',len(losses),'rows',dict(collections.Counter(r['path'] for r in losses)))
