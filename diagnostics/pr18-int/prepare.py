import base64, hashlib, os, urllib.request, zipfile
from pathlib import Path

here = Path(__file__).resolve().parent
root = Path(os.environ['DIAGNOSTIC_ROOT'])
archive = root / 'benchmark.zip'
archive.write_bytes(base64.b64decode((here / 'benchmark.zip.b64').read_text()))
assert hashlib.sha256(archive.read_bytes()).hexdigest() == '10637ed6ef6812957e2b17d55884b59f4e4c9cfd1fafe36690df182a0a7e12c7'
with zipfile.ZipFile(archive) as z:
    z.extractall(root / 'benchmark')
dependencies = {
    'org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar': '6a5604b5b804e0daca1145df1077609321687734a8b49387e49f10557c186c77',
    'org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar': 'dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3',
    'net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar': 'df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28',
    'org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar': '1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308',
}
for relative, digest in dependencies.items():
    target = root / 'jmh' / relative.split('/')[-1]
    urllib.request.urlretrieve('https://repo.maven.apache.org/maven2/' + relative, target)
    assert hashlib.sha256(target.read_bytes()).hexdigest() == digest, target
