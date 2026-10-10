# Welcome to the JDK!

For build instructions please see the
[online documentation](https://git.openjdk.org/jdk/blob/master/doc/building.md),
or either of these files:

- [doc/building.html](doc/building.html) (html version)
- [doc/building.md](doc/building.md) (markdown version)

Use `bin/configure-dev` for this fork's reduced native build: no desktop or audio
modules, Serial/G1/ZGC only, and the CPU baselines selected by the script. Linux
uses mold; set `CONFIGURE_DEV_NO_MOLD=1` to use the default linker. Ordinary
`bash configure` retains upstream defaults and is required for documentation
targets. During upstream updates, review the `ENABLE_DESKTOP` build guards and
module/collector requirements in retained tests.

See <https://openjdk.org/> for more information about the OpenJDK
Community and the JDK and see <https://bugs.openjdk.org> for JDK issue
tracking.
