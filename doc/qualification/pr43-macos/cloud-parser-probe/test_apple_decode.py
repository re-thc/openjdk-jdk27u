# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
import json
from pathlib import Path
import struct
import unittest

from apple_decode import macho_object, fused_sequences, verify_otool_control

# These words are retained in Linux run 39602216233, normal compilation 439,
# offsets 0x24c..0x270. Independent GNU output names every operand.
CONTROL = (0xd2804021, 0xf2a10081, 0xf2c40201, 0xf2f00801, 0x4e080c34,
           0x4e341e34, 0x4e34be94, 0x4e34be94, 0x4e34be94, 0x0e023e81)

def data(words=CONTROL):
    return struct.pack('<'+'I'*len(words), *words)

class AppleDecodeTests(unittest.TestCase):
    def test_macho_layout_and_byte_identity(self):
        raw=data(); obj=macho_object(raw)
        header=struct.unpack('<8I',obj[:32]); self.assertEqual(header,(0xfeedfacf,0x0100000c,0,1,1,152,0,0))
        segment=struct.unpack('<II16sQQQQiiII',obj[32:104])
        section=struct.unpack('<16s16sQQ8I',obj[104:184])
        self.assertEqual(segment[0:2],(0x19,152)); self.assertEqual(segment[3:7],(0,len(raw),184,len(raw)))
        self.assertEqual(section[2:6],(0,len(raw),184,2)); self.assertEqual(section[8],0x80000400)
        self.assertEqual(obj[184:],raw)
    def test_reject_unaligned(self):
        for raw in (b'',b'123'):
            with self.assertRaises(ValueError):macho_object(raw)
        with self.assertRaises(ValueError):fused_sequences(b'123')
    def test_known_operands(self):
        found=fused_sequences(data());self.assertEqual(len(found),1)
        self.assertEqual((found[0]['scalar_result'],found[0]['raw_mask'],found[0]['vector_temp']),('x1','v17','v20'))
        self.assertTrue(found[0]['all_operands_valid'])
    def test_wrong_register_links_are_reported(self):
        for index,bit in ((1,0),(4,5),(5,0),(5,16),(6,5),(8,16),(9,0),(9,5)):
            with self.subTest(index=index,bit=bit):
                words=list(CONTROL);words[index]^=1<<bit
                found=fused_sequences(data(words));self.assertEqual(len(found),1);self.assertFalse(found[0]['all_operands_valid'])
    def test_source_temp_alias_rejected(self):
        words=list(CONTROL);words[5]=(words[5]&~(31<<5))|(20<<5)
        found=fused_sequences(data(words));self.assertEqual(len(found),1)
        self.assertFalse(found[0]['all_operands_valid']);self.assertFalse(found[0]['raw_mask_distinct_from_temp'])
    def test_wrong_opcode_arrangement_lane_or_weight_does_not_match(self):
        for index,bit in ((0,5),(2,31),(4,30),(5,30),(6,22),(7,23),(9,18)):
            with self.subTest(index=index,bit=bit):
                words=list(CONTROL);words[index]^=1<<bit
                self.assertEqual(fused_sequences(data(words)),[])
    def test_otool_aliases_and_formats(self):
        for listing in ('0000000000000000\tmov\tx0, #0x1\n0000000000000004\tret\n',
                        '0 d2800020 movz x0, #1\n4 d65f03c0 ret x30\n',
                        '0 20 00 80 d2 mov x0, #1\n4 c0 03 5f d6 ret\n'):
            self.assertTrue(verify_otool_control(listing))
        for listing in ('0 mov x0,#2\n4 ret','0 mov w0,#1\n4 ret','0 mov x0,#1\n8 ret'):
            self.assertFalse(verify_otool_control(listing))
    @unittest.skipUnless(Path('/tmp/pr43-result-39602216233/comparison-evidence').exists(),'optional retained native evidence')
    def test_retained_linux_binaries(self):
        root=Path('/tmp/pr43-result-39602216233/comparison-evidence')
        for label,count in (('A',0),('B',40)):
            report=json.loads((root/f'diagnostic-{label}'/'review.json').read_text())
            for method in report['nmethods']:
                binary=root/f'diagnostic-{label}'/(method['compile_id']+'.bin')
                found=fused_sequences(binary.read_bytes())
                self.assertEqual(len(found),count)
                self.assertEqual(found,method['fused_sequences'])

if __name__=='__main__':unittest.main(verbosity=2)
