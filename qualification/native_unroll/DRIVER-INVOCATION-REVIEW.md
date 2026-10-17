# Compiler invocation-path repair

The reported Mac v2 failure occurred at the initial b3 fastdebug build, before
any of the 11 selected tests. We have the user's report, not their local logs.
At review head 8675beb12a3 the source explicitly called `resolve()` on the result
of `xcrun --find clang++`, then used that canonical path as CXX. With the reported
clang++ -> clang symlink this makes CXX end in clang. C++ driver-name selection
and implicit C++ library linking are lost. The report's missing C++ symbols while
linking adlc is consistent with this source defect. We have not reproduced that
link on a Mac in this executor and do not claim a corrected Mac build pass.

The checked-in configure logic independently supports preserving that spelling:
`make/autoconf/toolchain.m4` resolves a copy named SYMLINK_ORIGINAL for reporting
and ccache detection, leaving the selected compiler variable intact.
`util_paths.m4` makes its directory absolute while preserving the basename.

The fix uses discovered paths for execution and stores canonical paths solely
as provenance. Regression fixtures execute a local multi-call script through a
clang++ alias, and show the old canonical-path invocation instead observes clang.
They verify intact arguments containing spaces and shell characters, wrapper
selection, compiler-reported helper aliases, directory symlink targets, same-byte
symlink retargeting and executable permissions. Mac initialization fixtures assert
that CXX and gmake retain their chosen names while canonical executable hashes
and SDK settings remain independently bound. Reuse now requires this invocation
provenance; older receipts without it fail closed.

Audited and repaired invocation sites:

- `native_source_qualify.py`: all four xcrun-selected tools and GNU make.
- `build_classifier_image.py`: Linux compiler/linker/make discovery, plus
  compiler-reported cc1/cc1plus helpers; before/after provenance checks.
- `build_backend_images.py` and `build_roundtrip_images.py`: the analogous
  retained image-build tool paths and provenance checks.
- `diagnose_controller.py`: its direct Java executable symlink invocation.

Other resolve calls identify source/output directories, manifests, JDK image
roots or evidence containment. They do not canonicalize an individual selected
compiler/launcher name and are retained. Wrapper files are executed as selected;
the runner does not infer their target from their text or unwrap them. It binds
the wrapper bytes and mode, but cannot freeze arbitrary external dependencies a
wrapper may consult. Use the normal installed native tools for qualification.

Python subprocess calls pass argument lists, preserving tool spelling and literal
arguments without shell splitting. This is distinct from configure support:
OpenJDK `make/autoconf/util_paths.m4` documents and enforces no spaces in Unix
build paths. Build entry points now reject whitespace-containing build/tool paths
instead of claiming quoting makes them supported. No automatic path aliases or
installation workaround is introduced.

This repair changes no product/test/build-profile trees and does not remove GUI,
Metal or desktop modules. It supplies a corrected source-only Mac recipe; a new
focused Mac campaign needs separate authorization and a fresh output directory.
