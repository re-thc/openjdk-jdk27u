"""Offline fixtures for the fail-closed prospective input validator."""

import copy
import hashlib
import json
import shutil
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import decision
import inputs


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _write_json(path: Path, value) -> bytes:
    data = (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return data


def _record(root: Path, name: str, value) -> dict:
    relative = f"evidence/{name}.json"
    data = _write_json(root / relative, value)
    return {"path": relative, "sha256": _sha(data)}


def _manifest(root: Path) -> dict:
    return inputs._inventory(root)


def _tree_hash(root: Path) -> str:
    return inputs._tree_hash(_manifest(root))


def _copy_sources(source_dir: Path, root: Path) -> None:
    for path in source_dir.iterdir():
        if path.is_file() and path.suffix in inputs.SOURCE_SUFFIXES:
            shutil.copyfile(path, root / path.name)
    (root / "RUNBOOK.md").write_text("offline fixture runbook\n")


def _build_image(root: Path, name: str, commit: str, module: bytes, cds: bytes,
                 native: bytes, build_identity: dict) -> dict:
    image_root = root / "images" / name
    java = image_root / "bin/java"
    java.parent.mkdir(parents=True)
    java.write_bytes(b"fixture java " + name.encode())
    java.chmod(0o755)
    modules = image_root / "lib/modules"
    modules.parent.mkdir(parents=True)
    modules.write_bytes(module)
    cds_path = image_root / "lib/server/classes.jsa"
    cds_path.parent.mkdir(parents=True)
    cds_path.write_bytes(cds)
    native_path = image_root / "lib/server/libjvm.so"
    native_path.write_bytes(native)
    tree_manifest = _manifest(image_root)
    tree_digest = inputs._tree_hash(tree_manifest)
    cds_digest = inputs._tree_hash({
        "lib/server/classes.jsa": {"type": "file", "sha256": _sha(cds)}
    })
    receipt = _record(root, f"build-{name}", {
        "status": "PASS", "source_commit": commit,
        "tree_sha256": tree_digest, "build_identity": build_identity,
    })
    return {
        "source_commit": commit, "source_clean": True,
        "root": str(image_root), "tree_manifest": tree_manifest,
        "tree_sha256": tree_digest, "modules_sha256": _sha(module),
        "cds_files": {"lib/server/classes.jsa": _sha(cds)},
        "cds_sha256": cds_digest,
        "native_files": {"lib/server/libjvm.so": _sha(native)},
        "build_identity": build_identity, "build_receipt": receipt,
        **({"generated_template": {
            "source_id": "7" * 64,
            "payload_sha256": inputs.TEMPLATE_PAYLOAD_SHA256,
            "length": inputs.TEMPLATE_PAYLOAD_LENGTH,
            "entries": inputs.TEMPLATE_ENTRY_COUNT,
            "crc32": inputs.TEMPLATE_PAYLOAD_CRC32,
            "metadata_sha256": "8" * 64,
            "resource_sha256": "9" * 64,
        }} if name == "template" else {}),
    }


def _refresh_launch_review(root: Path) -> None:
    names = ("EXECUTION_BINDINGS.json", "PROPOSAL.json", "SCHEDULE.json", "SOURCE_FILES.json")
    hashes = {name: _sha((root / name).read_bytes()) for name in names}
    _write_json(root / "LAUNCH_REVIEW.json", {
        "schema": inputs.SCHEMA, "authorized": True,
        "authorization_id": "fixture-authorization", "reviewer": "fixture reviewer",
        "reviewer_type": "human", "sha256": hashes,
    })


def _refresh_source_manifest(root: Path) -> None:
    manifest_path = root / "SOURCE_FILES.json"
    manifest = json.loads(manifest_path.read_text())
    for name in ("PROPOSAL.json", "SCHEDULE.json", "README.md", "RUNBOOK.md",
                 "OFFLINE_VALIDATION.json"):
        manifest["files"][name] = _sha((root / name).read_bytes())
    _write_json(manifest_path, manifest)


def _make_fixture(root: Path, source_dir: Path) -> bytes:
    _copy_sources(source_dir, root)
    proposal = copy.deepcopy(decision.PLAN)
    _write_json(root / "PROPOSAL.json", proposal)
    _write_json(root / "SCHEDULE.json", decision.make_schedule())
    (root / "README.md").write_text("offline fixture instructions\n")
    _write_json(root / "OFFLINE_VALIDATION.json", {"status": "PASS", "offline": True})

    tool_hash = "a" * 64
    build_identity = {
        "target": "Linux/aarch64", "profile": "configure-dev",
        "debug_level": "release", "ccache_enabled": False,
        "configure_sha256": tool_hash, "configure_args_sha256": "b" * 64,
        "boot_jdk_sha256": "c" * 64, "gcc_sha256": "d" * 64,
        "mold_sha256": "e" * 64,
    }
    native_payload = b"offline native payload fixture"
    base = _build_image(root, "base", inputs.BASE, b"base modules", b"base CDS",
                        b"identical bundled libjvm", build_identity)
    template = _build_image(root, "template", inputs.CANDIDATE, b"template modules",
                            b"base CDS", b"identical bundled libjvm", build_identity)

    classes = root / "benchmark-classes"
    classes.mkdir()
    (classes / "Probe.class").write_bytes(b"offline probe class")
    (classes / "Steady.class").write_bytes(b"offline steady class")
    native = root / "libbench.so"
    native.write_bytes(native_payload)
    admitted_cgroup = root / "mock-cgroup/work"
    admitted_cgroup.mkdir(parents=True)
    (admitted_cgroup / "cgroup.procs").write_text("123\n")
    (admitted_cgroup / "cpu.max").write_text("max 100000\n")
    (admitted_cgroup / "cpuset.cpus.effective").write_text("0-7\n")
    (admitted_cgroup.parent / "cpu.max").write_text("400000 100000\n")
    (admitted_cgroup.parent / "cpuset.cpus.effective").write_text("0-7\n")

    generated_template = template["generated_template"]
    evidence = {
        "candidate_correctness": _record(root, "candidate-correctness", {
            "status": "PASS", "candidate_commit": inputs.CANDIDATE,
            "candidate_tree_sha256": template["tree_sha256"],
            "platform": "Linux/aarch64",
            "required_mode": {"status": "PASS", "selected": True,
                              "platform": "linux-aarch64"},
        }),
        "candidate_image_linkage": _record(root, "candidate-image-linkage", {
            "status": "PASS", "source_commit": inputs.CANDIDATE,
            "tree_sha256": template["tree_sha256"],
            "modules_sha256": template["modules_sha256"],
            "generated_template": generated_template,
        }),
        "host_admission": _record(root, "host-admission", {
            "status": "PASS", "platform": "Linux/aarch64",
            "execution_environment": "native-linux-vm", "cpu": 7,
            "collector_and_java_same_pid_namespace": True,
            "collector_and_java_same_cgroup": True,
            "wait4_individual_child_cpu": True,
            "cpu_in_affinity_and_cpuset": True,
            "child_membership_verified": True,
            "child_affinity_verified": True,
            "proc_cpu_mapping_verified": True,
            "accounting_scope_verified": True,
            "affinity_cpus": [7], "cpuset_cpus": [7],
            "no_concurrent_build_test_or_input_write": True,
            "boot_id": "fixture-boot", "namespace_id": "pid:[fixture-pid]",
            "cgroup_path": str(admitted_cgroup),
            "cgroup_mountpoint": str(admitted_cgroup.parent),
            "cgroup_limits": {
                str(admitted_cgroup): {"cpu.max": "max 100000",
                                       "cpuset.cpus.effective": "0-7"},
                str(admitted_cgroup.parent): {"cpu.max": "400000 100000",
                                              "cpuset.cpus.effective": "0-7"},
            },
            "collector_pid": 100,
            "witness_child_pid": 101,
        }),
        "overall_budget": _record(root, "overall-budget", {
            "start_monotonic_ns": 1_000_000_000,
            "preparation_deadline_ns": 1_000_000_000 + 5_100_000_000_000,
            "overall_deadline_ns": 1_000_000_000 + 9_000_000_000_000,
            "boot_id": "fixture-boot",
        }),
    }
    diagnostics = []
    for image_name, image in (("base", base), ("template", template)):
        for cell, (caller, level) in inputs.DIAGNOSTIC_CELLS.items():
            diagnostics.append(_record(root, f"diagnostic-{image_name}-{cell}", {
                "status": "PASS", "image": image_name, "cell": cell,
                "caller": caller, "compiler_level": level,
                "pre_warm_marker": True, "compiled_root_verified": True,
                "image_tree_sha256": image["tree_sha256"],
                "root_evidence": f"actual compile root receipt: {image_name}/{cell}",
            }))
    evidence["compiler_diagnostics"] = diagnostics
    evidence["native_build"] = _record(root, "native-build", {
        "status": "PASS", "source_sha256": _sha((root / "native.c").read_bytes()),
        "library_sha256": _sha(native_payload), "compiler_sha256": build_identity["gcc_sha256"],
        "command": "gcc -shared -fPIC native.c",
    })
    bindings = {
        "schema": inputs.SCHEMA, "baseline": inputs.BASE,
        "candidate": inputs.CANDIDATE, "platform": "Linux/aarch64",
        "release": True, "cpu": 7,
        "paths": {"base": str(root / "images/base/bin/java"),
                  "template": str(root / "images/template/bin/java"),
                  "classes": str(classes), "native": str(native)},
        "images": {"base": base, "template": template},
        "classes_tree_manifest": _manifest(classes),
        "classes_tree_sha256": _tree_hash(classes),
        "native_sha256": _sha(native_payload), "evidence": evidence,
    }
    _write_json(root / "EXECUTION_BINDINGS.json", bindings)

    listed = {}
    for path in root.iterdir():
        if path.is_file() and path.suffix in inputs.SOURCE_SUFFIXES:
            listed[path.name] = _sha(path.read_bytes())
    for name in ("PROPOSAL.json", "SCHEDULE.json", "README.md", "RUNBOOK.md",
                 "OFFLINE_VALIDATION.json"):
        listed[name] = _sha((root / name).read_bytes())
    _write_json(root / "SOURCE_FILES.json", {"schema": inputs.SCHEMA, "files": listed})
    _refresh_launch_review(root)
    return _sha(native_payload)


class ValidateInputsTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="ffm-inputs-")
        self.root = Path(self.temp.name)
        self.source_dir = Path(__file__).resolve().parent
        self.native_sha = _make_fixture(self.root, self.source_dir)

    def tearDown(self):
        self.temp.cleanup()

    def validate(self):
        return inputs.validate_inputs(self.root)

    def test_valid_fixture_binds_images_evidence_and_recheck(self):
        bindings, fingerprints = self.validate()
        self.assertEqual(bindings["cpu"], 7)
        self.assertEqual(bindings["baseline"], inputs.BASE)
        self.assertEqual(bindings["candidate"], inputs.CANDIDATE)
        self.assertIn(str(self.root / "images/base/lib/modules"), fingerprints)
        self.assertIn(str(self.root / "evidence/host-admission.json"), fingerprints)
        self.assertEqual(inputs.get_budget(self.root, bindings)["overall_deadline_ns"],
                         1_000_000_000 + 9_000_000_000_000)
        self.assertTrue(inputs.recheck_inputs(fingerprints))

    def test_invalid_overall_budget_receipt_rejected(self):
        budget_path = self.root / "evidence/overall-budget.json"
        record = json.loads(budget_path.read_text())
        record["preparation_deadline_ns"] += 1
        data = _write_json(budget_path, record)
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        bindings["evidence"]["overall_budget"]["sha256"] = _sha(data)
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "preparation deadline"):
            self.validate()

    def test_recheck_detects_mutated_file_in_image_tree(self):
        _, fingerprints = self.validate()
        target = self.root / "images/template/lib/modules"
        target.write_bytes(b"changed after freeze")
        with self.assertRaisesRegex(ValueError, "frozen input changed"):
            inputs.recheck_inputs(fingerprints)

    def test_review_must_bind_exact_execution_bindings(self):
        review_path = self.root / "LAUNCH_REVIEW.json"
        review = json.loads(review_path.read_text())
        review["sha256"]["EXECUTION_BINDINGS.json"] = "0" * 64
        _write_json(review_path, review)
        with self.assertRaisesRegex(ValueError, "launch review hashes"):
            self.validate()

    def test_proposal_must_remain_exactly_frozen_draft(self):
        proposal_path = self.root / "PROPOSAL.json"
        proposal = json.loads(proposal_path.read_text())
        proposal["status"] = "AUTHORIZED_NOT_EXECUTED"
        _write_json(proposal_path, proposal)
        _refresh_source_manifest(self.root)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "proposal differs from frozen decision"):
            self.validate()

    def test_wrong_commit_pin_rejected(self):
        proposal_path = self.root / "PROPOSAL.json"
        proposal = json.loads(proposal_path.read_text())
        proposal["candidate"] = "0" * 40
        _write_json(proposal_path, proposal)
        _refresh_source_manifest(self.root)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "source hash mismatch|frozen decision"):
            self.validate()

    def test_host_cpu_and_wait4_are_admission_requirements(self):
        host_path = self.root / "evidence/host-admission.json"
        host = json.loads(host_path.read_text())
        host["wait4_individual_child_cpu"] = False
        data = _write_json(host_path, host)
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        bindings["evidence"]["host_admission"]["sha256"] = _sha(data)
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "actual Linux VM/CPU/wait4 admission"):
            self.validate()

    def test_missing_required_compiler_diagnostic_rejected(self):
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        bindings["evidence"]["compiler_diagnostics"].pop()
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "exactly six"):
            self.validate()

    def test_image_mutation_fails_complete_manifest_check(self):
        target = self.root / "images/base/lib/server/classes.jsa"
        target.write_bytes(b"stale CDS")
        with self.assertRaisesRegex(ValueError, "tree manifest differs"):
            self.validate()

    def test_native_file_inventory_must_be_complete(self):
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        del bindings["images"]["template"]["native_files"]["lib/server/libjvm.so"]
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "native file hashes required|inventory is incomplete"):
            self.validate()

    def test_source_manifest_must_include_docs_proposal_schedule_and_harness(self):
        manifest_path = self.root / "SOURCE_FILES.json"
        manifest = json.loads(manifest_path.read_text())
        del manifest["files"]["child_collector.py"]
        _write_json(manifest_path, manifest)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "cover all harness sources"):
            self.validate()

    def test_host_must_attest_to_quiet_execution_environment(self):
        host_path = self.root / "evidence/host-admission.json"
        host = json.loads(host_path.read_text())
        host["no_concurrent_build_test_or_input_write"] = False
        data = _write_json(host_path, host)
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        bindings["evidence"]["host_admission"]["sha256"] = _sha(data)
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "actual Linux VM/CPU/wait4 admission"):
            self.validate()

    def test_runtime_host_precheck_uses_mocked_proc_and_affinity(self):
        bindings, _ = self.validate()
        proc = self.root / "proc-fixture"
        (proc / "self/ns").mkdir(parents=True)
        (proc / "sys/kernel/random").mkdir(parents=True)
        (proc / "self/cgroup").write_text("0::/work\n")
        (proc / "self/mountinfo").write_text(
            f"36 25 0:32 / {self.root / 'mock-cgroup'} rw - cgroup2 cgroup rw\n")
        (proc / "sys/kernel/random/boot_id").write_text("fixture-boot\n")
        with patch("inputs.os.readlink", return_value="pid:[fixture-pid]"), \
                patch("inputs.os.sched_getaffinity", return_value={7}), \
                patch("inputs.os.getpid", return_value=123):
            current = inputs.validate_current_host(self.root, bindings, proc_root=proc)
        self.assertEqual(current["cpu"], 7)
        self.assertEqual(current["cgroup_path"], str(self.root / "mock-cgroup/work"))
        self.assertTrue(current["membership_verified"])
        self.assertEqual(len(current["cgroup_limits"]), 2)

    def test_runtime_host_precheck_rejects_changed_namespace(self):
        bindings, _ = self.validate()
        proc = self.root / "proc-fixture"
        (proc / "self/ns").mkdir(parents=True)
        (proc / "sys/kernel/random").mkdir(parents=True)
        (proc / "self/cgroup").write_text("0::/work\n")
        (proc / "self/mountinfo").write_text(
            f"36 25 0:32 / {self.root / 'mock-cgroup'} rw - cgroup2 cgroup rw\n")
        (proc / "sys/kernel/random/boot_id").write_text("fixture-boot\n")
        with patch("inputs.os.readlink", return_value="pid:[changed]"), \
                patch("inputs.os.sched_getaffinity", return_value={7}), \
                patch("inputs.os.getpid", return_value=123):
            with self.assertRaisesRegex(ValueError, "PID namespace changed"):
                inputs.validate_current_host(self.root, bindings, proc_root=proc)

    def test_runtime_host_precheck_rejects_changed_ancestor_cpu_limit(self):
        bindings, _ = self.validate()
        proc = self.root / "proc-fixture"
        (proc / "self/ns").mkdir(parents=True)
        (proc / "sys/kernel/random").mkdir(parents=True)
        (proc / "self/cgroup").write_text("0::/work\n")
        (proc / "self/mountinfo").write_text(
            f"36 25 0:32 / {self.root / 'mock-cgroup'} rw - cgroup2 cgroup rw\n")
        (proc / "sys/kernel/random/boot_id").write_text("fixture-boot\n")
        (self.root / "mock-cgroup/cpu.max").write_text("200000 100000\n")
        with patch("inputs.os.readlink", return_value="pid:[fixture-pid]"), \
                patch("inputs.os.sched_getaffinity", return_value={7}), \
                patch("inputs.os.getpid", return_value=123):
            with self.assertRaisesRegex(ValueError, "cpu.max or cpuset.*changed"):
                inputs.validate_current_host(self.root, bindings, proc_root=proc)

    def test_wrong_native_payload_hash_rejected(self):
        bindings_path = self.root / "EXECUTION_BINDINGS.json"
        bindings = json.loads(bindings_path.read_text())
        bindings["native_sha256"] = "0" * 64
        _write_json(bindings_path, bindings)
        _refresh_launch_review(self.root)
        with self.assertRaisesRegex(ValueError, "native benchmark library hash"):
            self.validate()


if __name__ == "__main__":
    unittest.main()
