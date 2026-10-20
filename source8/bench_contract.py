import json, math, statistics
WHITE=['empty','shortBlank','shortClean','shortPad','early','probeAt','probeAfter','tailProbeAt','tailProbeAfter','gateBefore','gateAt','longBlank','longClean','longLeading','longTrailing','longBoth','lateNbsp','nul','window','utf16']
LINES=['empty','short','immediate','probeAt','probeAfter','lines16','lines80','lines128','gateBefore','gateAt','noMatch','longLines','dense','windowCRLF','utf16']
OPS=['trim','strip','stripLeading','stripTrailing','isBlank']
LINE_OPS=['linesCount','linesFirst']
def expected(phase,group):
    white=WHITE if phase=='qualify' else ['shortBlank','shortClean','early','probeAt','probeAfter','tailProbeAt','tailProbeAfter','gateAt','longBlank','longClean','longBoth']
    lines=LINES if phase=='qualify' else ['short','immediate','probeAt','probeAfter','lines16','lines80','lines128','gateAt','noMatch','longLines','dense']
    result=set()
    if group in ('all','white'): result|={(op,case) for op in OPS for case in white}
    if group in ('all','lines'): result|={(op,case) for op in LINE_OPS for case in lines}
    return result

def load(path,keys):
    data=json.loads(path.read_text())
    if not isinstance(data,list): raise ValueError(f'not JMH rows: {path}')
    values={}
    for item in data:
        if not item['benchmark'].startswith('org.openjdk.bench.java.lang.StringZillaScans.'):
            raise ValueError(f'unexpected benchmark: {path}')
        key=(item['benchmark'].rsplit('.',1)[-1],item['params']['workload'])
        if key in values: raise ValueError(f'duplicate {key}: {path}')
        metric=item['primaryMetric']
        samples=[v for fork in metric['rawData'] for v in fork]
        if item['measurementIterations']!=3 or len(samples)!=3 or metric['scoreUnit']!='ns/op':
            raise ValueError(f'wrong sample shape/unit {key}: {path}')
        if any(not math.isfinite(v) or v<=0 for v in samples):
            raise ValueError(f'invalid sample {key}: {path}')
        values[key]=statistics.median(samples)
    if set(values)!=keys:
        raise ValueError(f'key mismatch {path}: missing={keys-set(values)} extra={set(values)-keys}')
    return values
