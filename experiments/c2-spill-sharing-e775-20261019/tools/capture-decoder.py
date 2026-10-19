#!/usr/bin/env python3
"""Untimed, serialized C2 code/activation captures on unchanged fixed frames."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

root = Path('/workspace/work/spill-sharing')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--java-home', type=Path, required=True)
parser.add_argument('--label', required=True)
parser.add_argument('--trace', action='store_true')
parser.add_argument('--opto', action='store_true', help='Print allocated C2 blocks and profile frequencies (fastdebug only)')
parser.add_argument('--corpus', action='append')
parser.add_argument('--fixed-count', type=int)
parser.add_argument('--cds', choices=['on', 'off', 'auto'], default='off')
args = parser.parse_args()
record_path = root/f'code/{args.label}-capture.json'
records = json.loads(record_path.read_text()) if record_path.exists() else []
for kind in args.corpus or ['source', 'repetitive', 'dense', 'long-offset', 'random']:
    command = [str(args.java_home.resolve()/'bin/java'), '--add-modules', 'jdk.incubator.vector',
               '-XX:+UseSerialGC', '-Xms512m', '-Xmx512m', '-XX:ActiveProcessorCount=4',
               '-Xbatch', '-XX:CICompilerCount=2', '-Xshare:' + args.cds, '-Dprobe.warmup=3',
               '-XX:+UnlockDiagnosticVMOptions', '-XX:PrintAssemblyOptions=intel',
               '-XX:CompileCommand=print,dev.jzstd.internal.WindowBuffer::executeSequencesDirect',
               '-XX:CompileCommand=print,dev.jzstd.internal.BlockDecoder::decodeSequencesRolling']
    if args.trace:
        command += ['-XX:+VerifyRegisterAllocator',
                    '-XX:CompileCommand=TraceSpilling,dev.jzstd.internal.WindowBuffer::executeSequencesDirect',
                    '-XX:CompileCommand=TraceSpilling,dev.jzstd.internal.BlockDecoder::decodeSequencesRolling']
    if args.opto:
        command += ['-XX:CompileCommand=PrintOptoAssembly,dev.jzstd.internal.WindowBuffer::executeSequencesDirect',
                    '-XX:CompileCommand=PrintOptoAssembly,dev.jzstd.internal.BlockDecoder::decodeSequencesRolling']
    if args.fixed_count:
        command += ['-cp', str(root/'classes'), 'DecodeCapture', str(root/f'corpus/{kind}.bin'),
                    str(root/f'corpus/{kind}.zst'), str(args.fixed_count)]
    else:
        command += ['-cp', str(root/'classes'), 'CodecProbe', 'decode', str(root/f'corpus/{kind}.bin'),
                    '3', str(root/f'corpus/{kind}.zst')]
    log = root/f'code/{args.label}-{kind}.log'
    assert not log.exists(), 'Retain existing captures; use a new experiment label'
    with log.open('w') as output:
        result = subprocess.run(command, stdout=output, stderr=subprocess.STDOUT)
    lines = log.read_text().splitlines()
    summaries = [line for line in lines if line.startswith('SHARED_RELOAD_SUMMARY ')]
    records.append(dict(corpus=kind, command=command, exit_code=result.returncode,
                        log=str(log), activation=summaries,
                        libjvm_sha256=hashlib.sha256((args.java_home/'lib/server/libjvm.so').read_bytes()).hexdigest()))
    record_path.write_text(json.dumps(records, indent=2)+'\n')
    print(kind, 'exit', result.returncode, *summaries, sep='\n', flush=True)
    if result.returncode: raise SystemExit(result.returncode)
