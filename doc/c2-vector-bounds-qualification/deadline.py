"""A single boot-bound monotonic campaign deadline, with cleanup inside 95 minutes."""
import json
import math
import time
from pathlib import Path

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; execution preconditions are required")

TOTAL_SECONDS = 95 * 60
CLEANUP_RESERVE_SECONDS = 5


def boot_id():
    return Path("/proc/sys/kernel/random/boot_id").read_text().strip()


class Budget:
    def __init__(self, state, clock=time.monotonic):
        self.state, self.clock = state, clock
        start, end = state["start_monotonic"], state["end_monotonic"]
        if (state["boot_id"] != boot_id() or not all(math.isfinite(x) for x in (start, end))
                or end <= start or end > start + TOTAL_SECONDS):
            raise ValueError("invalid/rebooted campaign deadline")
        if state["cleanup_reserve_seconds"] != CLEANUP_RESERVE_SECONDS:
            raise ValueError("campaign cleanup reserve changed")

    @classmethod
    def start(cls, started=None, clock=time.monotonic):
        start = clock() if started is None else started
        return cls({"boot_id": boot_id(), "start_monotonic": start,
                    "end_monotonic": start + TOTAL_SECONDS,
                    "cleanup_reserve_seconds": CLEANUP_RESERVE_SECONDS}, clock)

    @classmethod
    def load(cls, path, clock=time.monotonic):
        return cls(json.loads(Path(path).read_text()), clock)

    def remaining(self, cap=None):
        left = self.state["end_monotonic"] - self.state["cleanup_reserve_seconds"] - self.clock()
        if left <= 0:
            raise TimeoutError("campaign work deadline expired; five-second cleanup reserve is now active")
        if cap is not None and cap <= 0:
            raise TimeoutError("stage/command budget expired inside the shared campaign")
        return left if cap is None else min(cap, left)

    def save(self, path):
        with Path(path).open("x") as stream:
            json.dump(self.state, stream, indent=2)
            stream.write("\n")


def stage_budget(path, stage_started, seconds):
    budget = Budget.load(path)
    return min(budget.remaining(), max(0, stage_started + seconds - time.monotonic()))
