import os,platform,subprocess
from pathlib import Path
output=Path("results").resolve();output.mkdir(exist_ok=True)
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
flags=["-march=armv8.2-a","-mtune=generic"] if platform.machine()=="aarch64" else ["-march=x86-64-v3","-mtune=generic"]
subprocess.run(["g++-16","-O3","-std=c++17",*flags,"-Isrc/utils/simdutf","make/scripts/simdutf-native-api.cpp","src/utils/simdutf/simdutf.cpp","-o",str(output/"native-api")],check=True)
subprocess.run([str(output/"native-api")],check=True)
