from pathlib import Path
import json,re
from capstone import Cs,CS_ARCH_ARM64,CS_MODE_LITTLE_ENDIAN
output=Path("decoded")
output.mkdir()
decoder=Cs(CS_ARCH_ARM64,CS_MODE_LITTLE_ENDIAN)
for mode in ("base","on","off"):
    path=next(Path("input").rglob("latin1-inlining-"+mode+".log"))
    raw=path.read_text()
    for index,section in enumerate(raw.split("Compiled method (c1)")[1:]):
        heading=section.splitlines()[0]
        if "java.lang.String::utf8" not in heading or "%" in heading: continue
        match=re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]",section)
        assert match,heading
        start,end=int(match[1],16),int(match[2],16)
        binary=bytearray(end-start)
        seen=0
        for line in section.splitlines():
            row=re.match(r"\s*(0x[0-9a-f]+):\s*([0-9a-f |]+)",line)
            if not row: continue
            address=int(row[1],16)
            hexbytes=re.sub(r"[ |]","",row[2])
            if not hexbytes or len(hexbytes)%2 or not start<=address<end: continue
            data=bytes.fromhex(hexbytes)[:end-address]
            binary[address-start:address-start+len(data)]=data
            seen+=len(data)
        assert seen==end-start,(mode,seen,end-start)
        instructions=list(decoder.disasm(bytes(binary),start))
        assert sum(x.size for x in instructions)==len(binary),(mode,"disassembly incomplete")
        def fmt(ins):
            return hex(ins.address-start)+": "+ins.mnemonic+" "+ins.op_str
        loops=[]
        for ins in instructions:
            if ins.mnemonic=="b" or ins.mnemonic.startswith("b.") or ins.mnemonic in ("cbz","cbnz","tbz","tbnz"):
                targets=re.findall(r"#0x([0-9a-f]+)",ins.op_str)
                if not targets: continue
                target=int(targets[-1],16)
                if not start<=target<ins.address or ins.address-target<32: continue
                body=[x for x in instructions if target<=x.address<=ins.address]
                if not any("#0xfe" in x.op_str for x in body): continue
                loops.append((target,ins.address,body))
        loops.sort(key=lambda x:len(x[2]))
        print("ARM_STRING_CODE",json.dumps({"mode":mode,"heading":heading,
            "main_bytes":end-start,"frame":re.findall(r"#\s*\[sp\+[^\n]+",section)[:1],
            "prologue":[fmt(x) for x in instructions[:24]]}),flush=True)
        for target,stop,body in loops[:2]:
            stack=[x for x in body if "[sp," in x.op_str or "[sp]" in x.op_str]
            print("ARM_STRING_LOOP",json.dumps({"mode":mode,"begin":hex(target-start),
                "end":hex(stop-start),"instructions":len(body),"stack_accesses":len(stack),
                "body":[fmt(x) for x in body]}),flush=True)
        (output/(mode+"-"+str(index)+".bin")).write_bytes(binary)
        (output/(mode+"-"+str(index)+".txt")).write_text("\n".join(fmt(x) for x in instructions))
print("ARM_STRING_CODE_COMPLETE",flush=True)
