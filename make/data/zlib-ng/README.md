# Maintained zlib-ng import

The JDK vendor tree starts from upstream zlib-ng commit
`49323f2af98b92fccf03cfc62ea2cb5591a3202e`. Its 217 selected upstream files
match the public archive byte for byte. The import then applies exactly one
local patch, `raw-crc32.patch`, which contains the persistent raw-inflate CRC32
implementation, the bulk-before-tail-alignment correction, and the standalone
synthetic `test/raw_crc32.c` probe. The resulting vendor tree has 220 files.
The patch is required maintenance input, including its probe; it is not an
optional benchmark or an upstream zlib-ng release.

Upstream archive:
<https://codeload.github.com/zlib-ng/zlib-ng/tar.gz/49323f2af98b92fccf03cfc62ea2cb5591a3202e>

Checksums used by `make/scripts/update-zlib-ng.py`:

- Archive SHA-256: `bc36e6f11cdbe71352b551ed98c94cd9d5f13dc248f3c3b56c518cc72678d604`
- Patch SHA-256: `704ecfdd24bf4e6f3015ec5feb7884b2a4be018c3ede26ebd3c17b9fd40be556`
- Patched tree SHA-256: `660dfe08f432771a3a1f1b6c8402e66cc5450f89b0d6b9097822a425969f0bfc`

The tree checksum hashes sorted relative paths, canonical Git file permissions
(0644 or 0755), lengths, and exact bytes. It covers the full selected vendor
tree, including the probe and the two locally added headers. It excludes the
separately generated JDK legal notice. The importer preserves upstream
`LICENSE.md` exactly and regenerates that notice with a local-modification
attribution outside the verbatim license.

From the repository root, with the downloaded archive at `/path/upstream.tar.gz`:

```sh
python3 make/scripts/update-zlib-ng.py \
  --archive /path/upstream.tar.gz \
  --revision 49323f2af98b92fccf03cfc62ea2cb5591a3202e \
  --sha256 bc36e6f11cdbe71352b551ed98c94cd9d5f13dc248f3c3b56c518cc72678d604

git diff --exit-code -- src/java.base/share/native/libzip/zlib-ng \
  src/java.base/share/legal/zlib-ng.md

python3 test/make/zlib-ng/test-import.py --archive /path/upstream.tar.gz -v
```

The ordinary Linux x64 release CI build also runs
`make test-make-zlib-ng-import`. This uses the existing make-test route and
reconstructs a filtered fixture by reversing this one patch from the checked-in
vendor tree. It exercises replay, no-write failure checks, license preservation
and idempotence without downloading anything. It does not verify the official
upstream archive's checksum or replace the explicit `--archive` checks above.
The make-test target is registered only on Linux build hosts, where the
executable-mode checks are qualified. Python 3 and Git must be available.

Run regeneration on a checkout containing the complete source and regression
series. A second import must also leave no diff. Python 3 and Git are required;
the importer performs no network access. Regeneration is checked on Linux with
filesystem executable bits. It stages the selected archive files,
checks and applies the single patch without fuzzy/three-way fallback, verifies
the exact result and license, and checks destination paths before changing
vendor files or the legal notice. Revision, archive, patch, context or tree
mismatch fails before those writes. There is no upstream-only import switch.
This is a validation-before-write guarantee, not transactional recovery from
arbitrary filesystem failures during the final synchronization.

For an upstream update, deliberately rebase this one patch against the newly
selected source. Retain the native probe, license notices and the corrected
bulk-helper ordering. Review changes to the internal inflate state and reset,
copy, dictionary, window-copy and finalization paths, plus x86 helper signatures,
dispatch, exported/mangled API templates and stock-zlib fallback. Update the
pinned revision and archive checksum only with that reviewed rebase; update the
patch and complete-tree checksums after comparing every resulting change.
Then run regeneration twice, the maintenance checks, the native probe and the
Java GZIP regression for enabled, disabled and stock backends. Requalify other
platforms and performance as appropriate. A new revision is rejected until its
pins are deliberately changed, and changed patch context or an omitted probe
still fails after changing those pins. Updating upstream never silently drops
the maintained implementation.

Upstream copyright notices and zlib license remain in the vendor files. The
persistent x86 folding template derives from upstream folding code (including
the earlier 2.3.3 partial-fold approach), retains its original authors/notices,
and reuses the pinned upstream bulk/reduction helpers. Added native files and
the synthetic probe use the same zlib terms stated in their file headers.
The patch file transports those source changes; it does not relicense them
under the GPL header of the Python maintenance tools. Java/JNI integration and
JDK regression files retain their own OpenJDK file headers. This local patch
has not been submitted upstream as part of this work.
