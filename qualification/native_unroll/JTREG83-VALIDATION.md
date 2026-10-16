# jtreg83 compatibility

The active end-to-end native recipe is [NATIVE-SOURCE-QUALIFICATION.md](NATIVE-SOURCE-QUALIFICATION.md).
It builds references and probes from Git and uses one installed compatible
harness; exact8.2.1 binaries and Library packets are permanently retired as
qualification prerequisites. The artifact-bound jtreg83 workflow is removed.

The approved single local generic smoke passed3/3tests in23.04seconds using
installed8.3-dev+1 and an existing x86_64 fastdebug VM: minimum8.2.1+1 admission,
ClassFileInstaller/native WhiteBox, driver/othervm and an enabled C2 AddI IR
assertion. No retry, JDK build or native ARM campaign occurred. This is harness
compatibility evidence, not classifier or performance qualification.

To plan a generic smoke on another host, use committed `jtreg83_harness.py smoke`
with explicit `--image`, `--jdk`, `--debug-jdk`, `--debug-spec` and fresh `--out`.
Without `--execute` it prints a plan. Runtime needs its own applicable approval.
The native recipe includes this gate before either classifier overlay. An exact
classifier VM is not required for generic compatibility. Installed images remain
optional acceleration; the source route creates its own b3 fastdebug reference.

No executable archive endpoint substitution or binary-sharing route is included.
The denied git.openjdk.org JT Harness fetch has not been retried. A native host
with a normally installed compatible harness avoids that fetch entirely.
