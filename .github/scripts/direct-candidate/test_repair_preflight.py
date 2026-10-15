"""Deterministic provenance fixtures; compile/link only, no native execution."""
from pathlib import Path
import hashlib,json,shlex,subprocess,tempfile,unittest
from unittest import mock
import direct_protocol as P
import repair_preflight as R
HERE=Path(__file__).resolve().parent

def digest(b):return hashlib.sha256(b).hexdigest()
class BindingTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.root=Path(self.tmp.name);self.b=self.root/'build/S';self.b.mkdir(parents=True);self.src=self.root/'deflate.c';self.src.write_text('int fixture(void){return 7;}\n');(self.b/'Makefile').write_text('fixture compiler arguments are logged\n')
        self.argv=['gcc-14','-O2','-fPIC','-DZLIB_COMPAT','-c','-o','deflate.o',str(self.src)]
        self.log=self.root/'make.log';self.log.write_text(shlex.join(self.argv)+'\n');self.command(self.argv,'initial-compile.log',self.b);self.command(['ar','rcs','libz.a','deflate.o'],'initial-ar.log',self.b)
        self.link=['gcc-14','-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',str(self.b/'libz.a'),'-Wl,--no-whole-archive','-o',str(self.b/'ng.so')];self.command(self.link,'initial-link.log',self.root)
    def tearDown(self):self.tmp.cleanup()
    def command(self,a,log,cwd):
        with (self.root/log).open('w') as f:subprocess.run(a,cwd=cwd,stdout=f,stderr=subprocess.STDOUT,check=True)
    def bind(self):return R.bind(self.root,'S',self.src,self.log,self.link,self.command)
    def stale_archive(self):
        old=self.root/'old.c';old.write_text('int fixture(void){return 9;}\n');p=self.root/'old';p.mkdir();self.command(['gcc-14','-O2','-fPIC','-c',str(old),'-o',str(p/'deflate.o')],'old-compile.log',self.root);self.command(['ar','rcs',str(self.b/'libz.a'),str(p/'deflate.o')],'stale-ar.log',self.root)
    def test_exact_recompile_archive_and_relink(self):
        x=self.bind();self.assertTrue(x['object_recompiled_equal'] and x['archive_member_equal'] and x['shared_relinked_equal'])
    def test_stale_archive_rejected_with_correct_current_source_and_object(self):
        original=self.src.read_bytes();self.stale_archive();self.assertEqual(self.src.read_bytes(),original)
        with self.assertRaisesRegex(P.InvalidData,'stale S deflate object/archive'):self.bind()
    def test_stale_shared_library_rejected_even_with_correct_archive(self):
        good=(self.b/'libz.a').read_bytes();self.stale_archive();self.command(self.link,'old-link.log',self.root);(self.b/'libz.a').write_bytes(good)
        with self.assertRaisesRegex(P.InvalidData,'stale S shared library'):self.bind()
    def test_wrong_source_command_rejected(self):
        self.log.write_text(shlex.join(self.argv[:-1]+[str(self.root/'wrong.c')])+'\n')
        with self.assertRaisesRegex(P.InvalidData,'exact deflate compile'):self.bind()
    def test_duplicate_compile_command_rejected(self):
        self.log.write_text(self.log.read_text()*2)
        with self.assertRaisesRegex(P.InvalidData,'exact deflate compile'):self.bind()
    def test_changed_optimization_rejected(self):
        self.log.write_text(self.log.read_text().replace('-O2','-O3'))
        with self.assertRaisesRegex(P.InvalidData,'optimization'):self.bind()
    def test_verifier_library_cannot_replace_public_link_target(self):
        a=self.link.copy();a[-1]=str(self.root/'verify.so')
        with self.assertRaisesRegex(P.InvalidData,'bound S link'):R.bind(self.root,'S',self.src,self.log,a,self.command)
    def test_sanitizer_recompile_and_relink_is_deterministic(self):
        b=self.root/'build/SA';b.mkdir();(b/'Makefile').write_text('sanitizer fixture\n');a=['gcc-14','-O2','-O1','-g','-fPIC','-fno-omit-frame-pointer','-fsanitize=address,undefined','-DZLIB_COMPAT','-c','-o','deflate.o',str(self.src)];log=self.root/'san-make.log';log.write_text(shlex.join(a)+'\n');self.command(a,'san-compile.log',b);self.command(['ar','rcs','libz.a','deflate.o'],'san-ar.log',b)
        link=['gcc-14','-fsanitize=address,undefined','-shared','-Wl,-Bsymbolic','-Wl,--whole-archive',str(b/'libz.a'),'-Wl,--no-whole-archive','-o',str(b/'ng.so')];self.command(link,'san-link.log',self.root);self.assertTrue(R.bind(self.root,'SA',self.src,log,link,self.command)['shared_relinked_equal'])

class SourceTests(unittest.TestCase):
    def test_actual_reviewed_delta_hash(self):self.assertEqual(P.sha(HERE/'remove-duplicate-reset-check.patch'),R.DELTA)
    def test_late_repair_rejected_before_touching_source(self):
        with tempfile.TemporaryDirectory() as d:
            out=Path(d);(out/'build/S').mkdir(parents=True);(out/'build/S/libz.a').write_bytes(b'stale')
            with self.assertRaisesRegex(P.InvalidData,'precede every archive'):R.apply(out)
    def test_correct_source_exact_hash_and_old_source_negative(self):
        # Synthetic source fixtures test the fail-closed mechanism, not zlib semantics.
        with tempfile.TemporaryDirectory() as d:
            out=Path(d);header=b'header';original=b'original';correct=b'corrected';expected={'deflate.c':digest(original),'deflate.h':digest(header)}
            for kind,body in [('baseline',original),('candidate',correct)]:
                p=R.source_path(out,kind);p.mkdir(parents=True);(p/'deflate.c').write_bytes(body);(p/'deflate.h').write_bytes(header)
            with mock.patch.object(R,'pinned_hashes',return_value=expected),mock.patch.object(R,'CORRECTED',digest(correct)),mock.patch.object(R,'HEADER',digest(header)):
                self.assertEqual(R.source_state(out,False)['candidate']['deflate.c'],digest(correct));(R.source_path(out,'candidate')/'deflate.c').write_bytes(original)
                with self.assertRaisesRegex(P.InvalidData,'candidate source inventory'):R.source_state(out,False)
    def test_hook_precedes_verifier_copy_and_build(self):
        text=(HERE.parent/'reset-only/reset-study.py').read_text();hook=text.index('candidate_transform(out)');self.assertLess(hook,text.index("shutil.copytree(out/'candidate',out/'verify'"));self.assertLess(hook,text.index("stock=out/'build/stock'"))
    def test_native_inventory_cannot_omit_preflight(self):
        import test_direct as T
        import direct_score as S
        with tempfile.TemporaryDirectory() as d:
            out=Path(d);T.disk_fixture(out);m=json.loads((out/'manifest.json').read_text());m['record_origin']='NATIVE_MEASUREMENT';P.dump(out/'manifest.json',m);p=json.loads((out/'preregistered.json').read_text());p['manifest']=P.sha(out/'manifest.json');P.dump(out/'preregistered.json',p)
            with mock.patch.object(S.subprocess,'check_output',return_value='PUBLIC_SYMBOLS\n'):
                with self.assertRaises(FileNotFoundError):S.inventory(out)

if __name__=='__main__':unittest.main(verbosity=2)
