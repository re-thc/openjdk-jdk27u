#!/usr/bin/env python3
"""One reviewed preparation repair; adopt sealed local images, never rebuild.

Only the exact installed-jtreg-version stop before any qualification workload is
eligible. The historical directory is immutable evidence. A new directory owns
all remaining work and review gates under the original UTC deadline.
"""
import argparse
import copy
import json
import math
import os
from pathlib import Path
import re
import signal
from datetime import datetime

from qualification_campaign import (BASE, CANDIDATE, DEADLINE_UTC, PLAN, Campaign,
                                    ContinuationClock, cancellation_signal, dump,
                                    inventory, require, sha, utc_now)

def load_receipt(path, expected_sha256):
    """Host evidence stays local; independent release pins this receipt hash."""
    require(re.fullmatch(r"[0-9a-f]{64}", expected_sha256) and sha(path) == expected_sha256,
            "Reviewed local identity receipt changed")
    value = json.loads(path.read_text())
    keys = {"schema", "deadline_utc", "parent_sha256", "old_config_sha256", "fixed_config_sha256",
            "parent_provenance_sha256", "image_inventories"}
    require(set(value) == keys and type(value["schema"]) is int and value["schema"] == 1 and
            value["deadline_utc"] == DEADLINE_UTC, "Invalid identity receipt schema/deadline")
    require(set(value["image_inventories"]) == set(PLAN["builds"]), "Receipt image set changed")
    hashes = [value[k] for k in keys if k.endswith("sha256")] + list(value["image_inventories"].values())
    require(all(isinstance(s, str) and re.fullmatch(r"[0-9a-f]{64}", s) for s in hashes),
            "Missing or invalid receipt identities")
    return value


def expected_records():
    names = ["source-clean", "source-head", "runner-head", "runner-clean", "codec-pin"]
    names += [kind + "-" + step for kind in PLAN["builds"]
              for step in ("checkout", "head", "configure", "images", "version")]
    return names + [kind + "-source-clean" for kind in PLAN["builds"]] + ["installed-jtreg-version"]


def validate_stop(parent):
    require(parent.get("status") == "stopped-no-retry" and parent.get("measurement_started") is False,
            "Only the exact pre-measurement preparation stop is repairable")
    require(parent.get("failure") == "Command failed; no retry: installed-jtreg-version",
            "Different stopped command")
    require(parent.get("plan") == PLAN and parent.get("phase_caps") == PLAN["phase_seconds"],
            "Original plan/caps changed")
    require(parent["outer_clock"]["deadline_utc"] == DEADLINE_UTC, "Original deadline changed")
    clock = parent["outer_clock"]
    require(all(math.isfinite(clock[k]) for k in ("deadline_monotonic", "started_monotonic")) and
            math.isclose(clock["deadline_monotonic"] - clock["started_monotonic"], PLAN["total_seconds"], abs_tol=1e-6),
            "Original monotonic budget changed")
    require(not any(key in parent for key in ("timing", "reviews", "decoder_proofs", "full_provenance")),
            "A qualification workload or review already started")
    records = parent["records"]
    require([r["name"] for r in records] == expected_records(), "Unexpected prior command matrix")
    require(all(r.get("status") == "finished" and r.get("exit_code") == (1 if i == len(records)-1 else 0)
                for i, r in enumerate(records)), "Prior execution has another failure or unfinished child")
    require(set(parent["images"]) == set(PLAN["builds"]), "Three completed images required")
    for kind, image in parent["images"].items():
        require(image["commit"] == (BASE if kind == "base-release" else CANDIDATE), "Image source changed")
    for row in records:
        require(math.isfinite(row["wall_seconds"]) and row["wall_seconds"] >= 0, "Invalid prior budget debit")


def validate_config(old, fixed):
    require(fixed["environment"].get("JTREG_JAVA") == str(Path(old["boot_jdk"]) / "bin/java"),
            "Explicit installed boot-JDK launcher required")
    stripped = copy.deepcopy(fixed)
    stripped["environment"].pop("JTREG_JAVA")
    require(stripped == old and "JTREG_JAVA" not in old["environment"],
            "Only the JTREG_JAVA preparation correction is permitted")


class PreparationContinuation(Campaign):
    def __init__(self, parent_path, config_path, output, receipt_path, receipt_sha256):
        clock = ContinuationClock()  # Expiry is checked before output or child creation.
        self.bindings = load_receipt(receipt_path, receipt_sha256)
        self.receipt_path, self.receipt_hash = receipt_path.resolve(), receipt_sha256
        self.parent_path = parent_path.resolve()
        require(sha(self.parent_path) == self.bindings["parent_sha256"], "Historical campaign identity changed")
        self.parent_state = json.loads(self.parent_path.read_text())
        validate_stop(self.parent_state)
        prior_clock = self.parent_state["outer_clock"]
        require(utc_now() >= datetime.fromisoformat(prior_clock["observed_utc"]),
                "UTC moved backwards since the stopped parent")
        # These are the SAME host and original ordinary worktrees: retain the
        # prior monotonic limit as well as the fixed UTC limit, never renew it.
        clock.deadline_monotonic = min(clock.deadline_monotonic, prior_clock["deadline_monotonic"])
        clock.started_monotonic = prior_clock["started_monotonic"]
        clock.require_open()
        old_path = Path(self.parent_state["supplied_config"]["path"])
        require(self.parent_state["supplied_config"]["sha256"] == self.bindings["old_config_sha256"] and
                sha(old_path) == self.bindings["old_config_sha256"], "Historical configuration changed")
        require(sha(config_path) == self.bindings["fixed_config_sha256"], "Unreviewed repaired configuration")
        fixed = json.loads(config_path.read_text())
        old = json.loads(old_path.read_text())
        validate_config(old, fixed)
        effective = copy.deepcopy(old)
        boot_bin = str(Path(old["boot_jdk"]) / "bin")
        effective["environment"]["PATH"] = os.pathsep.join([boot_bin, *[
            p for p in old["environment"]["PATH"].split(os.pathsep) if p != boot_bin]])
        require(effective == self.parent_state["config"], "Historical effective configuration changed")
        super().__init__(fixed, output, clock=clock)
        # Prior command time remains spent; verification and helper preparation
        # share one remaining prepare cap. No same-phase reset is possible.
        debits = {phase: sum(r["wall_seconds"] for r in self.parent_state["records"] if r["phase"] == phase)
                  for phase in self.phase_caps}
        for phase, spent in debits.items():
            self.phase_caps[phase] -= spent
            require(self.phase_caps[phase] > 0, "Original stage budget exhausted")
        self.state["prior_phase_command_seconds"] = debits
        self.state["prior_preparation"] = dict(path=str(self.parent_path), sha256=self.bindings["parent_sha256"],
            failure=self.parent_state["failure"], failed_record=self.parent_state["records"][-1])
        self.state["supplied_config"] = dict(path=str(config_path.resolve()), sha256=self.bindings["fixed_config_sha256"])
        self.state["continuation_receipt"] = dict(path=str(self.receipt_path), sha256=self.receipt_hash)
        self.state["images"] = copy.deepcopy(self.parent_state["images"])
        self.state["bundle"] = copy.deepcopy(self.parent_state["bundle"])
        self.state["host"] = copy.deepcopy(self.parent_state["host"])
        self.entered_phases = {"prepare"}
        self.source_hash = sha(Path(__file__))
        self.state["continuation_source_sha256"] = self.source_hash
        claim = self.parent_path.parent / "preparation-continuation-claim.json"
        with claim.open("x") as stream:
            json.dump(dict(output=str(self.output), parent_sha256=self.bindings["parent_sha256"],
                           source_sha256=self.source_hash, deadline_utc=DEADLINE_UTC), stream)
        self.claim_path, self.claim_hash = claim, sha(claim)
        self.state["continuation_claim"] = dict(path=str(claim), sha256=self.claim_hash)
        self.images = {kind: self.parent_path.parent / kind / "build/qualification/images/jdk"
                       for kind in PLAN["builds"]}
        self.worktrees = {kind: self.parent_path.parent / kind for kind in PLAN["builds"]}
        for kind, tree in self.worktrees.items():
            checkout = next(r for r in self.parent_state["records"] if r["name"] == kind + "-checkout")
            require(tree.resolve() == Path(checkout["command"][-2]).resolve(),
                    "Only the original same-host ordinary worktree may be adopted")
            # Diagnostics use this fixed layout. These aliases reference the
            # original ordinary Git worktrees, with no image copying/relabeling.
            (self.output / kind).symlink_to(tree, target_is_directory=True)
        self.save()

    def start_phase(self, phase):
        self.clock.require_open()
        if phase == self.phase:
            return
        require(phase not in self.entered_phases, "A completed stage cannot be restarted")
        self.entered_phases.add(phase)
        super().start_phase(phase)

    def verify_parent(self):
        require(sha(self.receipt_path) == self.receipt_hash and
                sha(self.parent_path) == self.bindings["parent_sha256"] and sha(Path(__file__)) == self.source_hash,
                "Historical campaign or continuation source changed")
        require(sha(self.claim_path) == self.claim_hash, "Continuation ownership claim changed")
        old_config = self.parent_state["supplied_config"]
        require(sha(old_config["path"]) == self.bindings["old_config_sha256"], "Historical config changed")
        require(sha(self.parent_path.parent / "full-image-provenance.json") == self.bindings["parent_provenance_sha256"],
                "Historical full-image provenance changed")
        bundle = Path(self.config["jdk_source"]) / "doc/cold-call-qualification/SOURCE-MANIFEST.json"
        require(sha(bundle) == self.state["bundle"]["manifest_sha256"], "Original source manifest changed")
        source_root = Path(__file__).resolve().parents[3]
        for entry in json.loads(bundle.read_text())["files"]:
            require(sha(source_root / entry["path"]) == entry["sha256"], "Frozen qualification source changed")
        for row in self.parent_state["records"]:
            self.clock.require_open()
            require(sha(self.parent_path.parent / (row["name"] + ".log")) == row["log_sha256"],
                    "Historical command evidence changed: " + row["name"])
        for kind, expected in self.bindings["image_inventories"].items():
            tree, image = self.worktrees[kind], self.images[kind]
            old = self.parent_state["images"][kind]
            require((self.output / kind).is_symlink() and (self.output / kind).resolve() == tree.resolve(),
                    "Adopted image alias changed")
            require(sha(tree / "build/qualification/spec.gmk") == old["spec_sha256"] and
                    sha(self.parent_path.parent / (kind + "-spec.gmk")) == old["spec_sha256"] and
                    sha(image / "lib/server/libjvm.so") == old["libjvm_sha256"] and
                    (image / "release").read_text() == old["release"], "Recorded image/spec identity changed")
            manifest = self.parent_path.parent / (kind + "-full-image.json")
            require(sha(manifest) == expected and inventory(image, self.clock) == json.loads(manifest.read_text()),
                    "Full recorded image identity changed: " + kind)

    def adopt(self):
        self.verify_parent()
        # Readiness only: no make, configure, Git checkout, Java compilation,
        # safety capture, throughput or resource command is launched here.
        require(not self.run("resume-source-clean", ["git", "status", "--porcelain"],
                             cwd=self.config["jdk_source"]).strip(), "JDK bundle checkout changed")
        require(self.run("resume-source-head", ["git", "rev-parse", "HEAD"],
                         cwd=self.config["jdk_source"]).strip() == self.state["bundle"]["jdk_commit"],
                "Published source bundle head changed")
        self.state["runner_commit"] = self.run("resume-runner-head", ["git", "rev-parse", "HEAD"]).strip()
        require(not self.run("resume-runner-clean", ["git", "status", "--porcelain"]).strip(),
                "Committed continuation checkout required")
        self.run("resume-codec-pin", ["git", "diff", "--exit-code", self.state["plan"]["codec"],
                  "--", "src/main/java", "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"])
        for kind, tree in self.worktrees.items():
            require(self.run("resume-" + kind + "-head", ["git", "rev-parse", "HEAD"], cwd=tree).strip()
                    == self.state["images"][kind]["commit"], "Adopted source head changed")
        self.save()

    def verify_frozen(self):
        super().verify_frozen()
        self.verify_parent()


def execute(campaign):
    campaign.adopt()
    campaign.verify_images()
    campaign.prepare()
    campaign.verify_prepared()
    campaign.safety()
    campaign.capture()
    campaign.review_gate("pre-timing")
    campaign.timing()
    campaign.resources()
    campaign.summarize()
    from capture_timed_profile import run_diagnostics
    import shutil
    parent = campaign.output / "diagnostic-parent.json"
    shutil.copyfile(campaign.output / "campaign.json", parent)
    run_diagnostics(campaign.output, clock=campaign.clock)
    campaign.state["diagnostic_parent_snapshot_sha256"] = sha(parent)
    campaign.state["diagnostic_manifest_sha256"] = sha(campaign.output / "source-profile-diagnostics/campaign.json")
    decision = campaign.review_gate("final")
    campaign.state.update(status="complete-owner-verdict", verdict=decision,
        review_seconds=campaign.review_elapsed,
        cleanup="All direct command children reaped; no active command remains",
        publication="None; no automatic CI/PR/default change")
    campaign.save()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--config", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--receipt-sha256", required=True)
    args = parser.parse_args()
    campaign = PreparationContinuation(args.parent, args.config, args.output, args.receipt, args.receipt_sha256)
    previous = {sig: signal.getsignal(sig) for sig in (signal.SIGTERM, signal.SIGINT)}
    try:
        for sig in previous:
            signal.signal(sig, cancellation_signal)
        execute(campaign)
    except BaseException as error:
        campaign.state.update(status="stopped-no-retry", failure=str(error))
        campaign.save()
        raise
    finally:
        for sig, handler in previous.items():
            signal.signal(sig, handler)


if __name__ == "__main__":
    main()
