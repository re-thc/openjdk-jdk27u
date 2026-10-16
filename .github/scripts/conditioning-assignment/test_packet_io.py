import hashlib,unittest
import packet_io as P

class PacketTests(unittest.TestCase):
    def test_crlf_lf_and_embedded_markers_preserved(self):
        files=[('crlf.csv',b'a,b\r\n1,2\r\n'),('lf.csv',b'a,b\n1,2\n'),('text.txt',b'\nEND_FILE\nFILE_JSON test\n')]
        out=P.decode(P.encode(files));self.assertEqual(out,dict(files))
        self.assertNotEqual(hashlib.sha256(out['crlf.csv']).digest(),hashlib.sha256(out['lf.csv']).digest())

    def test_tampered_body_rejected(self):
        p=P.encode([('a.txt',b'unique body\n')]);p=p.replace(b'unique body',b'unique Body')
        with self.assertRaises(AssertionError):P.decode(p)

    def test_duplicate_or_unsafe_path_rejected(self):
        for files in [[('a',b'x'),('a',b'y')],[('../a',b'x')]]:
            with self.assertRaises(AssertionError):P.decode(P.encode(files))

if __name__=='__main__':unittest.main(verbosity=2)
