import itertools,json,pathlib,os,subprocess,xml.etree.ElementTree as ET
image=pathlib.Path('trace-debug').resolve()
classes=pathlib.Path('frozen/qualification/classes').resolve()
wb=pathlib.Path('frozen/qualification/whitebox').resolve()
out=pathlib.Path('trace-results').resolve();out.mkdir()
cpu=min(os.sched_getaffinity(0))
for sve,unroll in itertools.product(['default','0'],['default','1','2','4']):
    label='legacy-sve'+sve+'-unroll'+unroll
    argv=['taskset','-c',str(cpu),str(image/'bin/java'),'-Xms256m','-Xmx512m','-XX:ActiveProcessorCount=2',
      '--add-modules=jdk.incubator.vector','-DvectorBits=128','-DobserveCompilation=true','-DmeasureCalls=1000',
      '-XX:+UnlockDiagnosticVMOptions','-XX:+WhiteBoxAPI','-Xbootclasspath/a:'+str(wb),'-Xbatch','-XX:-TieredCompilation',
      '-XX:+TraceLoopOpts','-XX:+PrintFlagsFinal','-XX:+LogCompilation','-XX:LogFile='+str(out/(label+'.xml')),
      '-XX:CompileCommand=dontinline,PhaseVectorKernels::conversion','-XX:CompileCommand=dontinline,PhaseVectorProbe::invoke',
      '-XX:CompileCommand=PrintIdeal,PhaseVectorKernels::conversion','-XX:-UseCompactObjectHeaders']
    if sve=='0':argv+=['-XX:UseSVE=0']
    if unroll!='default':argv+=['-XX:LoopMaxUnroll='+unroll]
    argv+=['-cp',str(classes)+os.pathsep+str(wb),'PhaseVectorProbe','conversion','c2']
    raw=out/(label+'.out')
    with raw.open('w') as f:r=subprocess.run(argv,stdout=f,stderr=subprocess.STDOUT,timeout=180)
    (out/(label+'.status.json')).write_text(json.dumps({'argv':argv,'exit':r.returncode}))
    if r.returncode:raise RuntimeError(label+' failed')
    t=ET.parse(out/(label+'.xml'))
    normals=[n.attrib for n in t.findall('.//nmethod') if n.get('method')=='PhaseVectorKernels conversion (I)J' and n.get('compile_kind')!='osr']
    ids={n['compile_id'] for n in normals}
    lines=[line for line in raw.read_text().splitlines() if line.startswith(('PR14_UNROLL','PR14_REDUCTION'))]
    print('NATIVE_ADMISSION_JSON='+json.dumps({'source':os.environ['TRACE_SOURCE'],'label':label,
          'ordinary_nmethods':normals,'policy_events':[line for line in lines if line.split('compile=')[1].split()[0] in ids]}),flush=True)
