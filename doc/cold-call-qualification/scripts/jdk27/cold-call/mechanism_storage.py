"""Live filesystem allowance and post-seal compaction; no campaign entry point.

Only fresh role-owned native .o/.gch files can be unlinked. Images, sources,
debug sidecars and all logs/command records keep their original paths.
"""
import hashlib
import json
import os
from pathlib import Path
import stat
import time

from mechanism_process import Failure

RESERVE_BYTES = 4 * 1024**3
POLL_SECONDS = 1.0
OBJECT_ROOTS = ("hotspot/variant-server/libjvm/objs", "support/native")
OBJECT_SUFFIXES = frozenset((".o", ".gch"))


def require(value, reason):
    if not value:
        raise Failure(reason)


class StorageGuard:
    """Charge all filesystem consumption, including unrelated writers, to headroom.

    No estimated fastdebug minimum is asserted. The initial available bytes minus
    the reserve are the maximum allowed observed net consumption. SIGALRM forces
    a probe each second; cooperative probes may use the last subsecond sample.
    """
    def __init__(self, workspace, probe=None, monotonic=time.monotonic):
        self.workspace = Path(workspace)
        self.probe = probe or os.statvfs
        self.monotonic = monotonic
        self.last_probe = None
        self.failed = None
        self.failed_at = None
        self.record = dict(reserve_bytes=RESERVE_BYTES, poll_seconds=POLL_SECONDS,
                           samples=0, initial=None, latest=None, failure=None)

    def check(self, force=False):
        if self.failed:
            raise Failure(self.failed)
        now = self.monotonic()
        if self.last_probe is not None:
            require(now >= self.last_probe, "storage monotonic clock moved backwards")
            if not force and now - self.last_probe < POLL_SECONDS:
                return self.record["latest"]
        try:
            value = self.probe(self.workspace)
            require(all(type(n) is int and n >= 0 for n in
                        (value.f_frsize, value.f_blocks, value.f_bfree, value.f_bavail))
                    and value.f_frsize > 0
                    and value.f_bavail <= value.f_bfree <= value.f_blocks,
                    "invalid filesystem storage accounting")
            sample = dict(available_bytes=value.f_bavail * value.f_frsize,
                          filesystem_used_bytes=(value.f_blocks - value.f_bfree) * value.f_frsize,
                          total_bytes=value.f_blocks * value.f_frsize, monotonic=now,
                          device=self.workspace.stat().st_dev)
            self.last_probe = now
            self.record["samples"] += 1
            self.record["latest"] = sample
            if self.record["initial"] is None:
                self.record["initial"] = sample.copy()
                self.record["max_net_consumption_bytes"] = sample["available_bytes"] - RESERVE_BYTES
                self.record["minimum_available_bytes"] = sample["available_bytes"]
                self.record["peak_observed_net_consumption_bytes"] = 0
            require(all(sample[key] == self.record["initial"][key] for key in ("total_bytes", "device")),
                    "storage filesystem capacity changed")
            self.record["minimum_available_bytes"] = min(self.record["minimum_available_bytes"], sample["available_bytes"])
            self.record["peak_observed_net_consumption_bytes"] = max(
                self.record["peak_observed_net_consumption_bytes"],
                self.record["initial"]["available_bytes"] - sample["available_bytes"])
            require(sample["available_bytes"] > RESERVE_BYTES,
                    "storage safety reserve reached: available=" + str(sample["available_bytes"])
                    + " reserve=" + str(RESERVE_BYTES))
            return sample
        except (OSError, ValueError, AttributeError, Failure) as error:
            self.failed_at = now
            self.failed = "storage guard stopped work: " + str(error)
            self.record["failure"] = self.failed
            self.record["failure_monotonic"] = self.failed_at
            raise Failure(self.failed) from error


def identity(path):
    info = Path(path).lstat()
    require(stat.S_ISDIR(info.st_mode), "staging ownership directory changed: " + str(path))
    return [info.st_dev, info.st_ino]


def file_identity(info):
    return [info.st_dev, info.st_ino, info.st_size, info.st_mtime_ns, info.st_ctime_ns]


class RoleStaging:
    """One fresh build directory, one sealed-image receipt, one compaction pass."""
    def __init__(self, output, tree, role, run_id, save, sha256, check):
        self.output, self.tree = Path(output), Path(tree)
        require(role in ("base-release", "candidate-release", "candidate-fastdebug"), "unknown staging role")
        require(self.output.is_absolute() and self.output.resolve() == self.output
                and self.tree == self.output / "trees" / role
                and self.tree.resolve() == self.tree, "staging must own the exact fresh role worktree")
        self.tree_identity = identity(self.tree)
        self.build = self.tree / "build" / "mechanism"
        # Existing build outputs and adopted caches are never eligible for cleanup.
        (self.tree / "build").mkdir(exist_ok=False)
        self.build.mkdir(exist_ok=False)
        self.build_identity = identity(self.build)
        self.role, self.run_id = role, run_id
        self.save, self.sha256, self.check = save, sha256, check
        self.owner_path = self.output / ("staging-" + role + "-ownership.json")
        require(not self.owner_path.exists(), "staging ownership receipt already exists")
        self.owner = dict(schema=1, run_id=run_id, role=role, tree=str(self.tree),
                          tree_identity=self.tree_identity, build=str(self.build), build_identity=self.build_identity)
        save(self.owner_path, self.owner)
        self.owner_hash = sha256(self.owner_path)
        self.record = dict(status="REGISTERED", ownership_sha256=self.owner_hash,
                           removed_files=0, removed_allocated_bytes=0)
        self.started = False

    def verify_owner(self):
        self.check()
        require(self.tree.resolve() == self.tree and self.build.resolve() == self.build
                and identity(self.tree) == self.tree_identity and identity(self.build) == self.build_identity,
                "staging ownership identity changed")
        require(self.sha256(self.owner_path) == self.owner_hash, "staging ownership receipt changed")
        require(self.output.resolve() == self.output, "staging output path changed")

    def _parent_fd(self, relative):
        """Open every component without following symlinks, anchored to owned root."""
        relative = Path(relative)
        require(not relative.is_absolute() and ".." not in relative.parts and len(relative.parts) > 1,
                "invalid intermediate path")
        require(any(relative.is_relative_to(root) for root in map(Path, OBJECT_ROOTS))
                and relative.suffix in OBJECT_SUFFIXES, "intermediate outside compaction allowlist")
        self.verify_owner()
        fd = os.open(self.build, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
        try:
            info = os.fstat(fd)
            require([info.st_dev, info.st_ino] == self.build_identity, "opened build identity changed")
            for component in relative.parts[:-1]:
                self.check()
                child = os.open(component, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=fd)
                os.close(fd)
                fd = child
                require(os.fstat(fd).st_dev == self.build_identity[0], "intermediate crossed filesystem")
            return fd
        except BaseException:
            os.close(fd)
            raise

    def _objects(self):
        rows = []
        for allowed in OBJECT_ROOTS:
            root = self.build / allowed
            if not root.exists() and not root.is_symlink():
                continue
            require(root.is_dir() and not root.is_symlink(), "invalid intermediate directory")
            def walk_error(error):
                raise Failure("cannot inventory intermediate directory: " + str(error)) from error
            for directory, dirs, files in os.walk(root, followlinks=False, onerror=walk_error):
                self.check()
                require(not Path(directory).is_symlink(), "symlink in intermediate directory")
                for name in dirs:
                    require(not (Path(directory) / name).is_symlink(), "symlink in intermediate directory")
                for name in sorted(files):
                    path = Path(directory) / name
                    if path.suffix not in OBJECT_SUFFIXES:
                        continue
                    relative = str(path.relative_to(self.build))
                    fd = self._parent_fd(relative)
                    try:
                        info = os.stat(name, dir_fd=fd, follow_symlinks=False)
                        require(stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
                                "intermediate is not a private regular file")
                        # Hash the anchored file, never a path that could follow a changed symlink.
                        item = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=fd)
                        try:
                            require(file_identity(os.fstat(item)) == file_identity(info), "intermediate changed while opening")
                            digest = hashlib.sha256()
                            while True:
                                self.check()
                                block = os.read(item, 1024 * 1024)
                                if not block:
                                    break
                                digest.update(block)
                            require(file_identity(os.fstat(item)) == file_identity(info), "intermediate changed while sealing")
                        finally:
                            os.close(item)
                        rows.append(dict(path=relative, identity=file_identity(info),
                                         allocated_bytes=info.st_blocks * 512, sha256=digest.hexdigest()))
                    finally:
                        os.close(fd)
        return sorted(rows, key=lambda row: row["path"])

    def compact(self, seal_path, seal_hash, verify_seals, idle):
        require(not self.started, "role compaction cannot restart")
        self.started = True
        self.verify_owner()
        idle()  # The executor has killed/reaped owned descendants before unlinking.
        seal_path = Path(seal_path)
        require(seal_path == self.output / ("image-seal-" + self.role + ".json")
                and self.sha256(seal_path) == seal_hash, "missing or changed successful image seal")
        seal = json.loads(seal_path.read_text())
        require(seal["role"] == self.role and seal["run_id"] == self.run_id
                and seal["ownership_sha256"] == self.owner_hash
                and seal["image"]["path"] == str(self.build / "images/jdk"), "image seal ownership mismatch")
        verify_seals()
        rows = self._objects()
        plan = self.output / ("staging-" + self.role + "-objects.json")
        self.save(plan, dict(schema=1, role=self.role, run_id=self.run_id,
                             image_seal_sha256=seal_hash, ownership_sha256=self.owner_hash,
                             roots=list(OBJECT_ROOTS), suffixes=sorted(OBJECT_SUFFIXES), objects=rows))
        self.record.update(status="PRUNING", image_seal_sha256=seal_hash,
                           object_manifest_sha256=self.sha256(plan), planned_files=len(rows))
        self.save(self.output / ("staging-" + self.role + ".json"), self.record)
        # Interruption of image hashing, receipt writes or plan sealing cannot authorize deletion.
        verify_seals()
        require(self.sha256(plan) == self.record["object_manifest_sha256"], "compaction plan changed")
        for row in rows:
            self.check()
            fd = self._parent_fd(row["path"])
            try:
                info = os.stat(Path(row["path"]).name, dir_fd=fd, follow_symlinks=False)
                require(file_identity(info) == row["identity"] and stat.S_ISREG(info.st_mode)
                        and info.st_nlink == 1, "planned intermediate identity changed")
                os.unlink(Path(row["path"]).name, dir_fd=fd)
                self.record["removed_files"] += 1
                self.record["removed_allocated_bytes"] += row["allocated_bytes"]
            finally:
                os.close(fd)
        verify_seals()
        self.verify_owner()
        require(self.sha256(plan) == self.record["object_manifest_sha256"], "compaction plan changed")
        self.record["status"] = "COMPLETE"
        self.save(self.output / ("staging-" + self.role + ".json"), self.record)
        return self.record
