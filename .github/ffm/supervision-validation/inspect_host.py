"""Read-only host/interface binding. No child, wait, prctl or signal operation."""

import argparse
import ctypes
import json
import os
from pathlib import Path
import platform
import signal


def read(path):
    try:
        return dict(readable=True, value=Path(path).read_text().strip())
    except OSError as failure:
        return dict(readable=False, error=type(failure).__name__, errno=failure.errno)


def main(out):
    inventory = read(f"/proc/self/task/{os.getpid()}/children")
    boot = read("/proc/sys/kernel/random/boot_id")
    init = read("/proc/1/comm")
    record = dict(system=platform.system(), machine=platform.machine(), hostname=platform.node(),
                  boot_id=boot.get("value"), pid1_comm=init.get("value"),
                  production_child_inventory_readable=inventory["readable"],
                  inventory=inventory, thread_self_inventory=read("/proc/thread-self/children"),
                  wait_interfaces={k: hasattr(os, k) for k in ["waitid", "waitpid", "wait4", "P_PID", "P_ALL", "WNOHANG", "WNOWAIT", "WEXITED"]},
                  SIGCHLD_is_default=signal.getsignal(signal.SIGCHLD) == signal.SIG_DFL,
                  prctl_symbol_present=hasattr(ctypes.CDLL(None), "prctl"),
                  child_launched=False, prctl_called=False, signal_sent=False,
                  runtime_containment_verified=False, FFM_approval=False)
    try:
        record["pid1_exe"] = os.readlink("/proc/1/exe")
        record["task_count"] = len(list(Path("/proc/self/task").iterdir()))
        record["namespaces"] = {k: os.readlink("/proc/self/ns/" + k) for k in ["pid", "mnt", "cgroup"]}
    except OSError as failure:
        record["inspection_error"] = str(failure)
    record["read_only_prerequisites_passed"] = (
        record["system"] == "Linux" and record["machine"] == "aarch64"
        and inventory["readable"] and not inventory.get("value")
        and record.get("task_count") == 1 and record["SIGCHLD_is_default"]
        and all(record["wait_interfaces"].values()) and record["prctl_symbol_present"]
        and bool(record["boot_id"]) and bool(record["pid1_comm"]) and record["pid1_comm"] != "tail")
    with out.open("x") as stream:
        json.dump(record, stream, indent=2)
        stream.write("\n")
    print(json.dumps(record))
    return 0 if record["read_only_prerequisites_passed"] else 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, required=True)
    raise SystemExit(main(parser.parse_args().out))
