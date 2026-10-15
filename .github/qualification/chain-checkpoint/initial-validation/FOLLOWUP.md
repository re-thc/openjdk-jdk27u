# Source 0fb3e86a initial validation

Both incremental release and fastdebug rebuilds succeeded. Initialization and
concurrent redefinition each passed on both images (four records); fastdebug
used CheckUnhandledOops and VerifyOops. The expanded initialization test failed
on the old 0af2b4bc image as expected, because its first large square did not
generate compiler stubs. The first old-source attempt ran zero tests because
its nativepath had been removed by the concurrent clean build; that setup error
and corrected run are both preserved. This is not a reproduced VM crash.

All 15 exploratory product-crossover cases passed on the actual committed 0fb
image. They use 40 measured balanced blocks at 3072/3328/3584/3840/4096 bits in
interpreter and C1 levels 1/3, against the published c04d head and baseline/flag
controls. No resolved slowdown against c04d appears in this sample. Final full
first-call, startup and warmed performance remain pending. The exact full-bit
fixture is also supplied: historical FirstBigInteger uses N-bit buffers with
N-7 significant bits; retain that fixture for historical comparisons.

The statistical reanalysis uses exact paired Student-t critical values for the
fresh-JVM block counts. Original exploratory summaries used 1.98 as an
approximate value; raw data and original summaries remain untouched. Guard
selection and the conclusions above are unchanged by the exact reanalysis.
The 391-ID audit and official include-order checker pass.

Clean builds of source 0fb3e86a are now in progress, with internal native debug
symbols in fastdebug to close the three earlier source-location gtest failures.
The initial concurrent configure calls collided in shared conftest files;
release configuration failed before rebuilding and then succeeded on a
sequential retry. The build helper now serializes configure. No tests or build
ran concurrently with a timing matrix. No PR push, hosted campaign, init change,
merge, or force-push occurred. ARM and Windows qualification gaps remain.
