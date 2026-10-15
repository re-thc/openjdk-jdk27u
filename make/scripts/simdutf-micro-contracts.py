import json
import os
from pathlib import Path
import subprocess
import sys

head,output=[Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
classes,generated=output/"classes",output/"generated"
classes.mkdir()
generated.mkdir()
classpath="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
subprocess.run([str(head/"bin/javac"),"-cp",classpath,"-processorpath",classpath,
    "-d",str(classes),"-s",str(generated),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
path=output/"smoke.json"
java=str(head/"bin/java")
subprocess.run([java,"-cp",str(classes)+os.pathsep+classpath,"org.openjdk.jmh.Main",
    "org.openjdk.bench.java.lang.SimdUTF.malformedSequenceDecode$",
    "-p","size=128","-f","1","-wi","0","-i","1","-r","100ms",
    "-jvm",java,"-jvmArgs","-Xms256m -Xmx256m -XX:ActiveProcessorCount=2",
    "-rf","json","-rff",str(path)],check=True)
rows=json.loads(path.read_text())
assert len(rows)==10 and all(row["primaryMetric"].get("rawData") for row in rows)
print("MICRO_FIXTURE_SMOKE_PASSED",len(rows),flush=True)
