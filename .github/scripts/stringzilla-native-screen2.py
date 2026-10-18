#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Second native candidate screen; immutable production459 remains the baseline."""
import argparse
import ctypes
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import statistics
import subprocess
import zipfile
import io

ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
OUT = ROOT / "component-output"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
HISTORICAL_GCC_PACKAGE = "16-20260322-1ubuntu1"
INPUT_MAP_SHA256 = "27c6004491c0120db2c0ca94a23a034a760428ad0b5763b53e8c7f53b3738a9f"
VARIANTS = ("long", "short", "combined")
INPUTS = {
    "baseline": {
        "kernel_blob": "39144674b48777a00a41cf1456cd253a41fca2c2",
        "kernel_sha256": "e6511e32540530e2086bec93bd66cce096f5f3226ba2d71be8cdfc7d5d709117",
        "tests_blob": "285615e7e6b50123d850c4fd141bd4aff52955ac",
        "tests_sha256": "358174761f88b1a6fad74ac99714935af9191722bc75d52add77f8b09d52d4ed"
    },
    "long": {
        "kernel_blob": "d14881913b31e421fc8f090e33790550b5974b48",
        "kernel_sha256": "f2d15c1861e76e76f08fab8009f2720017a113c566a2d3147de73c6214664536",
        "tests_blob": "14b07efccebdabf864bd3c558ca5bb7077331a41",
        "tests_sha256": "844241dd646dd35513da4eb626e5926afbb950d61b255d6333c9f88bd30def23"
    },
    "short": {
        "kernel_blob": "2b12a3e8f302433c77a490c7386a1c2d89297350",
        "kernel_sha256": "58f571e4dffb3b7263dee05354516678682eefaa6b5986ab758d2dcf564b3c8f",
        "tests_blob": "bf2d0b1c38544b6ef1991d3b4d764d80a3d70508",
        "tests_sha256": "a33758de63b6c8a8ae4302289233d66d08e5d6ab670bbe60201fb82945f8e18f"
    },
    "combined": {
        "kernel_blob": "3aa9f9988f14f4dc8bf948230578624721da7687",
        "kernel_sha256": "60a38056f9fd4732a7135d0c947c260f5ecb48acf26e3ecda9bfc786831eb858",
        "tests_blob": "a562967a00e1728e4959b61121f99fa0b83f674d",
        "tests_sha256": "50d7d560eb0cecf1725df812d9e5a2201eb30fa921faf4cd84c7474e40e80ed0"
    }
}
BACKENDS = {"serial": (0, 0), "avx2": (1, 32), "avx512": (2, 64), "neon": (4, 16)}



def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def capture(values):
    return subprocess.check_output([str(value) for value in values], text=True, stderr=subprocess.STDOUT).strip()


def run(values, log, environment=None, timeout=300):
    with log.open("w") as stream:
        child = subprocess.run([str(value) for value in values], stdout=stream, stderr=subprocess.STDOUT,
                               env=environment, timeout=timeout)
    if child.returncode:
        print(log.read_text(errors="replace")[-16000:], flush=True)
        raise RuntimeError("Component command failed: " + str(log))
    return {"command": [str(value) for value in values], "log": log.relative_to(OUT).as_posix(),
            "log_sha256": sha(log)}


def records(log, name):
    prefix = "STRINGZILLA_NATIVE_SCREEN2_" + name + " "
    return [json.loads(line[len(prefix):]) for line in log.read_text().splitlines() if line.startswith(prefix)]


def input_hashes():
    values = {path.name: sha(path) for path in sorted((OUT / "inputs").glob("*.bin"))}
    legacy = {name: digest for name, digest in values.items() if not name.startswith("extra-")}
    assert len(values) == 298 and len(legacy) == 152 and canonical_sha(legacy) == INPUT_MAP_SHA256
    return values


def copy_control(control):
    folder = OUT / control
    folder.mkdir()
    if control == "baseline":
        kernel = ROOT / "src/java.base/share/native/libjava/StringZillaKernels.c"
        tests = ROOT / "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
    else:
        kernel = AUX / (".github/scripts/stringzilla-native-" + control + "-kernels.c")
        tests = AUX / (".github/scripts/stringzilla-native-" + control + "-tests.c")
    assert sha(kernel) == INPUTS[control]["kernel_sha256"]
    assert sha(tests) == INPUTS[control]["tests_sha256"]
    (folder / "StringZillaKernels.c").write_bytes(kernel.read_bytes())
    (folder / "native-tests.c").write_bytes(tests.read_bytes())
    tag = "component_baseline" if control == "baseline" else "component_candidate"
    wrapper = folder / "kernel-unit.c"
    wrapper.write_text(
        "#define StringZilla_initialize " + tag + "_initialize\n"
        "#define JVM_StringZillaCapabilities " + tag + "_capabilities\n"
        "#define JVM_RegisterStringZillaKernels " + tag + "_publish\n"
        '#include "StringZillaKernels.c"\n'
        "static const StringZillaKernels* component_published;\n"
        "static jint component_requested;\n"
        "JNIEXPORT jint JNICALL JVM_StringZillaCapabilities(void) { return component_requested; }\n"
        "JNIEXPORT void JNICALL JVM_RegisterStringZillaKernels(const void* table) {\n"
        "    component_published = (const StringZillaKernels*)table;\n"
        "}\n"
        "const StringZillaKernels* " + tag + "_kernels(jint capabilities) {\n"
        "    component_requested = capabilities;\n"
        "    return StringZilla_initialize() == capabilities ? component_published : NULL;\n"
        "}\n")
    contract = folder / "contract.c"
    contract.write_text(
        '#include "native-tests.c"\n#include <stdio.h>\n'
        "int main(void) {\n"
        "    for (jint mask = 0; mask < 8; mask++) {\n"
        "        requested_capabilities = mask; test_initialize();\n"
        '        printf("requested=%d selected=%d executable=%d\\n", mask, published->capabilities,\n'
        "               can_execute(published->capabilities));\n"
        "    }\n"
        "    int failure = check_kernels();\n"
        '    if (failure) fprintf(stderr, "Native failure line %d\\n", failure);\n'
        '    else puts("Native contract passed");\n'
        "    return failure ? 1 : 0;\n"
        "}\n")
    return folder, wrapper, contract


def assembly_paths(path, label):
    text = path.read_text()
    headers = list(re.finditer(r"(?m)^([0-9a-f]+) <([^>]+)>:\s*$", text))
    selected, callback_count = [], 0
    for i, match in enumerate(headers):
        name = match[2]
        if not any(token in name for token in
                   ("neon_rfind_latin1", "rfind_latin1_neon", "sz_rfind_neon", "search_impl")):
            continue
        body = text[match.start():headers[i + 1].start() if i + 1 < len(headers) else len(text)]
        lines = body.splitlines()
        calls = [line for line in lines if re.search(r"\s(?:bl|blr|br|b)\s", line)]
        entry = {"symbol": name, "address": match[1], "lines": len(lines),
                 "body_sha256": hashlib.sha256(body.encode()).hexdigest(), "calls_and_tail_branches": calls}
        callback_count += name.startswith("neon_rfind_latin1")
        selected.append(entry)
        # Complete saved objdump remains in the artifact; bounded log text exposes
        # each actual callback and all of its direct call/tail-branch targets.
        print("STRINGZILLA_NATIVE_SCREEN2_ASSEMBLY " + json.dumps(
            {"label": label, **entry, "first_lines": lines[:120 if name.startswith("search_impl") else 320]}, separators=(",", ":")), flush=True)
    assert callback_count >= 2, "Both separately compiled baseline/candidate callbacks must be present"
    return {"file_sha256": sha(path), "symbols": selected}


def historical_assembly():
    artifact_id = 12140157714
    digest = "sha256:05f832c9076972fdb8ccaedd469760ddbdf58620a51d036abde103659b4a2cb7"
    head = "0e49ebb7b5f8c65c7f02d55f0fc0f284b77e4557"
    endpoint = "repos/re-thc/openjdk-jdk27u/actions/artifacts/" + str(artifact_id)
    metadata = json.loads(capture(["gh", "api", endpoint]))
    assert metadata["id"] == artifact_id and metadata["digest"] == digest and not metadata["expired"]
    assert metadata["workflow_run"]["id"] == 39136165574 and metadata["workflow_run"]["head_sha"] == head
    assert metadata["name"] == "stringzilla-neon-screen-" + head + "-attempt1"
    archive = subprocess.check_output(["gh", "api", endpoint + "/zip"])
    assert "sha256:" + hashlib.sha256(archive).hexdigest() == digest
    folder = OUT / "historical-first-screen"
    folder.mkdir()
    with zipfile.ZipFile(io.BytesIO(archive)) as bundle:
        provenance_bytes = bundle.read("provenance.json")
        provenance = json.loads(provenance_bytes)
        assembly = bundle.read("long-assembly.log")
    assert provenance["production_source"] == SOURCE and provenance["auxiliary_head"] == head
    assert provenance["runner_sha256"] == "dfab0bb6cb8b2e1ecc97a33694ce1707b8e0b55ec56731d5a2cdae4af1c73a89"
    assert provenance["harness_sha256"] == "da6c137c0ecfdf58af4be2d6844f8c07a13b5dfdca41c694aa5643be665d7af9"
    assert provenance["native_contracts_all_passed"] is True and provenance["comparisons"] == 441
    assert hashlib.sha256(assembly).hexdigest() == provenance["builds"]["long_assembly"]["log_sha256"]
    assert hashlib.sha256(assembly).hexdigest() == "43da8bc381eab9d4fa6d9c4b872c29e6fa59fbc33bb4698122743e701982dd68"
    path = folder / "long-assembly.log"
    path.write_bytes(assembly)
    (folder / "provenance.json").write_bytes(provenance_bytes)
    receipt = {"artifact_id": artifact_id, "artifact_digest": digest, "producer_run": 39136165574,
               "producer_head": head, "production_source": SOURCE, "timed_records": 0,
               "scope": "Read-only extraction of saved first-screen machine code; no timing repeated",
               "provenance_sha256": hashlib.sha256(provenance_bytes).hexdigest(),
               "assembly": assembly_paths(path, "first-screen-long"),
               "metadata": metadata}
    (folder / "extraction-receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    return receipt


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--backend", choices=tuple(BACKENDS), required=True)
    args = parser.parse_args()
    backend = args.backend
    capabilities, vector_bytes = BACKENDS[backend]
    architecture = platform.machine().lower()
    assert architecture in (("aarch64", "arm64") if backend == "neon" else ("x86_64", "amd64"))
    assert capture(["git", "rev-parse", "HEAD"]) == SOURCE
    capture(["git", "diff", "--exit-code", "--", "src", "make", "test", "bin"])
    assert os.environ["GITHUB_RUN_ATTEMPT"] == "1", "No duplicate component execution by rerun"
    OUT.mkdir()
    (OUT / "inputs").mkdir()
    includes = OUT / "include"
    includes.mkdir()
    template = ROOT / "src/java.base/share/native/include/classfile_constants.h.template"
    constants = template.read_text().replace("@@VERSION_CLASSFILE_MAJOR@@", "71").replace("@@VERSION_CLASSFILE_MINOR@@", "0")
    assert "@@" not in constants
    (includes / "classfile_constants.h").write_text(constants)
    source = AUX / ".github/scripts/stringzilla-native-screen2.c"
    assert sha(source) == "b5cd930ef46078b444506bd0e41762e5d160dc36f1522cfddaac8edb778cfdde"
    compiler = capture(["gcc-16", "--version"])
    assert capture(["gcc-16", "-dumpversion"]) == "16"
    flags = ["gcc-16", "-std=c11", "-O3",
             "-march=armv8.2-a" if backend == "neon" else "-march=x86-64-v3", "-DSZ_USE_SVE=0",
             "-fno-lto", "-fno-omit-frame-pointer", "-Wall", "-Wextra", "-Wno-unknown-pragmas",
             *["-I" + str(path.resolve()) for path in (
                 ROOT, includes, ROOT / "src/java.base/share/native/libjava",
                 ROOT / "src/java.base/share/native/libjava/stringzilla",
                 ROOT / "src/java.base/share/native/include", ROOT / "src/java.base/unix/native/include",
                 ROOT / "src/hotspot/share/include", ROOT / "src/hotspot/os/posix/include")]]
    sanitizer = ["-fsanitize=address,undefined,alignment", "-fno-sanitize-recover=all"]
    environment = {**os.environ, "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=1:strict_string_checks=1",
                   "UBSAN_OPTIONS": "halt_on_error=1:print_stacktrace=1"}
    libc = ctypes.CDLL(None)
    libc.getauxval.argtypes, libc.getauxval.restype = [ctypes.c_ulong], ctypes.c_ulong
    hwcap = libc.getauxval(16) if backend == "neon" else None
    provenance = {"production_source": SOURCE, "candidate_status": "unpromoted-isolated-native-copy",
                  "auxiliary_head": os.environ["GITHUB_SHA"], "backend": backend,
                  "expected_capabilities": capabilities, "input_blobs": INPUTS,
                  "compiler": compiler, "compiler_fullversion": capture(["gcc-16", "-dumpfullversion", "-dumpversion"]),
                  "historical_compiler_package": HISTORICAL_GCC_PACKAGE,
                  "matches_historical_compiler_package": HISTORICAL_GCC_PACKAGE in compiler,
                  "machine": platform.platform(), "cpuinfo": Path("/proc/cpuinfo").read_text(), "hwcap": hwcap,
                  "timing_scope": "Candidate screening: native component calls only; no JVM, Java dispatch, JMH or original-Java comparison",
                  "input_scope_labels": "Potential adapter input ranges, not proof a helper executed; equality-only single-candidate ranges are excluded.",
                  "header_generation": {"template_sha256": sha(template), "major": 71, "minor": 0},
                  "harness_sha256": sha(source), "runner_sha256": sha(Path(__file__)),
                  "fixture_input_map_sha256": INPUT_MAP_SHA256, "flags": flags,
                  "source_trees": capture(["git", "ls-tree", "HEAD", "--", "src", "make", "test", "bin"]),
                  "builds": {}, "native_contracts": {}}
    if backend == "neon":
        # Retrieval/inspection only: no compile, execution or new timing from the first screen.
        provenance["historical_assembly"] = historical_assembly()
        supported = bool(hwcap & 2)
    else:
        probe = OUT / "cpu-probe.c"
        probe.write_text(
            '#include <stdio.h>\nint main(void) { __builtin_cpu_init();\n'
            'printf("{\\"v3\\":%d,\\"skylake\\":%d}\\n", !!__builtin_cpu_supports("x86-64-v3"),\n'
            '!!(__builtin_cpu_supports("avx512f") && __builtin_cpu_supports("avx512bw") && '
            '__builtin_cpu_supports("avx512vl"))); return 0; }\n')
        probe_binary = OUT / "cpu-probe"
        provenance["builds"]["cpu_probe"] = run(
            ["gcc-16", "-std=c11", "-O2", "-march=x86-64", probe, "-o", probe_binary], OUT / "cpu-probe-build.log")
        physical = json.loads(capture([probe_binary]))
        provenance["physical_cpu"] = physical
        provenance["cpu_probe_sha256"] = {"source": sha(probe), "binary": sha(probe_binary)}
        supported = bool(physical["v3"] and (backend != "avx512" or physical["skylake"]))
    if not supported:
        provenance["unsupported"] = {"available": False, "timed_records": 0,
                                     "reason": "Required native architecture or ISA absent"}
        (OUT / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
        print("STRINGZILLA_NATIVE_SCREEN2_SKIPPED " + json.dumps(provenance, separators=(",", ":")), flush=True)
        return
    objects, sanitized_objects, control_files = {}, {}, []
    for control in ("baseline", *VARIANTS):
        folder, wrapper, contract = copy_control(control)
        control_files.extend(folder.iterdir())
        obj, sanitized_obj = folder / "kernel.o", folder / "kernel-sanitized.o"
        provenance["builds"][control] = run([*flags, "-c", wrapper, "-o", obj], folder / "build.log")
        provenance["builds"][control + "_sanitized"] = run(
            [*flags, *sanitizer, "-c", wrapper, "-o", sanitized_obj], folder / "sanitized-build.log")
        binary = folder / "native-contract"
        provenance["builds"][control + "_contract"] = run(
            [*flags, *sanitizer, contract, "-o", binary], folder / "contract-build.log")
        provenance["native_contracts"][control] = run([binary], folder / "contract.log", environment)
        text = (folder / "contract.log").read_text()
        assert f"requested={capabilities} selected={capabilities} executable=1" in text and "Native contract passed" in text
        objects[control] = obj
        sanitized_objects[control] = sanitized_obj
    binaries, checks = {}, {}
    before_inputs = None
    for variant in VARIANTS:
        benchmark, sanitized = OUT / (variant + "-screen"), OUT / (variant + "-correctness")
        provenance["builds"][variant + "_link"] = run(
            [*flags, source, objects["baseline"], objects[variant], "-o", benchmark], OUT / (variant + "-build.log"))
        provenance["builds"][variant + "_sanitized_link"] = run(
            [*flags, *sanitizer, source, sanitized_objects["baseline"], sanitized_objects[variant], "-o", sanitized],
            OUT / (variant + "-sanitized-build.log"))
        provenance["builds"][variant + "_assembly"] = run(["objdump", "-d", benchmark], OUT / (variant + "-assembly.log"))
        if backend == "neon" and variant == "long":
            provenance["current_long_assembly"] = assembly_paths(OUT / (variant + "-assembly.log"), "second-screen-long")
        log = OUT / (variant + "-correctness.log")
        provenance["builds"][variant + "_correctness"] = run([sanitized, backend, "--check-only"], log, environment)
        host = records(log, "HOST")
        assert len(host) == 1 and host[0]["available"] and host[0]["vector_bytes"] == vector_bytes
        assert host[0]["backend"] == backend and host[0]["capabilities"] == capabilities
        correctness = records(log, "CHECK")
        assert len(correctness) == 149 and len({record["case"] for record in correctness}) == 149
        assert records(log, "COMPONENT") == []
        current_inputs = input_hashes()
        if before_inputs is None:
            before_inputs = current_inputs
        assert current_inputs == before_inputs
        checks[variant] = {"host": host[0], "cases": correctness}
        binaries[variant] = (benchmark, sanitized)
    # All four native contracts and all three sanitizer fixture runs precede any timing.
    rows, hosts = [], {}
    table = ["Unpromoted native candidate screening only. No JVM/Java dispatch, JMH, original-Java or end-to-end claims.",
             "All original 76 fixtures and 152 input hashes are unchanged. There are 73 additional odd-suffix controls.",
             "Each variant retains 147 paired measurements; two bounded FALLBACK cases are not timed.",
             "", "| Variant | Case | Baseline459 ns/call +/- SEM | Candidate ns/call +/- SEM | Baseline/candidate | Higher candidate mean |",
             "| --- | --- | ---: | ---: | ---: | --- |"]
    for variant in VARIANTS:
        log = OUT / (variant + "-timings.jsonl")
        provenance["builds"][variant + "_execution"] = run([binaries[variant][0], backend], log)
        measured_host = records(log, "HOST")
        host, correctness = checks[variant]["host"], checks[variant]["cases"]
        assert len(measured_host) == 1 and measured_host[0]["available"] and measured_host[0]["vector_bytes"] == vector_bytes
        assert measured_host[0]["cpu"] == host["cpu"] and measured_host[0]["endianness"] == "little"
        assert measured_host[0]["backend"] == backend and measured_host[0]["capabilities"] == capabilities
        hosts[variant] = measured_host[0]
        assert records(log, "CHECK") == correctness
        raw = records(log, "COMPONENT")
        expected = {record["case"] for record in correctness if record["classification"] == "eligible"}
        assert len(raw) == len(expected) == 147 and {record["case"] for record in raw} == expected
        complete = records(log, "COMPLETE")
        assert len(complete) == 1 and complete[0]["cases"] == 149 and not complete[0]["check_only"]
        for record in raw:
            assert record["samples_per_backend"] == 15 and record["warmups_per_backend"] == 3
            iterations = record["iterations_per_sample"]
            assert 128 <= iterations <= 4194304
            means, sems = {}, {}
            for control in ("baseline", "candidate"):
                samples = record["raw_batch_ns"][control]
                assert len(samples) == 15 and all(isinstance(value, int) and value > 0 for value in samples)
                values = [value / iterations for value in samples]
                means[control] = statistics.mean(values)
                sems[control] = statistics.stdev(values) / (15 ** .5)
            row = {**record, "variant": variant, "backend": backend, "mean_ns": means, "sem_ns": sems,
                   "baseline_over_candidate": means["baseline"] / means["candidate"],
                   "higher_candidate_mean": means["candidate"] > means["baseline"],
                   "unchanged_operation_control": record["operation"] != 0,
                   "long_unit_probe_input_scope": variant in ("long", "combined") and record["operation"] == 0
                                               and record["haystack_bytes"] > record["needle_bytes"] > 256
                                               and (backend == "neon" or
                                                    (record["coder"] == "UTF16-native-endian" and
                                                     (backend == "serial" or
                                                      (backend == "avx2" and record["haystack_bytes"] - record["needle_bytes"] >= 64) or
                                                      (backend == "avx512" and record["haystack_bytes"] - record["needle_bytes"] > 2)))),
                   "short_adjacent_probe_input_scope": backend == "neon" and variant in ("short", "combined") and record["operation"] == 0
                                                   and record["coder"] == "UTF16-native-endian"
                                                   and record["haystack_bytes"] > record["needle_bytes"]
                                                   and 3 <= record["needle_units"] <= 32}
            rows.append(row)
            table.append("| " + " | ".join((variant, record["case"],
                f'{means["baseline"]:.3f} +/- {sems["baseline"]:.3f}',
                f'{means["candidate"]:.3f} +/- {sems["candidate"]:.3f}',
                f'{row["baseline_over_candidate"]:.3f}', "yes" if row["higher_candidate_mean"] else "-")) + " |")
            print("STRINGZILLA_NATIVE_SCREEN2_RESULT " + json.dumps(row, separators=(",", ":")), flush=True)
        assert input_hashes() == before_inputs
    assert len(rows) == 441 and len({(row["variant"], row["case"]) for row in rows}) == 441
    for control in ("baseline", *VARIANTS):
        assert sha(OUT / control / "StringZillaKernels.c") == INPUTS[control]["kernel_sha256"]
        assert sha(OUT / control / "native-tests.c") == INPUTS[control]["tests_sha256"]
    provenance["hosts"] = hosts
    provenance["binaries_sha256"] = {path.relative_to(OUT).as_posix(): sha(path)
        for path in [*(path for pair in binaries.values() for path in pair),
                     *objects.values(), *sanitized_objects.values(),
                     *(OUT / control / "native-contract" for control in ("baseline", *VARIANTS))]}
    provenance["generated_sources_sha256"] = {path.relative_to(OUT).as_posix(): sha(path)
                                               for path in control_files}
    provenance["inputs_sha256"] = before_inputs
    provenance["raw_timings_sha256"] = {variant: sha(OUT / (variant + "-timings.jsonl")) for variant in VARIANTS}
    provenance["cases_per_variant"] = 149
    provenance["eligible_cases_per_variant"] = 147
    provenance["outside_bound_cases_not_timed_per_variant"] = 2
    provenance["comparisons"] = 441
    provenance["native_contracts_all_passed"] = True
    (OUT / "results.json").write_text(json.dumps({"provenance": provenance, "results": rows}, indent=2) + "\n")
    (OUT / "RESULTS.md").write_text("\n".join(table) + "\n")
    (OUT / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
    print("STRINGZILLA_NATIVE_SCREEN2_PROVENANCE " + json.dumps(provenance, separators=(",", ":")), flush=True)
    capture(["git", "diff", "--exit-code", "--", "src", "make", "test", "bin"])


if __name__ == "__main__":
    main()
