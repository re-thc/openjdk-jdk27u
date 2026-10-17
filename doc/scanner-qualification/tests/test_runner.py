"""Deterministic offline fixtures. No real procfs, processes, waits or signals.

Run from any checkout: python3 -m unittest discover -s
doc/scanner-qualification/tests -v
"""
from dataclasses import asdict, replace
import importlib.util
import json
import os
from pathlib import Path
import signal
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

PACKET = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PACKET))
import runner_process as proc

spec = importlib.util.spec_from_file_location("stage_control", PACKET / "stage-control.py")
control = importlib.util.module_from_spec(spec)
spec.loader.exec_module(control)

ROOT = proc.Process(100, 10, 100, 100, 10, 1000, "S", 100)
WORKER = proc.Process(200, 100, 200, 100, 20, 1000, "S", 1024)
OWNER = proc.Process(10, 1, 10, 10, 1, 1000, "S", 100)


def processes(*items):
    return {item.pid: item for item in items}


class Offline(unittest.TestCase):
    def setUp(self):
        # Accidental fall-through to production backends is a test failure.
        for name in ("os.kill", "os.pidfd_open", "os.waitpid", "os.waitid", "signal.pidfd_send_signal",
                     "subprocess.Popen", "ctypes.CDLL"):
            guard = patch(name, side_effect=AssertionError("real backend forbidden: " + name))
            guard.start()
            self.addCleanup(guard.stop)
        guard = patch.object(control, "snapshot", side_effect=AssertionError("real procfs forbidden"))
        guard.start()
        self.addCleanup(guard.stop)
        def target(pid):
            observed = control.snapshot()
            if pid not in observed:
                raise FileNotFoundError("synthetic disappearance")
            return observed[pid]
        guard = patch.object(control, "read_process", side_effect=target)
        guard.start()
        self.addCleanup(guard.stop)
        self.temporary = tempfile.TemporaryDirectory(prefix="scanner-offline-")
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)

    def token(self, name, identity=ROOT.identity):
        proc.atomic_json(self.directory / name, {"identity": asdict(identity), "owner": asdict(OWNER.identity)})


class Classification(Offline):
    def test_five_required_fixtures_and_exact_signal_trace(self):
        fixtures = json.loads((PACKET / "tests/fixtures/processes.json").read_text())
        for name, rows in fixtures.items():
            with self.subTest(name=name):
                trace = []
                scope = proc.Scope(ROOT.identity, [WORKER.identity])
                def read(_):
                    trace.append("read")
                    if isinstance(rows, dict):
                        raise PermissionError(rows["error"])
                    if not rows:
                        raise FileNotFoundError("synthetic disappearance")
                    return proc.Process(**rows[0])
                def send(*args):
                    trace.append(("signal", args))
                def open_fd(pid, flags):
                    trace.append(("open", pid, flags))
                    return 7
                def close(fd):
                    trace.append(("close", fd))
                if name in {"pid-reused", "observer-error"}:
                    with self.assertRaises((proc.Uncertain, PermissionError)):
                        proc.signal_owned(WORKER.identity, signal.SIGTERM, read, open_fd, send, close)
                else:
                    result = proc.signal_owned(WORKER.identity, signal.SIGTERM, read, open_fd, send, close)
                    self.assertEqual(result, {"live": "signaled", "zombie": "zombie", "disappeared": "disappeared"}[name])
                    states = scope.observe(processes(ROOT, *(proc.Process(**row) for row in rows)))
                    self.assertEqual(states[200], "live" if name == "live" else name)
                expected = [("open", 200, 0), "read"]
                if name == "live":
                    expected.append(("signal", (7, signal.SIGTERM, None, 0)))
                self.assertEqual(trace, expected + [("close", 7)])

    def test_zero_rss_live_blocked_and_stopped_remain_live(self):
        for value in ("R", "S", "D", "T", "t", "I", "W", "P"):
            self.assertEqual(proc.state(replace(WORKER, state=value, rss=0)), "live")

    def test_unknown_contradictory_negative_uid_and_birth_fail_closed(self):
        for worker in (replace(WORKER, state="?"), replace(WORKER, state="X"),
                       replace(WORKER, state="Z"), replace(WORKER, rss=-1),
                       replace(WORKER, uid=1001), replace(WORKER, birth=21)):
            with self.subTest(worker=worker), self.assertRaises(proc.Uncertain):
                proc.Scope(ROOT.identity, [WORKER.identity]).observe(processes(ROOT, worker))

    def test_adoption_sid_escape_and_zombie_leader_keep_live_descendant(self):
        child = replace(WORKER, pid=201, ppid=200, birth=21)
        scope = proc.Scope(ROOT.identity)
        scope.observe(processes(ROOT, WORKER, child))
        zombie = replace(WORKER, state="Z", rss=0, ppid=1)
        escaped = replace(child, ppid=100, pgid=201, sid=201)
        self.assertEqual(scope.live(processes(ROOT, zombie, escaped), {100}), [escaped.identity])
        adopted_zombie = replace(escaped, state="Z", rss=0)
        self.assertEqual(scope.live(processes(ROOT, zombie, adopted_zombie), {100}), [])
        self.assertEqual(scope.observe(processes(ROOT, zombie, adopted_zombie))[200], "zombie")

    def test_foreign_same_numeric_group_is_not_inherited_ownership(self):
        scope = proc.Scope(ROOT.identity, [WORKER.identity])
        foreign = replace(WORKER, birth=900, ppid=999)
        with self.assertRaises(proc.Uncertain):
            scope.live(processes(ROOT, foreign), {100})
        self.assertEqual(scope.owned[200], WORKER.identity)

    def test_one_reused_birth_does_not_suppress_other_guarded_cleanup(self):
        safe = replace(WORKER, pid=201, birth=21)
        trace = []
        def guarded(identity, number):
            if identity == WORKER.identity:
                raise proc.Uncertain("synthetic reused PID")
            trace.append((identity, number))
        errors = proc.stop_known([WORKER.identity, safe.identity], signal.SIGKILL, guarded)
        self.assertEqual(trace, [(safe.identity, signal.SIGKILL)])
        self.assertEqual(len(errors), 1)
        self.assertIn("reused PID", errors[0])

    def test_bad_admission_preserves_other_independently_owned_births(self):
        scope = proc.Scope(ROOT.identity, [WORKER.identity])
        reused = replace(WORKER, birth=900)
        foreign = replace(WORKER, pid=201, uid=1001)
        safe = replace(WORKER, pid=202, birth=22)
        with self.assertRaises(proc.Uncertain):
            scope.observe(processes(ROOT, reused, foreign, safe))
        self.assertEqual(scope.owned[202], safe.identity)
        self.assertNotIn(201, scope.owned)
        self.assertEqual(scope.owned[200], WORKER.identity)

    def test_stat_parser_and_birth_change_with_fake_procfs(self):
        entry = self.directory / "200"
        entry.mkdir()
        fields = ["0"] * 22
        fields[0], fields[1], fields[2], fields[3] = "S", "100", "200", "100"
        fields[19], fields[21] = "20", "2"
        stat = b"200 (name with ) parentheses) " + " ".join(fields).encode()
        (entry / "stat").write_bytes(stat)
        parsed = proc.read_process(200, self.directory)
        self.assertEqual((parsed.pid, parsed.ppid, parsed.pgid, parsed.sid, parsed.birth, parsed.state),
                         (200, 100, 200, 100, 20, "S"))
        changed = stat.replace(b" 20 ", b" 21 ")
        with patch.object(Path, "read_bytes", side_effect=[stat, changed]), self.assertRaises(proc.Uncertain):
            proc.read_process(200, self.directory)
        (entry / "stat").write_bytes(b"malformed")
        with self.assertRaises((IndexError, ValueError)):
            proc.read_process(200, self.directory)

    def test_snapshot_disappearance_vs_observer_error(self):
        (self.directory / "200").mkdir()
        with patch.object(proc, "read_process", side_effect=FileNotFoundError):
            self.assertEqual(proc.snapshot(self.directory), {})
        for error in (PermissionError("fixture"), ValueError("malformed stat")):
            with patch.object(proc, "read_process", side_effect=error), self.assertRaises(type(error)):
                proc.snapshot(self.directory)

    def test_checkpoint_after_exited_parent_and_escaped_child(self):
        campaign = replace(WORKER, pid=300, ppid=100, birth=30)
        escaped = replace(WORKER, pid=400, ppid=100, pgid=400, sid=400, birth=40)
        scope = proc.Scope(ROOT.identity)
        proc.checkpoint(scope, processes(ROOT, campaign), campaign.identity)
        launches = []
        with self.assertRaises(proc.Uncertain):
            proc.checkpoint(scope, processes(ROOT, campaign, escaped), campaign.identity)
            launches.append("next child")
        self.assertEqual(launches, [])
        proc.checkpoint(scope, processes(ROOT, campaign, replace(escaped, state="Z", rss=0)), campaign.identity)
        with self.assertRaises(proc.Uncertain):
            proc.checkpoint(scope, processes(ROOT, replace(campaign, birth=31)), campaign.identity)


class Observer(Offline):
    def test_readiness_checks_birth_state_and_staleness(self):
        self.token("observer.json")
        proc.atomic_json(self.directory / "memory-ready", {"identity": asdict(ROOT.identity), "monotonic": 10})
        for observed, now in ((ROOT, 11), (replace(ROOT, state="Z", rss=0), 11),
                              (replace(ROOT, birth=11), 11), (ROOT, 16)):
            launches = []
            with patch.object(control, "snapshot", return_value=processes(observed)), \
                    patch.object(control.time, "monotonic", return_value=now):
                if observed == ROOT and now == 11:
                    self.assertEqual(control.observer_health(self.directory, 100), ROOT.identity)
                else:
                    with self.assertRaises(proc.Uncertain):
                        control.observer_health(self.directory, 100)
                        launches.append("stage")
                    self.assertEqual(launches, [])

    def test_zombie_stage_cannot_complete_launch_handshake(self):
        self.token("identity.json")
        with patch.object(control, "snapshot", return_value=processes(replace(ROOT, state="Z", rss=0))), \
                patch.object(control.time, "monotonic", return_value=10), self.assertRaises(proc.Uncertain):
            control.await_ready(self.directory, 100, True)
        self.assertFalse((self.directory / "go").exists())

    def test_io_deadline_is_failure_not_absence(self):
        with self.assertRaises(control.ControlDeadline):
            control.io_deadline()
        trace = []
        def expired(*_):
            control.io_deadline()
        with self.assertRaises(control.ControlDeadline):
            proc.stop_known([WORKER.identity, ROOT.identity], signal.SIGKILL, expired)
            trace.append("continued after global deadline")
        self.assertEqual(trace, [])

    def test_fault_before_readiness_never_publishes_ready(self):
        trace = []
        with self.assertRaises(PermissionError):
            proc.publish_sample(ROOT.identity, 1, 2, 10,
                                Mock(side_effect=PermissionError("flush denied")),
                                lambda _: trace.append("ready"))
        self.assertEqual(trace, [])
        for rss in (12 * 1024 * 1024, 12 * 1024 * 1024 + 1):
            trace = []
            with self.assertRaises(proc.Uncertain):
                proc.publish_sample(ROOT.identity, rss, 12 * 1024 * 1024, 10,
                                    lambda: trace.append("flushed"), lambda _: trace.append("ready"))
            self.assertEqual(trace, ["flushed"])

    def test_first_valid_sample_flushes_then_publishes_identity(self):
        trace = []
        proc.publish_sample(ROOT.identity, 1, 2, 10, lambda: trace.append("flush"), trace.append)
        self.assertEqual(trace, ["flush", {"identity": asdict(ROOT.identity), "monotonic": 10}])

    def test_fault_report_failure_and_timeout_unwind_still_notify(self):
        for point in ("record", "arm", "disarm", None):
            trace = []
            def action(label):
                def execute():
                    trace.append(label)
                    if point == label:
                        raise OSError("synthetic " + point)
                return execute
            if point in {"arm", "disarm"}:
                with self.assertRaises(OSError):
                    proc.report_fault(action("record"), action("notify"), action("arm"), action("disarm"))
            else:
                self.assertEqual(proc.report_fault(action("record"), action("notify"), action("arm"), action("disarm")), 125)
            self.assertEqual(trace[-1], "notify")
        trace = []
        def record_timeout():
            try:
                proc.timeout_fault(lambda: trace.append("early-notify"), "sample/report deadline")
            finally:
                trace.append("unwind")
        proc.report_fault(record_timeout, lambda: trace.append("final-notify"), lambda: None, lambda: None)
        self.assertEqual(trace, ["early-notify", "unwind", "final-notify"])

    def test_planned_shutdown_rejects_no_stale_or_future_sample(self):
        for last in (None, 0, 20):
            with self.assertRaises(proc.Uncertain):
                proc.fresh_sample(last, 10)
        proc.fresh_sample(5, 10)

    def test_shutdown_signals_live_identity_then_accepts_zombie(self):
        self.token("observer.json")
        proc.atomic_json(self.directory / "memory-ready", {"identity": asdict(ROOT.identity), "monotonic": 10})
        terminal = replace(ROOT, state="Z", rss=0)
        trace = []
        with patch.object(control, "snapshot", side_effect=[processes(ROOT), processes(ROOT), processes(terminal)]), \
                patch.object(control.time, "monotonic", return_value=10), \
                patch.object(control, "signal_owned", side_effect=lambda *args: trace.append(args)):
            self.assertEqual(control.stop_observer(self.directory, 100), 0)
        self.assertEqual(trace, [(ROOT.identity, signal.SIGUSR2)])

    def test_stale_or_malformed_heartbeat_still_stops_verified_owned_observer(self):
        self.token("observer.json")
        for text in ('{"identity": {}, "monotonic": 0}', 'malformed'):
            (self.directory / "memory-ready").write_text(text)
            terminal = replace(ROOT, state="Z", rss=0)
            trace = []
            with patch.object(control, "snapshot", side_effect=[processes(ROOT), processes(ROOT), processes(terminal)]), \
                    patch.object(control.time, "monotonic", return_value=10), \
                    patch.object(control, "signal_owned", side_effect=lambda *args: trace.append(args)):
                with self.assertRaises(proc.Uncertain):
                    control.stop_observer(self.directory, 100)
            self.assertEqual(trace, [(ROOT.identity, signal.SIGUSR2)])

    def test_foreign_snapshot_error_still_stops_readable_owned_observer(self):
        self.token("observer.json")
        trace = []
        with patch.object(control, "snapshot", side_effect=PermissionError("foreign entry")), \
                patch.object(control, "read_process", side_effect=[ROOT, replace(ROOT, state="Z", rss=0)]), \
                patch.object(control, "signal_owned", side_effect=lambda *args: trace.append(args)), \
                patch.object(control.time, "monotonic", return_value=10), self.assertRaises(proc.Uncertain):
            control.stop_observer(self.directory, 100)
        self.assertEqual(trace, [(ROOT.identity, signal.SIGUSR2)])

    def test_dead_reused_error_or_stale_observer_cannot_authorize_shutdown(self):
        self.token("observer.json")
        proc.atomic_json(self.directory / "memory-ready", {"identity": asdict(ROOT.identity), "monotonic": 10})
        for observed in ({}, processes(replace(ROOT, state="Z", rss=0)), processes(replace(ROOT, birth=11)), PermissionError("fixture")):
            trace = []
            mock_snapshot = Mock(side_effect=observed) if isinstance(observed, Exception) else Mock(return_value=observed)
            with patch.object(control, "snapshot", mock_snapshot), \
                    patch.object(control, "signal_owned", side_effect=lambda *args: trace.append(args)), \
                    patch.object(control.time, "monotonic", return_value=10):
                with self.assertRaises((proc.Uncertain, PermissionError)):
                    control.stop_observer(self.directory, 100)
            self.assertEqual(trace, [])


class Custody(Offline):
    def complete(self, members):
        self.token("identity.json")
        proc.atomic_json(self.directory / "complete.json", {
            "identity": asdict(ROOT.identity), "owner": asdict(OWNER.identity), "clean": True,
            "members": [asdict(item) for item in members]})

    def test_zombie_only_completion_retains_evidence_and_never_signals(self):
        self.complete([ROOT.identity, WORKER.identity])
        rows = processes(replace(ROOT, state="Z", rss=0), replace(WORKER, state="Z", rss=0))
        with patch.object(control, "snapshot", return_value=rows), patch.object(control, "signal_owned") as signals:
            self.assertEqual(control.stop_stage(self.directory, 100), 0)
            signals.assert_not_called()
        evidence = [json.loads(line) for line in (self.directory / "processes.jsonl").read_text().splitlines()]
        self.assertEqual([row["status"] for row in evidence], ["zombie", "zombie"])
        self.assertEqual([row["observed"]["rss"] for row in evidence], [0, 0])

    def test_supervisor_disappearance_without_footer_is_uncertain(self):
        self.token("identity.json")
        with patch.object(control, "snapshot", return_value={}), self.assertRaises(proc.Uncertain):
            control.stop_stage(self.directory, 100)

    def test_missing_footer_cleans_safe_ledger_targets_but_remains_uncertain(self):
        self.token("identity.json")
        safe = replace(WORKER, pid=201, birth=21)
        ledger = self.directory / "processes.jsonl"
        ledger.write_text("\n".join(json.dumps({"identity": asdict(item)})
                                   for item in (ROOT.identity, WORKER.identity, safe.identity)) + "\npartial")
        before = ledger.read_bytes()
        trace = []
        def guarded(identity, number):
            if identity == WORKER.identity:
                raise proc.Uncertain("PID reused")
            trace.append((identity, number))
        with patch.object(control, "snapshot", return_value={}), \
                patch.object(control, "signal_owned", side_effect=guarded), self.assertRaises(proc.Uncertain):
            control.stop_stage(self.directory, 100)
        self.assertEqual(trace, [(safe.identity, signal.SIGKILL)])
        self.assertEqual(ledger.read_bytes(), before)

    def test_supervisor_signal_validation_failure_still_cleans_other_known_births(self):
        self.token("identity.json")
        proc.atomic_json(self.directory / "payload.json", {"identity": asdict(WORKER.identity)})
        trace = []
        def guarded(identity, number):
            if identity == ROOT.identity:
                raise proc.Uncertain("supervisor identity changed before pidfd signal")
            trace.append((identity, number))
        with patch.object(control, "read_process", return_value=ROOT), \
                patch.object(control, "signal_owned", side_effect=guarded), self.assertRaises(proc.Uncertain):
            control.stop_stage(self.directory, 100)
        self.assertEqual(trace, [(WORKER.identity, signal.SIGKILL)])

    def test_malformed_footer_still_attempts_known_payload_cleanup(self):
        self.token("identity.json")
        proc.atomic_json(self.directory / "payload.json", {"identity": asdict(WORKER.identity)})
        (self.directory / "complete.json").write_text("partial corrupt footer")
        with patch.object(control, "read_process", return_value=replace(ROOT, state="Z", rss=0)), \
                patch.object(control, "signal_owned") as signals, self.assertRaises(proc.Uncertain):
            control.stop_stage(self.directory, 100)
        signals.assert_called_once_with(WORKER.identity, signal.SIGKILL)

    def test_live_worker_or_pid_reuse_prevents_clean_completion(self):
        self.complete([ROOT.identity, WORKER.identity])
        for worker in (WORKER, replace(WORKER, birth=21)):
            trace = []
            def guarded(identity, number):
                if proc.match(identity, processes(worker)) == "live":
                    trace.append((identity, number))
            with patch.object(control, "snapshot", return_value=processes(replace(ROOT, state="Z", rss=0), worker)), \
                    patch.object(control, "signal_owned", side_effect=guarded), self.assertRaises(proc.Uncertain):
                control.stop_stage(self.directory, 100)
            self.assertEqual(trace, [(WORKER.identity, signal.SIGKILL)] if worker == WORKER else [])

    def test_validated_supervisor_receives_only_term_then_terminal_check(self):
        self.complete([ROOT.identity])
        zombie = processes(replace(ROOT, state="Z", rss=0))
        with patch.object(control, "snapshot", side_effect=[processes(ROOT), zombie, zombie]), \
                patch.object(control, "signal_owned") as signals:
            self.assertEqual(control.stop_stage(self.directory, 100), 0)
        signals.assert_called_once_with(ROOT.identity, signal.SIGTERM)

    def test_supervisor_owns_reaps_and_logs_zombies_without_real_kernel_calls(self):
        for survivor in (False, True):
            with self.subTest(survivor=survivor):
                directory = self.directory / str(survivor)
                directory.mkdir()
                (directory / "go").touch()
                owner_path = directory / "owner.json"
                proc.atomic_json(owner_path, {"identity": asdict(OWNER.identity)})
                observer = replace(ROOT, pid=500, ppid=10, birth=50)
                proc.atomic_json(directory / "observer.json", {"identity": asdict(observer.identity)})
                proc.atomic_json(directory / "memory-ready", {"identity": asdict(observer.identity), "monotonic": 10})
                payload = replace(WORKER, state="Z", rss=0)
                escaped = replace(WORKER, pid=201, ppid=100, pgid=201, sid=201,
                                  birth=21, state="S" if survivor else "Z", rss=100 if survivor else 0)
                current = processes(OWNER, ROOT, observer, payload, escaped)
                clock = [10.]
                trace = []
                child = SimpleNamespace(pid=200, returncode=None)
                def fake_snapshot():
                    return dict(current)
                def fake_waitid(*_):
                    children = [item for item in current.values() if item.ppid == 100]
                    for item in children:
                        if item.state == "Z":
                            trace.append(("peek", item.pid))
                            return SimpleNamespace(si_pid=item.pid)
                    if children:
                        return None
                    raise ChildProcessError
                def fake_waitpid(pid, options):
                    self.assertEqual(options, 0)
                    self.assertEqual(current[pid].state, "Z")
                    evidence = (directory / "processes.jsonl").read_text()
                    self.assertIn('"before_reap": true', evidence)
                    trace.append(("reap", pid))
                    del current[pid]
                    return pid, 0
                def fake_signal(identity, number):
                    self.assertEqual(identity, escaped.identity)
                    trace.append(("signal", identity.pid, number))
                    current[identity.pid] = replace(current[identity.pid], state="Z", rss=0)
                def sleep(seconds):
                    clock[0] += seconds
                with patch.object(control, "read_process", side_effect=lambda pid: current[pid]), \
                        patch.object(control, "snapshot", side_effect=fake_snapshot), \
                        patch.object(control.os, "getpid", return_value=100), \
                        patch.object(control.os, "waitid", side_effect=fake_waitid), \
                        patch.object(control.os, "waitpid", side_effect=fake_waitpid), \
                        patch.object(control.ctypes, "CDLL", return_value=SimpleNamespace(prctl=lambda *_: 0)), \
                        patch.object(control.subprocess, "Popen", return_value=child), \
                        patch.object(control.signal, "signal"), patch.object(control.signal, "alarm"), \
                        patch.object(control, "signal_owned", side_effect=fake_signal), \
                        patch.object(control.time, "sleep", side_effect=sleep), \
                        patch.object(control.time, "monotonic", side_effect=lambda: clock[0]):
                    result = control.stage(directory, owner_path, "10s", ["offline-payload"])
                self.assertEqual(result, 125 if survivor else 0)
                expected = [("peek", 200), ("reap", 200)]
                if survivor:
                    expected.append(("signal", 201, signal.SIGTERM))
                self.assertEqual(trace, expected + [("peek", 201), ("reap", 201)])
                footer = json.loads((directory / "complete.json").read_text())
                self.assertTrue(footer["clean"])
                self.assertEqual(footer["survivors"], survivor)
                self.assertEqual(footer["command_status"], 0)

    def test_post_request_snapshot_clears_pre_request_live_child(self):
        campaign = replace(WORKER, pid=300, ppid=100, birth=30)
        scope = proc.Scope(ROOT.identity)
        scope.observe(processes(ROOT, campaign, WORKER))
        # The same ledger must allow only the fresh post-request observation.
        request = self.directory / "checkpoint.request"
        request.write_text("nonce 300 30 1000\n")
        with patch.object(control, "snapshot", return_value=processes(ROOT, campaign)):
            control.serve_checkpoint(self.directory, scope)
        self.assertEqual(json.loads((self.directory / "checkpoint.reply").read_text()), {"nonce": "nonce", "ok": True})
        request.write_text("new-nonce 300 30 1000\n")
        with patch.object(control, "snapshot", return_value=processes(ROOT, campaign, replace(WORKER, ppid=100, sid=200))), \
                self.assertRaises(proc.Uncertain):
            control.serve_checkpoint(self.directory, scope)
        self.assertNotIn("new-nonce", (self.directory / "checkpoint.reply").read_text())


class ImagesAndSource(Offline):
    def test_images_use_current_output_normal_image_and_require_all_files(self):
        images = proc.image_paths(self.directory)
        self.assertEqual(images, {label: self.directory / label / "build/scanner/images/jdk" for label in ("base", "candidate")})
        for image in images.values():
            with self.assertRaises(proc.Uncertain):
                proc.check_image(image)
            for relative in ("release", "lib/modules", "lib/server/libjvm.so", "bin/java"):
                path = image / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text("offline placeholder; never executed\n")
            with self.assertRaises(proc.Uncertain):
                proc.check_image(image)
            (image / "bin/java").chmod(0o700)
            proc.check_image(image)
            (image / "lib/modules").unlink()
            with self.assertRaises(proc.Uncertain):
                proc.check_image(image)

    def test_every_runner_consumer_uses_shared_map_and_no_kill_zero(self):
        source = (PACKET / "run-linux.sh").read_text()
        self.assertIn('make CONF=scanner JOBS=4 jdk images', source)
        self.assertNotIn('build/scanner/jdk', source)
        self.assertNotIn('build/scanner/images/jdk', source)  # Only Python map defines it.
        self.assertNotIn('kill -0', source)
        self.assertNotIn('ACTIVE_PGID', source)
        self.assertIn('check-image "$image"', source)
        self.assertIn('"$BASE_JDK" "$CANDIDATE_JDK"', source)
        self.assertLess(source.index('check-image "$image"'), source.index('sha256sum "$image/lib/modules"'))
        self.assertIn('if [[ $checkout == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi', source)

    def test_observer_import_has_no_process_or_signal_side_effects(self):
        observer_spec = importlib.util.spec_from_file_location("scanner_watch_memory", PACKET / "watch-memory.py")
        observer_module = importlib.util.module_from_spec(observer_spec)
        with patch.object(signal, "alarm", side_effect=AssertionError("import armed a real alarm")), \
                patch.object(signal, "signal", side_effect=AssertionError("import installed a real handler")):
            observer_spec.loader.exec_module(observer_module)
        self.assertEqual(observer_module.LIMIT_KIB, 12 * 1024 * 1024)

    def test_invalid_checkpoints_leave_existing_raw_and_failed_evidence_untouched(self):
        raw = self.directory / "raw.csv"
        failed = self.directory / "failed-attempt"
        failed.mkdir()
        evidence = failed / "RESULT.md"
        raw.write_bytes(b"partial,raw,row\n")
        evidence.write_bytes(b"INCOMPLETE: no measurements\n")
        before = {path: path.read_bytes() for path in (raw, evidence)}
        with self.assertRaises(proc.Uncertain):
            proc.checkpoint(proc.Scope(ROOT.identity), processes(ROOT, WORKER), WORKER.identity.__class__(200, 21, 1000))
        self.assertEqual({path: path.read_bytes() for path in before}, before)


if __name__ == "__main__":
    unittest.main()
