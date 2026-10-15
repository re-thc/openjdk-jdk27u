# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This diagnostic is distributed under the GNU General Public License version 2.

"""Extract review files from an immutable completed run; never execute a JDK."""
import base64
import copy
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

REPOSITORY = 're-thc/openjdk-jdk27u'
SOURCE_RUN = 38759786636
ARTIFACT = 11986354529
ARTIFACT_SHA256 = '384e315221f44dd8b9da6d4c2d47b6188724dd74eb241bca25ce41007534275a'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def extract_review(source, destination, provenance):
    destination.mkdir(parents=True, exist_ok=True)
    manifest = {'source': provenance, 'copied_files': {}, 'derived_xml': {}, 'warnings': [],
                'purpose': 'File-only extraction. No JVM execution or new measurement. Complete raw data remains in the source artifact.'}
    with zipfile.ZipFile(source) as z:
        names = [n for n in z.namelist() if not n.endswith('/')]
        for n in names:
            p = PurePosixPath(n)
            assert not p.is_absolute() and '..' not in p.parts, n
        summaries = [n for n in names if PurePosixPath(n).name == 'summary.json']
        assert summaries, 'Missing completed-run summary'
        summary_name = min(summaries, key=lambda n: len(PurePosixPath(n).parts))
        prefix = str(PurePosixPath(summary_name).parent)
        prefix = '' if prefix == '.' else prefix + '/'
        mapping = {n[len(prefix):]: n for n in names if n.startswith(prefix)}
        summary = json.loads(z.read(summary_name))
        selected = set()
        timed = sorted({n.split('/')[0] for n in mapping if n.startswith(('aa-', 'ab-'))})

        def retain(name):
            if name not in mapping:
                manifest['warnings'].append('Missing referenced review file: ' + name)
            else:
                selected.add(name)

        def code_references(value):
            if isinstance(value, dict):
                if isinstance(value.get('file'), str) and value['file'].endswith('.bin'):
                    yield value
                for child in value.values():
                    yield from code_references(child)
            elif isinstance(value, list):
                for child in value:
                    yield from code_references(child)

        for name in mapping:
            path = PurePosixPath(name)
            top = path.parts[0]
            if len(path.parts) == 1 and path.suffix in ['.json', '.txt', '.log']:
                retain(name)
            elif top.startswith('codegen-') and path.suffix in ['.bin', '.asm', '.json', '.log', '.txt']:
                retain(name)
            elif not top.startswith(('aa-', 'ab-')) and (path.suffix == '.jtr' or path.name in ['stdout.log', 'command.json', 'exit-code.txt']):
                retain(name)

        for folder in timed:
            ids = set()
            for name in mapping:
                if not name.startswith(folder + '/'):
                    continue
                path = PurePosixPath(name)
                if path.suffix == '.json' or path.name == 'exit-code.txt':
                    retain(name)
                if path.name.startswith('iteration-') and path.suffix == '.json':
                    record = json.loads(z.read(mapping[name]))
                    if record.get('type') == 'MEASUREMENT':
                        for item in code_references(record):
                            file_name = item['file']
                            assert PurePosixPath(file_name).name == file_name
                            binary = folder + '/' + file_name
                            retain(binary)
                            retain(str(PurePosixPath(binary).with_suffix('.asm')))
                            if binary in mapping:
                                assert sha(z.read(mapping[binary])) == item['sha256'], binary
                            ids.add(str(item['compile_id']))
            xml_name = folder + '/compilation.xml'
            if xml_name not in mapping:
                manifest['warnings'].append('Missing compilation lifecycle: ' + xml_name)
                continue
            data = z.read(mapping[xml_name])
            try:
                tree = ET.fromstring(data)
                selected_xml = ET.Element('selected_compilation_records', {'source_sha256': sha(data)})
                for node in tree.iter():
                    if node.tag in ['nmethod', 'task', 'make_not_entrant', 'deoptimized'] and node.get('compile_id') in ids:
                        selected_xml.append(copy.deepcopy(node))
                relative = folder + '/selected-compilation.xml'
                target = destination / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                payload = ET.tostring(selected_xml, encoding='utf-8', xml_declaration=True)
                target.write_bytes(payload)
                manifest['derived_xml'][relative] = {'source': xml_name, 'source_sha256': sha(data),
                    'selected_compile_ids': sorted(ids), 'selected_records': len(selected_xml), 'sha256': sha(payload)}
            except ET.ParseError as error:
                manifest['warnings'].append('Compilation XML parse error in ' + xml_name + ': ' + str(error))

        for name in sorted(selected):
            data = z.read(mapping[name])
            target = destination / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            manifest['copied_files'][name] = {'sha256': sha(data), 'bytes': len(data)}

    manifest['timed_folders'] = timed
    manifest['calibration_folders'] = [n for n in timed if n.startswith('aa-')]
    manifest['comparison_folders'] = [n for n in timed if n.startswith('ab-')]
    (destination / 'review-manifest.json').write_text(json.dumps(manifest, indent=2))
    # Every value below is copied from the original summary, without changing gates.
    overview = {k: summary.get(k) for k in ['completed_fixed_protocol', 'performance_qualified', 'base_image_unchanged',
                                          'candidate_image_unchanged', 'supported_test_scenarios', 'unsupported_test_scenarios', 'error']}
    calibration = summary.get('calibration')
    overview['calibration'] = {k: calibration.get(k) for k in ['passed', 'ratio_percent', 'ci95_percent']} if calibration else None
    overview['comparisons'] = [{k: c.get(k) for k in ['case', 'base_ns_per_op', 'candidate_ns_per_op', 'ratio_percent',
        'ci95_percent', 'integrity_passed', 'qualified', 'measured_improvement', 'significant_regression_above_5_percent']}
        for c in summary.get('comparisons', [])]
    overview['correctness'] = summary.get('correctness')
    overview['timed_folder_count'] = len(timed)
    overview['review_warnings'] = manifest['warnings']
    (destination / 'overview.json').write_text(json.dumps(overview, indent=2))
    return overview


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def main():
    root = Path(os.environ['RUNNER_TEMP']) / 'pr18-arm-review'
    root.mkdir(parents=True, exist_ok=True)
    with open(os.environ['GITHUB_ENV'], 'a') as f:
        f.write('REVIEW_ROOT=' + str(root) + '\n')
    source = root / 'native-artifact.zip'
    request = urllib.request.Request(f'https://api.github.com/repos/{REPOSITORY}/actions/artifacts/{ARTIFACT}/zip', headers={
        'Authorization': 'Bearer ' + os.environ['GH_TOKEN'], 'Accept': 'application/vnd.github+json', 'User-Agent': 'PR18-evidence-review'})
    try:
        response = urllib.request.build_opener(NoRedirect).open(request, timeout=60)
    except urllib.error.HTTPError as error:
        if error.code not in [301, 302, 303, 307, 308]:
            raise
        location = error.headers['Location']
        assert location.startswith('https://')
        # Follow with a new request, without forwarding the GitHub authorization header.
        response = urllib.request.urlopen(location, timeout=120)
    with response, source.open('wb') as f:
        shutil.copyfileobj(response, f)
    assert sha(source.read_bytes()) == ARTIFACT_SHA256
    provenance = {'repository': REPOSITORY, 'run': SOURCE_RUN, 'artifact': ARTIFACT, 'sha256': ARTIFACT_SHA256,
                  'bytes': source.stat().st_size, 'measurement_or_jvm_execution_in_this_job': False}
    overview = extract_review(source, root / 'review', provenance)
    print('SOURCE_ARTIFACT_VERIFIED=' + json.dumps(provenance), flush=True)
    print('NATIVE_REVIEW_OVERVIEW=' + json.dumps(overview), flush=True)
    archive = root / 'native-review.zip'
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for p in sorted((root / 'review').rglob('*')):
            if p.is_file():
                z.write(p, str(p.relative_to(root / 'review')))
    print('PR18_REVIEW_ZIP_BYTES=' + str(archive.stat().st_size))
    print('PR18_REVIEW_ZIP_SHA256=' + sha(archive.read_bytes()))
    print('PR18_REVIEW_BASE64_BEGIN')
    print(base64.encodebytes(archive.read_bytes()).decode().rstrip())
    print('PR18_REVIEW_BASE64_END')


if __name__ == '__main__':
    main()
