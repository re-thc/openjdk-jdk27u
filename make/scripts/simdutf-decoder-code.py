import json
from pathlib import Path
import re
import subprocess

for log in sorted(Path("download").rglob("inlining-*.log")):
    text = log.read_text()
    for index, section in enumerate(text.split("Compiled method (c1)")[1:]):
        heading = section.splitlines()[0]
        if "UTF_8$Decoder::decodeArrayLoop" not in heading:
            continue
        match = re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]\s*=\s*(\d+)", section)
        if not match:
            print("NO_MAIN_CODE", log.name, heading, section[:1800], flush=True)
            continue
        start, end = int(match[1], 16), int(match[2], 16)
        data = bytearray(end - start)
        seen = 0
        for line in section.splitlines():
            row = re.match(r"\s*(0x[0-9a-f]+):\s*([0-9a-f |]+)", line)
            if not row:
                continue
            address = int(row[1], 16)
            raw = re.sub(r"[ |]", "", row[2])
            if not raw or len(raw) % 2:
                continue
            binary = bytes.fromhex(raw)
            if start <= address < end:
                binary = binary[:end-address]
                data[address-start:address-start+len(binary)] = binary
                seen += len(binary)
        print("CODE_HEADER", log.name, heading, "main_bytes", end-start, "decoded_bytes", seen,
              re.findall(r"#\s*\[sp\+[^\n]+", section)[:2], flush=True)
        if not seen:
            print(section[:6500], flush=True)
            continue
        versions = [bytes(data)]
        decoded = []
        for order, binary in enumerate(versions):
            file = Path("code-" + log.stem + "-" + str(index) + "-" + str(order) + ".bin")
            file.write_bytes(binary)
            result = subprocess.run(["aarch64-linux-gnu-objdump", "-D", "-b", "binary", "-m", "aarch64",
                "--adjust-vma=" + hex(start), str(file)], check=True, text=True, capture_output=True)
            lines = result.stdout.splitlines()
            instructions = []
            for line in lines:
                row = re.match(r"\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+(\S+)\s*(.*)", line)
                if row:
                    instructions.append((int(row[1], 16), row[3], row[4], line))
            valid = sum(mnemonic not in (".inst", "udf") for _, mnemonic, _, _ in instructions)
            decoded.append((valid, order, instructions, result.stdout))
        _, order, instructions, disassembly = max(decoded, key=lambda item: item[0])
        Path("decoded-" + log.stem + "-" + str(index) + ".txt").write_text(disassembly)
        ends = {}
        for address, mnemonic, operands, _ in instructions:
            if mnemonic == "b" or mnemonic.startswith("b.") or mnemonic in ("cbz", "cbnz", "tbz", "tbnz"):
                targets = re.findall(r"(?:0x)?([0-9a-f]{8,})(?=\s|<|$)", operands)
                if targets:
                    target = int(targets[-1], 16)
                    if start <= target < address and address - target >= 64:
                        ends[target] = max(address, ends.get(target, 0))
        loops = []
        for begin, stop in sorted(ends.items()):
            body = [ins for ins in instructions if begin <= ins[0] <= stop]
            spills = [ins[3] for ins in body if re.search(r"\[(?:sp|x29)[,\]]", ins[2])]
            loops.append({"begin":hex(begin), "end":hex(stop), "instructions":len(body),
                          "stack_accesses":len(spills), "stack_instructions":spills[:40]})
        print("CODE_SUMMARY", json.dumps({"file":log.name, "heading":heading, "word_order":order,
            "main_size":end-start, "instruction_count":len(instructions), "loops":loops}), flush=True)
        if loops:
            first = loops[0]
            begin, stop = int(first["begin"], 16), int(first["end"], 16)
            print("CODE_LOOP_BODY", log.name, json.dumps([ins[3] for ins in instructions if begin <= ins[0] <= stop]), flush=True)
        print("CODE_PROLOGUE", log.name, json.dumps([ins[3] for ins in instructions[:28]]), flush=True)
