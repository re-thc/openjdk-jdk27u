"""Prepare, but never publish or dispatch, exact-source native build workflows."""
import hashlib
import json
import pathlib

import yaml

r = pathlib.Path('/workspace/pr9-layout-validation')
repo = pathlib.Path('/workspace/openjdk-jdk27u')
out = r / 'native-review'
out.mkdir(exist_ok=False)
workflows = out / '.github/workflows'
workflows.mkdir(parents=True)
checkout = 'actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1'
bootstrap = """        with:
          ref: c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b
          fetch-depth: 1
          persist-credentials: false

      - name: 'Checkout immutable candidate bundle'
        uses: CHECKOUT_ACTION
        with:
          ref: c158ea6ba18667c2e71127e9b1bb8b9b760f3fbd
          path: pr9-source-bootstrap
          sparse-checkout: .github/qualification/chain-checkpoint/layout-source-e41d
          persist-credentials: false

      - name: 'Restore and verify exact candidate source'
        shell: bash
        run: |
          set -euo pipefail
          bootstrap="$RUNNER_TEMP/pr9-source-bootstrap"
          test ! -e "$bootstrap"
          mv pr9-source-bootstrap "$bootstrap"
          bundle="$bootstrap/.github/qualification/chain-checkpoint/layout-source-e41d/layout-source.bundle"
          echo "79f0619e2fe9cf1b26b9526c615ce56c1d5b60082aa389c511098c9354ff1ed9  $bundle" | sha256sum --check
          git bundle verify "$bundle"
          git -c gc.auto=0 -c maintenance.auto=false fetch "$bundle" refs/heads/common-intrinsics:refs/remotes/qualification/candidate
          git checkout --detach e41d7823bf6de77c4bfba52e896bf325221488cb
          test "$(git rev-parse HEAD)" = e41d7823bf6de77c4bfba52e896bf325221488cb
          test -z "$(git status --porcelain)"
          git rev-parse HEAD
""".replace('CHECKOUT_ACTION', checkout)

identity = """      - name: 'Verify actual JVM source and retain core payload identity'
        shell: bash
        run: |
          set -euo pipefail
          test "$(git rev-parse HEAD)" = e41d7823bf6de77c4bfba52e896bf325221488cb
          image="build/${{ inputs.platform }}/images/jdk"
          grep -Fx 'SOURCE=".:git:e41d7823bf6d"' "$image/release"
          identity="$RUNNER_TEMP/pr9-identity"
          mkdir -p "$identity"
          git rev-parse HEAD > "$identity/checkout-source.txt"
          cp "$image/release" "$identity/release"
          printf '%s\\n' "$GITHUB_SHA" > "$identity/workflow-source.txt"
          printf '%s\\n' "$GITHUB_WORKFLOW_REF" > "$identity/workflow-ref.txt"
          printf '%s\\n' "$GITHUB_RUN_ID" > "$identity/workflow-run-id.txt"
          "$image/bin/java" -XX:ActiveProcessorCount=1 -version > "$identity/java-version.txt" 2>&1
          find "$image" -type f \\( -name libjvm.so -o -name jvm.dll -o -name modules -o -name 'classes*.jsa' -o -name release \\) -print0 | sort -z | xargs -0 sha256sum > "$identity/payload-sha256.txt"

      - name: 'Upload actual-source identity receipt'
        uses: actions/upload-artifact@043fb46d1a93c77aae656e7c1c64a875d1fc6a0a
        with:
          name: pr9-native-identity-${{ inputs.platform }}-${{ matrix.debug-level }}
          path: ${{ runner.temp }}/pr9-identity
          retention-days: 14

"""

for platform in ['linux', 'windows']:
    template = (repo / f'.github/workflows/build-{platform}.yml').read_text()
    needle = "      - name: 'Checkout the JDK source'\n        uses: " + checkout + ' # v7.0.1\n'
    assert template.count(needle) == 1
    template = template.replace(needle, needle + bootstrap)
    target = "      - name: 'Upload bundles'\n"
    assert template.count(target) == 1
    template = template.replace(target, identity + target)
    (workflows / f'pr9-native-{platform}.yml').write_text(template)

main = """name: PR9 exact-source native builds
on:
  workflow_dispatch:
permissions:
  contents: read
concurrency:
  group: pr9-exact-source-native-${{ github.ref }}
  cancel-in-progress: false
jobs:
  prepare:
    runs-on: ubuntu-26.04
    steps:
      - uses: CHECKOUT_ACTION
        with:
          ref: e41d7823bf6de77c4bfba52e896bf325221488cb
          sparse-checkout: |
            .github
            make/conf/github-actions.conf
          persist-credentials: false
      - uses: ./.github/actions/build-jtreg
  linux-aarch64:
    needs: prepare
    uses: ./.github/workflows/pr9-native-linux.yml
    with:
      platform: linux-aarch64
      runs-on: ubuntu-26.04-arm
      bootjdk-platform: linux-aarch64
      gcc-major-version: '16'
  windows-x64:
    needs: prepare
    uses: ./.github/workflows/pr9-native-windows.yml
    with:
      platform: windows-x64
      runs-on: windows-2025
      architecture: x86.x64
      msvc-toolset-version: '14.44'
""".replace('CHECKOUT_ACTION', checkout)
# The prepare job only needs the already-public prerequisite's build tooling;
# the unpublished candidate commit is restored and checked in each build job.
main = main.replace('ref: e41d7823bf6de77c4bfba52e896bf325221488cb',
                    'ref: c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b')
(workflows / 'main.yml').write_text(main)
files = []
for path in sorted(workflows.glob('*.yml')):
    data = path.read_bytes()
    parsed = yaml.load(data, Loader=yaml.BaseLoader)
    assert isinstance(parsed, dict) and 'on' in parsed and 'jobs' in parsed
    files.append({'path': str(path.relative_to(out)), 'bytes': len(data),
                  'sha256': hashlib.sha256(data).hexdigest()})
assert set(yaml.load(main, Loader=yaml.BaseLoader)['on']) == {'workflow_dispatch'}
record = {'source': 'e41d7823bf6de77c4bfba52e896bf325221488cb',
          'status': 'local-review-draft-not-published-not-dispatched',
          'files': files,
          'scope': 'Four native candidate builds: release/fastdebug on Linux ARM and Windows x64. '
                   'Build receipts verify actual JVM SOURCE independently of the workflow revision. '
                   'This draft does not run tests, controls, CDS repetitions or performance and '
                   'cannot close any native qualification gap.',
          'publication': 'If explicitly approved, overlay these workflow files only on the existing '
                         'evidence branch, preserving its other content; dispatch its existing '
                         'main.yml workflow manually on that branch. The default branch and PR '
                         'source do not need to change. Parent approval is still required.'}
(out / 'qualification.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record, indent=2))
