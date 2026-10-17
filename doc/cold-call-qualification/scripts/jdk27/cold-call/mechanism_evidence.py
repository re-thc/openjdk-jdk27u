#!/usr/bin/env python3
"""Read-only C2 capture accounting. No subprocesses and no timing are performed.

``analyze_capture(log_text, xml_path_or_text, asm_text, cell, debug)`` returns a
JSON-safe proof. ``compare_captures({cell: proof})`` returns the complete ledger,
checks and a fail-closed verdict. The caller must retain the three input files;
their SHA256 identities are included in every proof. Objdump must be supplied by
the reviewed runner, with Intel syntax, bytes and absolute addresses.

This is deliberately not an x86 decoder. It verifies every supplied instruction
against contiguous PrintAssembly bytes, rejects undecoded bytes/unknown control
flow, and inventories *all* stack accesses and GPR/XMM transfers. It does not
infer that a missing store preserves Java semantics. Correctness tests and any
required evidence-bound semantic review remain separate gates.
"""
from __future__ import annotations

import argparse
from bisect import bisect_right
from collections import defaultdict
import copy
import difflib
import hashlib
import json
import math
from pathlib import Path
import re
import xml.etree.ElementTree as ET

TARGET = "decodeSequencesRolling"
TARGET_CLASS = "dev.jzstd.internal.BlockDecoder"
ROOT_BCIS = (360, 373, 386)
RETURN_BCI = 684
MAX_CYCLES = 8192
MAX_CYCLE_STATES = 250000
MAX_CYCLE_DEPTH = 512
VECTOR_MEMORY_READS = {
    "addss", "addsd", "addps", "addpd", "subss", "subsd", "subps", "subpd",
    "mulss", "mulsd", "mulps", "mulpd", "divss", "divsd", "divps", "divpd",
    "andps", "andpd", "orps", "orpd", "xorps", "xorpd", "pand", "por", "pxor",
    "pshufb", "pshufd", "paddb", "paddw", "paddd", "paddq", "psubb", "psubw", "psubd", "psubq",
    "pcmpeqb", "pcmpeqw", "pcmpeqd", "pcmpeqq", "pcmpgtb", "pcmpgtw", "pcmpgtd", "pcmpgtq",
    "cvtsi2ss", "cvtsi2sd", "cvtss2sd", "cvtsd2ss", "cvttss2si", "cvttsd2si",
}
VECTOR_MEMORY_READS |= {"v" + op for op in VECTOR_MEMORY_READS}


def _sha(text):
    return hashlib.sha256(text.encode()).hexdigest()


def _number(text):
    value = float(text)
    if not math.isfinite(value) or value < 0:
        raise ValueError("invalid nonnegative frequency: " + text)
    return value


def _target(method):
    return TARGET_CLASS in method and re.search(r"(?:^|\s)" + TARGET + r"(?:\s|\()", method) is not None


def _parse_shape(task):
    types = {node.get("id"): node.get("name") for node in task.iter()
             if node.tag in {"klass", "type"} and node.get("id")}
    methods = {}
    unresolved = set()
    for node in task.iter("method"):
        if not node.get("id"):
            continue
        owner, result = types.get(node.get("holder")), types.get(node.get("return"))
        arguments = [types.get(value) for value in node.get("arguments", "").split()]
        if owner is None or result is None or any(value is None for value in arguments):
            unresolved.add("method:" + node.get("id"))
        else:
            methods[node.get("id")] = owner + "::" + node.get("name", "?") + "(" + ",".join(arguments) + "):" + result
    rows = []

    def method_name(identifier):
        if identifier not in methods:
            unresolved.add("reference:" + str(identifier))
            return "UNRESOLVED"
        return methods[identifier]

    def visit(element, path=(), current="", bci=-1):
        if element.tag == "parse":
            current = method_name(element.get("method"))
            path = path + ((current, bci),)
            rows.append(["parse", list(path)])
            bci = -1
        last_call = None
        for child in element:
            if child.tag == "bc":
                bci = int(child.get("bci", "-1"))
                rows.append(["bc", list(path), bci, child.get("code")])
            elif child.tag == "call":
                last_call = method_name(child.get("method"))
                rows.append(["call", list(path), bci, last_call])
            elif child.tag in {"inline_success", "inline_fail"}:
                rows.append([child.tag, list(path), bci, last_call, child.get("reason", "")])
            elif child.tag == "branch":
                # Numeric profile values are retained, not erased along with
                # unstable pool IDs. A different branch profile is inconclusive.
                rows.append(["branch", list(path), bci,
                             {key: value for key, value in sorted(child.attrib.items())
                              if key in {"target_bci", "taken", "not_taken", "cnt", "prob"}}])
            elif child.tag == "intrinsic":
                rows.append(["intrinsic", list(path), bci, child.get("id")])
            elif child.tag == "uncommon_trap":
                rows.append(["trap", list(path), child.get("bci", str(bci)), child.get("reason"), child.get("action")])
            elif child.tag == "parse":
                visit(child, path, current, bci)
            elif child.tag not in {"method", "klass", "type"}:
                visit(child, path, current, bci)
    visit(task)
    complete = bool(rows) and any(row[0] == "parse" for row in rows) and not unresolved
    encoded = json.dumps(rows, sort_keys=True, separators=(",", ":"))
    return {"complete": complete, "sha256": _sha(encoded), "events": rows,
            "resolved_methods": sorted(set(methods.values())), "unresolved": sorted(unresolved)}


def _xml(text_or_path):
    if isinstance(text_or_path, Path):
        text = text_or_path.read_text()
    elif isinstance(text_or_path, str) and text_or_path.lstrip().startswith("<"):
        text = text_or_path
    else:
        text = Path(text_or_path).read_text()
    root = ET.fromstring(text)
    installed = [n for n in root.iter("nmethod") if _target(n.get("method", ""))
                 and n.get("compiler") == "c2" and n.get("compile_kind") != "osr"
                 and n.get("osr_bci") is None]
    dead = {n.get("compile_id") for n in root.iter("make_not_entrant")}
    if not installed or installed[-1].get("compile_id") in dead:
        raise ValueError("no final normal-entry entrant C2 target")
    selected = installed[-1]
    tasks = [t for t in root.iter("task") if _target(t.get("method", ""))]
    diagnostics = []
    selected_task = None
    shape = None
    for task in tasks:
        failures = [dict(n.attrib) for n in task.iter("failure")]
        allocators = [dict(n.attrib) for n in task.iter("regalloc")]
        done = [dict(n.attrib) for n in task.iter("task_done")]
        diagnostics.append({"compile_id": task.get("compile_id"), "failures": failures,
                            "regalloc": allocators, "task_done": done})
        if task.get("compile_id") == selected.get("compile_id"):
            selected_task = diagnostics[-1]
            shape = _parse_shape(task)
    if selected_task is None:
        raise ValueError("installed target lacks compilation task")
    successful = (not selected_task["failures"] and selected_task["regalloc"]
                  and all(a.get("success") == "1" for a in selected_task["regalloc"])
                  and selected_task["task_done"]
                  and selected_task["task_done"][-1].get("success") == "1")
    return text, {"compile_id": int(selected.get("compile_id")),
                  "installed": dict(selected.attrib), "entrant": True,
                  "normal_entry": True, "selected_task_success": bool(successful),
                  "parse_inlining_branch_shape": shape,
                  "target_compilations": diagnostics}


def _assembly_section(log, compile_id):
    starts = list(re.finditer(r"(?m)^Compiled method \(c2\)[^\n]*$", log))
    for index, match in enumerate(starts):
        header = match.group()
        parsed = re.match(r"Compiled method \(c2\)\s+\d+\s+(\d+)\s+", header)
        if parsed and int(parsed[1]) == compile_id and TARGET in header:
            if "%" in header:
                raise ValueError("assembly is OSR")
            end = starts[index + 1].start() if index + 1 < len(starts) else len(log)
            selected = log[match.start():end]
            bounds = re.search(r"main code\s+\[0x([0-9a-fA-F]+),0x([0-9a-fA-F]+)\]", selected)
            if not bounds or "[MachCode]" not in selected or "[/MachCode]" not in selected:
                raise ValueError("missing main-code bounds or complete MachCode")
            start, stop = (int(v, 16) for v in bounds.groups())
            if stop <= start:
                raise ValueError("empty main code")
            mach = selected.split("[MachCode]", 1)[1].split("[/MachCode]", 1)[0]
            raw = {}
            for line in mach.splitlines():
                item = re.match(r"\s*0x([0-9a-fA-F]+):\s*([0-9a-fA-F |]+)\s*$", line)
                if not item:
                    continue
                pc = int(item[1], 16)
                data = bytes.fromhex(item[2].replace("|", " "))
                for offset, byte in enumerate(data):
                    at = pc + offset
                    if start <= at < stop:
                        if at in raw and raw[at] != byte:
                            raise ValueError("conflicting main-code bytes")
                        raw[at] = byte
            if len(raw) != stop - start:
                missing = next(at for at in range(start, stop) if at not in raw)
                raise ValueError("missing main-code byte " + hex(missing))
            prefix = log[:match.start()]
            # Directives must print only this target. If there are earlier
            # target captures, do not mingle their TraceSpilling provenance.
            previous = prefix.rfind("[/MachCode]")
            if previous >= 0:
                prefix = prefix[previous + len("[/MachCode]"):]
            return header, start, stop, bytes(raw[at] for at in range(start, stop)), mach, prefix
    raise ValueError("entrant XML CompileID does not have matching assembly")


def _instructions(asm, header, start, stop, raw):
    if header not in asm.splitlines():
        raise ValueError("objdump header is not the selected entrant compilation")
    instructions = []
    for line in asm.splitlines():
        item = re.match(r"^\s*([0-9a-fA-F]+):\s+((?:[0-9a-fA-F]{2}[ \t]+)+)\s*(\S.*)$", line)
        if not item:
            if re.match(r"^\s*[0-9a-fA-F]+:", line) and not line.rstrip().endswith(":"):
                raise ValueError("unparsed objdump instruction: " + line)
            continue
        pc = int(item[1], 16)
        data = bytes.fromhex(item[2])
        body = item[3].strip()
        if "(bad)" in body or body.startswith((".byte", ".word")):
            raise ValueError("undecoded instruction at " + hex(pc))
        mnemonic, _, operands = body.partition(" ")
        # Objdump presents certain prefixes as separate words.
        while mnemonic in {"lock", "rep", "repz", "repnz", "bnd", "notrack", "data16", "rex.W"}:
            next_word, _, operands = operands.strip().partition(" ")
            mnemonic = mnemonic + " " + next_word
            break
        if not start <= pc < stop:
            raise ValueError("objdump instruction outside main code")
        instructions.append({"pc": pc, "offset": pc - start, "size": len(data),
                             "bytes": data.hex(), "mnemonic": mnemonic.lower(),
                             "operands": operands.strip(), "text": body})
    if not instructions:
        raise ValueError("no decoded instructions")
    cursor = start
    for ins in instructions:
        if ins["pc"] != cursor or ins["size"] < 1 or ins["size"] > 15:
            raise ValueError("noncontiguous/overlapping/invalid objdump coverage at " + hex(cursor))
        if bytes.fromhex(ins["bytes"]) != raw[cursor - start:cursor - start + ins["size"]]:
            raise ValueError("objdump bytes differ from capture at " + hex(cursor))
        cursor += ins["size"]
    if cursor != stop:
        raise ValueError("objdump does not cover every main-code byte")
    return instructions


def _annotations(mach, instructions, opto_text=""):
    pcs = [i["pc"] for i in instructions]
    end = instructions[-1]["pc"] + instructions[-1]["size"]
    annotations = defaultdict(list)
    roots = defaultdict(set)
    frequencies = {}
    headers = []
    pending_blocks = []
    current_pc = None
    current_kind = ""

    def interval(pc):
        at = bisect_right(pcs, pc) - 1
        if at >= 0 and pcs[at] <= pc < pcs[at] + instructions[at]["size"]:
            return pcs[at]
        return None

    # Fastdebug's full OptoAssembly listing is more complete than the sparse
    # ;; B annotations in MachCode. Its offsets share this exact nmethod base.
    for line in opto_text.splitlines():
        block = re.match(r"\s*([0-9a-fA-F]+)\s+B(\d+):.*?Freq:\s*(\S+)", line)
        if block:
            pc = pcs[0] + int(block[1], 16)
            if pc not in pcs:
                raise ValueError("OptoAssembly block offset is not an instruction boundary")
            value = {"block": int(block[2]), "frequency": _number(block[3]), "pc": pc}
            headers.append(value)
            frequencies[pc] = value["frequency"]

    for line in mach.splitlines():
        block = re.search(r";;\s*B(\d+):.*?Freq:\s*(\S+)", line)
        if block:
            pending_blocks.append({"block": int(block[1]), "frequency": _number(block[2])})
        address = re.match(r"\s*0x([0-9a-fA-F]+):\s*(.*)", line)
        if address:
            current_pc = int(address[1], 16)
            current_kind = address[2] if address[2].startswith(";") else ""
            if pending_blocks and current_pc < end and not address[2].startswith(";"):
                if current_pc not in pcs:
                    raise ValueError("MachCode block boundary is inside an instruction")
                for block in pending_blocks:
                    headers.append(dict(block, pc=current_pc))
                frequencies[current_pc] = pending_blocks[-1]["frequency"]
                pending_blocks.clear()
        if current_pc is not None and ";" in line:
            at = interval(current_pc)
            if at is not None:
                annotations[at].append(line.strip())
                bci = re.search(r"BlockDecoder::decodeSequencesRolling@(-?\d+)\b", line)
                if bci and int(bci[1]) in ROOT_BCIS and "laload" in current_kind:
                    roots[int(bci[1])].add(at)
    for ins in instructions:
        ins["annotations"] = annotations.get(ins["pc"], [])
    # PrintAssembly flushes byte groups at relocation sites, occasionally before
    # the actual transfer opcode (e.g. in the tail of its argument store). Bind
    # an explicit runtime-call annotation only to the unique next control
    # transfer in that at-most-15-byte instruction window.
    for pc, notes in list(annotations.items()):
        markers = [line for line in notes if re.search(r"\{runtime_call\s+[^}]+\}", line)]
        if not markers:
            continue
        candidates = [i for i in instructions if pc <= i["pc"] < pc + 16
                      and (i["mnemonic"].split()[-1].startswith("j") or i["mnemonic"].split()[-1] in {"call", "callq"})]
        if candidates:
            candidates[0]["annotations"].extend(line for line in markers if line not in candidates[0]["annotations"])
    sorted_freq = sorted(frequencies)
    for ins in instructions:
        pos = bisect_right(sorted_freq, ins["pc"]) - 1
        ins["frequency"] = frequencies[sorted_freq[pos]] if pos >= 0 else None
    mapped = {}
    for bci in ROOT_BCIS:
        candidates = []
        for pc in roots.get(bci, set()):
            ins = instructions[pcs.index(pc)]
            operands = _operands(ins["operands"])
            if (ins["mnemonic"] in {"mov", "movabs"} and len(operands) == 2
                    and "[" not in operands[0] and "QWORD PTR [" in operands[1]
                    and not re.search(r"\[rsp\b", operands[1])):
                candidates.append(pc)
        if len(candidates) != 1:
            raise ValueError("BCI %d does not identify exactly one nonstack 64-bit load instruction: %r" % (bci, sorted(candidates)))
        pc = candidates[0]
        mapped[str(bci)] = pc
    return mapped, headers


def _operands(text):
    # Commas inside brackets are uncommon in Intel syntax, but do not split them.
    return [part.strip() for part in re.split(r",(?![^\[]*\])", text.split("#", 1)[0]) if part.strip()]


def _flow(instructions, start, stop):
    by_pc = {i["pc"]: i for i in instructions}
    leaders = {start}
    external = []
    for ins in instructions:
        op = ins["mnemonic"].split()[-1]
        following = ins["pc"] + ins["size"]
        successors = []
        is_branch = op.startswith("j") or op.startswith("loop")
        ins["call"] = op in {"call", "callq"}
        ins["branch"] = is_branch
        if is_branch:
            target = re.fullmatch(r"(?:0x)?([0-9a-fA-F]+)(?:\s+<[^>]+>)?", ins["operands"])
            if not target:
                raise ValueError("unresolved indirect branch: " + ins["text"])
            target = int(target[1], 16)
            ins["target"] = target
            if start <= target < stop:
                if target not in by_pc:
                    raise ValueError("branch target is inside an instruction")
                successors.append(target)
                leaders.add(target)
            else:
                external.append({"pc": ins["pc"], "target": target, "kind": "tail-exit"})
            if op not in {"jmp", "jmpq"} and following < stop:
                successors.append(following)
                leaders.add(following)
        elif op in {"ret", "retq", "ud2", "hlt", "int3"}:
            pass
        elif op in {"syscall", "sysenter", "iret", "iretq", "int"}:
            raise ValueError("unsupported exceptional control transfer: " + ins["text"])
        elif following < stop:
            successors.append(following)
            if ins["call"]:
                leaders.add(following)
        ins["successors"] = successors
        if (is_branch or ins["call"] or op in {"ret", "retq", "ud2", "hlt", "int3"}) and following < stop:
            leaders.add(following)
    blocks = []
    current = None
    for ins in instructions:
        if ins["pc"] in leaders or current is None:
            current = {"pc": ins["pc"], "instructions": [], "successors": []}
            blocks.append(current)
        current["instructions"].append(ins["pc"])
        ins["block"] = current["pc"]
    for block in blocks:
        block["successors"] = by_pc[block["instructions"][-1]]["successors"]
        block["calls"] = [pc for pc in block["instructions"] if by_pc[pc]["call"]]
    return blocks, external


def _transport(instructions):
    """Inventory memory effects. Unknown stack effects cannot produce PASS."""
    ledger = []
    frame = []
    unknown = []
    aliases = {"rsp"}
    # A captured raw rbp is often an allocatable Java register. Only call it a
    # frame base if the code actually establishes it from rsp.
    proven_rbp = any((re.fullmatch(r"rbp\s*,\s*rsp", i["operands"]) and i["mnemonic"] == "mov")
                     or (re.fullmatch(r"rbp\s*,\s*\[rsp(?:[+-]0x[0-9a-f]+)?\]", i["operands"]) and i["mnemonic"] == "lea")
                     for i in instructions[:12])
    if proven_rbp:
        aliases.add("rbp")
    for ins in instructions:
        op = ins["mnemonic"].split()[-1]
        args = _operands(ins["operands"])
        memory = [n for n, a in enumerate(args) if "[" in a]
        stack = [n for n in memory if any(re.search(r"\[.*?\b" + base + r"\b", args[n]) for base in aliases)]
        item = {"pc": ins["pc"], "offset": ins["offset"], "block": ins["block"],
                "instruction": ins["text"], "frequency": ins["frequency"],
                "stack_reads": 0, "stack_writes": 0, "xmm_loads": 0, "xmm_stores": 0,
                "kind": "", "annotations": ins["annotations"]}
        if op in {"push", "pushq", "pop", "popq", "enter", "leave"}:
            push = op in {"push", "pushq"}
            width = 2 if "data16" in ins["mnemonic"].split()[:-1] or (args and re.fullmatch(r"(?:[abcd]x|[sd]i|[bs]p|r\d+w)", args[0])) else 8
            frame.append(dict(item, kind="frame-push" if push else "frame-pop", implicit_stack_reads=int(not push),
                              implicit_stack_writes=int(push), relative_cost=1 if push else 2,
                              implicit_stack_bytes=width, frame_allocation_bytes=0, frame_release_bytes=0,
                              frame_adjustment_complete=op not in {"enter", "leave"},
                              weighted_cost=(1 if push else 2) * ins["frequency"] if ins["frequency"] is not None else None))
            if op in {"enter", "leave"}:
                unknown.append({"pc": ins["pc"], "reason": "unsupported frame instruction"})
            if op in {"pop", "popq"} and args and args[0] in {"rsp", "esp", "sp"}:
                frame[-1]["frame_adjustment_complete"] = False
                unknown.append({"pc": ins["pc"], "reason": "stack pointer restored from unproven memory"})
        elif args and ((args[0] == "rsp" and op in {"add", "sub", "lea", "and", "mov"})
                       or (args[0] == "rbp" and op in {"mov", "lea"} and len(args) > 1 and "rsp" in args[1])):
            allocation = release = 0
            complete = False
            if len(args) == 2 and args[0] == "rsp":
                immediate = re.fullmatch(r"(?:0x[0-9a-f]+|\d+)", args[1])
                displacement = re.fullmatch(r"\[rsp(?:([+-])(0x[0-9a-f]+|\d+))?\]", args[1])
                if op in {"add", "sub"} and immediate:
                    amount = int(args[1], 0)
                    allocation, release, complete = (amount, 0, True) if op == "sub" else (0, amount, True)
                elif op == "lea" and displacement:
                    amount = int(displacement[2], 0) if displacement[2] else 0
                    allocation, release, complete = (amount, 0, True) if displacement[1] == "-" else (0, amount, True)
                elif op == "mov" and args[1] == "rbp" and proven_rbp:
                    complete = True
            elif args[0] == "rbp" and proven_rbp:
                complete = ((op == "mov" and args[1] == "rsp") or
                            (op == "lea" and re.fullmatch(r"\[rsp(?:[+-]0x[0-9a-f]+)?\]", args[1]) is not None))
            frame.append(dict(item, kind="frame-adjust", implicit_stack_reads=0, implicit_stack_writes=0,
                              implicit_stack_bytes=0, frame_allocation_bytes=allocation, frame_release_bytes=release,
                              frame_adjustment_complete=complete,
                              relative_cost=0, weighted_cost=0 if ins["frequency"] is not None else None))
            if not complete:
                unknown.append({"pc": ins["pc"], "reason": "unresolved frame allocation/adjustment"})
        elif op in {"call", "callq", "ret", "retq"}:
            call = op in {"call", "callq"}
            release = int(args[0], 0) if not call and args and re.fullmatch(r"0x[0-9a-f]+|\d+", args[0]) else 0
            frame.append(dict(item, kind="frame-call" if call else "frame-return", implicit_stack_reads=int(not call),
                              implicit_stack_writes=int(call), relative_cost=1 if call else 2,
                              implicit_stack_bytes=8, frame_allocation_bytes=0, frame_release_bytes=release,
                              frame_adjustment_complete=True,
                              weighted_cost=(1 if call else 2) * ins["frequency"] if ins["frequency"] is not None else None))
        elif args and ((args[0] in {"rsp", "esp", "sp"} and op not in {"cmp", "test", "bt", "push", "pushq"}) or
                       (op in {"xchg", "xadd"} and any(arg in {"rsp", "esp", "sp"} for arg in args))):
            unknown.append({"pc": ins["pc"], "reason": "unresolved stack-pointer mutation"})
        if op == "lea":
            if len(args) == 2 and any(re.search(r"\b" + base + r"\b", args[1]) for base in aliases):
                # An address escaping the fixed stack bases needs interblock
                # alias analysis; never silently undercount it.
                if args[0] not in {"rsp", "rbp"}:
                    unknown.append({"pc": ins["pc"], "reason": "stack address aliases " + args[0]})
            continue
        if op == "mov" and len(args) == 2 and args[1] in aliases and args[0] not in {"rsp", "rbp"}:
            unknown.append({"pc": ins["pc"], "reason": "stack base copied to " + args[0]})
        if stack:
            if len(memory) != 1:
                unknown.append({"pc": ins["pc"], "reason": "multiple memory operands"})
            slot = stack[0]
            if op.startswith(("mov", "vmov", "kmov")) or op in {"stos", "stosq", "stosl"}:
                if slot == 0:
                    item["stack_writes"] = 1
                else:
                    item["stack_reads"] = 1
            elif op.startswith(("vextract", "pextr", "vpextr")) and slot == 0:
                item["stack_writes"] = 1
            elif op in {"xchg", "xadd", "cmpxchg"}:
                item["stack_reads"] = 1
                item["stack_writes"] = 1
            elif op in {"pop", "popq"}:
                item["stack_writes"] = 1
            elif op in {"push", "pushq"}:
                item["stack_reads"] = 1
            elif op.startswith(("cmov", "cmp", "test")) or (op in VECTOR_MEMORY_READS and slot > 0) or op in {"imul", "mul", "div", "idiv", "lzcnt", "tzcnt", "bsf", "bsr", "bt", "shlx", "shrx", "sarx", "rorx", "bzhi", "pdep", "pext", "mulx", "andn", "call", "callq"}:
                item["stack_reads"] = 1
            elif op in {"add", "sub", "and", "or", "xor", "adc", "sbb", "inc", "dec", "neg", "not", "shl", "shr", "sar", "sal", "rol", "ror", "bts", "btr", "btc"}:
                item["stack_reads"] = 1
                item["stack_writes"] = int(slot == 0)
            elif op.startswith(("nop", "prefetch")):
                continue
            else:
                unknown.append({"pc": ins["pc"], "reason": "unclassified stack effect: " + op})
            item["kind"] = "stack-cisc" if not op.startswith(("mov", "vmov")) else "stack-move"
        if not memory and len(args) >= 2 and op in {"movd", "movq", "vmovd", "vmovq", "pextrd", "pextrq", "vpextrd", "vpextrq", "pinsrd", "pinsrq", "vpinsrd", "vpinsrq"}:
            vectors = [bool(re.fullmatch(r"(?:xmm|ymm|zmm)\d+", a)) for a in args[:2]]
            if sum(vectors) == 1:
                item["xmm_stores"] = int(vectors[0])
                item["xmm_loads"] = int(vectors[1])
                item["kind"] = "register-class-transfer"
        if item["kind"]:
            item["store_count"] = item["stack_writes"] + item["xmm_stores"]
            item["load_count"] = item["stack_reads"] + item["xmm_loads"]
            item["relative_cost"] = item["store_count"] + 2 * item["load_count"]
            item["weighted_cost"] = None if item["frequency"] is None else item["relative_cost"] * item["frequency"]
            ledger.append(item)
    return ledger, frame, unknown


def _cycles(blocks, instructions, roots):
    by_pc = {i["pc"]: i for i in instructions}
    graph = {b["pc"]: b for b in blocks}
    root_blocks = {by_pc[pc]["block"] for pc in roots.values()}
    origin = by_pc[roots[str(ROOT_BCIS[0])]]["block"]
    # A node outside the reverse-reachable set cannot occur on a cycle through
    # the root. Pruning these acyclic trap/exception tails is exact, not sampling.
    reverse = defaultdict(list)
    for block in blocks:
        for successor in block["successors"]:
            reverse[successor].append(block["pc"])
    can_return = {origin}
    work = [origin]
    while work:
        for previous in reverse[work.pop()]:
            if previous not in can_return:
                can_return.add(previous)
                work.append(previous)
    cycles = []
    states = 0
    # Iterative DFS prevents Python recursion depth from becoming a hidden cap.
    todo = [(origin, (origin,), frozenset({origin}))]
    while todo:
        node, path, seen = todo.pop()
        states += 1
        if states > MAX_CYCLE_STATES or len(path) > MAX_CYCLE_DEPTH:
            raise ValueError("cycle enumeration work/depth bound exceeded")
        for successor in graph[node]["successors"]:
            if successor == origin:
                if root_blocks.issubset(seen):
                    pcs = [pc for block in path for pc in graph[block]["instructions"]]
                    calls = [pc for pc in pcs if by_pc[pc]["call"]]
                    cycles.append({"blocks": list(path), "instructions": pcs, "calls": calls,
                                   "kind": "common-no-call" if not calls else "call-refill"})
                    if len(cycles) > MAX_CYCLES:
                        raise ValueError("cycle enumeration result bound exceeded")
            elif successor not in seen and successor in can_return:
                todo.append((successor, path + (successor,), seen | {successor}))
    if not cycles:
        raise ValueError("no cycle contains all three packed loads")
    return cycles, {"states": states, "cycles": len(cycles), "bounds": {
        "cycles": MAX_CYCLES, "states": MAX_CYCLE_STATES, "depth": MAX_CYCLE_DEPTH}}


def _activation(prefix, enabled):
    definitions = {}
    load_roots = defaultdict(set)
    # Final trace dumps may repeat nodes across allocator attempts. The identity
    # remains a node identity; multiple different nodes at one BCI are ambiguous.
    for line in prefix.splitlines():
        match = re.match(r"\s*(\d+)\s+loadL\s+===.*BlockDecoder::decodeSequencesRolling\s+@ bci:(360|373|386)\b", line)
        if match:
            load_roots[int(match[2])].add(int(match[1]))
    events = []
    inputs = defaultdict(list)
    kept = set()
    phis = {}
    marked = {}
    edges = defaultdict(list)
    pending = None
    range_constraints = {}

    def margin(left, right):
        return left > 0 and left >= right * (1 - 2e-5)

    def same(left, right):
        return abs(left - right) <= max(left, right) * 2e-5

    def finish_phi(node):
        fields = phis[node]
        values = inputs[node]
        up_values = [v for v in values if v["up"] == "1"]
        if not up_values:
            raise ValueError("accepted Phi has no UP input")
        observed_up = sum(_number(v["freq"]) for v in up_values)
        observed_down = sum(_number(v["freq"]) for v in values if v["up"] == "0")
        constraints = _number(fields["constraint_freq"])
        if not same(observed_up, _number(fields["up_freq"])) or not same(observed_down, _number(fields["down_freq"])):
            raise ValueError("Phi input frequency totals disagree")
        if not margin(observed_up, 10 * (2 * observed_down + 3 * constraints)):
            raise ValueError("Phi violates weighted cost margin")
        marked[node] = fields["range"]
        for value in up_values:
            edges[int(value["def"][1:])].append(node)

    for line in prefix.splitlines():
        if not line.startswith(("CCDEFER ", "CCPHI ", "CCPHI_INPUT ", "CCHRP ")):
            continue
        fields = dict(re.findall(r"([a-zA-Z_]+)=([^ ]+)", line))
        fields["event"] = line.split()[0]
        range_match = re.search(r"\bL(\d+)\b", line)
        block_match = re.search(r"\bB(\d+)\b", line)
        if not range_match or not block_match:
            raise ValueError("activation event lacks exact LRG/block identity")
        fields["range"] = int(range_match[1])
        fields["block"] = int(block_match[1])
        if "constraint_freq" in fields:
            constraint = _number(fields["constraint_freq"])
            previous = range_constraints.setdefault(fields["range"], constraint)
            if not same(previous, constraint):
                raise ValueError("constraint frequency changed within one original LRG")
        events.append(fields)
        if pending is not None and fields["event"] != "CCPHI_INPUT":
            raise ValueError("incomplete accepted Phi input records")
        if fields["event"] == "CCDEFER":
            node = int(fields["def"][1:])
            if not margin(_number(fields["freq"]), 10 * _number(fields["constraint_freq"])):
                raise ValueError("definition violates cold constraint margin")
            if node in marked:
                raise ValueError("duplicate marked definition in one compilation")
            definitions[node] = fields
            marked[node] = fields["range"]
        elif fields["event"] == "CCPHI":
            node = int(fields["def"][1:])
            if node in marked or int(fields.get("inputs", "0")) < 1:
                raise ValueError("duplicate Phi or empty accepted Phi")
            if fields.get("pressure_down") not in {"0", "1"}:
                raise ValueError("invalid Phi pressure decision")
            if fields["range"] not in marked.values():
                raise ValueError("accepted Phi lacks prior deferral in its LRG")
            if not margin(_number(fields["freq"]), 10 * _number(fields["constraint_freq"])):
                raise ValueError("Phi block violates cold constraint margin")
            phis[node] = fields
            pending = node
        elif fields["event"] == "CCPHI_INPUT":
            node = int(fields["phi"][1:])
            if pending != node or node not in phis:
                raise ValueError("orphan/wrong Phi input record")
            if fields["range"] != phis[node]["range"] or fields["block"] != phis[node]["block"]:
                raise ValueError("Phi input LRG/block differs from accepted decision")
            if fields.get("up") not in {"0", "1"} or fields.get("deferred") not in {"0", "1"}:
                raise ValueError("invalid Phi input state")
            source = int(fields["def"][1:])
            if fields["up"] == "1" and (fields["deferred"] != "1" or marked.get(source) != fields["range"]):
                raise ValueError("UP input lacks prior exact-node/LRG provenance")
            _number(fields["freq"])
            if any(all(previous.get(k) == fields.get(k) for k in ("pred", "def", "up", "freq")) for previous in inputs[node]):
                raise ValueError("duplicate Phi input record cannot prove edge coverage")
            inputs[node].append(fields)
            if len(inputs[node]) == int(phis[node]["inputs"]):
                finish_phi(node)
                pending = None
        else:
            node = int(fields["def"][1:])
            if marked.get(node) != fields["range"]:
                raise ValueError("HRP boundary lacks exact-node/LRG provenance")
            valid_keep = margin(_number(fields["freq"]), 10 * _number(fields["constraint_freq"]))
            if fields.get("keep") == "1":
                if not valid_keep:
                    raise ValueError("kept HRP boundary violates cold constraint margin")
                kept.add((node, fields["range"], fields["block"]))
            elif fields.get("keep") != "0":
                raise ValueError("invalid HRP keep state")
            elif _number(fields["freq"]) > 10 * _number(fields["constraint_freq"]) * (1 + 2e-5):
                raise ValueError("applicable hot HRP boundary undid deferred placement")
    if pending is not None:
        raise ValueError("truncated accepted Phi input records")
    result = {"events": events, "roots_by_bci": {str(k): sorted(v) for k, v in load_roots.items()},
              "chains": {}, "complete": False}
    if not enabled:
        result["complete"] = not events
        result["unexpected_activation"] = bool(events)
        return result
    chain_groups = defaultdict(dict)

    def boundary_satisfied(node):
        # Production graphs need not reproduce a synthetic fixture's exact
        # scheduling. An already-UP Phi needs no invented HRP event. Where its
        # pressure decision was actually overridden, require the actual kept
        # event, with that node, original LRG, block and immutable constraint.
        fields = phis[node]
        return (fields.get("pressure_down") == "0"
                or (node, fields["range"], fields["block"]) in kept)
    for bci in ROOT_BCIS:
        roots = load_roots.get(bci, set())
        if len(roots) != 1:
            continue
        node = next(iter(roots))
        if node not in definitions or definitions[node].get("loadL") != "1":
            continue
        for first in edges[node]:
            for second in edges[first]:
                if (first != second and phis[first]["block"] != phis[second]["block"]
                        and boundary_satisfied(first) and boundary_satisfied(second)):
                    chain_groups[(phis[first]["block"], phis[second]["block"])][str(bci)] = [node, first, second]
    for chains in chain_groups.values():
        if len(chains) == 3 and len({n for chain in chains.values() for n in chain[1:]}) == 6:
            root_ranges = {definitions[chain[0]]["range"] for chain in chains.values()}
            if len(root_ranges) == 3:
                result["chains"] = chains
                break
    result["complete"] = len(result["chains"]) == len(ROOT_BCIS)
    return result


def _normalized(instructions, start, stop):
    """Exact operands except individually identified PC/data relocations."""
    rows = []
    relocations = []
    unresolved = []
    for ins in instructions:
        op = ins["mnemonic"]
        operands = ins["operands"].lower()
        notes = " ".join(ins["annotations"])
        replacement = None
        direct = re.fullmatch(r"(?:0x)?([0-9a-f]+)(?:\s+<[^>]+>)?", operands)
        if ins.get("branch") and direct:
            target = int(direct[1], 16)
            if start <= target < stop:
                replacement = "internal@%x" % (target - start)
            else:
                # Nearby nmethod entry/exception/deopt stubs are identified by
                # their nmethod-relative target, never a blanket branch mask.
                symbol = re.search(r"\{runtime_call\s+([^}]+)\}", notes)
                if symbol:
                    replacement = "external-exit:" + symbol[1].strip()
                else:
                    unresolved.append({"pc": ins["pc"], "kind": "external-exit", "exact_operand": operands})
        elif ins.get("call") and direct:
            target = int(direct[1], 16)
            symbol = re.search(r"\{(?:runtime_call|static_call|virtual_call)\s*([^}]*)\}", notes)
            bytecode = re.search(r";\*invoke\w*\s+([^\n{;]+)", notes)
            if start <= target < stop:
                replacement = "internal-call@%x" % (target - start)
            elif (symbol and symbol[1].strip()) or bytecode:
                replacement = "external-call:" + (symbol[1].strip() if symbol else "") + (":" + bytecode[1].strip() if bytecode else "")
            else:
                unresolved.append({"pc": ins["pc"], "kind": "external-call", "exact_operand": operands})
        else:
            relocation = re.search(r"\{(oop\([^}]*\)|metadata\([^}]*\)|external_word|internal_word)\}", notes)
            if relocation and op in {"mov", "movabs", "lea"}:
                args = _operands(operands)
                if len(args) == 2 and re.fullmatch(r"0x[0-9a-f]+", args[1]):
                    if relocation[1].startswith(("oop(", "metadata(")):
                        replacement = args[0] + ",identified-relocation:" + relocation[1]
                    elif relocation[1] == "internal_word" and start <= int(args[1], 16) < stop:
                        replacement = args[0] + ",internal-word@%x" % (int(args[1], 16) - start)
                    else:
                        unresolved.append({"pc": ins["pc"], "kind": "unidentified-data-relocation", "exact_operand": operands})
        if replacement is not None:
            relocations.append({"pc": ins["pc"], "original": operands, "normalized": replacement})
            operands = replacement
        rows.append([ins["offset"], op, re.sub(r"\s+", " ", operands)])
    return rows, relocations, unresolved


def _frame_summary(rows):
    """Keep implicit work separate: explicit store savings cannot pay for it."""
    metrics = {key: 0 for key in (
        "frame-push", "frame-pop", "frame-call", "frame-return", "frame-adjust",
        "implicit_stack_reads", "implicit_stack_writes", "implicit_read_bytes", "implicit_write_bytes",
        "relative_cost", "frame_allocation_bytes", "frame_release_bytes")}
    weighted = dict(metrics)
    complete = weighted_complete = True
    errors = []
    allocations = []
    layout = []
    for row in rows:
        kind = row.get("kind")
        values = {key: row.get(key) for key in ("implicit_stack_reads", "implicit_stack_writes",
                  "implicit_stack_bytes", "relative_cost", "frame_allocation_bytes", "frame_release_bytes")}
        if (kind not in {"frame-push", "frame-pop", "frame-call", "frame-return", "frame-adjust"} or
                row.get("frame_adjustment_complete") is not True or
                any(not isinstance(value, (int, float)) or isinstance(value, bool) or
                    not math.isfinite(value) or value < 0 for value in values.values())):
            complete = False
            errors.append({"pc": row.get("pc"), "reason": "unproven implicit stack/frame effect"})
            continue
        contributions = {kind: 1, "implicit_stack_reads": values["implicit_stack_reads"],
                         "implicit_stack_writes": values["implicit_stack_writes"],
                         "implicit_read_bytes": values["implicit_stack_reads"] * values["implicit_stack_bytes"],
                         "implicit_write_bytes": values["implicit_stack_writes"] * values["implicit_stack_bytes"],
                         "relative_cost": values["relative_cost"],
                         "frame_allocation_bytes": values["frame_allocation_bytes"],
                         "frame_release_bytes": values["frame_release_bytes"]}
        for key, value in contributions.items():
            metrics[key] += value
        allocations.append(values["frame_allocation_bytes"])
        # Equal aggregate bytes do not prove an equal stack extent: moving a
        # release past another reservation can increase the live frame. Require
        # the decoded adjustment/order layout to stay fixed unless the ordinary
        # growth metrics already establish NO_GO. Addresses and call operands
        # are deliberately absent; actual adjustment constants remain exact.
        layout.append([kind, values["implicit_stack_bytes"], values["frame_release_bytes"],
                       re.sub(r"\s+", " ", row["instruction"]).strip() if kind == "frame-adjust" else ""])
        frequency = row.get("frequency")
        if not isinstance(frequency, (int, float)) or not math.isfinite(frequency) or frequency < 0:
            weighted_complete = False
        else:
            for key, value in contributions.items():
                weighted[key] += value * frequency
    metrics["max_frame_allocation_bytes"] = max(allocations, default=0)
    return {"complete": complete, "weighted_complete": complete and weighted_complete,
            "metrics": metrics, "weighted_metrics": weighted, "layout": layout, "errors": errors}


def _common_frame_paths(proof):
    """Match control decisions without instruction addresses/register allocation.

    Duplicate structural paths must have the same frame effects; otherwise the
    correspondence is ambiguous and cannot waive a path-specific increase.
    """
    by_pc = {i["pc"]: i for i in proof.get("instructions", [])}
    frame = {row["pc"]: row for row in proof.get("frame", [])}
    groups = defaultdict(list)
    try:
        for cycle in proof.get("cycles", []):
            if cycle["kind"] != "common-no-call":
                continue
            pcs = cycle["instructions"]
            signature = []
            for index, pc in enumerate(pcs):
                ins = by_pc[pc]
                if ins.get("branch"):
                    next_pc = pcs[(index + 1) % len(pcs)]
                    if next_pc not in ins["successors"]:
                        raise ValueError("cycle edge not in decoded CFG")
                    bcis = sorted(set(re.findall(r"[\w.$]+::?[\w$]+@\d+", " ".join(ins["annotations"]))))
                    signature.append([ins["mnemonic"], next_pc == ins["target"], bcis])
            key = json.dumps(signature, separators=(",", ":"))
            groups[key].append({"cycle_id": cycle["id"], "summary": _frame_summary([frame[pc] for pc in pcs if pc in frame])})
    except (KeyError, TypeError, ValueError) as error:
        return {"complete": False, "paths": {}, "error": str(error)}
    complete = bool(groups) and all(row["summary"]["complete"] for rows in groups.values() for row in rows)
    complete = complete and all(len({json.dumps([row["summary"]["metrics"], row["summary"]["layout"]], sort_keys=True) for row in rows}) == 1
                                for rows in groups.values())
    return {"complete": complete, "paths": dict(groups)}


def _frame_comparison(off, on, debug):
    before, after = _frame_summary(off.get("frame", [])), _frame_summary(on.get("frame", []))
    old_paths, new_paths = _common_frame_paths(off), _common_frame_paths(on)
    complete = before["complete"] and after["complete"]
    mapping = (old_paths["complete"] and new_paths["complete"] and old_paths["paths"].keys() == new_paths["paths"].keys())
    layout_proven = complete and before["layout"] == after["layout"]
    path_layout_proven = bool(mapping) and all(rows[0]["summary"]["layout"] == new_paths["paths"][key][0]["summary"]["layout"]
                                              for key, rows in old_paths["paths"].items())
    increases = []
    if complete:
        increases.extend({"scope": "whole-method", "metric": key, "before": value, "after": after["metrics"][key]}
                         for key, value in before["metrics"].items() if after["metrics"][key] > value)
    path_increases = []
    if mapping:
        for key, rows in old_paths["paths"].items():
            old = rows[0]["summary"]["metrics"]
            new = new_paths["paths"][key][0]["summary"]["metrics"]
            path_increases.extend({"scope": "common-path", "path": key, "metric": metric, "before": value, "after": new[metric]}
                                  for metric, value in old.items() if new[metric] > value)
    weighted_complete = before["weighted_complete"] and after["weighted_complete"]
    weighted_increases = []
    if debug and weighted_complete:
        weighted_increases = [{"scope": "whole-method-frequency-weighted", "metric": key, "before": value,
                               "after": after["weighted_metrics"][key]}
                              for key, value in before["weighted_metrics"].items() if after["weighted_metrics"][key] > value]
    return {"before": before, "after": after, "old_common_paths": old_paths, "new_common_paths": new_paths,
            "method_effects_proven": complete, "common_paths_proven": bool(mapping),
            "frame_layout_proven": layout_proven and path_layout_proven,
            "method_no_increase": complete and not increases,
            "common_paths_no_increase": bool(mapping) and not path_increases,
            "weighted_effects_proven": weighted_complete,
            "weighted_no_increase": weighted_complete and not weighted_increases,
            "increases": increases + path_increases + weighted_increases}


def analyze_capture(log_text, xml_path_or_text, asm_text, cell, debug):
    """Return a fail-closed, JSON-serializable proof without running tools."""
    proof = {"schema": 1, "cell": cell, "debug": bool(debug), "complete": False,
             "errors": [], "checks": {}, "verdict": "INCONCLUSIVE",
             "input_sha256": {"log": _sha(log_text), "asm": _sha(asm_text)}}
    try:
        xml_text, compilation = _xml(xml_path_or_text)
        proof["input_sha256"]["xml"] = _sha(xml_text)
        proof["compilation"] = compilation
        header, start, stop, raw, mach, prefix = _assembly_section(log_text, compilation["compile_id"])
        instructions = _instructions(asm_text, header, start, stop, raw)
        roots, headers = _annotations(mach, instructions, prefix if debug else "")
        blocks, external = _flow(instructions, start, stop)
        ledger, frame, unknown = _transport(instructions)
        cycles, enumeration = _cycles(blocks, instructions, roots)
        transport = {row["pc"]: row for row in ledger}
        by_pc = {i["pc"]: i for i in instructions}
        for index, cycle in enumerate(cycles):
            rows = [transport[pc] for pc in cycle["instructions"] if pc in transport]
            frame_rows = [row for row in frame if row["pc"] in set(cycle["instructions"])]
            cycle.update({"id": index, "transport_pcs": [r["pc"] for r in rows],
                          "stores": sum(r["store_count"] for r in rows),
                          "loads": sum(r["load_count"] for r in rows),
                          "relative_cost": sum(r["relative_cost"] for r in rows),
                          "weighted_cost": sum(r["weighted_cost"] for r in rows) if all(r["weighted_cost"] is not None for r in rows) else None,
                          "frame_effects": frame_rows,
                          "frame_relative_cost": sum(r["relative_cost"] for r in frame_rows),
                          "frame_summary": _frame_summary(frame_rows),
                          "combined_relative_cost": sum(r["relative_cost"] for r in rows + frame_rows)})
        common = [c for c in cycles if c["kind"] == "common-no-call"]
        common_pcs = set(pc for c in common for pc in c["transport_pcs"])
        common_stores = [r for r in ledger if r["pc"] in common_pcs and r["store_count"]]
        common_rows = [r for r in ledger if r["pc"] in common_pcs]
        returning = [i for i in instructions if i.get("call") and "readPartialLong" in " ".join(i["annotations"])
                     and re.search(r"decodeSequencesRolling@684\b", " ".join(i["annotations"]))]
        enabled = str(cell).lower().split("-")[-1] == "on"
        activation = _activation(prefix, enabled) if debug else {"complete": True, "required": False}
        normalized, relocations, unresolved = _normalized(instructions, start, stop)
        gpr = re.compile(r"(?:r(?:[0-9]+[dwb]?|ax|bx|cx|dx|si|di|bp|sp)|e(?:ax|bx|cx|dx|si|di|bp|sp)|[abcd][lh]|[abcd]x|[sd]i|[bs]p|[sd]il|[bs]pl)")
        gpr_moves = [i for i in instructions if i["mnemonic"] == "mov" and len(_operands(i["operands"])) == 2
                     and all(gpr.fullmatch(arg) for arg in _operands(i["operands"]))]
        frame_sizes = sorted({int(value, 0) for i in instructions
                              if i["mnemonic"] == "sub" for value in re.findall(r"^rsp,(0x[0-9a-f]+|\d+)$", i["operands"])})
        proof.update({"code": {"header": header, "start": start, "end": stop, "bytes": len(raw),
                                "sha256": hashlib.sha256(raw).hexdigest(), "instructions": len(instructions)},
                      "instructions": instructions, "blocks": blocks, "external_exits": external,
                      "xmm_instructions": [i for i in instructions if re.search(r"\b(?:xmm|ymm|zmm)\d+\b", i["operands"])],
                      "gpr_register_moves": gpr_moves, "frame_sizes": frame_sizes,
                      "roots": roots, "mach_blocks": headers, "transport": ledger, "frame": frame,
                      "frame_summary": _frame_summary(frame),
                      "unclassified_effects": unknown, "cycles": cycles, "cycle_enumeration": enumeration,
                      "common_store_inventory": common_stores, "activation": activation,
                      "returning_bci684_calls": [{"pc": i["pc"], "block": i["block"],
                                                  "fallthrough": i["successors"], "annotations": i["annotations"]} for i in returning],
                      "normalization": {"instructions": normalized, "identified_relocations": relocations,
                                        "unresolved_external_calls": unresolved},
                      "totals": {"all_transport_instructions": len(ledger), "common_unique_stores": len(common_stores),
                                 "common_unique_relative_cost": sum(r["relative_cost"] for r in common_rows),
                                 "common_unique_weighted_cost": sum(r["weighted_cost"] for r in common_rows)
                                 if all(r["weighted_cost"] is not None for r in common_rows) else None,
                                 "all_weighted_transport_cost": sum(r["weighted_cost"] for r in ledger)
                                 if all(r["weighted_cost"] is not None for r in ledger) else None,
                                 "implicit_stack_reads": sum(r.get("implicit_stack_reads", 0) for r in frame),
                                 "implicit_stack_writes": sum(r.get("implicit_stack_writes", 0) for r in frame),
                                 "all_frame_weighted_cost": sum(r["weighted_cost"] for r in frame)
                                 if all(r["weighted_cost"] is not None for r in frame) else None,
                                 "all_combined_weighted_cost": sum(r["weighted_cost"] for r in ledger + frame)
                                 if all(r["weighted_cost"] is not None for r in ledger + frame) else None,
                                 "gpr_register_moves": len(gpr_moves)}})
        proof["checks"] = {"xml_final_entrant": True, "compile_id_tied_to_assembly": True,
                           "all_main_bytes_decoded": True, "all_control_flow_resolved": True,
                           "all_stack_effects_classified": not unknown, "common_cycles_exist": bool(common),
                           "all_root_cycles_enumerated": True, "returning_bci684_retained": bool(returning),
                           "selected_task_success": compilation["selected_task_success"],
                           "parse_inlining_branch_signature_resolved": compilation["parse_inlining_branch_shape"]["complete"],
                           "all_frequencies_covered": all(i["frequency"] is not None for i in instructions) if debug else True,
                           "three_root_activation": activation["complete"]}
        proof["complete"] = all(proof["checks"].values())
        proof["verdict"] = "EVIDENCE_COMPLETE" if proof["complete"] else "INCONCLUSIVE"
    except (ValueError, KeyError, IndexError, TypeError, OSError, ET.ParseError) as error:
        proof["errors"].append(str(error))
    return proof


def _equivalence(left, right):
    a = left.get("normalization", {}).get("instructions", [])
    b = right.get("normalization", {}).get("instructions", [])
    equal = bool(a) and a == b
    mismatches = []
    if not equal:
        for i in range(max(len(a), len(b))):
            old = a[i] if i < len(a) else None
            new = b[i] if i < len(b) else None
            if old != new:
                mismatches.append({"index": i, "left": old, "right": new})
    complete = not (left.get("normalization", {}).get("unresolved_external_calls")
                    or right.get("normalization", {}).get("unresolved_external_calls"))
    return {"equal": equal and complete, "complete": complete,
            "left_cell": left["cell"], "right_cell": right["cell"],
            "differences": mismatches, "constant_masking": False}


def _store_ledger(off, on):
    old = off.get("normalization", {}).get("instructions", [])
    new = on.get("normalization", {}).get("instructions", [])
    # Relative offsets change after actual instruction removal. Alignment uses
    # exact opcode+operands, not a register/constant-erasing canonicalizer.
    a, b = [tuple(row[1:]) for row in old], [tuple(row[1:]) for row in new]
    matcher = difflib.SequenceMatcher(a=a, b=b, autojunk=False)
    aligned = {}
    for block in matcher.get_matching_blocks():
        for delta in range(block.size):
            aligned[block.a + delta] = block.b + delta
    old_index = {i["pc"]: n for n, i in enumerate(off.get("instructions", []))}
    new_instructions = on.get("instructions", [])
    new_transport = {r["pc"]: r for r in on.get("transport", [])}
    globally_identical = bool(old) and old == new
    changed_ranges = []
    for tag, i1, i2, j1, j2 in matcher.get_opcodes():
        if tag != "equal":
            changed_ranges.append((i1, i2, j1, j2))
    rows = []
    for store in off.get("common_store_inventory", []):
        index = old_index[store["pc"]]
        mapping = aligned.get(index)
        replacements = []
        for i1, i2, j1, j2 in changed_ranges:
            if i1 <= index < i2:
                replacements = [new_transport[i["pc"]] for i in new_instructions[j1:j2] if i["pc"] in new_transport]
        args = _operands(store["instruction"].partition(" ")[2])
        slot = next((arg for arg in args if "[" in arg), args[0] if args else None)
        value = next((arg for arg in args if arg != slot), None)
        rows.append({"old_store": store,
                     "status": "unchanged-instruction" if mapping is not None else "changed-or-removed",
                     "new_instruction": new_instructions[mapping] if mapping is not None else None,
                     "value_location": value, "slot": slot,
                     "source_node": None,
                     "source_node_binding": "Physical instruction alone does not identify its SSA reaching definition.",
                     "replacement_candidates": replacements,
                     "replacement_loads": [r for r in replacements if r["load_count"]],
                     "semantic_identity_proven": globally_identical,
                     "note": "Exact instruction alignment is positional evidence, not value-flow equivalence."})
    return rows


def _load_reference():
    path = Path(__file__).resolve().parents[3] / "MECHANISM-REFERENCE-STORES.json"
    text = path.read_text()
    reference = json.loads(text)
    if reference.get("schema") != 1 or set(reference.get("paths", {})) != {"cross_word", "within_word"}:
        raise ValueError("invalid sealed 19-store reference schema")
    for name, value in reference["paths"].items():
        if value.get("stack_mov_stores") != 19 or len(value.get("stores", [])) != 19:
            raise ValueError("reference path %s does not contain all 19 stores" % name)
    return reference, hashlib.sha256(text.encode()).hexdigest()


def _reference_paths(proof, reference):
    """Bind both complete ordered reference paths; never pick an arbitrary 19."""
    traffic = {r["pc"]: r for r in proof.get("transport", [])}
    result = {}
    normalize = lambda text: re.sub(r"\s+", " ", text.strip()).lower()
    for name, old in reference["paths"].items():
        expected = [(int(row["offset"], 0), normalize(row["instruction"])) for row in old["stores"]]
        matches = []
        for cycle in proof.get("cycles", []):
            if cycle["kind"] != "common-no-call":
                continue
            stores = [traffic[pc] for pc in cycle["transport_pcs"] if traffic[pc]["store_count"]]
            actual = [(r["offset"], normalize(r["instruction"])) for r in stores]
            # Cycles are rooted at the first packed load; the retained historical
            # ledger starts at the loop header. Rotate the *whole* ordered cycle
            # store list, preserving every row and its absolute code offset.
            if len(actual) == len(expected) and any(actual[n:] + actual[:n] == expected for n in range(len(actual))):
                matches.append({"cycle_id": cycle["id"], "stores": stores,
                                "loads": [traffic[pc] for pc in cycle["transport_pcs"] if traffic[pc]["load_count"]],
                                "relative_cost": cycle["relative_cost"], "weighted_cost": cycle["weighted_cost"]})
        result[name] = {"matched": bool(matches), "reference": old, "matching_cycles": matches}
    return result


def compare_captures(proofs):
    """Return all accounting and gates; never substitute a checklist for proof.

    Required cell names: release-base/default/off/on, debug-off/on. An unresolved
    semantic mapping emits an evidence-bound review request and prevents PASS.
    """
    # Canonical runner cell names are base/default/off/on/debug-off/debug-on.
    # Accept the explicit release-* spelling for standalone archival analysis.
    proofs = {k.removeprefix("release-"): v for k, v in proofs.items()}
    required = {"base", "default", "off", "on", "debug-off", "debug-on"}
    ledger = {"schema": 1, "verdict": "INCONCLUSIVE_INFRA", "checks": {}, "captures": proofs,
              "equivalences": [], "store_accounting": {}, "semantic_review_required": []}
    checks = ledger["checks"]
    checks["six_required_captures"] = required.issubset(proofs)
    if not checks["six_required_captures"]:
        ledger["missing_cells"] = sorted(required - proofs.keys())
        return ledger
    checks["all_capture_evidence_complete"] = all(proofs[k].get("complete") for k in required)
    for left, right in [("base", "default"), ("default", "off")]:
        comparison = _equivalence(proofs[left], proofs[right])
        ledger["equivalences"].append(comparison)
    checks["default_off_base_relocation_aware_equal"] = all(v["equal"] for v in ledger["equivalences"])
    checks["disabled_captures_no_activation"] = all(not proofs[k].get("activation", {}).get("events")
                                                  for k in required if k not in {"on", "debug-on"})
    checks["three_target_roots_activated"] = proofs["debug-on"].get("activation", {}).get("complete", False)
    shape_pairs = [("off", "on"), ("debug-off", "debug-on")]
    shape_comparisons = []
    for left, right in shape_pairs:
        a = proofs[left].get("compilation", {}).get("parse_inlining_branch_shape", {})
        b = proofs[right].get("compilation", {}).get("parse_inlining_branch_shape", {})
        shape_comparisons.append({"left": left, "right": right,
                                  "equal": bool(a.get("complete") and b.get("complete") and a.get("sha256") == b.get("sha256")),
                                  "left_sha256": a.get("sha256"), "right_sha256": b.get("sha256")})
    ledger["parse_inlining_branch_comparisons"] = shape_comparisons
    checks["off_on_parse_inlining_branch_shape_equal"] = all(row["equal"] for row in shape_comparisons)
    try:
        reference, reference_sha = _load_reference()
        ledger["reference_sha256"] = reference_sha
        ledger["reference"] = reference
        checks["sealed_reference_available"] = True
    except (OSError, ValueError, KeyError, json.JSONDecodeError) as error:
        reference = None
        checks["sealed_reference_available"] = False
        ledger["reference_error"] = str(error)
    measured_failure = False
    for flavor in ("release", "debug"):
        off, on = (proofs["off"], proofs["on"]) if flavor == "release" else (proofs["debug-off"], proofs["debug-on"])
        rows = _store_ledger(off, on)
        ledger["store_accounting"][flavor] = {"old_stores": rows,
            "code_size_before": off.get("code", {}).get("bytes"), "code_size_after": on.get("code", {}).get("bytes"),
            "instructions_before": off.get("code", {}).get("instructions"), "instructions_after": on.get("code", {}).get("instructions"),
            "frame_sizes_before": off.get("frame_sizes", []), "frame_sizes_after": on.get("frame_sizes", []),
            "all_effect_totals_before": off.get("totals", {}), "all_effect_totals_after": on.get("totals", {}),
            "frame_effects_before": off.get("frame", []), "frame_effects_after": on.get("frame", []),
            "gpr_register_moves_before": off.get("gpr_register_moves", []), "gpr_register_moves_after": on.get("gpr_register_moves", []),
            "on_all_transport": on.get("transport", []), "off_all_transport": off.get("transport", []),
            "on_all_cycles": on.get("cycles", []), "off_all_cycles": off.get("cycles", []),
            "on_call_refill_edges": on.get("returning_bci684_calls", []),
            "off_call_refill_edges": off.get("returning_bci684_calls", [])}
        paths = _reference_paths(off, reference) if reference else {}
        by_old_pc = {row["old_store"]["pc"]: row for row in rows}
        for value in paths.values():
            for cycle in value["matching_cycles"]:
                cycle["store_accounting"] = [by_old_pc[row["pc"]] for row in cycle["stores"]]
        ledger["store_accounting"][flavor]["reference_paths"] = paths
        checks[flavor + "_old_19_stores_accounted"] = bool(paths) and all(v["matched"] for v in paths.values())
        old_cost = off.get("totals", {}).get("common_unique_relative_cost")
        new_cost = on.get("totals", {}).get("common_unique_relative_cost")
        smaller = old_cost is not None and new_cost is not None and new_cost < old_cost
        checks[flavor + "_less_total_common_transport"] = smaller
        checks[flavor + "_fewer_common_stores"] = (on.get("totals", {}).get("common_unique_stores", math.inf)
                                                    < off.get("totals", {}).get("common_unique_stores", -1))
        # Require every on cycle to improve against the least expensive off
        # common cycle, preventing compensation on an alternate hot path.
        old_cycles = [c["relative_cost"] for c in off.get("cycles", []) if c["kind"] == "common-no-call"]
        new_cycles = [c["relative_cost"] for c in on.get("cycles", []) if c["kind"] == "common-no-call"]
        checks[flavor + "_no_compensating_common_cycle"] = bool(old_cycles and new_cycles) and max(new_cycles) < min(old_cycles)
        # Implicit return-address/saved-register traffic and frame allocation
        # are independent hard gates. Lower explicit spill counts cannot pay
        # for new pushes/pops/calls/returns, a larger frame, or hotter frame work.
        frame_comparison = _frame_comparison(off, on, flavor == "debug")
        ledger["store_accounting"][flavor]["implicit_frame_comparison"] = frame_comparison
        checks[flavor + "_implicit_frame_effects_proven"] = frame_comparison["method_effects_proven"]
        checks[flavor + "_implicit_frame_layout_proven"] = frame_comparison["frame_layout_proven"]
        checks[flavor + "_no_increased_method_implicit_frame_work"] = frame_comparison["method_no_increase"]
        checks[flavor + "_common_implicit_frame_paths_proven"] = frame_comparison["common_paths_proven"]
        checks[flavor + "_no_increased_common_path_implicit_frame_work"] = frame_comparison["common_paths_no_increase"]
        valid_pair = bool(off.get("complete") and on.get("complete") and checks["off_on_parse_inlining_branch_shape_equal"])
        if valid_pair and frame_comparison["increases"]:
            measured_failure = True
        if flavor == "debug":
            checks["debug_weighted_implicit_frame_effects_proven"] = frame_comparison["weighted_effects_proven"]
            checks["debug_no_increased_all_path_weighted_implicit_frame_work"] = frame_comparison["weighted_no_increase"]
            before = off.get("totals", {}).get("common_unique_weighted_cost")
            after = on.get("totals", {}).get("common_unique_weighted_cost")
            checks["debug_less_weighted_transport"] = before is not None and after is not None and after < before
            before = off.get("totals", {}).get("all_weighted_transport_cost")
            after = on.get("totals", {}).get("all_weighted_transport_cost")
            checks["debug_less_all_path_weighted_transport"] = before is not None and after is not None and after < before
            if (off.get("complete") and on.get("complete") and checks["off_on_parse_inlining_branch_shape_equal"]
                    and before is not None and after is not None and after >= before):
                measured_failure = True
            before = off.get("totals", {}).get("all_combined_weighted_cost")
            after = on.get("totals", {}).get("all_combined_weighted_cost")
            checks["debug_less_all_path_combined_weighted_transport"] = before is not None and after is not None and after < before
            if valid_pair and before is not None and after is not None and after >= before:
                measured_failure = True
        if off.get("complete") and on.get("complete") and old_cost is not None and new_cost is not None and new_cost >= old_cost:
            measured_failure = True
        for row in rows:
            if not row["semantic_identity_proven"]:
                ledger["semantic_review_required"].append({"flavor": flavor, "old_pc": row["old_store"]["pc"],
                    "off_evidence": off["input_sha256"], "on_evidence": on["input_sha256"],
                    "requirement": "Bind changed/removed transport to source/value-flow correctness; no supplied review yet."})
    checks["changed_transport_semantically_bound"] = not ledger["semantic_review_required"]
    known_equivalence_failure = any(v["complete"] and not v["equal"] for v in ledger["equivalences"])
    if measured_failure or (checks["all_capture_evidence_complete"] and known_equivalence_failure):
        ledger["verdict"] = "MECHANISM_NO_GO"
    elif all(checks.values()):
        ledger["verdict"] = "MECHANISM_PASS"
    ledger["evidence_sha256"] = _sha(json.dumps({k: v.get("input_sha256") for k, v in sorted(proofs.items())}, sort_keys=True))
    return ledger


def semantic_review_digest(ledger):
    """Identity for an independent receipt, including every ledger row/check."""
    return _sha(json.dumps(ledger, sort_keys=True, separators=(",", ":")))


def apply_semantic_review(ledger, review):
    """Validate a sealed independent review; it cannot relax mechanical gates.

    Authorization/independence and the bounded file wait belong to the runner.
    This function validates exact evidence identity and complete per-store
    dispositions. It never performs messaging, waiting, tools or measurements.
    """
    if ledger.get("verdict") == "MECHANISM_NO_GO":
        raise ValueError("semantic review cannot override NO_GO")
    checks = ledger.get("checks", {})
    if not checks or any(value is not True for key, value in checks.items()
                         if key != "changed_transport_semantically_bound"):
        raise ValueError("semantic review cannot override incomplete/failed mechanical gates")
    if ledger.get("semantic_review_receipt") is not None:
        raise ValueError("semantic review already applied")
    if review.get("decision") != "accept" or review.get("all_replacement_transport_reviewed") is not True:
        raise ValueError("independent review must accept and cover all replacement transport")
    if review.get("ledger_sha256") != semantic_review_digest(ledger):
        raise ValueError("semantic review does not bind the exact full ledger")
    if review.get("evidence_sha256") != ledger.get("evidence_sha256"):
        raise ValueError("semantic review evidence-set hash differs")
    expected_captures = {cell: proof["input_sha256"] for cell, proof in ledger["captures"].items()}
    if review.get("capture_sha256") != expected_captures:
        raise ValueError("semantic review capture identities differ")
    expected = {}
    for flavor, value in ledger["store_accounting"].items():
        for row in value["old_stores"]:
            if not row["semantic_identity_proven"]:
                expected[(flavor, row["old_store"]["pc"])] = row
    if not expected:
        raise ValueError("no unresolved per-store semantic obligations")
    provided = review.get("bindings")
    if not isinstance(provided, list):
        raise ValueError("semantic review bindings must be a list")
    bindings = {}
    for binding in provided:
        if not isinstance(binding, dict):
            raise ValueError("semantic review binding must be an object")
        pc = binding.get("old_pc")
        if not isinstance(pc, int) or isinstance(pc, bool):
            raise ValueError("old_pc must be an integer instruction address")
        key = (binding.get("flavor"), pc)
        if key not in expected or key in bindings:
            raise ValueError("duplicate or foreign old-store semantic binding")
        disposition = binding.get("disposition")
        if disposition not in {"removed", "moved", "retained"}:
            raise ValueError("invalid store disposition")
        for field in ("value_evidence", "path_evidence"):
            if not isinstance(binding.get(field), str) or not binding[field].strip():
                raise ValueError("semantic binding lacks " + field)
        on_pcs = binding.get("on_pcs")
        if not isinstance(on_pcs, list) or any(not isinstance(at, int) or isinstance(at, bool) for at in on_pcs):
            raise ValueError("on_pcs must list actual integer instruction addresses")
        if len(set(on_pcs)) != len(on_pcs):
            raise ValueError("duplicate replacement instruction address")
        cell = "on" if key[0] == "release" else "debug-on"
        actual = {ins["pc"] for ins in ledger["captures"][cell]["instructions"]}
        traffic = {ins["pc"] for ins in ledger["captures"][cell]["transport"]}
        if any(at not in actual for at in on_pcs):
            raise ValueError("semantic binding names a nonexistent on instruction")
        if disposition in {"moved", "retained"} and (not on_pcs or any(at not in traffic for at in on_pcs)):
            raise ValueError("moved/retained disposition needs actual on transport")
        bindings[key] = binding
    if bindings.keys() != expected.keys():
        raise ValueError("semantic review does not cover the exact complete unresolved store set")
    result = copy.deepcopy(ledger)
    for flavor, value in result["store_accounting"].items():
        for row in value["old_stores"]:
            binding = bindings.get((flavor, row["old_store"]["pc"]))
            if binding is not None:
                row["semantic_identity_proven"] = True
                row["independent_semantic_binding"] = binding
    result["semantic_review_receipt"] = copy.deepcopy(review)
    result["semantic_review_required"] = []
    result["checks"]["changed_transport_semantically_bound"] = True
    if not all(value is True for value in result["checks"].values()):
        raise ValueError("reviewed result still lacks a required gate")
    result["verdict"] = "MECHANISM_PASS"
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--xml", type=Path, required=True)
    parser.add_argument("--asm", type=Path, required=True)
    parser.add_argument("--cell", required=True)
    parser.add_argument("--debug", action="store_true")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    proof = analyze_capture(args.log.read_text(), args.xml, args.asm.read_text(), args.cell, args.debug)
    args.output.write_text(json.dumps(proof, indent=2, sort_keys=True) + "\n")
    print(proof["verdict"])


if __name__ == "__main__":
    main()
