# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
import json
from pathlib import Path
import struct
import tempfile
import unittest
import apple_compare as reader

class AppleControllerTests(unittest.TestCase):
    def test_native_host(self):
        for translated in ['', '0']:
            reader.validate_host('Darwin','arm64','1',translated,'arm64\n')
    def test_incompatible_host(self):
        for args in [('Linux','arm64','1','0','arm64'),('Darwin','x86_64','1','1','x86_64'),
                     ('Darwin','arm64','1','1','arm64'),('Darwin','arm64','0','0','arm64'),
                     ('Darwin','arm64','1','unknown','arm64')]:
            with self.subTest(args=args), self.assertRaises(RuntimeError):reader.validate_host(*args)
    def test_native_executable(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'java';p.write_bytes(struct.pack('<II',0xfeedfacf,0x0100000c));reader.macho_arm64(p)
            for header in [b'\x7fELF',struct.pack('<II',0xfeedfacf,0x01000007),struct.pack('<II',0xcafebabe,2)]:
                p.write_bytes(header)
                with self.assertRaises(RuntimeError):reader.macho_arm64(p)
    def valid_results(self):
        return '\n'.join(f'CORPUS {w} '+('a'*64)+f'\nRESULT {w} 10 100 1000 -123' for w in reader.WORKLOADS)
    def test_results(self):
        r=reader.parse_results(self.valid_results());self.assertEqual(r['results']['long']['bytes_per_second'],1e9)
    def test_results_reject_duplicates_missing_and_zero(self):
        for text in [self.valid_results()+'\nRESULT long 1 1 1 1',self.valid_results().replace('RESULT long','BROKEN long'),self.valid_results().replace('10 100 1000','0 100 1000')]:
            with self.assertRaises(RuntimeError):reader.parse_results(text)
    def test_runtime_nesting_and_harness_events(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d);p.joinpath('console.log').write_text('\n'.join(f'MEASURE_BEGIN {w} 20000\nMEASURE_END {w} 30000' for w in reader.WORKLOADS))
            p.joinpath('hotspot.xml').write_text('''<hotspot_log><tty>
<nmethod compile_id="1" compiler="c2" stamp="10.000" method="org.simdjson.StructuralIndexer index128 (x)"/>
<nmethod compile_id="2" compiler="c2" stamp="25.000" method="org.simdjson.PR43ParserTiming measure (x)"/>
<uncommon_trap compile_id="2" stamp="26.000"/>
</tty><compilation_log><task><uncommon_trap compile_id="1" stamp="25.000"/></task></compilation_log></hotspot_log>''')
            stability=reader.stability(p);self.assertTrue(all(v['eligible'] for v in stability['windows'].values()))
            audit=reader.all_runtime(p,stability['windows']);self.assertEqual(len(audit['runtime_events']),1)
            self.assertTrue(all(len(v)==2 for v in audit['guarded_window_overlaps'].values()))
    def test_failed_and_mismatched_pair_retained(self):
        results=reader.parse_results(self.valid_results());rows=[]
        for label in 'AB':
            rows.append({'pair':0,'label':label,'process_ok':label=='A',**results,
                         'stability':{'windows':{w:{'eligible':True,'reasons':[]} for w in reader.WORKLOADS}}})
        summary=reader.summarize(rows)
        self.assertEqual(summary['long']['all_observed']['n'],1)
        self.assertEqual(summary['long']['stable_pairs']['n'],0)
        self.assertEqual(len(summary['long']['pairs']),12)
    @unittest.skipUnless(Path('/tmp/pr43-result-39602216233/comparison-evidence').exists(),'optional retained Linux audit fixture')
    def test_retained_result_parity(self):
        p=Path('/tmp/pr43-result-39602216233/comparison-evidence');rows=json.loads((p/'observations.json').read_text())
        for row in rows:
            parsed=reader.parse_results((p/f"pair-{row['pair']:02d}-{row['label']}"/'console.log').read_text())
            self.assertEqual(parsed['results'],row['results']);self.assertEqual(parsed['corpus'],row['corpus'])
        self.assertEqual(reader.summarize(rows),json.loads((p/'summary.json').read_text()))
if __name__=='__main__':unittest.main(verbosity=2)
