# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
import unittest
from audit import baseline,applicability
class AuditTest(unittest.TestCase):
    def sample(self,method='and',node='andLConvL2I',found=0,phase='After Matching'):
        return f'''IRViolationException: One or more @IR rules failed:
1) Method "compiler.c2.aarch64.TestTruncatedLongBitwise::{method}" - [Failed IR rules: 1]:
  > Phase "{phase}":
    * Constraint 1: "\\b{node}\\b"
      - Failed comparison: [found] {found} = 1 [given]
      - No nodes matched!
>>> Check stdout for compilation output of the failed methods
'''
    def test_intended_missing_node(self):self.assertEqual([],baseline(self.sample(),{'and':'andLConvL2I'}))
    def test_unrelated_failed_method(self):self.assertTrue(baseline(self.sample('constantAnd'),{'and':'andLConvL2I'}))
    def test_wrong_count(self):self.assertTrue(baseline(self.sample(found=2),{'and':'andLConvL2I'}))
    def test_wrong_phase(self):self.assertTrue(baseline(self.sample(phase='Before Matching'),{'and':'andLConvL2I'}))
    def test_uncompiled(self):self.assertTrue(baseline(self.sample()+'Method was not compiled',{'and':'andLConvL2I'}))
    def test_framework_compilation_assertion_failure(self):
        self.assertTrue(baseline(self.sample()+'extract32 should have been C2 compiled',{'and':'andLConvL2I'}))
    def test_applicability(self):
        self.assertFalse(applicability('- and: 1, 2\n',{'and':2}))
        self.assertTrue(applicability('- and: 1\n',{'and':2}))

    def test_ubfx_requires_every_applicable_rule(self):
        import json
        from pathlib import Path
        manifest=json.loads((Path(__file__).parent/'manifest.json').read_text())
        expected=next(t['applicable_methods'] for t in manifest['tests'] if t['label']=='UBFX')
        self.assertEqual(28,sum(expected.values()))
        def output(omit=None):
            return '\n'.join('- '+name+': '+', '.join(str(i) for i in range(1,count+1)
                             if (name,i)!=omit) for name,count in expected.items())
        self.assertFalse(applicability(output(),expected))
        for name,count in expected.items():
            for rule in range(1,count+1):
                with self.subTest(method=name,rule=rule):
                    self.assertTrue(applicability(output((name,rule)),expected))

class PhaseInventoryTest(unittest.TestCase):
    def test_phase_and_compiler_binding(self):
        import tempfile
        from pathlib import Path
        from run import phase_inventory
        with tempfile.TemporaryDirectory() as d:
            Path(d,'hotspot_pid1.log').write_text("<task_queued compile_id='9' method='compiler.Example probe (J)I'/>\n<ideal compile_id='9' compile_phase='Before Matching'>\n<ideal compile_id='9' compile_phase='After Matching'>\n<nmethod compile_id='9' compiler='c2' method='compiler.Example probe (J)I'/>\n")
            found=phase_inventory(Path(d),'compiler.Example')
            self.assertEqual(['After Matching','Before Matching'],found['phases']['probe'])
            self.assertEqual(['probe'],found['C2_methods'])
            self.assertFalse(phase_inventory(Path(d),'compiler.Other')['phases'])

if __name__=='__main__':unittest.main()
