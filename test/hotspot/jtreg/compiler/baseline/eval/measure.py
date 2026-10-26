#!/usr/bin/env python3
"""Small serial, interleaved comparison; no benchmark controller or tuning.
Usage: measure.py STOCK_JDK PROTOTYPE_JDK OUTPUT_DIR [with-delay]
Compile the two adjacent Java sources into OUTPUT_DIR first.
"""
import csv
import os
from pathlib import Path
import statistics
import subprocess
import sys
import time

stock, prototype, destination = map(Path, sys.argv[1:4])
destination.mkdir(parents=True, exist_ok=True)
common = ['-Xshare:off', '-XX:+UnlockExperimentalVMOptions', '-XX:+UnlockDiagnosticVMOptions',
          '-XX:+UseG1GC', '-Xms128m', '-Xmx128m', '-XX:ActiveProcessorCount=4', '-XX:CICompilerCount=3']
configs = {
    'stock': (stock, []),
    'off': (prototype, ['-XX:-UseDirectBaseline']),
    'early': (prototype, ['-XX:+UseDirectBaseline']),
    # Deliberately delay normal-entry predicates only. OSR and notification masks stay unchanged.
    'delay': (prototype, ['-XX:+UseDirectBaseline', '-XX:Tier3InvocationThreshold=600',
                         '-XX:Tier3MinInvocationThreshold=300', '-XX:Tier3CompileThreshold=6000']),
}
if len(sys.argv) < 5 or sys.argv[4] != 'with-delay':
    del configs['delay']
for name, (jdk, extra) in configs.items():
    with (destination / (name+'-effective-flags.txt')).open('w') as log:
        subprocess.run([str(jdk/'bin/java'), *common, *extra, '-XX:+PrintFlagsFinal', '-version'],
                       stdout=log, stderr=subprocess.STDOUT, check=True)
with (destination/'samples.tsv').open('w', buffering=1) as output:
    writer = csv.writer(output, delimiter='\t')
    writer.writerow(['phase','workload','config','repeat','wall_ns','user_s','sys_s','maxrss_kb','warm_median_ns','exit'])
    for phase, repetitions in [('startup',10), ('warm',6)]:
        for repetition in range(repetitions):
            modes=list(configs)
            modes=modes[repetition % len(modes):]+modes[:repetition % len(modes)]
            if repetition % 2: modes.reverse()
            for workload in ['BaselineWorkload','CompilerWorkload']:
                for mode in modes:
                    jdk, extra=configs[mode]
                    command=[str(jdk/'bin/java'),*common,*extra,'-cp',str(destination),workload,phase]
                    stem=f'{phase}-{workload}-{mode}-{repetition}'
                    (destination/(stem+'.command')).write_text('\n'.join(command)+'\n')
                    with (destination/(stem+'.log')).open('w') as log:
                        begin=time.perf_counter_ns()
                        child=subprocess.Popen(command,stdout=log,stderr=subprocess.STDOUT)
                        _,status,usage=os.wait4(child.pid,0)
                        child.returncode=os.waitstatus_to_exitcode(status)
                        elapsed=time.perf_counter_ns()-begin
                    text=(destination/(stem+'.log')).read_text()
                    warmed=[int(line.split('=',1)[1]) for line in text.splitlines() if line.startswith('warm_ns=')]
                    writer.writerow([phase,workload,mode,repetition,elapsed,usage.ru_utime,usage.ru_stime,
                                     usage.ru_maxrss,statistics.median(warmed) if warmed else '',child.returncode])
                    print(phase,workload,mode,repetition,elapsed,child.returncode,flush=True)
                    if child.returncode != 0: raise RuntimeError(stem+' failed; preserve and inspect the log')
