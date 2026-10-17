"""Exercise offline suites under a symlinked TMPDIR, as on macOS /var."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--out',type=Path,required=True);args=parser.parse_args()
    args.out.mkdir(parents=True,exist_ok=False);cases=[]
    with tempfile.TemporaryDirectory(prefix='fixture-tmpdir-') as tmp:
        root=Path(tmp);actual=root/'actual';actual.mkdir();alias=root/'alias';alias.symlink_to(actual,target_is_directory=True)
        env=dict(os.environ,TMPDIR=str(alias),PYTHONDONTWRITEBYTECODE='1')
        for suite in ['test_tool_invocation.py','test_native_source.py']:
            out=args.out/suite.removesuffix('.py')
            result=subprocess.run([sys.executable,str(Path(__file__).with_name(suite)),'--out',str(out)],
                                  env=env,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=120)
            (args.out/(suite+'.log')).write_text(result.stdout)
            if result.returncode:raise RuntimeError('Symlink TMPDIR fixture failed: '+suite+'\n'+result.stdout)
            value=json.loads((out/'results.json').read_text());assert value['passed']
            cases.append(dict(suite=suite,cases=value['count'],passed=True))
    value=dict(passed=True,count=len(cases),cases=cases,JVMs=0,compiler_builds=0,network_calls=0)
    (args.out/'results.json').write_text(json.dumps(value,indent=2)+'\n');print(json.dumps(value))


if __name__=='__main__':main()
