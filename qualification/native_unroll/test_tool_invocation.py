"""Local driver/wrapper regression fixtures; no JVM, compiler or network calls."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
from unittest import mock

from classifier_images import record,source_binding,pins
from tool_invocation import invocation_path,invocation_record,configure_paths
import build_classifier_image as builder


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--out',type=Path,required=True);args=parser.parse_args()
    source_binding(Path(__file__).resolve().parents[2],pins());cases=[]
    with tempfile.TemporaryDirectory(prefix='driver-invocation-') as tmp:
        root=Path(tmp);tools=root/'tools with spaces';tools.mkdir()
        # A real multi-call fixture observes the name and intact argv passed by Popen.
        driver=tools/'clang'
        driver.write_text('#!'+sys.executable+'\nimport json,sys\nfrom pathlib import Path\nprint(json.dumps(dict(driver=Path(sys.argv[0]).name,args=sys.argv[1:])))\n')
        driver.chmod(0o755)
        cpp=tools/'clang++';cpp.symlink_to('clang')
        selected=invocation_path(cpp)
        got=json.loads(subprocess.check_output([str(selected),'argument with spaces','literal;$()'],text=True))
        assert got==dict(driver='clang++',args=['argument with spaces','literal;$()'])
        cases.append('real multi-call fixture preserves C++ argv0 and unsplit literal arguments')
        assert json.loads(subprocess.check_output([str(cpp.resolve())],text=True))['driver']=='clang'
        cases.append('old resolve behavior independently reproduces lost C++ driver name')
        identity=invocation_record(cpp)
        assert identity['invocation']==str(cpp) and identity['resolved']==str(driver.resolve()) and identity['executable']==record(driver)
        assert identity['symlinks'][str(cpp)]=='clang'
        cases.append('canonical executable identity and symbolic invocation provenance remain separate')
        alternate=tools/'alternate';alternate.write_bytes(driver.read_bytes());alternate.chmod(0o755)
        cpp.unlink();cpp.symlink_to('alternate')
        assert record(cpp)==identity['executable'] and invocation_record(cpp)!=identity
        cases.append('same-byte target substitution changes invocation provenance')
        cpp.unlink();cpp.symlink_to('clang')
        driver.chmod(0o644)
        assert invocation_record(cpp)!=identity
        cases.append('executable permission changes are part of tool identity')
        driver.chmod(0o755)
        wrapper=tools/'g++-wrapper';wrapper.write_text('#!/bin/sh\nexec "'+str(cpp)+'" "$@"\n');wrapper.chmod(0o755)
        assert invocation_path(wrapper)==wrapper and invocation_record(wrapper)['resolved']==str(wrapper.resolve())
        assert json.loads(subprocess.check_output([str(wrapper),'a b'],text=True))['driver']=='clang++'
        cases.append('selected wrapper is recorded and executed without unwrapping it')
        alias=root/'tool-alias';alias.symlink_to(tools,target_is_directory=True)
        snapshot=invocation_record(alias/'clang++');assert snapshot['invocation']==str(alias/'clang++')
        assert snapshot['symlinks'][str(alias)]==str(tools)
        cases.append('directory symlink spelling and target are both preserved')
        try:configure_paths({'compiler':cpp})
        except RuntimeError:cases.append('Unix OpenJDK tool path with spaces is rejected before configure')
        else:raise AssertionError('Space-containing configure path accepted')
        # Exercise shared Linux discovery, including compiler-reported helper aliases.
        names=list(builder.TOOLS[:8])+['cc1','cc1plus']
        paths={name:root/name for name in names}
        for path in paths.values():path.symlink_to(driver)
        with mock.patch.object(builder.shutil,'which',side_effect=lambda name:str(paths[name])), \
             mock.patch.object(builder.subprocess,'check_output',side_effect=lambda argv,**kw:str(paths[argv[-1].split('=')[1]])+'\n'):
            discovered=builder.toolchain()
        assert discovered==paths
        cases.append('Linux compiler linker make and cc1 aliases survive discovery unchanged')
        # Source-level audit guard for the two retained analogous build entry points.
        for name in ['build_backend_images.py','build_roundtrip_images.py']:
            text=Path(__file__).with_name(name).read_text()
            assert 'tool_paths[name] = invocation_path(path)' in text and 'tool_paths[label] = invocation_path(path)' in text
            assert 'invocation_records(tool_paths)!=invocations' in text
            cases.append(name+' retains invocation path and rechecks provenance')
    args.out.mkdir(parents=True,exist_ok=False)
    value=dict(passed=True,count=len(cases),cases=cases,JVMs=0,compiler_builds=0,network_calls=0)
    (args.out/'results.json').write_text(json.dumps(value,indent=2)+'\n');print(json.dumps(value))


if __name__=='__main__':main()
