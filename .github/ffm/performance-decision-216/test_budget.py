"""Offline fixed-boundary tests: no real clock, process or host reads."""

import unittest
from budget import campaign_deadline, collector_supervision_deadline, overall_budget_passed, validate_budget


class BudgetTests(unittest.TestCase):
    def record(self):
        return dict(start_monotonic_ns=1, preparation_deadline_ns=5100_000_000_001,
                    overall_deadline_ns=9000_000_000_001, boot_id="fixture")

    def test_full_windows_and_reserved_cleanup_boundary(self):
        record = self.record()
        self.assertEqual(campaign_deadline(record, record["preparation_deadline_ns"]),
                         record["overall_deadline_ns"] - 300_000_000_000)
        self.assertTrue(overall_budget_passed(record, record["overall_deadline_ns"]))
        self.assertFalse(overall_budget_passed(record, record["overall_deadline_ns"] + 1))

    def test_expired_preparation_does_not_start_shortened_campaign(self):
        with self.assertRaises(ValueError):
            campaign_deadline(self.record(), self.record()["preparation_deadline_ns"] + 1)

    def test_supervisor_respects_campaign_and_sealing_window_within_original_deadline(self):
        record = self.record()
        self.assertEqual(collector_supervision_deadline(record, 2), 3900_000_000_002)
        self.assertEqual(collector_supervision_deadline(record, record["preparation_deadline_ns"]),
                         record["overall_deadline_ns"])
        with self.assertRaises(ValueError):
            collector_supervision_deadline(record, record["preparation_deadline_ns"] + 1)

    def test_reset_extended_or_incoherent_records_rejected(self):
        for edit in [dict(start_monotonic_ns=2), dict(start_monotonic_ns=True),
                     dict(preparation_deadline_ns=1), dict(overall_deadline_ns=999999999999999),
                     dict(boot_id="")]:
            with self.assertRaises(ValueError):
                validate_budget(dict(self.record(), **edit))


if __name__ == "__main__":
    unittest.main()
