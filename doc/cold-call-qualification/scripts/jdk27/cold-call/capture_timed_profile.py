#!/usr/bin/env python3
"""Four predeclared source-profile diagnostics, never additional rate samples.

Run once after valid main execution, irrespective of its gain/loss. Reuses its
exact images/classes/frame and command-boundary budget machinery. No build,
retry, alternate corpus, sample replacement, publication or installation.
"""
import argparse
import json
from pathlib import Path
import re
import time
import xml.etree.ElementTree as ET

from qualification_campaign import Campaign, COMMON, DEADLINE_UTC, METHOD, TARGET, dump, require, sha, utc_now
from decode_capture import extract


def run_diagnostics(root, clock=None):
    root = root.resolve()
    original = json.loads((root / "campaign.json").read_text())
    require(original["status"] == "execution-complete-review-required", "Main execution did not complete validly")
    require(original["outer_clock"]["deadline_utc"] == DEADLINE_UTC, "Parent immutable deadline differs")
    require(utc_now().isoformat() >= original["outer_clock"]["observed_utc"], "UTC moved backwards since parent")
    # Add3 minutes to the main35-minute measurement caps:38<approved45.
    campaign = Campaign(original["config"], root / "source-profile-diagnostics", clock=clock,
                        phase_caps={"capture": 180})
    campaign.start_phase("capture")
    campaign.state.update(scope="Four fixed diagnostics; rates excluded from paired ensemble",
                          main_manifest_sha256=sha(root / "campaign.json"))
    try:
        for level in ("release", "fastdebug"):
            image = root / ("candidate-" + level) / "build/qualification/images/jdk"
            require(sha(image / "lib/server/libjvm.so") == original["images"]["candidate-" + level]["libjvm_sha256"],
                    "Frozen image changed")
            for cell in ("off", "on"):
                stem = level + "-" + cell
                directive = campaign.output / (stem + "-directives.json")
                item = dict(match="dev.jzstd.internal." + TARGET, PrintAssembly=True)
                if level == "fastdebug":
                    item["c2"] = dict(TraceSpilling=True)
                dump(directive, [item])
                xml_path = campaign.output / (stem + ".xml")
                flags = [*COMMON, *campaign.flag(cell), "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                         "-XX:LogFile=" + str(xml_path), "-XX:CompilerDirectivesFile=" + str(directive),
                         "-Dprobe.warmup=8", "-Dprobe.compilerStats=true"]
                corpus = root / "prepared/corpora/source.bin"
                frame = root / "prepared/corpora/source.l1.zst"
                require(sha(corpus) == original["inputs"][corpus.name]["sha256"] and
                        sha(frame) == original["inputs"][frame.name]["sha256"], "Frozen source/frame changed")
                log = campaign.run(stem, [image / "bin/java", *flags, "-cp", root / "prepared/classes", "CodecProbe",
                                          "decode", corpus, "1", frame], cap=35)
                xml = ET.parse(xml_path)
                methods = [n for n in xml.iter("nmethod") if METHOD in n.get("method", "") and
                           n.get("compiler") == "c2" and n.get("compile_kind", "normal") == "normal"]
                require(methods, "No final normal source-profile parser")
                selected = methods[-1]
                header, _, code = extract(log, TARGET)
                compile_id = re.match(r"Compiled method \(c2\)\s+\d+\s+(\d+)\s+", header)[1]
                require(selected.get("compile_id") == compile_id, "Code/XML ID mismatch")
                boundary = re.search(r"COMPILER warmup_ms=(\d+) measured_ms=(\d+) boundary_uptime_ms=(\d+)", log)
                require(boundary and float(selected.get("stamp")) < int(boundary[3]) / 1000 - 0.1,
                        "Parser not compiled before boundary")
                require(int(boundary[2]) <= 10, "Unsettled diagnostic compilation")
                require(not any(n.get("compile_id") == compile_id for n in xml.iter("make_not_entrant")),
                        "Final parser became nonentrant")
                pos = log.rfind(header)
                code_section = log[pos:].split("[/MachCode]", 1)[0]
                require(re.search(r"\{static_call\}.{0,750}?\*invokestatic readPartialLong.{0,750}?"
                                  r"BlockDecoder::decodeSequencesRolling@684", code_section, re.S),
                        "Source-profile returning call missing")
                proof = dict(header=header, compile_id=compile_id, main_code_bytes=len(code),
                             nmethod=selected.attrib, target_tasks=[dict(t.attrib,
                                 regalloc=[n.attrib for n in t.iter("regalloc")]) for t in xml.iter("task")
                                 if t.get("compile_id") == compile_id], diagnostic_rates_excluded=True)
                if level == "fastdebug":
                    begin = log.rfind("CCINITIAL ", 0, pos)
                    require(begin >= 0, "No final initial-allocation marker")
                    proof["deferred"] = len(re.findall(r"^CCDEFER ", log[begin:pos], re.M))
                    require((proof["deferred"] > 0) == (cell == "on"), "Source-trained deferral mismatch")
                campaign.state.setdefault("proofs", {})[stem] = proof
                campaign.run(stem + "-objdump", ["python3", Path(__file__).with_name("decode_capture.py"),
                    campaign.output / (stem + ".log"), campaign.output / (stem + ".asm"), "--target", TARGET], cap=5)
                campaign.save()
        campaign.state["status"] = "profile-capture-complete-review-required"
        campaign.save()
        return campaign.state
    except BaseException as error:
        campaign.state.update(status="stopped-no-retry", failure=str(error))
        campaign.save()
        raise


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("campaign", type=Path)
    args = parser.parse_args()
    run_diagnostics(args.campaign)


if __name__ == "__main__":
    main()
