"""Reuse hash-pinned CI images. Never forward the GitHub token to a redirect host."""
import base64, hashlib, json, os, shutil, subprocess, tarfile, urllib.error, urllib.parse, urllib.request, zipfile
from pathlib import Path

here = Path(__file__).resolve().parent
root = Path(os.environ['ARM_ROOT'])
evidence = root / 'evidence'
protocol = json.loads((here / 'protocol.json').read_text())

def sha(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''): h.update(chunk)
    return h.hexdigest()

def unzip(archive, dest):
    dest.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive) as z:
        for n in z.namelist():
            assert not Path(n).is_absolute() and '..' not in Path(n).parts, n
        z.extractall(dest)

class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl): return None

manifest = {}
for name, spec in protocol['artifacts'].items():
    archive = root / f'{name}.zip'
    req = urllib.request.Request(f"https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/{spec['id']}/zip", headers={
        'Authorization': 'Bearer ' + os.environ['GH_TOKEN'], 'Accept': 'application/vnd.github+json', 'User-Agent': 'PR18-native-validation'})
    try:
        response = urllib.request.build_opener(NoRedirect).open(req, timeout=60)
    except urllib.error.HTTPError as e:
        if e.code not in [301, 302, 303, 307, 308]: raise
        location = e.headers['Location']
        assert urllib.parse.urlsplit(location).scheme == 'https'
        # A new request has no Authorization header; do not print the signed URL.
        response = urllib.request.urlopen(location, timeout=120)
    with response, archive.open('wb') as f: shutil.copyfileobj(response, f)
    digest = sha(archive)
    assert digest == spec['sha256'], (name, digest)
    dest = root / f'{name}-bundle'
    unzip(archive, dest)
    if name in ['base', 'candidate']:
        matches = list(dest.rglob('jdk-linux-aarch64.tar.gz'))
        assert len(matches) == 1, [str(x) for x in dest.rglob('*')]
        image = root / 'images' / name
        image.mkdir(parents=True)
        with tarfile.open(matches[0]) as t: t.extractall(image, filter='data')
        javabins = list(image.glob('*/bin/java'))
        assert len(javabins) == 1, javabins
        jdk = javabins[0].parent.parent
        assert int.from_bytes((jdk / 'bin/java').read_bytes()[18:20], 'little') == 183
        manifest[name] = {'jdk': str(jdk), 'outer_archive_sha256': digest, 'runtime_tar_sha256': sha(matches[0]), **spec}
    else:
        for p in list(dest.rglob('*')):
            if p.name.endswith(('.tar.gz', '.tgz')):
                with tarfile.open(p) as t: t.extractall(dest / 'extracted', filter='data')
            elif p.suffix == '.zip': unzip(p, dest / 'extracted')
        jars = list(dest.rglob('lib/jtreg.jar'))
        assert len(jars) == 1, jars
        manifest[name] = {'jar': str(jars[0]), **spec}
    # Retain hashes and metadata, not redundant multi-hundred-MB downloads.
    archive.unlink()
    if name != 'jtreg': shutil.rmtree(dest)

(root / 'jmh').mkdir()
(root / 'classes').mkdir()
(root / 'wb').mkdir()
archive = root / 'benchmark.zip'
archive.write_bytes(base64.b64decode((here / 'benchmark.zip.b64').read_text()))
assert sha(archive) == protocol['benchmark_zip_sha256']
unzip(archive, root / 'benchmark')
dependencies = {
    'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar': 'dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3',
    'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar': 'df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28',
    'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar': '1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308',
}
for relative, expected in dependencies.items():
    target = root / 'jmh' / relative.split('/')[-1]
    urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + relative, target)
    assert sha(target) == expected
classpath = ':'.join(map(str, sorted((root / 'jmh').glob('*.jar'))))
javac = manifest['candidate']['jdk'] + '/bin/javac'
repo = Path(os.environ['GITHUB_WORKSPACE'])
subprocess.run([javac, '-sourcepath', str(repo / 'test/lib'), '-d', str(root / 'wb'), str(repo / 'test/lib/jdk/test/whitebox/WhiteBox.java')], check=True)
subprocess.run([javac, '-cp', classpath + ':' + str(root / 'wb') + ':' + str(root / 'benchmark'), '-d', str(root / 'classes'),
                *[str(here / x) for x in ['ArmObservation.java', 'MultiplyLoops.java', 'DumpMultiplyCode.java', 'BenchmarkCheck.java']]], check=True)
manifest['classpath'] = ':'.join([str(root / 'classes'), str(root / 'benchmark'), classpath])
manifest['inputs'] = {str(p.relative_to(here)): sha(p) for p in sorted(here.rglob('*')) if p.is_file() and '__pycache__' not in p.parts}
manifest['dependencies'] = {p.name: sha(p) for p in (root / 'jmh').glob('*.jar')}
blob = subprocess.check_output(['git', 'hash-object', 'src/hotspot/share/opto/vectornode.cpp'], text=True).strip()
assert blob == protocol['candidate_vectornode_blob'], blob
manifest['vectornode_blob'] = blob
(root / 'manifest.json').write_text(json.dumps(manifest, indent=2))
shutil.copy(root / 'manifest.json', evidence / 'manifest.json')
shutil.copy(here / 'protocol.json', evidence / 'protocol.json')
print('Verified native release images, frozen benchmark classes, source and dependencies.', flush=True)
