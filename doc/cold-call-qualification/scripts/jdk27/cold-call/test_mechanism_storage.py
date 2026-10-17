"""Offline storage/staging fixtures; never launch a build, tool or workload."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import mechanism_storage as storage


class OfflineTest(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        for name in ("Popen", "run", "call", "check_call", "check_output"):
            blocker = patch.object(subprocess, name, side_effect=AssertionError("offline test cannot launch " + name))
            blocker.start()
            self.addCleanup(blocker.stop)


class GuardTests(OfflineTest):
    def guard(self, available):
        self.now = 100.0
        self.value = SimpleNamespace(f_frsize=1, f_blocks=40 * 1024**3,
                                     f_bfree=available, f_bavail=available)
        return storage.StorageGuard(self.root, lambda _: self.value, lambda: self.now)

    def test_reserve_boundary_is_strict_and_does_not_assert_a_build_minimum(self):
        for available in (storage.RESERVE_BYTES - 1, storage.RESERVE_BYTES):
            with self.subTest(available=available), self.assertRaisesRegex(storage.Failure, "safety reserve"):
                self.guard(available).check()
        for available in (storage.RESERVE_BYTES + 1, 32020656128):
            with self.subTest(available=available):
                guard = self.guard(available)
                guard.check()
                self.assertEqual(guard.record["max_net_consumption_bytes"], available - storage.RESERVE_BYTES)

    def test_forced_watchdog_probe_cannot_use_a_subsecond_cached_sample(self):
        guard = self.guard(10 * 1024**3)
        guard.check()
        self.now += 0.25
        self.value.f_bfree = self.value.f_bavail = storage.RESERVE_BYTES
        guard.check()  # Cheap cooperative call may retain its subsecond sample.
        with self.assertRaisesRegex(storage.Failure, "safety reserve"):
            guard.check(force=True)
        self.assertEqual(guard.record["samples"], 2)
        self.assertEqual(guard.failed_at, self.now)
        self.value.f_bfree = self.value.f_bavail = 10 * 1024**3
        with self.assertRaisesRegex(storage.Failure, "safety reserve"):
            guard.check(force=True)  # A low-space stop never reopens work.

    def test_net_usage_counts_unrelated_writes_and_retains_high_water_after_compaction(self):
        guard = self.guard(20 * 1024**3)
        guard.check()
        self.value.f_bfree = self.value.f_bavail = 12 * 1024**3
        self.now += storage.POLL_SECONDS
        guard.check()
        self.value.f_bfree = self.value.f_bavail = 18 * 1024**3
        guard.check(force=True)
        self.assertEqual(guard.record["peak_observed_net_consumption_bytes"], 8 * 1024**3)
        self.assertEqual(guard.record["minimum_available_bytes"], 12 * 1024**3)
        self.assertEqual(guard.record["max_net_consumption_bytes"], 16 * 1024**3)

    def test_missing_changed_or_invalid_filesystem_accounting_fails_closed(self):
        for mutation in (lambda v: setattr(v, "f_bavail", -1),
                         lambda v: setattr(v, "f_bavail", v.f_blocks + 1),
                         lambda v: setattr(v, "f_frsize", 0),
                         lambda v: setattr(v, "f_blocks", v.f_blocks + 1)):
            guard = self.guard(10 * 1024**3)
            guard.check()
            mutation(self.value)
            with self.subTest(mutation=mutation), self.assertRaises(storage.Failure):
                guard.check(force=True)
        guard = self.guard(10 * 1024**3)
        guard.probe = lambda _: (_ for _ in ()).throw(OSError("unavailable"))
        with self.assertRaisesRegex(storage.Failure, "unavailable"):
            guard.check()


class StagingTests(OfflineTest):
    def sha(self, path):
        return hashlib.sha256(Path(path).read_bytes()).hexdigest()

    def save(self, path, value):
        Path(path).write_text(json.dumps(value, sort_keys=True))

    def check(self):
        if self.interrupted:
            raise storage.Failure("offline interruption")

    def fixture(self):
        self.interrupted = False
        self.role, self.run_id = "base-release", "offline-storage"
        self.output = self.root / "run"
        self.tree = self.output / "trees" / self.role
        self.tree.mkdir(parents=True)
        (self.tree / "source.cpp").write_text("original source")
        self.stage = storage.RoleStaging(self.output, self.tree, self.role, self.run_id,
                                         self.save, self.sha, self.check)
        self.build = self.stage.build
        self.objects = []
        for relative in ("hotspot/variant-server/libjvm/objs/allocator.o",
                         "hotspot/variant-server/libjvm/objs/precompiled/header.gch",
                         "support/native/java.base/native.o"):
            path = self.build / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(b"reproducible object " + relative.encode())
            self.objects.append(path)
        self.kept = []
        for relative in ("spec.gmk", "images/jdk/lib/server/libjvm.so", "images/jdk/lib/modules",
                         "images/jdk/lib/server/keep.o", "images/symbols/libjvm.debuginfo",
                         "support/native/java.base/compile.log", "support/native/java.base/native.cmdline",
                         "support/modules_libs/java.base/libjvm.debuginfo", "jdk/modules/Retain.class",
                         "hotspot/variant-server/libjvm/objs/allocator.d"):
            path = self.build / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(b"retained unique evidence " + relative.encode())
            self.kept.append(path)
        self.kept.append(self.tree / "source.cpp")
        self.kept_hashes = {str(path): self.sha(path) for path in self.kept}
        self.seal = self.output / ("image-seal-" + self.role + ".json")
        self.save(self.seal, dict(role=self.role, run_id=self.run_id, ownership_sha256=self.stage.owner_hash,
                                  image={"path": str(self.build / "images/jdk")}))
        self.seal_hash = self.sha(self.seal)
        self.verifications = 0

    def verify(self):
        self.verifications += 1
        self.assertEqual(self.sha(self.seal), self.seal_hash)
        self.assertEqual({str(path): self.sha(path) for path in self.kept}, self.kept_hashes)

    def compact(self, verify=None, idle=lambda: None):
        return self.stage.compact(self.seal, self.seal_hash, verify or self.verify, idle)

    def assert_objects_intact(self):
        self.assertTrue(all(path.is_file() for path in self.objects))
        self.verify()

    def test_only_owned_native_objects_are_removed_after_sealing(self):
        self.fixture()
        result = self.compact()
        self.assertEqual(result["status"], "COMPLETE")
        self.assertEqual(result["removed_files"], 3)
        self.assertTrue(all(not path.exists() for path in self.objects))
        self.verify()
        manifest = json.loads((self.output / ("staging-" + self.role + "-objects.json")).read_text())
        self.assertEqual(len(manifest["objects"]), 3)
        self.assertTrue(all(row["sha256"] and row["identity"] for row in manifest["objects"]))
        with self.assertRaisesRegex(storage.Failure, "cannot restart"):
            self.compact()

    def test_existing_build_directory_cannot_be_adopted(self):
        self.interrupted = False
        output = self.root / "new"
        tree = output / "trees/base-release"
        build = tree / "build/mechanism"
        build.mkdir(parents=True)
        original = build / "precious.o"
        original.write_bytes(b"pre-existing")
        with self.assertRaises(FileExistsError):
            storage.RoleStaging(output, tree, "base-release", "new", self.save, self.sha, self.check)
        self.assertEqual(original.read_bytes(), b"pre-existing")

    def test_incomplete_or_wrong_image_seal_cannot_authorize_compaction(self):
        self.fixture()
        with self.assertRaisesRegex(storage.Failure, "image seal"):
            self.stage.compact(self.seal, "0" * 64, self.verify, lambda: None)
        self.assert_objects_intact()

    def test_interruption_during_either_image_verification_preserves_all_objects(self):
        for fail_at in (1, 2):
            with self.subTest(fail_at=fail_at), tempfile.TemporaryDirectory(dir=self.root) as directory:
                original_root = self.root
                self.root = Path(directory)
                self.fixture()
                def verify():
                    self.verify()
                    if self.verifications == fail_at:
                        raise storage.Failure("interrupted sealing")
                with self.assertRaisesRegex(storage.Failure, "interrupted sealing"):
                    self.compact(verify)
                self.assert_objects_intact()
                self.root = original_root

    def test_interrupted_object_manifest_write_preserves_all_objects(self):
        self.fixture()
        original_save = self.stage.save
        def interrupt(path, value):
            if str(path).endswith("-objects.json"):
                raise storage.Failure("interrupted manifest")
            original_save(path, value)
        self.stage.save = interrupt
        with self.assertRaisesRegex(storage.Failure, "interrupted manifest"):
            self.compact()
        self.assert_objects_intact()

    def test_active_owned_process_prevents_compaction(self):
        self.fixture()
        def busy():
            raise storage.Failure("owned writer remains")
        with self.assertRaisesRegex(storage.Failure, "owned writer"):
            self.compact(idle=busy)
        self.assert_objects_intact()

    def test_changed_ownership_receipt_prevents_compaction(self):
        self.fixture()
        self.stage.owner_path.write_text("changed identity")
        with self.assertRaisesRegex(storage.Failure, "ownership receipt changed"):
            self.compact()
        self.assert_objects_intact()

    def test_changed_build_identity_prevents_compaction(self):
        self.fixture()
        moved = self.build.with_name("displaced")
        self.build.rename(moved)
        self.build.mkdir()
        foreign = self.build / "foreign.o"
        foreign.write_bytes(b"not owned")
        with self.assertRaisesRegex(storage.Failure, "ownership identity changed"):
            self.compact()
        self.assertEqual(foreign.read_bytes(), b"not owned")
        self.assertTrue((moved / "hotspot/variant-server/libjvm/objs/allocator.o").is_file())

    def test_symlink_escape_and_hardlinked_image_inode_are_never_unlinked(self):
        self.fixture()
        outside = self.root / "unrelated"
        outside.mkdir()
        foreign = outside / "foreign.o"
        foreign.write_bytes(b"not owned")
        (self.build / "support/native/escape").symlink_to(outside, target_is_directory=True)
        with self.assertRaisesRegex(storage.Failure, "symlink"):
            self.compact()
        self.assertEqual(foreign.read_bytes(), b"not owned")
        self.assert_objects_intact()

    def test_hardlinked_image_inode_is_never_pruned(self):
        self.fixture()
        image = self.build / "images/jdk/lib/server/libjvm.so"
        os.link(image, self.objects[0].with_name("shared.o"))
        with self.assertRaisesRegex(storage.Failure, "private regular"):
            self.compact()
        self.assert_objects_intact()

    def test_replaced_planned_file_is_not_deleted(self):
        self.fixture()
        def replace():
            self.verify()
            if self.verifications == 2:
                self.objects[0].rename(self.objects[0].with_name("preserved.o"))
                self.objects[0].write_bytes(b"replacement")
        with self.assertRaisesRegex(storage.Failure, "identity changed"):
            self.compact(replace)
        self.assertEqual(self.objects[0].read_bytes(), b"replacement")
        self.assert_objects_intact()

    def test_interruption_mid_compaction_preserves_images_and_forbids_resume(self):
        self.fixture()
        unlink = os.unlink
        def interrupt(*args, **kwargs):
            unlink(*args, **kwargs)
            self.interrupted = True
        with patch.object(storage.os, "unlink", side_effect=interrupt):
            with self.assertRaisesRegex(storage.Failure, "offline interruption"):
                self.compact()
        self.assertEqual(self.stage.record["removed_files"], 1)
        self.assertEqual(sum(path.exists() for path in self.objects), 2)
        self.verify()
        with self.assertRaisesRegex(storage.Failure, "cannot restart"):
            self.compact()

    def test_manifest_changed_during_pruning_cannot_be_resealed_as_complete(self):
        self.fixture()
        unlink = os.unlink
        def tamper(*args, **kwargs):
            unlink(*args, **kwargs)
            (self.output / ("staging-" + self.role + "-objects.json")).write_text("changed manifest")
        with patch.object(storage.os, "unlink", side_effect=tamper):
            with self.assertRaisesRegex(storage.Failure, "compaction plan changed"):
                self.compact()
        self.assertEqual(self.stage.record["status"], "PRUNING")
        self.verify()


if __name__ == "__main__":
    unittest.main()
