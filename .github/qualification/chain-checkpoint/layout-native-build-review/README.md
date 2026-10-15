# Exact-source native build draft

Review data only. These nested workflow files are not active workflows and no
hosted job has been dispatched. Parent approval is required before activation
and execution. The PR source has not been pushed.

The draft uses the existing main.yml workflow path for a manual dispatch on
the existing evidence branch. It adds two reusable build recipes, producing
release/fastdebug on Linux ARM and Windows x64. The actual source is restored
from immutable checkpoint c158ea6ba18667c2e71127e9b1bb8b9b760f3fbd, verifies
the 79f0619e... bundle SHA256 and c04d prerequisite, and checks out exactly
e41d7823bf6de77c4bfba52e896bf325221488cb before building. The JVM release
SOURCE must match that source. Workflow revision and VM revision are retained
separately with VM/modules/archive hashes. No default-branch edit is proposed.

Static validation checks YAML structure, reusable-file references, dispatch-only
activation, and 18 shell steps with bash -n after substituting GHA expressions.
It does not evaluate GHA expressions or execute native toolchains. The portable
identity helper was self-checked only against the already-built local Linux x64
image, explicitly labelled in its receipt.

This is a build preparation phase. It does not yet execute focused native tests,
ARM ZGC repetition/offset-map analysis, controls, AOT/CDS or performance. Those
remain required by native-qualification-proposal.json. It cannot establish
Windows AVX512 capability or close any native qualification gap.
