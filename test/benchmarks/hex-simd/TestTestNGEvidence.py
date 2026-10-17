#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Offline string fixtures only: no supervisor, subprocess, JVM or campaign."""
import unittest
from unittest.mock import patch

from qualify import Stop, parse_hexformat_testng

PASS = "test result: Passed. Execution successful\n"
SUMMARY = "Total tests run: 154, Passes: 154, Failures: 0, Skips: 0"
HEX = "java/util/HexFormat/HexFormatTest.jtr"
BULK = "java/util/HexFormat/BulkHexFormatTest.jtr"


class TestTestNGEvidence(unittest.TestCase):
    def setUp(self):
        guard = patch("qualify.subprocess.Popen", side_effect=AssertionError("offline fixtures must not start processes"))
        guard.start()
        self.addCleanup(guard.stop)

    def parse(self, summary=SUMMARY, events="", extra=()):
        text = PASS + events + (summary + "\n" if summary is not None else "")
        return parse_hexformat_testng([(HEX, text), *extra])

    def rejected(self, records):
        with self.assertRaises(Stop) as raised:
            parse_hexformat_testng(records)
        # main() maps this evidence failure to INCOMPLETE, never LOCAL_GO.
        self.assertEqual(raised.exception.category, "EVIDENCE_OR_CORRECTNESS")

    def test_passed_baseline_and_candidate(self):
        for extra in [(), ((BULK, PASS),)]:
            with self.subTest(candidate=bool(extra)):
                self.assertEqual(self.parse(extra=extra), {
                    "total": 154, "passed": 154, "expected_low_heap_skips": 0, "record": HEX})

    def test_generic_passed_record_without_summary_is_rejected(self):
        self.rejected([(HEX, PASS)])

    def test_missing_or_duplicate_hex_record_is_rejected(self):
        for records in [[], [(BULK, PASS)], [(HEX, PASS + SUMMARY), ("other/HexFormatTest.jtr", PASS + SUMMARY)]]:
            with self.subTest(records=records):
                self.rejected(records)

    def test_summary_in_wrong_record_is_rejected(self):
        self.rejected([(HEX, PASS), (BULK, PASS + SUMMARY)])

    def test_duplicate_summaries_are_rejected(self):
        for second in [SUMMARY, "Total tests run: unrecognized", "  total tests run = 154"]:
            with self.subTest(second=second):
                self.rejected([(HEX, PASS + SUMMARY + "\n" + second)])
        self.rejected([(HEX, PASS + SUMMARY), (BULK, PASS + SUMMARY)])

    def test_malformed_summaries_are_rejected(self):
        for summary in [
            "Total tests run: 154, Passes: 154, Failures: 0",  # missing field
            "Total tests run: many, Passes: 154, Failures: 0, Skips: 0",
            "Total tests run = 154, Passes: 154, Failures: 0, Skips: 0",
            SUMMARY + " extra",
            " " + SUMMARY,
            SUMMARY.lower(),
            SUMMARY.replace("154", "１５４"),
            SUMMARY.replace("Skips: 0", "Skips: -1"),
        ]:
            with self.subTest(summary=summary):
                self.rejected([(HEX, PASS + summary)])

    def test_invalid_counts_are_rejected(self):
        for summary in [
            "Total tests run: 153, Passes: 153, Failures: 0, Skips: 0",
            "Total tests run: 154, Passes: 153, Failures: 0, Skips: 0",
            "Total tests run: 154, Passes: 153, Failures: 1, Skips: 0",
        ]:
            with self.subTest(summary=summary):
                self.rejected([(HEX, PASS + summary)])

    def test_permitted_low_heap_skip_with_exception_or_memory_diagnostic(self):
        for diagnostic in ["org.testng.SkipException: Insufficient Memory to test OOME\n",
                           "OOME: total mem: 10000000, free mem: 00000000, max mem: 20000000\n"]:
            with self.subTest(diagnostic=diagnostic):
                events = "[12:00:00.000] test HexFormatTest.testOOME(\nargs\n): skipped [1ms]\n" + diagnostic
                result = self.parse("Total tests run: 154, Passes: 153, Failures: 0, Skips: 1", events)
                self.assertEqual(result["passed"], 153)
                self.assertEqual(result["expected_low_heap_skips"], 1)

    def test_multiple_permitted_skips(self):
        events = ("test HexFormatTest.testOOME(first): skip [1ms]\n"
                  "test HexFormatTest.testOOME(second): skipped [1ms]\n"
                  "Insufficient Memory to test OOME\n")
        self.assertEqual(self.parse("Total tests run: 154, Passes: 152, Failures: 0, Skips: 2", events)
                         ["expected_low_heap_skips"], 2)

    def test_unknown_or_inconsistent_skips_are_rejected(self):
        summary = "Total tests run: 154, Passes: 153, Failures: 0, Skips: 1"
        for events in ["", "test HexFormatTest.samples(): skip\nInsufficient Memory to test OOME\n",
                       "test HexFormatTest.testOOME(args): skip\n"]:
            with self.subTest(events=events):
                self.rejected([(HEX, PASS + events + summary)])
        self.rejected([(HEX, PASS + "test HexFormatTest.testOOME(args): skip\n"
                        "Insufficient Memory to test OOME\n" + SUMMARY)])


if __name__ == "__main__":
    unittest.main()
