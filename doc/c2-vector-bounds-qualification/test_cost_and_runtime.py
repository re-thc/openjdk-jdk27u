"""Offline parser/provenance counterexamples; no JVM or benchmark execution."""
from pathlib import Path
import tempfile
import unittest
from audit import tree_digest
from compiler_cost import compiler_screen, elapsed_ms, parse_log


def log_fixture(tasks, events="", truncate=False):
    installs, bodies = [], []
    for number, kind, bci, start, end, success in tasks:
        method = "qualification.BoundsQualification vectorCursor ()I"
        entry = " compile_kind='osr' osr_bci='" + str(bci) + "'" if kind == "osr" else ""
        if success == "1":
            installs.append(f"<nmethod compiler='c2' compile_id='{number}' method='{method}' stamp='{end}'/>")
        done = f"<task_done success='{success}' stamp='{end}'/>" if success is not None else ""
        bodies.append(f"<task compile_id='{number}' method='{method}' stamp='{start}'{entry}>{done}</task>")
    return ("<hotspot_log><vm_arguments><args>-XX:+LogCompilation</args></vm_arguments>"
            + "".join(installs) + events + "<compilation_log thread='1'>"
            + "<start_compile_thread name='C2 CompilerThread0' thread='1'/>" + "".join(bodies)
            + ("" if truncate else "</compilation_log></hotspot_log>"))


class CostAndRuntimeTest(unittest.TestCase):
    def parse(self, content):
        with tempfile.TemporaryDirectory(prefix="c2-cost-test-") as directory:
            path = Path(directory) / "log.xml"
            path.write_text(content)
            return parse_log(path)

    def test_normal_osr_failed_recompiled_incomplete_and_nested_trap(self):
        tasks = [(1, "normal", None, 0.1, 0.11, "1"), (2, "osr", 7, 0.2, 0.22, "1"),
                 (3, "normal", None, 0.3, 0.31, "1"), (4, "osr", 8, 0.4, 0.41, "1"),
                 (5, "normal", None, 0.5, 0.51, "0"), (6, "normal", None, 0.6, None, None)]
        event = "<uncommon_trap compile_id='1' stamp='0.8'><jvms method='m' bci='0'/></uncommon_trap>"
        result = self.parse(log_fixture(tasks, event))
        self.assertEqual(result["summary"]["tasks"], 6)
        self.assertEqual(result["summary"]["normal"], 4)
        self.assertEqual(result["summary"]["osr"], 2)
        self.assertEqual(result["summary"]["failed"], 1)
        self.assertEqual(result["summary"]["missing_completions"], 1)
        self.assertEqual(result["summary"]["repeated_entry_tasks"], 3)
        self.assertEqual(len(result["c2_runtime_traps"]), 1)
        self.assertEqual(result["tasks"][3]["entry_generation"], 1, "different OSR BCI must remain separate")
        self.assertEqual(result["summary"]["task_wall_total_ms"], 60)

    def test_truncated_log_and_invalid_clocks_are_not_a_pass(self):
        result = self.parse(log_fixture([(1, "normal", None, 0.1, None, None)], truncate=True))
        self.assertEqual(result["incomplete_compilation_sections"], 1)
        self.assertEqual(result["summary"]["missing_completions"], 1)
        for start, end in (("1", "0.9"), ("NaN", "1"), ("0", "Infinity")):
            with self.assertRaises(ValueError):
                elapsed_ms(start, end)

    def test_quantitative_cost_screen_and_incomparable_entries(self):
        baseline = self.parse(log_fixture([(1, "normal", None, 0.1, 0.2, "1")]))
        candidate = self.parse(log_fixture([(1, "normal", None, 0.1, 0.26, "1")]))
        rows = {0: {"compiler_cost_pairs": {i: {"baseline": baseline, "candidate": candidate} for i in range(6)}}}
        screen = compiler_screen(rows)[0]
        self.assertEqual(screen["total_cost_increase_pairs"], 6)
        self.assertTrue(screen["explanation_required"])
        self.assertTrue(all(x == 6 for x in screen["target_cost_increase_pairs"].values()))
        close = self.parse(log_fixture([(1, "normal", None, 0.1, 0.201, "1")]))
        rows[0]["compiler_cost_pairs"] = {i: {"baseline": baseline, "candidate": close} for i in range(6)}
        self.assertFalse(compiler_screen(rows)[0]["explanation_required"])
        repeated = self.parse(log_fixture([(1, "normal", None, 0.1, 0.2, "1"), (2, "normal", None, 0.9, 1.1, "1")]))
        repeated["measurement_start_seconds"] = 1.0
        rows[0]["compiler_cost_pairs"][0]["candidate"] = repeated
        screen = compiler_screen(rows)[0]
        self.assertTrue(screen["entry_count_changes"])
        self.assertTrue(any("repeated" in x for x in screen["blockers"]))
        self.assertTrue(screen["explanation_required"])

    def test_every_required_library_and_symlink_target_is_bound(self):
        with tempfile.TemporaryDirectory(prefix="c2-runtime-test-") as directory:
            root = Path(directory)
            lib = root / "lib"
            lib.mkdir()
            for name in ("libjli.so", "libjava.so", "libzip.so", "libnio.so"):
                (lib / name).write_bytes(b"original")
            before = tree_digest(lib)
            for name in ("libjli.so", "libjava.so", "libzip.so", "libnio.so"):
                (lib / name).write_bytes(b"changed-runtime-code")
                self.assertNotEqual(tree_digest(lib)["sha256"], before["sha256"])
                (lib / name).write_bytes(b"original")
            target = root / "external.so"
            target.write_bytes(b"linked-code")
            (lib / "external-link.so").symlink_to(target)
            linked = tree_digest(lib)
            target.write_bytes(b"changed-linked-code")
            self.assertNotEqual(tree_digest(lib)["sha256"], linked["sha256"])
            external = root / "external-dir"
            external.mkdir()
            (external / "nested.so").write_bytes(b"nested-code")
            (lib / "directory-link").symlink_to(external, target_is_directory=True)
            linked_dir = tree_digest(lib)
            (external / "nested.so").write_bytes(b"changed-nested-code")
            self.assertNotEqual(tree_digest(lib)["sha256"], linked_dir["sha256"])
            (external / "loop").symlink_to(lib, target_is_directory=True)
            with self.assertRaisesRegex(ValueError, "cycle"):
                tree_digest(lib)


if __name__ == "__main__":
    unittest.main()
