# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Conservative wall/monotonic bound when original boot evidence is absent."""
from datetime import datetime, timezone
import time

ORIGINAL_UTC_CUTOFF = '2026-10-18T01:23:44Z'
UTC_CUTOFF = datetime(2026, 10, 18, 1, 23, 44, tzinfo=timezone.utc).timestamp()
PREPARATION_UTC_CUTOFF = UTC_CUTOFF - 36000 + 6600


def utc(value):
    parsed = datetime.fromisoformat(value.replace('Z', '+00:00'))
    if parsed.tzinfo is None:
        raise RuntimeError('Original UTC evidence needs an explicit timezone')
    return parsed.timestamp()


class FixedCutoff:
    """Never derive authority from a monotonic value from an unproven boot.

    Initial UTC remaining time becomes a non-extendable local monotonic bound.
    Advancing UTC can stop sooner; rolling UTC back cannot extend that bound.
    """
    def __init__(self, monotonic=None, wall=None):
        self.now = monotonic or time.monotonic
        self.wall = wall or time.time
        start = self.now()
        self.wall_at_start = self.wall()
        self.start = start
        self.deadline = start + max(0, UTC_CUTOFF - self.wall_at_start)
        self.preparation_deadline = start + max(0, PREPARATION_UTC_CUTOFF - self.wall_at_start)

    def check(self):
        if self.now() >= self.deadline or self.wall() >= UTC_CUTOFF:
            raise RuntimeError('Original fixed UTC/monotonic deadline exhausted')

    def stage_deadline(self, release):
        # Stage time also survives a reboot: derive it from original UTC evidence.
        end = utc(release['released_at_utc']) + 6600
        return min(self.deadline, self.start + max(0, end - self.wall_at_start))

    def check_preparation(self):
        self.check()
        if self.now() >= self.preparation_deadline or self.wall() >= PREPARATION_UTC_CUTOFF:
            raise RuntimeError('Original preparation UTC/stage deadline exhausted')
