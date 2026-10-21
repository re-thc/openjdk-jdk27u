# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
import tempfile
from pathlib import Path
import unittest
import sve_check

class SVEReaderTests(unittest.TestCase):
    def fixture(self, out, *, rules=True, phase=True, fused=False, flag=1):
        work=out/'work';work.mkdir()
        text=f'testresult=Passed. Execution successful\nUseSVE = {flag}\n'
        if rules:
            for name in sve_check.METHODS:
                text+=f'- {name}: 3\nVerifying IR rules for {name}: 10 ns = 0 ms\n'
        (work/'TestByteMaskToLongSVE.jtr').write_text(text)
        xml='<hotspot_log><tty>'
        for i,name in enumerate(sve_check.METHODS):
            xml+=f'<nmethod compile_id="{i}" compiler="c2" method="compiler.c2.aarch64.TestByteMaskToLong {name} (x)"/>'
        xml+='</tty>'
        if phase:
            for i,name in enumerate(sve_check.METHODS):
                xml+=f'<ideal compile_id="{i}" compile_phase="After Matching">\n 123 vmask_tolong_sve test\n'
                if fused:xml+=' 124 vstoremask_tolongB16_neon test\n'
                xml+='</ideal>'
        (work/'hotspot_pid1.log').write_text(xml+'</hotspot_log>')
    def test_executed(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d);self.fixture(p)
            self.assertEqual(len(sve_check.audit(p)['matching_phases']),2)
    def test_missing_and_incompatible_evidence(self):
        for kwargs in [dict(rules=False),dict(phase=False),dict(fused=True),dict(flag=0)]:
            with self.subTest(kwargs=kwargs),tempfile.TemporaryDirectory() as d:
                p=Path(d);self.fixture(p,**kwargs)
                with self.assertRaises(RuntimeError):sve_check.audit(p)
    def test_skipped(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d);(p/'work').mkdir()
            with self.assertRaises(RuntimeError):sve_check.audit(p)
if __name__=='__main__':unittest.main(verbosity=2)
