"""Deterministic offline fixtures. No real procfs, processes, waits or signals.

Run from any checkout: python3 -m unittest discover -s
doc/scanner-qualification/tests -v
"""
from dataclasses import asdict, replace
import hashlib
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
snapshot_backend = proc.snapshot  # Used only with an explicit synthetic proc root.
import image_manifest
import continuation
remaining_budget = continuation.remaining

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
        for module in (control,continuation,proc):
            guard = patch.object(module, "snapshot", side_effect=AssertionError("real procfs forbidden"))
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
        def evidence():
            def poll(pid):
                try:
                    item = control.read_process(pid)
                except (FileNotFoundError, ProcessLookupError, KeyError):
                    return True
                return item.state in ("X", "Z") and item.rss == 0
            return proc.PidfdEvidence(open_fd=lambda pid, flags: pid,
                    read=lambda pid: control.read_process(pid), poll=poll, close=lambda fd: None,
                    send=lambda pid, number, *_: control.signal_owned(control.read_process(pid).identity, number))
        guard = patch.object(control, "PidfdEvidence", side_effect=evidence)
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
                    result = proc.signal_owned(WORKER.identity, signal.SIGTERM, read, open_fd, send, close,
                                               poll=lambda _: name in {"zombie", "disappeared"})
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
            self.assertEqual(snapshot_backend(self.directory), {})
        for error in (PermissionError("fixture"), ValueError("malformed stat")):
            with patch.object(proc, "read_process", side_effect=error), self.assertRaises(type(error)):
                snapshot_backend(self.directory)

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


class PidfdExit(Offline):
    def evidence(self, current, ready, trace):
        def read(pid):
            if pid not in current:
                raise FileNotFoundError("offline disappearance")
            return current[pid]
        def opened(pid, flags):
            self.assertEqual(flags, 0)
            trace.append(("open", pid))
            return pid + 1000
        return proc.PidfdEvidence(open_fd=opened, read=read,
                poll=lambda fd: fd - 1000 in ready, close=lambda fd:trace.append(("close", fd)),
                send=lambda fd, number, *_:trace.append(("signal", fd, number)))

    def test_final_stat_fields_are_one_buffer_and_raw_exit_is_not_liveness(self):
        entry=self.directory / "200"
        entry.mkdir()
        def raw(state, ppid, pgid, sid, rss):
            fields=["0"]*22
            fields[0:4]=[state,str(ppid),str(pgid),str(sid)]
            fields[19],fields[21]="20",str(rss)
            return b"200 (offline name) "+" ".join(fields).encode()
        with patch.object(Path,"read_bytes",side_effect=[raw("S",100,200,100,2),raw("X",0,-1,-1,0)]):
            item=proc.read_process(200,self.directory)
        self.assertEqual((item.state,item.ppid,item.pgid,item.sid,item.birth,item.rss),("X",0,-1,-1,20,0))
        with self.assertRaises(proc.Uncertain): proc.state(item)

    def test_owned_exit_requires_positive_held_proof_and_preserves_raw_fields(self):
        current=processes(ROOT,WORKER); ready=set(); trace=[]
        with self.evidence(current,ready,trace) as exits:
            scope=proc.Scope(ROOT.identity,exits=exits)
            scope.observe(current)
            current[200]=replace(WORKER,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
            with self.assertRaises(proc.Uncertain): scope.observe(current)
            ready.add(200)
            self.assertEqual(scope.observe(current)[200],"exited")
            self.assertEqual(scope.exits.proofs[WORKER.identity]["source"],"held_pidfd_exit")
            control.record(self.directory/"exit.jsonl",scope,current,{})
            row=next(json.loads(line) for line in (self.directory/"exit.jsonl").read_text().splitlines()
                     if json.loads(line)["identity"]["pid"]==200)
            self.assertEqual(row["observed"]["state"],"X")
            self.assertEqual(row["status"],"exited")
            self.assertEqual(row["exit_witness"]["identity"],asdict(WORKER.identity))
            del current[200]
            control.record(self.directory/"gone.jsonl",scope,current,{})
            gone=next(json.loads(line) for line in (self.directory/"gone.jsonl").read_text().splitlines()
                      if json.loads(line)["identity"]["pid"]==200)
            self.assertNotIn("observed",gone)
            self.assertIn("exit_witness",gone)
            self.assertEqual(scope.live(current,{100}),[])
        self.assertEqual(trace.count(("open",200)),1)
        self.assertEqual(trace.count(("close",1200)),1)

    def test_unrelated_x_is_not_admitted_and_unknown_descendant_still_fails(self):
        foreign=replace(WORKER,pid=999,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
        current=processes(ROOT,foreign); trace=[]
        with self.evidence(current,set(),trace) as exits:
            scope=proc.Scope(ROOT.identity,exits=exits)
            self.assertEqual(scope.observe(current),{100:"live"})
            self.assertNotIn(999,scope.owned)
            self.assertNotIn(("open",999),trace)
            current[200]=replace(WORKER,state="X",rss=0)
            with self.assertRaises(proc.Uncertain): scope.observe(current)
            self.assertNotIn(200,scope.owned)
            self.assertNotIn(("open",200),trace)

    def test_poll_errors_unknown_state_and_identity_mismatch_never_allow_exit(self):
        for change in (replace(WORKER,state="?",rss=0),replace(WORKER,state="X",rss=1),
                       replace(WORKER,birth=21),replace(WORKER,uid=1001)):
            current=processes(WORKER); trace=[]
            with self.evidence(current,set(),trace) as exits:
                self.assertEqual(exits.status(WORKER.identity,WORKER),"live")
                current[200]=change
                with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,change)
            self.assertFalse(any(row[0]=="signal" for row in trace))
        current=processes(WORKER); trace=[]
        with self.evidence(current,set(),trace) as exits:
            exits.status(WORKER.identity,WORKER)
            exits.poll=Mock(side_effect=PermissionError("offline poll failure"))
            with self.assertRaises(PermissionError): exits.status(WORKER.identity,WORKER)
        self.assertEqual(trace.count(("close",1200)),1)

    def test_pidfd_poll_masks_are_positive_exit_only(self):
        for events, expected in (([],False),([(7,proc.select.POLLIN)],True),([(7,proc.select.POLLHUP)],True)):
            poller=SimpleNamespace(register=Mock(),poll=Mock(return_value=events))
            with patch.object(proc.select,"poll",return_value=poller): self.assertEqual(proc.pidfd_exited(7),expected)
            poller.register.assert_called_once_with(7,proc.select.POLLIN)
        for events in ([(7,proc.select.POLLERR)],[(7,proc.select.POLLNVAL)],[(8,proc.select.POLLIN)],[(7,0)]):
            with patch.object(proc.select,"poll",return_value=SimpleNamespace(register=Mock(),poll=Mock(return_value=events))), \
                    self.assertRaises(proc.Uncertain): proc.pidfd_exited(7)

    def test_missing_proc_or_zombie_leader_needs_process_exit_proof(self):
        current=processes(WORKER); trace=[]; ready=set()
        with self.evidence(current,ready,trace) as exits:
            exits.status(WORKER.identity,WORKER)
            with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,replace(WORKER,state="Z",rss=0))
            del current[200]
            with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,None)
            ready.add(200)
            self.assertEqual(exits.status(WORKER.identity,None),"disappeared")
            self.assertEqual(exits.signal(WORKER.identity,signal.SIGKILL),"exited")
        self.assertFalse(any(row[0]=="signal" for row in trace))

    def test_admission_revalidates_birth_and_releases_on_error(self):
        trace=[]
        exits=self.evidence(processes(replace(WORKER,birth=21)),set(),trace)
        with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,WORKER)
        self.assertEqual(trace,[("open",200),("close",1200)])
        self.assertFalse(exits.handles)
        trace=[]
        with self.evidence({},set(),trace) as exits:
            with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,None)
        self.assertEqual(trace,[("open",200),("close",1200)])

    def test_fresh_admission_state_cannot_be_hidden_by_stale_live_sample(self):
        for item in (replace(WORKER,state="?",rss=0),replace(WORKER,rss=-1)):
            trace=[]
            with self.evidence(processes(item),{200},trace) as exits:
                with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,WORKER)
                self.assertFalse(exits.proofs)
            self.assertEqual(trace,[("open",200),("close",1200)])
        for state in ("X","Z"):
            current=processes(replace(WORKER,state=state,rss=0)); trace=[]; ready=set()
            with self.evidence(current,ready,trace) as exits:
                with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,WORKER)
                with self.assertRaises(proc.Uncertain): exits.status(WORKER.identity,WORKER)
                self.assertIn(WORKER.identity,exits.handles)
                self.assertEqual(exits.signal(WORKER.identity,signal.SIGKILL),"signaled")
                ready.add(200)
                self.assertEqual(exits.status(WORKER.identity,WORKER),"exited")
            self.assertEqual(trace.count(("close",1200)),1)

    def test_exited_parent_stale_row_cannot_admit_new_child(self):
        current=processes(ROOT,WORKER); trace=[]; ready=set()
        with self.evidence(current,ready,trace) as exits:
            scope=proc.Scope(ROOT.identity,exits=exits)
            scope.observe(current)
            ready.add(200)
            child=replace(WORKER,pid=300,ppid=200,birth=30)
            for item in (child,replace(child,state="X",rss=0),replace(child,uid=1001),replace(child,birth=1)):
                current[300]=item
                self.assertEqual(scope.observe(current)[200],"exited")
                self.assertNotIn(300,scope.owned)
            self.assertNotIn(("open",300),trace)
            self.assertFalse(any(row[0]=="signal" for row in trace))

    def test_parent_terminal_admission_uncertainty_is_sticky_across_stale_rows(self):
        current=processes(ROOT,replace(WORKER,state="X",rss=0)); trace=[]
        with self.evidence(current,set(),trace) as exits:
            scope=proc.Scope(ROOT.identity,[WORKER.identity],exits=exits)
            child=replace(WORKER,pid=300,ppid=200,birth=30)
            stale=processes(ROOT,WORKER,child)
            for _ in range(2):
                with self.assertRaises(proc.Uncertain): scope.observe(stale)
                self.assertNotIn(300,scope.owned)
            self.assertNotIn(("open",300),trace)

    def test_terminal_handles_close_early_and_held_signal_never_retargets_reused_pid(self):
        current=processes(ROOT); ready=set(); trace=[]
        with self.evidence(current,ready,trace) as exits:
            scope=proc.Scope(ROOT.identity,exits=exits)
            for number in range(64):
                item=replace(WORKER,pid=200+number,birth=20+number)
                current[item.pid]=item
                scope.observe(current)
                self.assertLessEqual(len(exits.handles),2)
                ready.add(item.pid)
                current[item.pid]=replace(item,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
                scope.observe(current)
                del current[item.pid]
            self.assertEqual(len(exits.handles),1)
            current[200]=replace(WORKER,birth=900)
            with self.assertRaises(proc.Uncertain): scope.observe(current)
            self.assertEqual(exits.signal(WORKER.identity,signal.SIGKILL),"exited")
            self.assertEqual(len([row for row in trace if row==("open",200)]),1)
        self.assertFalse(exits.handles)
        self.assertFalse(any(row[0]=="signal" for row in trace))

    def test_signal_uses_held_handle_during_unknown_exit_and_fresh_lookup_stays_strict(self):
        current=processes(WORKER); trace=[]
        with self.evidence(current,set(),trace) as exits:
            exits.status(WORKER.identity,WORKER)
            current[200]=replace(WORKER,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
            self.assertEqual(exits.signal(WORKER.identity,signal.SIGKILL),"signaled")
            self.assertIn(("signal",1200,signal.SIGKILL),trace)
            self.assertEqual(trace.count(("open",200)),1)
        for ready in (False,True):
            sends=[]; closes=[]
            item=replace(WORKER,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
            action=lambda:proc.signal_owned(WORKER.identity,signal.SIGKILL,read=lambda _:item,
                    open_fd=lambda *_:7,send=lambda *args:sends.append(args),close=closes.append,poll=lambda _:ready)
            if ready: self.assertEqual(action(),"exited")
            else:
                with self.assertRaises(proc.Uncertain): action()
            self.assertEqual(sends,[])
            self.assertEqual(closes,[7])
        with self.assertRaises(proc.Uncertain):
            proc.signal_owned(WORKER.identity,signal.SIGKILL,read=lambda _:replace(item,birth=900),
                    open_fd=lambda *_:7,send=lambda *_:self.fail("unrelated signal"),close=lambda _:None,poll=lambda _:True)

    def test_fresh_zombie_or_missing_proc_nonready_is_uncertain(self):
        for missing in (False,True):
            trace=[]
            def read(_):
                if missing: raise FileNotFoundError("offline exit gap")
                return replace(WORKER,state="Z",rss=0)
            with self.assertRaises(proc.Uncertain):
                proc.signal_owned(WORKER.identity,signal.SIGKILL,read=read,open_fd=lambda *_:7,
                        send=lambda *_:self.fail("uncertain fallback signal"),close=trace.append,poll=lambda _:False)
            self.assertEqual(trace,[7])

    def test_close_failure_attempts_all_owned_descriptors_once(self):
        current=processes(ROOT,WORKER); trace=[]
        exits=self.evidence(current,set(),trace)
        exits.status(ROOT.identity,ROOT); exits.status(WORKER.identity,WORKER)
        def close(fd):
            trace.append(("close",fd))
            if fd==1100: raise OSError("offline close error")
        exits.close_fd=close
        with self.assertRaises(proc.Uncertain): exits.close()
        self.assertEqual([row for row in trace if row[0]=="close"],[("close",1100),("close",1200)])
        self.assertFalse(exits.handles)

    def test_checkpoint_rejects_a_requester_with_positive_exit_proof(self):
        current=processes(ROOT,WORKER); ready=set(); trace=[]
        with self.evidence(current,ready,trace) as exits:
            scope=proc.Scope(ROOT.identity,exits=exits)
            scope.observe(current)
            ready.add(200)  # The old S row is stale; the kernel handle proves exit.
            with self.assertRaises(proc.Uncertain): proc.checkpoint(scope,current,WORKER.identity)

    def exercise_rss_observer(self, exited_rss=None):
        observer_spec=importlib.util.spec_from_file_location("offline_watch_exit",PACKET/"watch-memory.py")
        watch=importlib.util.module_from_spec(observer_spec); observer_spec.loader.exec_module(watch)
        from contextlib import ExitStack
        outer=replace(OWNER,pid=1,ppid=0,birth=0,rss=20)
        observer=replace(ROOT,pid=500,ppid=10,birth=50,rss=30)
        worker=replace(WORKER,ppid=10)
        foreign=replace(WORKER,pid=999,ppid=0,state="X",rss=0,pgid=-1,sid=-1)
        current=processes(OWNER,outer,observer,worker,foreign)
        clock=[10.]; sleeps=[0]; ready=set(); trace=[]; handlers={}
        self.token("owner.json",OWNER.identity)
        (self.directory/"active-stage").write_text("\n")
        def sleep(_):
            sleeps[0]+=1; clock[0]+=1
            if sleeps[0]==1:
                current[200]=(replace(worker,state="X",rss=0,ppid=0,pgid=-1,sid=-1)
                              if exited_rss is None else replace(worker,rss=exited_rss))
                ready.add(200)
            else: handlers[signal.SIGUSR2]()
        with self.evidence(current,ready,trace) as exits, ExitStack() as cleanup, \
                patch.object(watch,"read_process",side_effect=lambda pid:current[pid]), \
                patch.object(watch,"snapshot",side_effect=lambda:dict(current)), \
                patch.object(watch.os,"getpid",return_value=500),patch.object(watch.os,"getppid",return_value=10), \
                patch.object(watch.os,"pidfd_open",return_value=99),patch.object(watch.os,"close"), \
                patch.object(watch.os,"sched_getaffinity",return_value={0,1}),patch.object(watch.os,"sched_setaffinity"), \
                patch.object(watch.signal,"signal",side_effect=lambda number,handler:handlers.update({number:handler})), \
                patch.object(watch.signal,"alarm"),patch.object(watch.time,"monotonic",side_effect=lambda:clock[0]), \
                patch.object(watch.signal,"pidfd_send_signal") as notify, \
                patch.object(watch.time,"monotonic_ns",side_effect=lambda:int(clock[0]*1e9)), \
                patch.object(watch.time,"sleep",side_effect=sleep),patch.dict(os.environ,{"PERF_CPU":"0"}), \
                patch.object(watch.sys,"argv",["watch-memory.py",str(self.directory/"owner.json"),str(self.directory)]):
            if exited_rss is None:
                with self.assertRaises(SystemExit) as result: watch.observe(exits,cleanup)
                self.assertEqual(result.exception.code,0)
            else:
                self.assertEqual(watch.observe(exits,cleanup),125)
                notify.assert_called_once_with(99,signal.SIGUSR1,None,0)
        import csv
        with (self.directory/"memory-members.csv").open() as stream: rows=list(csv.DictReader(stream))
        owned=[row for row in rows if row["pid"]=="200"]
        self.assertEqual([row["classification"] for row in owned],["live","exited"])
        self.assertEqual(owned[-1]["state"],"X" if exited_rss is None else "S")
        self.assertFalse(any(row["pid"]=="999" for row in rows))
        proof=json.loads((self.directory/"memory-exits.jsonl").read_text())
        self.assertEqual(proof["identity"],asdict(worker.identity))
        self.assertEqual(proof["source"],"held_pidfd_exit")

    def test_rss_observer_logs_owned_x_exit_and_ignores_unrelated_raw_x(self):
        self.exercise_rss_observer()

    def test_exit_after_rss_read_cannot_erase_over_limit_sample_or_publish_health(self):
        self.exercise_rss_observer(12*1024*1024)
        import csv
        with (self.directory/"memory.csv").open() as stream: rows=list(csv.DictReader(stream))
        self.assertGreaterEqual(int(rows[-1]["rss_kib"]),12*1024*1024)
        self.assertEqual(rows[-1]["rss_kib"],rows[-1]["observed_peak_kib"])
        self.assertEqual(json.loads((self.directory/"memory-ready").read_text())["monotonic"],10.)
        self.assertIn("reached stop limit",(self.directory/"resource-stop.txt").read_text())


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
        current = [ROOT]
        def send(*args):
            trace.append(args)
            current[0] = terminal
        with patch.object(control, "snapshot", side_effect=lambda: processes(current[0])), \
                patch.object(control.time, "monotonic", return_value=10), \
                patch.object(control, "signal_owned", side_effect=send):
            self.assertEqual(control.stop_observer(self.directory, 100), 0)
        self.assertEqual(trace, [(ROOT.identity, signal.SIGUSR2)])

    def test_stale_or_malformed_heartbeat_still_stops_verified_owned_observer(self):
        self.token("observer.json")
        for text in ('{"identity": {}, "monotonic": 0}', 'malformed'):
            (self.directory / "memory-ready").write_text(text)
            terminal = replace(ROOT, state="Z", rss=0)
            trace = []
            current = [ROOT]
            def send(*args):
                trace.append(args)
                current[0] = terminal
            with patch.object(control, "snapshot", side_effect=lambda: processes(current[0])), \
                    patch.object(control.time, "monotonic", return_value=10), \
                    patch.object(control, "signal_owned", side_effect=send):
                with self.assertRaises(proc.Uncertain):
                    control.stop_observer(self.directory, 100)
            self.assertEqual(trace, [(ROOT.identity, signal.SIGUSR2)])

    def test_foreign_snapshot_error_still_stops_readable_owned_observer(self):
        self.token("observer.json")
        trace = []
        current = [ROOT]
        def send(*args):
            trace.append(args)
            current[0] = replace(ROOT, state="Z", rss=0)
        with patch.object(control, "snapshot", side_effect=PermissionError("foreign entry")), \
                patch.object(control, "read_process", side_effect=lambda _:current[0]), \
                patch.object(control, "signal_owned", side_effect=send), \
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
        current = [ROOT]
        def send(*_):
            current[0] = replace(ROOT, state="Z", rss=0)
        with patch.object(control, "snapshot", side_effect=lambda:processes(current[0])), \
                patch.object(control, "signal_owned", side_effect=send) as signals:
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


class BuildDrain(Offline):
    def exercise(self, case, build=True, duration="90m"):
        directory = self.directory / case
        directory.mkdir()
        (directory / "go").touch()
        proc.atomic_json(directory / "owner.json", {"identity": asdict(OWNER.identity)})
        observer = replace(ROOT, pid=500, ppid=10, birth=50)
        proc.atomic_json(directory / "observer.json", {"identity": asdict(observer.identity)})
        proc.atomic_json(directory / "memory-ready", {"identity": asdict(observer.identity), "monotonic": 10})
        server = replace(WORKER, pid=201, ppid=100, pgid=201, sid=201, birth=21)
        current = processes(OWNER, ROOT, observer)
        snapshots = [0]
        clock, trace, handlers = [10.], [], {}
        child = SimpleNamespace(pid=200, returncode=None)

        def launch(command, **__):
            trace.append(("launch", clock[0], command))
            running = case in ("timeout-exit0", "exit-race")
            current.update(processes(replace(WORKER, state="S" if running else "Z", rss=1024 if running else 0)))
            if case != "nonzero-empty":
                current[server.pid] = replace(server, ppid=200) if case == "exit-race" else server
            return child

        def handler(number, callback):
            handlers[number] = callback
            if case == "stopped-before-launch" and number == signal.SIGINT:
                handlers[signal.SIGTERM]()

        def observe():
            snapshots[0] += 1
            if case == "owner-lost-before-launch" and snapshots[0] == 2:
                del current[OWNER.pid]
            return dict(current)

        def waitid(*_):
            children = [item for item in current.values() if item.ppid == ROOT.pid]
            for item in children:
                if item.state == "Z":
                    return SimpleNamespace(si_pid=item.pid)
            if children:
                return None
            raise ChildProcessError

        def waitpid(pid, options):
            self.assertEqual(options, 0)
            self.assertEqual(current[pid].state, "Z")
            trace.append(("reap", pid, clock[0]))
            del current[pid]
            return pid, 256 if case.startswith("nonzero") and pid == 200 else 0

        def send(identity, number):
            item = current.get(identity.pid)
            if item is None:
                return "disappeared"
            status = proc.match(identity, {item.pid: item})
            if status != "live":
                return status
            trace.append(("signal", identity.pid, number, clock[0]))
            if case != "unkillable" and (case != "persistent" or number == signal.SIGKILL):
                current[identity.pid] = replace(item, state="Z", rss=0)
            return "signaled"

        def sleep(seconds):
            clock[0] += 7 if case == "late-empty" else seconds
            if case in ("normal", "strict", "late-empty") and clock[0] >= 15 and server.pid in current:
                current[server.pid] = replace(server, state="Z", rss=0)
            if case == "abort" and clock[0] >= 12:
                handlers[signal.SIGTERM]()
            if case == "observer-fault" and clock[0] >= 12:
                current[observer.pid] = replace(observer, state="Z", rss=0)
            if case == "exit-race":
                if clock[0] >= 12:
                    current[server.pid] = replace(server, state="X", rss=0, ppid=0, pgid=-1, sid=-1)
                if clock[0] >= 13 and 200 in current:
                    current[200] = replace(WORKER, state="Z", rss=0)
            proc.atomic_json(directory / "memory-ready", {"identity": asdict(observer.identity), "monotonic": clock[0]})

        caught = None
        result = None
        with patch.object(control, "read_process", side_effect=lambda pid: current[pid]), \
                patch.object(control, "snapshot", side_effect=observe), \
                patch.object(control.os, "getpid", return_value=ROOT.pid), \
                patch.object(control.os, "waitid", side_effect=waitid), \
                patch.object(control.os, "waitpid", side_effect=waitpid), \
                patch.object(control.ctypes, "CDLL", return_value=SimpleNamespace(prctl=lambda *_: 0)), \
                patch.object(control.subprocess, "Popen", side_effect=launch), \
                patch.object(control.signal, "signal", side_effect=handler), \
                patch.object(control.signal, "alarm"), patch.object(control, "signal_owned", side_effect=send), \
                patch.object(control.time, "sleep", side_effect=sleep), \
                patch.object(control.time, "monotonic", side_effect=lambda: clock[0]), \
                patch.object(control.sys, "stderr", new=Mock()):
            try:
                result = control.stage(directory, directory / "owner.json", duration, ["offline-make"], build=build)
            except proc.Uncertain as error:
                caught = error
        footer = json.loads((directory / "complete.json").read_text()) if (directory / "complete.json").exists() else None
        return result, footer, trace, clock[0], caught

    def test_normal_five_second_server_shutdown_drains_without_signal(self):
        result, footer, trace, now, caught = self.exercise("normal")
        self.assertIsNone(caught)
        self.assertEqual(result, 0)
        self.assertTrue(footer["clean"])
        self.assertFalse(footer["survivors"])
        self.assertFalse(footer["drain_deadline_missed"])
        self.assertIsNone(footer["cleanup_started_monotonic"])
        self.assertGreaterEqual(footer["drain_verified_monotonic"] - footer["drain_started_monotonic"], 5)
        self.assertLessEqual(now, 16)
        self.assertEqual([event[:2] for event in trace if event[0] != "launch"], [("reap", 200), ("reap", 201)])

    def test_persistent_worker_fails_and_gets_full_term_kill_budget(self):
        result, footer, trace, now, caught = self.exercise("persistent")
        self.assertIsNone(caught)
        self.assertEqual(result, 125)
        self.assertTrue(footer["clean"])
        self.assertTrue(footer["survivors"])
        self.assertTrue(footer["drain_deadline_missed"])
        signals = [event for event in trace if event[0] == "signal"]
        self.assertEqual([(event[1], event[2]) for event in signals], [(201, signal.SIGTERM), (201, signal.SIGKILL)])
        self.assertGreaterEqual(signals[0][3], 16)
        self.assertGreaterEqual(signals[1][3] - signals[0][3], 10)
        self.assertLess(now - signals[0][3], 12)

    def test_unkillable_worker_never_gets_clean_footer_or_second_budget(self):
        result, footer, trace, now, caught = self.exercise("unkillable")
        self.assertIsInstance(caught, proc.Uncertain)
        self.assertIsNone(footer)
        self.assertIsNone(result)
        self.assertLess(now, 28.3)  # 6s grace +12s cleanup, polling slop only.
        self.assertEqual([event[2] for event in trace if event[0] == "signal"], [signal.SIGTERM, signal.SIGKILL])

    def test_late_empty_observation_cannot_pass_expired_grace(self):
        result, footer, trace, _, caught = self.exercise("late-empty")
        self.assertIsNone(caught)
        self.assertEqual(result, 125)
        self.assertTrue(footer["drain_deadline_missed"])
        self.assertFalse(any(event[0] == "signal" for event in trace))

    def test_abort_during_grace_starts_cleanup_immediately(self):
        result, footer, trace, now, caught = self.exercise("abort")
        self.assertIsNone(caught)
        self.assertEqual(result, 125)
        self.assertTrue(footer["stopped"])
        self.assertLess(footer["cleanup_started_monotonic"], 16)
        self.assertLess(now, 13)
        self.assertEqual([event[2] for event in trace if event[0] == "signal"], [signal.SIGTERM])

    def test_observer_fault_during_grace_aborts_without_clean_footer(self):
        result, footer, trace, now, caught = self.exercise("observer-fault")
        self.assertIsInstance(caught, proc.Uncertain)
        self.assertIsNone(footer)
        self.assertIsNone(result)
        self.assertLess(now, 13)
        self.assertEqual([event[2] for event in trace if event[0] == "signal"], [signal.SIGKILL])

    def test_nonzero_command_and_nonbuild_stage_never_use_build_grace(self):
        for case, build in (("nonzero", True), ("strict", False)):
            with self.subTest(case=case):
                result, footer, trace, now, caught = self.exercise(case, build)
                self.assertIsNone(caught)
                self.assertEqual(result, 125)
                self.assertIsNone(footer["drain_started_monotonic"])
                self.assertLess(now, 11)
                self.assertEqual([event[2] for event in trace if event[0] == "signal"], [signal.SIGTERM])

    def test_absolute_continuation_deadline_stops_an_active_stage_without_clean_footer(self):
        def budget(_):
            if control.time.monotonic() >= 12:
                raise proc.Uncertain("offline original deadline expired")
        with patch.dict(os.environ, {"SCANNER_CONTINUATION_BINDING": "offline", "SCANNER_CONTINUATION_SHA": "pin"}), \
                patch.object(continuation, "load", return_value={}), patch.object(continuation, "remaining", side_effect=budget):
            result, footer, trace, now, caught = self.exercise("normal")
        self.assertIsInstance(caught, proc.Uncertain)
        self.assertIsNone(result)
        self.assertIsNone(footer)
        self.assertLess(now, 13)
        self.assertTrue(any(event[0] == "signal" and event[2] == signal.SIGKILL for event in trace))

    def test_expiry_or_stop_after_handshake_cannot_launch_payload(self):
        with patch.dict(os.environ, {"SCANNER_CONTINUATION_BINDING": "offline", "SCANNER_CONTINUATION_SHA": "pin"}), \
                patch.object(continuation, "load", return_value={}), \
                patch.object(continuation, "remaining", side_effect=[100, proc.Uncertain("offline expiry before Popen")]):
            result, footer, trace, _, caught = self.exercise("expired-before-launch")
        self.assertIsInstance(caught, proc.Uncertain)
        self.assertIsNone(footer)
        self.assertFalse(any(event[0] == "launch" for event in trace))
        for case in ("owner-lost-before-launch", "stopped-before-launch"):
            result, footer, trace, _, caught = self.exercise(case)
            self.assertIsInstance(caught, proc.Uncertain)
            self.assertIsNone(footer)
            self.assertFalse(any(event[0] == "launch" for event in trace))

    def test_direct_make_preserves_success_failure_and_runtime_command_shape(self):
        result, footer, trace, _, caught = self.exercise("normal")
        self.assertIsNone(caught)
        self.assertEqual(result, 0)
        self.assertEqual(next(event[2] for event in trace if event[0] == "launch"), ["offline-make"])
        self.assertEqual(footer["command_deadline_monotonic"], 5410)
        self.assertFalse(footer["timed_out"])
        result, footer, trace, _, caught = self.exercise("nonzero-empty")
        self.assertEqual(result, 1)
        self.assertEqual(footer["command_status"], 1)
        self.assertIsNone(footer["drain_started_monotonic"])
        _, footer, trace, _, _ = self.exercise("strict", build=False)
        self.assertEqual(next(event[2] for event in trace if event[0] == "launch"),
                         ["timeout", "--signal=TERM", "--kill-after=12s", "90m", "offline-make"])
        self.assertIsNone(footer["command_deadline_monotonic"])

    def test_direct_make_timeout_latches_even_when_wait_status_is_later_zero(self):
        result, footer, trace, now, caught = self.exercise("timeout-exit0", duration="2s")
        self.assertIsNone(caught)
        self.assertEqual(result, 124)
        self.assertTrue(footer["timed_out"])
        self.assertTrue(footer["stopped"])
        self.assertEqual(footer["command_status"], 0)
        self.assertIsNone(footer["drain_started_monotonic"])
        self.assertLess(now, 13)
        self.assertTrue(any(event[0] == "signal" for event in trace))

    def test_owned_grandchild_exit_race_preserves_raw_observation_and_kernel_drain(self):
        result, footer, trace, _, caught = self.exercise("exit-race")
        self.assertIsNone(caught)
        self.assertEqual(result, 0)
        self.assertTrue(footer["clean"])
        self.assertFalse(any(event[0] == "signal" for event in trace))
        rows=[json.loads(line) for line in (self.directory / "exit-race/processes.jsonl").read_text().splitlines()]
        exited=[row for row in rows if row.get("observed",{}).get("state")=="X"]
        self.assertTrue(exited)
        self.assertEqual(exited[0]["status"], "exited")
        self.assertEqual(exited[0]["exit_witness"]["source"], "held_pidfd_exit")


class RetainedImage(Offline):
    def image(self, label="image"):
        image = self.directory / label
        for relative in ("release", "lib/modules", "lib/server/libjvm.so", "bin/java",
                         "lib/server/classes.jsa", "lib/libjli.so", "legal/license", "legal/other"):
            path = image / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(("offline " + relative).encode())
        (image / "bin/java").chmod(0o700)
        (image / "legal/copy").symlink_to("license")
        return image

    def test_full_image_manifest_round_trip_and_no_overwrite(self):
        image = self.image()
        manifest = self.directory / "manifest.json"
        data = image_manifest.record(image, manifest)
        self.assertEqual(image_manifest.verify(image, manifest), image.resolve())
        self.assertIn("lib/server/classes.jsa", data["entries"])
        self.assertIn("lib/libjli.so", data["entries"])
        self.assertEqual(data["entries"]["legal/copy"]["target"], "license")
        before = manifest.read_bytes()
        with self.assertRaises(FileExistsError):
            image_manifest.record(image, manifest)
        self.assertEqual(manifest.read_bytes(), before)

    def test_cds_and_native_dependency_changes_fail_verification(self):
        for index, relative in enumerate(("lib/server/classes.jsa", "lib/libjli.so")):
            with self.subTest(relative=relative):
                image = self.image(str(index))
                manifest = self.directory / (str(index) + ".json")
                image_manifest.record(image, manifest)
                target = image / relative
                target.write_bytes(b"X" * target.stat().st_size)  # Same-size change.
                with self.assertRaises(proc.Uncertain):
                    image_manifest.verify(image, manifest)

    def test_missing_extra_type_mode_and_symlink_changes_fail(self):
        for mutation in ("missing", "extra", "type", "mode", "symlink"):
            with self.subTest(mutation=mutation):
                image = self.image(mutation)
                manifest = self.directory / (mutation + ".json")
                image_manifest.record(image, manifest)
                if mutation == "missing":
                    (image / "legal/other").unlink()
                elif mutation == "extra":
                    (image / "legal/new").write_bytes(b"extra")
                elif mutation == "type":
                    (image / "legal/other").unlink()
                    (image / "legal/other").mkdir()
                elif mutation == "mode":
                    (image / "bin/java").chmod(0o600)
                else:
                    (image / "legal/copy").unlink()
                    (image / "legal/copy").symlink_to("other")
                with self.assertRaises(proc.Uncertain):
                    image_manifest.verify(image, manifest)

    def test_external_or_broken_symlink_cannot_hide_unhashed_content(self):
        image = self.image()
        outside = self.directory / "outside"
        outside.write_bytes(b"not part of this image")
        link = image / "legal/external"
        link.symlink_to(outside)
        with self.assertRaises(proc.Uncertain):
            image_manifest.catalog(image)
        outside.unlink()
        with self.assertRaises(FileNotFoundError):
            image_manifest.catalog(image)

    def test_unreadable_tree_and_manifest_inside_image_are_rejected(self):
        image = self.image()
        inside = image / "manifest.json"
        with self.assertRaises(proc.Uncertain):
            image_manifest.record(image, inside)
        self.assertFalse(inside.exists())
        def denied_walk(root, *, followlinks, onerror):
            onerror(PermissionError("synthetic unreadable subtree"))
            return iter(())
        with patch.object(image_manifest.os, "walk", side_effect=denied_walk), self.assertRaises(PermissionError):
            image_manifest.catalog(image)


class Continuation(Offline):
    image = RetainedImage.image

    def setUp(self):
        super().setUp()
        self.retained = self.directory / "retained"
        self.base = self.image("retained/base/build/scanner/images/jdk")
        self.manifest = self.directory / "manifest.json"
        image_manifest.record(self.base, self.manifest)
        self.toolchains = self.directory / "toolchains"
        self.toolchains.mkdir()
        self.spec = self.retained / "base/build/scanner/spec.gmk"
        values = dict.fromkeys(continuation.PROFILE_KEYS, "")
        values.update(OPENJDK_TARGET_OS="linux", OPENJDK_TARGET_CPU="x86_64", OPENJDK_TARGET_CPU_BITS="64",
                      COMPILE_TYPE="native", DEBUG_LEVEL="release", JVM_VARIANTS="server", TOOLCHAIN_TYPE="gcc",
                      JVM_FEATURES_server="cds serialgc g1gc zgc", BOOT_JDK=str(self.toolchains / "jdk27"),
                      CFLAGS_JVM="-O3 -fdebug-prefix-map=" + str(self.retained / "base") + "/=source/",
                      LDFLAGS_JDKLIB="-Wl,-z,now")
        self.spec.write_text("".join(f"{key} := {value}\n" for key, value in values.items()))
        for number in range(1, 5):
            (self.retained / "stages" / str(number)).mkdir(parents=True)
        self.footer = self.retained / "stages/4/complete.json"
        self.footer.write_text(json.dumps({"clean": True, "command_status": 0, "stopped": False,
                                           "survivors": True, "members": [asdict(WORKER.identity)]}))
        required = ["base/build/scanner/configure.log", "base/build/scanner/spec.gmk", "base/build/scanner/build.log",
                    "base-release.txt", "identity.txt", "launch-identity.json", "stages/4/complete.json"]
        for name in required:
            path = self.retained / name
            if not path.exists():
                path.write_text("offline provenance\n")
        for name in ("owner.json", "observer.json"):
            (self.retained / name).write_text(json.dumps({"identity": asdict(OWNER.identity)}))
        self.provenance = self.directory / "provenance.json"
        provenance = {"baseline_commit": continuation.BASE, "prior_campaign_status": 125, "measurements": 0,
                      "retained_attempt": str(self.retained), "image_manifest_sha256": continuation.sha(self.manifest),
                      "provenance_file_sha256": {name: continuation.sha(self.retained / name) for name in required}}
        self.provenance.write_text(json.dumps(provenance))
        self.binding = {"format": 1, "retained": str(self.retained), "base_jdk": str(self.base),
                        "manifest": str(self.manifest), "manifest_sha256": continuation.sha(self.manifest),
                        "provenance": str(self.provenance), "provenance_sha256": continuation.sha(self.provenance),
                        "toolchains": str(self.toolchains), "profile": continuation.profile(self.spec),
                        "packet": continuation.packet_inputs(), "inputs": {"synthetic": "bytes"},
                        "environment": {key: os.environ.get(key) for key in continuation.BUILD_ENV},
                        "claim": str(continuation.claim_path(self.retained, provenance)),
                        "custody_files": {name: continuation.sha(self.retained / name) for name in ("owner.json", "observer.json")},
                        "boot_id": "offline-boot", "deadline_monotonic": 1000., "deadline_utc": 2000.}
        for name, value in (("remaining", 100), ("inputs", self.binding["inputs"]), ("baseline_source", None)):
            mock = patch.object(continuation, name, return_value=value)
            mock.start()
            self.addCleanup(mock.stop)
        mock = patch.object(continuation,"PidfdEvidence",side_effect=lambda:proc.PidfdEvidence(
            open_fd=lambda pid,flags:pid,read=lambda pid:continuation.snapshot()[pid],
            poll=lambda fd:continuation.snapshot()[fd].state in ("X","Z"),close=lambda _:None,
            send=lambda *_:self.fail("continuation census must not signal")))
        mock.start(); self.addCleanup(mock.stop)
        self.output = self.directory / "new"
        self.output.mkdir()
        self.witness = self.directory / "binding.json"
        self.witness.write_text(json.dumps(self.binding))
        self.digest = continuation.sha(self.witness)
        self.candidate = "a" * 40

    def test_bind_selects_exact_retained_image_and_new_candidate_then_spends_claim(self):
        old = {path: path.read_bytes() for path in self.retained.rglob("*") if path.is_file()}
        with patch.object(continuation, "snapshot", return_value={}), patch("sys.stdout") as stdout:
            continuation.main(["bind", str(self.witness), self.digest, str(self.toolchains), str(self.output), self.candidate])
        record = json.loads((self.output / "continuation.json").read_text())
        self.assertEqual(record["base_jdk"], str(self.base))
        self.assertEqual(record["candidate_jdk"], str(proc.image_paths(self.output)["candidate"]))
        self.assertEqual(record["candidate"], self.candidate)
        self.assertEqual(record["binding_sha256"], self.digest)
        self.assertEqual({path: path.read_bytes() for path in old}, old)
        self.assertTrue(Path(self.binding["claim"]).is_dir())
        self.assertFalse((self.output / "base").exists())

    def test_wrong_image_changed_manifest_or_missing_witness_never_claim(self):
        for case in ("image", "manifest", "missing"):
            with self.subTest(case=case):
                binding = dict(self.binding)
                if case == "image":
                    binding["base_jdk"] = str(self.directory / "other-jdk")
                elif case == "manifest":
                    self.manifest.write_text(self.manifest.read_text() + " ")
                else:
                    self.provenance.unlink()
                with self.assertRaises((proc.Uncertain, FileNotFoundError)):
                    continuation.verify(binding, self.toolchains)
                self.assertFalse(Path(self.binding["claim"]).exists())
                if case == "manifest":
                    self.manifest.write_text(self.manifest.read_text()[:-1])

    def test_changed_binding_or_toolchain_and_packet_fail_closed(self):
        self.witness.write_text(self.witness.read_text() + " ")
        with self.assertRaises(proc.Uncertain):
            continuation.load(self.witness, self.digest)
        for key in ("inputs", "packet", "environment", "claim"):
            with self.subTest(key=key):
                binding = dict(self.binding)
                binding[key] = {"changed": "value"} if key != "claim" else str(self.directory / "new-claim")
                with self.assertRaises(proc.Uncertain):
                    continuation.verify(binding, self.toolchains)

    def test_untracked_configure_make_compiler_and_loader_overrides_are_rejected(self):
        for name in continuation.BUILD_ENV:
            with self.subTest(name=name), patch.dict(os.environ, {name: "/untracked/input"}), self.assertRaises(proc.Uncertain):
                continuation.verify(self.binding, self.toolchains)
            self.assertFalse(Path(self.binding["claim"]).exists())

    def test_original_live_birth_blocks_but_reused_pid_is_never_owned(self):
        with patch.object(continuation, "snapshot", return_value=processes(WORKER)), self.assertRaises(proc.Uncertain):
            continuation.quiescent(self.binding)
        with patch.object(continuation, "snapshot", return_value=processes(replace(WORKER, birth=900))):
            continuation.quiescent(self.binding)

    def test_duplicate_or_partially_written_claim_stays_spent_for_other_output(self):
        continuation.claim(self.binding, self.digest, self.output, self.candidate)
        other = self.directory / "other-output"
        other.mkdir()
        with self.assertRaises(FileExistsError):
            continuation.claim(self.binding, "b" * 64, other, "c" * 40)
        (Path(self.binding["claim"]) / "claim.json").unlink()  # Crash after exclusive mkdir is still spent.
        with self.assertRaises(FileExistsError):
            continuation.claim(self.binding, self.digest, other, self.candidate)
        self.assertFalse((other / "continuation.json").exists())

    def failed_predecessor(self):
        continuation.claim(self.binding,self.digest,self.output,self.candidate)
        (self.output/"analysis.json").write_text(json.dumps({"terminal_status":125,"candidate_image_complete":False,
            "source_commit":self.candidate,"binding_sha256":self.digest,
            "required_runtime_observations":{"cds":0,"jtreg_case_collector_executions":0,"host":0,"smoke":0,"workload_children":0}}))
        (self.output/"cleanup.json").write_text(json.dumps({"counts":{"live":0,"error":0},
            "unledgered_matching_workers":[],"current_snapshot_errors":[]}))
        (self.output/"cleanup.csv").write_text("pid,birth,uid\n200,20,1000\n")
        return self.directory/"successor.json"

    def test_successor_preparation_preserves_deadline_evidence_and_spent_parent(self):
        destination=self.failed_predecessor()
        before={path:path.read_bytes() for root in (self.retained,self.output,Path(self.binding["claim"]))
                for path in root.rglob("*") if path.is_file()}
        binding=continuation.prepare_successor(self.witness,self.digest,self.output,destination)
        self.assertEqual(binding["claim"],str(Path(self.binding["claim"])/"successor"))
        for key in ("deadline_monotonic","deadline_utc","boot_id","base_jdk","manifest_sha256","provenance_sha256"):
            self.assertEqual(binding[key],self.binding[key])
        self.assertEqual(binding["packet"],continuation.packet_inputs())
        self.assertEqual(binding["predecessor"]["custody"],"uncertain_missing_stage5_footer")
        self.assertFalse(Path(binding["claim"]).exists())
        self.assertEqual({path:path.read_bytes() for path in before},before)
        self.assertEqual(continuation.verify(binding,self.toolchains),self.base)
        other=self.directory/"successor-output"; other.mkdir()
        continuation.claim(binding,continuation.sha(destination),other,self.candidate)
        with self.assertRaises(proc.Uncertain):
            continuation.prepare_successor(self.witness,self.digest,self.output,self.directory/"renamed.json")
        self.assertEqual({path:path.read_bytes() for path in before},before)

    def test_successor_rejects_runtime_observations_completion_or_unresolved_census(self):
        destination=self.failed_predecessor()
        analysis_path=self.output/"analysis.json"; cleanup_path=self.output/"cleanup.json"
        analysis=json.loads(analysis_path.read_text()); cleanup=json.loads(cleanup_path.read_text())
        changes=[(analysis_path,dict(analysis,terminal_status=0)),
                 (analysis_path,dict(analysis,candidate_image_complete=True)),
                 (analysis_path,dict(analysis,source_commit="b"*40)),
                 (analysis_path,dict(analysis,binding_sha256="b"*64)),
                 (analysis_path,dict(analysis,required_runtime_observations={})),
                 (analysis_path,dict(analysis,required_runtime_observations={"workload":1})),
                 (cleanup_path,dict(cleanup,counts={"live":1,"error":0})),
                 (cleanup_path,dict(cleanup,counts={"live":0,"error":1})),
                 (cleanup_path,dict(cleanup,unledgered_matching_workers=[200]))]
        for path,value in changes:
            with self.subTest(value=value):
                path.write_text(json.dumps(value))
                with self.assertRaises(proc.Uncertain):
                    continuation.prepare_successor(self.witness,self.digest,self.output,destination)
                self.assertFalse(destination.exists())
                analysis_path.write_text(json.dumps(analysis)); cleanup_path.write_text(json.dumps(cleanup))
        footer=self.output/"stages/5/complete.json"; footer.parent.mkdir(parents=True); footer.write_text("{}")
        with self.assertRaises(proc.Uncertain): continuation.prepare_successor(self.witness,self.digest,self.output,destination)
        footer.unlink()
        proc.image_paths(self.output)["candidate"].mkdir(parents=True)
        with self.assertRaises(proc.Uncertain): continuation.prepare_successor(self.witness,self.digest,self.output,destination)

    def test_successor_pins_parent_claim_census_and_original_window(self):
        destination=self.failed_predecessor()
        binding=continuation.prepare_successor(self.witness,self.digest,self.output,destination)
        for key,value in (("claim",str(self.directory/"another-claim")),("deadline_monotonic",1001.),
                          ("deadline_utc",2001.),("boot_id","new-boot"),("base_jdk","other-image"),
                          ("inputs",{}),("environment",{}),("profile",{}),("toolchains","/other"),("custody_files",{})):
            with self.subTest(key=key),self.assertRaises(proc.Uncertain):
                continuation.predecessor(dict(binding,**{key:value}))
        for path in (self.output/"cleanup.csv",self.output/"analysis.json",Path(self.binding["claim"])/"claim.json"):
            original=path.read_bytes(); path.write_bytes(original+b" ")
            with self.assertRaises(proc.Uncertain): continuation.predecessor(binding)
            path.write_bytes(original)
        with patch.object(continuation,"snapshot",return_value=processes(WORKER)),self.assertRaises(proc.Uncertain):
            continuation.quiescent(binding)
        with patch.object(continuation,"snapshot",return_value=processes(replace(WORKER,birth=900))):
            continuation.quiescent(binding)
        with patch.object(continuation,"snapshot",return_value=processes(replace(WORKER,uid=1001))),self.assertRaises(proc.Uncertain):
            continuation.quiescent(binding)
        with self.assertRaises(FileExistsError):
            continuation.prepare_successor(self.witness,self.digest,self.output,destination)

    def test_successor_cannot_refresh_changed_toolchain_profile_or_environment(self):
        destination=self.failed_predecessor()
        for name,value in (("inputs",{"changed":"bytes"}),("profile",dict(self.binding["profile"],CFLAGS_JVM="-O2")),
                           ("environment",{"changed":"value"})):
            with self.subTest(name=name),patch.object(continuation,name,return_value=value),self.assertRaises(proc.Uncertain):
                continuation.prepare_successor(self.witness,self.digest,self.output,destination)
            self.assertFalse(destination.exists())

    def test_successor_output_cannot_overlap_failed_evidence_and_disk_counts_it(self):
        destination=self.failed_predecessor()
        binding=continuation.prepare_successor(self.witness,self.digest,self.output,destination)
        before={path:path.read_bytes() for path in self.output.rglob("*") if path.is_file()}
        self.assertEqual(continuation.preserved_outputs(binding),[self.retained,self.output])
        target=self.output/"nested-new-output"
        with self.assertRaises(proc.Uncertain): continuation.proposed_output(binding,target,self.toolchains,destination)
        self.assertFalse(target.exists())
        target.mkdir()  # claim independently rejects a caller bypassing preflight.
        with self.assertRaises(proc.Uncertain): continuation.claim(binding,continuation.sha(destination),target,self.candidate)
        self.assertFalse(Path(binding["claim"]).exists())
        self.assertEqual({path:path.read_bytes() for path in before},before)
        source=(PACKET/"run-linux.sh").read_text()
        disk=source.split("disk_check() {",1)[1].split("\n}",1)[0]
        self.assertIn('paths+=("$FAILED_PREDECESSOR")',disk)
        self.assertIn('du -sm "${paths[@]}"',disk)

    def test_output_overlap_is_rejected_before_creating_any_evidence(self):
        before = {path: path.read_bytes() for path in self.retained.rglob("*") if path.is_file()}
        for target in (self.retained / "new", self.toolchains / "new", Path(self.binding["claim"])):
            with self.subTest(target=target), self.assertRaises(proc.Uncertain):
                continuation.proposed_output(self.binding, target, self.toolchains, self.witness)
            self.assertFalse(target.exists())
        self.assertEqual({path: path.read_bytes() for path in before}, before)
        target = self.directory / "fresh"
        self.assertEqual(continuation.proposed_output(self.binding, target, self.toolchains, self.witness), target)
        self.assertFalse(target.exists())

    def candidate_stage(self):
        continuation.claim(self.binding, self.digest, self.output, self.candidate)
        image = self.image("new/candidate/build/scanner/images/jdk")
        spec = self.output / "candidate/build/scanner/spec.gmk"
        spec.write_text(self.spec.read_text().replace(str(self.retained / "base"), str(self.output / "candidate")))
        stage = self.output / "stages/5"
        stage.mkdir(parents=True)
        (stage / "identity.json").write_text(json.dumps({"kind": "build"}))
        footer = {"clean": True, "command_status": 0, "stopped": False, "survivors": False, "drain_deadline_missed": False, "timed_out": False}
        (stage / "complete.json").write_text(json.dumps(footer))
        return stage, footer

    def candidate_git(self, checkout, *args):
        return "\n".join([self.candidate, *continuation.CANDIDATE_TREES]) if args[0] == "rev-parse" else ""

    def test_candidate_profile_is_checked_before_make_with_only_checkout_prefix_normalized(self):
        stage, _ = self.candidate_stage()
        with patch.object(continuation, "git", side_effect=self.candidate_git):
            continuation.candidate_gate(self.binding, self.output, None)
            path = self.output / "candidate/build/scanner/spec.gmk"
            original = path.read_text()
            for before, after in (("-O3", "-O2"), ("-Wl,-z,now", "-Wl,-z,lazy")):
                path.write_text(original.replace(before, after))
                with self.assertRaises(proc.Uncertain):
                    continuation.candidate_gate(self.binding, self.output, None)
        self.assertTrue(Path(self.binding["claim"]).exists())

    def test_interrupted_build_and_clean_custody_with_persistent_child_never_reach_matrix(self):
        stage, footer = self.candidate_stage()
        for change in (None, {"command_status": 124}, {"stopped": True}, {"survivors": True}, {"drain_deadline_missed": True}, {"timed_out": True}):
            with self.subTest(change=change), patch.object(continuation, "git", side_effect=self.candidate_git):
                path = stage / "complete.json"
                if change is None:
                    path.unlink()
                else:
                    path.write_text(json.dumps(dict(footer, **change)))
                matrix = []
                with self.assertRaises((proc.Uncertain, FileNotFoundError)):
                    continuation.candidate_gate(self.binding, self.output, stage)
                    matrix.append("matrix")
                self.assertEqual(matrix, [])
                self.assertTrue(Path(self.binding["claim"]).exists())
        (stage / "complete.json").write_text(json.dumps(footer))
        with patch.object(continuation, "git", side_effect=self.candidate_git):
            continuation.candidate_gate(self.binding, self.output, stage)

    def test_deadline_expiry_during_verification_does_not_claim(self):
        continuation.remaining.side_effect = [100, proc.Uncertain("expired during verification")]
        with self.assertRaises(proc.Uncertain):
            continuation.verify(self.binding, self.toolchains)
        self.assertFalse(Path(self.binding["claim"]).exists())

    def test_deadline_requires_original_boot_and_both_absolute_clocks(self):
        self.assertEqual(remaining_budget(self.binding, now=900, wall=1900, boot="offline-boot"), 100)
        for changes in ({"now": 1000}, {"wall": 2000}, {"boot": "different"}):
            with self.subTest(changes=changes), self.assertRaises(proc.Uncertain):
                remaining_budget(self.binding, **dict({"now": 900, "wall": 1900, "boot": "offline-boot"}, **changes))
        for value in (float("nan"), float("inf"), "1000"):
            with self.assertRaises(proc.Uncertain):
                remaining_budget(dict(self.binding, deadline_monotonic=value), now=900, wall=1900, boot="offline-boot")

    def test_fingerprint_covers_external_resolved_content_and_directory_links(self):
        root = self.directory / "compiler"
        root.mkdir()
        target = self.directory / "native.so"
        target.write_bytes(b"library-one")
        (root / "native.so").symlink_to(target)
        (root / "recursive").symlink_to(".")
        before = continuation.fingerprint(root)
        target.write_bytes(b"library-two")
        self.assertNotEqual(continuation.fingerprint(root), before)
        with patch.object(Path, "iterdir", side_effect=PermissionError("offline unreadable input")), self.assertRaises(PermissionError):
            continuation.fingerprint(root)

    def test_native_startup_objects_and_linker_scripts_are_required_and_pinned(self):
        native = self.directory / "native"
        native.mkdir()
        for name in ("Scrt1.o", "crti.o", "crtn.o", "libc_nonshared.a", "libc.so", "libm.so", "libc.so.6"):
            (native / name).write_bytes(b"offline native input")
        selected = continuation.native_link_inputs(native)
        self.assertIn(native / "libc.so.6", selected)
        before = {str(path): continuation.fingerprint(path) for path in selected}
        (native / "crti.o").write_bytes(b"changed native object")
        self.assertNotEqual({str(path): continuation.fingerprint(path) for path in selected}, before)
        (native / "libc_nonshared.a").unlink()
        with self.assertRaises(proc.Uncertain):
            continuation.native_link_inputs(native)


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
        self.assertIn('bounded_build 90m make CONF=scanner JOBS=4 jdk images', source)
        self.assertEqual(source.count('bounded_build '), 1)
        self.assertNotIn('build/scanner/jdk', source)
        self.assertNotIn('build/scanner/images/jdk', source)  # Only Python map defines it.
        self.assertNotIn('kill -0', source)
        self.assertNotIn('ACTIVE_PGID', source)
        self.assertIn('check-image "$image"', source)
        self.assertIn('"$BASE_JDK" "$CANDIDATE_JDK"', source)
        self.assertLess(source.index('check-image "$image"'), source.index('sha256sum "$image/lib/modules"'))
        self.assertIn('if [[ $checkout == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi', source)

    def test_continuation_shares_the_complete_frozen_matrix_and_skips_only_baseline_build(self):
        source = (PACKET / "run-linux.sh").read_text()
        matrix = source.split("export Q=", 1)[1].split("\ndisk_check", 1)[0]
        self.assertEqual(hashlib.sha256(matrix.encode()).hexdigest(),
                         "53336c91569f92c46b06a9abc36e14853f5b03b8ec361acbf09e25bc3de6ad87")
        cds = source.split('# Both images must be ready before any required runtime observation starts.\n', 1)[1].split('export Q=', 1)[0]
        self.assertEqual(hashlib.sha256(cds.encode()).hexdigest(),
                         "f4ba6ca52fa25cba5bc77b7762a904d3c304de4138b070fc45ba77045249c8ca")
        self.assertIn('if [[ $checkout == base && -n $BINDING ]]; then', source)
        self.assertIn('if [[ -z $BINDING ]]; then bounded 5m git -C "$REPO" worktree add --detach "$OUT/base"', source)
        self.assertLess(source.index('continuation.py" profile'), source.index('bounded_build 90m make'))
        self.assertLess(source.index('continuation.py" gate'), source.index('export Q='))
        self.assertLess(source.index('continuation.py" gate'), source.index('-Xlog:cds=info'))
        self.assertLess(source.index('continuation.py" preflight'), source.index('mkdir "$3"'))
        continuation_wrapper = source.split('if [[ ${1:-} == --continue ]]; then', 1)[1].split('\n    fi', 1)[0]
        self.assertIn('continuation.py" remaining', continuation_wrapper)
        self.assertIn('"${remaining}s"', continuation_wrapper)
        self.assertNotIn('6h', continuation_wrapper)
        self.assertIn('paths+=("$RETAINED")', source)
        self.assertIn('paths+=("$FAILED_PREDECESSOR")', source)

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
