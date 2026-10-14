import pathlib,subprocess,json,csv,xml.etree.ElementTree as ET
p=pathlib.Path('controller-diagnostic').resolve();p.mkdir()
frozen=pathlib.Path('saved/prior/frozen/qualification').resolve()
old_controller=pathlib.Path('saved/controller-classes').resolve()
argv=[str(pathlib.Path('b3-release/bin/java').resolve()),'-Xms256m','-Xmx512m','-XX:ActiveProcessorCount=2',
 '--add-modules=jdk.incubator.vector','-DvectorBits=128','-DmeasureCalls=100000','-Xbatch','-XX:-TieredCompilation',
 '-XX:+UnlockDiagnosticVMOptions','-XX:+LogCompilation','-XX:LogFile='+str(p/'compiler.xml'),
 '-XX:CompileCommand=dontinline,PhaseVectorProbe::invoke','-XX:CompileCommand=dontinline,PhaseVectorKernels::conversion',
 '-XX:-UseCompactObjectHeaders','-XX:UseSVE=0','-XX:LoopMaxUnroll=4','-cp',
 str(old_controller)+':'+str(frozen/'classes')+':'+str(frozen/'whitebox'),'ProbeControllerPrimer','conversion','c2']
with (p/'raw.out').open('w') as f:r=subprocess.run(argv,stdout=f,stderr=subprocess.STDOUT,timeout=180)
assert r.returncode==0
text=(p/'raw.out').read_text().split('MEASURED_PASS_BEGIN'+chr(10))[-1]
rows=list(csv.DictReader([x for x in text.splitlines() if x.startswith(('kernel,phase,','conversion,'))]))
tree=ET.parse(p/'compiler.xml')
results=[]
for row in rows:
 if not row['phase'].startswith('measure'):continue
 start=float(row['start_uptime_ms'])/1000
 end=start+int(row['nanoseconds'])/1e9
 events=[]
 for task in tree.findall('.//task'):
  a=float(task.get('stamp','0'));d=task.find('task_done');b=float(d.get('stamp','0')) if d is not None else a
  if a<=end+.002 and b>=start-.002:events.append({'task':task.attrib,'end':b})
 results.append({'row':row,'approximate_window_seconds':[start,end],'compiler_events_with_2ms_boundary_tolerance':events})
data={'scope':'Unqualified controller reproduction only; not paired performance evidence','argv':argv,'results':results}
(p/'summary.json').write_text(json.dumps(data,indent=2))
print('NATIVE_CONTROLLER_DIAGNOSTIC_JSON='+json.dumps(data))
