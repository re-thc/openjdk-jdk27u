import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest

MODULE = Path(__file__).resolve().with_name('compare.py')
sys.path.insert(0, str(MODULE.parent))
spec = importlib.util.spec_from_file_location('corrected_compare', MODULE)
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)

class RuntimeReaderTests(unittest.TestCase):
    def read(self, events='', extra_methods='', compiled=''):
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp)
            p.joinpath('console.log').write_text('\n'.join(f'MEASURE_BEGIN {w} 20000\nMEASURE_END {w} 30000' for w in reader.WORKLOADS))
            p.joinpath('hotspot.xml').write_text('<hotspot_log><tty><nmethod compile_id="1" compiler="c2" stamp="10.000" method="org.simdjson.StructuralIndexer index128 (x)"/>'+extra_methods+events+'</tty><compilation_log><task>'+compiled+'</task></compilation_log></hotspot_log>')
            return reader.stability(p)
    def assertEligible(self, result, expected):
        self.assertTrue(all(w['eligible'] == expected for w in result['windows'].values()))
    def test_stable(self):
        self.assertEligible(self.read(), True)
    def test_nested_runtime_trap(self):
        r=self.read('<uncommon_trap compile_id="1" stamp="25.000"/>')
        self.assertEqual(len(r['runtime_events']),1)
        self.assertEligible(r,False)
    def test_prior_invalidation(self):
        self.assertEligible(self.read('<make_not_entrant compile_id="1" stamp="15.000"/>'),False)
    def test_compiled_trap_not_runtime(self):
        r=self.read(compiled='<uncommon_trap compile_id="1" stamp="25.000"/>')
        self.assertEqual(r['runtime_events'],[])
        self.assertEligible(r,True)
    def test_unrelated_runtime_event(self):
        self.assertEligible(self.read('<uncommon_trap compile_id="99" stamp="25.000"/>'),True)
    def test_warmup_replacement(self):
        r=self.read('<make_not_entrant compile_id="1" stamp="12.000"/>', '<nmethod compile_id="2" compiler="c2" stamp="15.000" method="org.simdjson.StructuralIndexer index128 (x)"/>')
        self.assertEqual(len(r['runtime_events']),1)
        self.assertEligible(r,True)
    def test_install_during_measurement(self):
        self.assertEligible(self.read(extra_methods='<nmethod compile_id="2" compiler="c2" stamp="25.000" method="org.simdjson.StructuralIndexer index128 (x)"/>'),False)
    def test_boundary_guard(self):
        self.assertEligible(self.read('<uncommon_trap compile_id="1" stamp="19.999"/>'),False)
    @unittest.skipUnless(Path('/tmp/pr43-result-39602216233/comparison-evidence').exists(), 'optional historical audit fixture')
    def test_retained_24_launches(self):
        dirs=sorted(Path('/tmp/pr43-result-39602216233/comparison-evidence').glob('pair-*'))
        self.assertEqual(len(dirs),24)
        results=[reader.stability(d) for d in dirs]
        self.assertEqual(sum(len(r['runtime_events']) for r in results),96)
        for result in results: self.assertEligible(result,True)

class FullRuntimeReaderTests(RuntimeReaderTests):
    def read(self, *args, **kwargs):
        import full_compare
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp)
            p.joinpath('console.log').write_text('\n'.join(f'MEASURE_BEGIN {w} 20000\nMEASURE_END {w} 30000' for w in reader.WORKLOADS))
            events = args[0] if args else kwargs.get('events','')
            extra = args[1] if len(args)>1 else kwargs.get('extra_methods','')
            compiled = kwargs.get('compiled','')
            p.joinpath('hotspot.xml').write_text('<hotspot_log><tty><nmethod compile_id="1" compiler="c2" stamp="10.000" method="org.simdjson.StructuralIndexer index128 (x)"/>'+extra+events+'</tty><compilation_log><task>'+compiled+'</task></compilation_log></hotspot_log>')
            return full_compare.stability(p)
    def test_other_parser_method_event(self):
        self.assertEligible(self.read('<uncommon_trap compile_id="2" stamp="25.000"/>', '<nmethod compile_id="2" compiler="c2" stamp="11.000" method="org.simdjson.StringParser doParseString (x)"/>'),False)
    def test_group_methods_separately(self):
        self.assertEligible(self.read('<make_not_entrant compile_id="2" stamp="15.000"/>', '<nmethod compile_id="2" compiler="c2" stamp="11.000" method="org.simdjson.StringParser doParseString (x)"/><nmethod compile_id="3" compiler="c2" stamp="16.000" method="org.simdjson.Utf8Validator validate (x)"/>'),False)
    @unittest.skip('historical fixture belongs to the original index-only scope')
    def test_retained_24_launches(self): pass

if __name__ == '__main__': unittest.main(verbosity=2)
