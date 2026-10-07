#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This file is available under the GNU General Public License version 2.
"""Compare the stock Spring Petclinic application in independently forked JVMs.

Requires aiohttp. Run after compilation and correctness checks have finished.
The candidate must default to four-byte headers; no enabling flag is passed.
"""
import argparse
import asyncio
import json
import os
from pathlib import Path
import re
import subprocess
import time

import aiohttp


def process_memory(pid):
    fields = {}
    for line in Path(f"/proc/{pid}/status").read_text().splitlines():
        if line.startswith(("VmRSS:", "VmHWM:")):
            key, value, _ = line.split()
            fields[key[:-1]] = int(value) * 1024
    stat = Path(f"/proc/{pid}/stat").read_text().split(") ", 1)[1].split()
    fields["cpu_seconds"] = (int(stat[11]) + int(stat[12])) / os.sysconf("SC_CLK_TCK")
    return fields


async def heap_usage(session, port):
    async with session.get(
        f"http://127.0.0.1:{port}/actuator/metrics/jvm.memory.used?tag=area:heap"
    ) as response:
        response.raise_for_status()
        data = await response.json()
        return sum(x["value"] for x in data["measurements"] if x["statistic"] == "VALUE")


async def load(port, seconds, concurrency, collect):
    """Closed-loop load; each worker has one outstanding HTTP request."""
    latencies, errors, counts, observations = [], [], {}, []
    started = time.perf_counter()
    deadline = started + seconds
    connector = aiohttp.TCPConnector(limit=concurrency + 1)
    async with aiohttp.ClientSession(
        connector=connector, timeout=aiohttp.ClientTimeout(total=15), trust_env=False
    ) as session:
        async def worker(number):
            index = number
            while time.perf_counter() < deadline:
                kind = index % 3
                if kind == 0:
                    path, expected = "/owners?lastName=Bench00", b"Bench00"
                elif kind == 1:
                    owner = 11 + (index * 37) % 9990
                    path, expected = f"/owners/{owner}", f"Bench{owner:05d}".encode()
                else:
                    path, expected = "/vets.html", b"Veterinarians"
                before = time.perf_counter_ns()
                try:
                    async with session.get(f"http://127.0.0.1:{port}{path}") as response:
                        body = await response.read()
                        if response.status != 200 or expected not in body:
                            raise RuntimeError(f"Invalid {path}: status={response.status}")
                    if collect:
                        latencies.append((time.perf_counter_ns() - before) / 1e6)
                        counts[str(kind)] = counts.get(str(kind), 0) + 1
                except Exception as error:
                    errors.append(str(error))
                index += 1

        async def observe():
            while time.perf_counter() < deadline:
                observations.append(await heap_usage(session, port))
                await asyncio.sleep(min(5, max(0, deadline - time.perf_counter())))

        tasks = [worker(i) for i in range(concurrency)]
        if collect:
            tasks.append(observe())
        await asyncio.gather(*tasks)
    elapsed = time.perf_counter() - started
    if errors:
        raise RuntimeError(f"HTTP failures: {len(errors)}; first={errors[0]}")
    if not collect:
        return {}
    ordered = sorted(latencies)
    if not ordered:
        raise RuntimeError("No completed requests")
    def percentile(fraction):
        return ordered[min(len(ordered) - 1, int((len(ordered) - 1) * fraction))]
    return {"seconds": elapsed, "requests": len(ordered),
            "requests_per_second": len(ordered) / elapsed, "errors": 0,
            "latency_p50_ms": percentile(.50), "latency_p95_ms": percentile(.95),
            "latency_p99_ms": percentile(.99), "endpoint_counts": counts,
            "busy_heap_samples_bytes": observations}


async def run_vm(args, layout, fork):
    image = args.baseline if layout == "baseline8" else args.candidate
    prefix = args.results / f"petclinic-{layout}-{args.gc}-{fork}"
    command = [str(image / "bin/java"), "-Xms512m", "-Xmx512m",
               "-XX:ActiveProcessorCount=4", "-XX:+PrintFlagsFinal",
               "-Xlog:gc:file=" + str(prefix) + "-gc.log"]
    if args.gc != "default":
        command.append("-XX:+Use" + args.gc + "GC")
    if layout == "candidate8":
        command.append("-XX:-UseFourByteObjectHeaders")
    if args.profile_library:
        command.append("-agentpath:" + str(args.profile_library)
                       + "=start,event=itimer,interval=5ms,collapsed,file="
                       + str(prefix) + ".collapsed")
    command += ["-jar", str(args.jar), "--server.port=" + str(args.port),
                "--server.tomcat.threads.max=32", "--server.tomcat.threads.min-spare=4",
                "--management.endpoints.web.exposure.include=health,metrics",
                "--spring.sql.init.data-locations=classpath:db/h2/data.sql,file:" + str(args.fixture)]
    started = time.perf_counter()
    with prefix.with_suffix(".log").open("w") as output:
        process = subprocess.Popen(command, stdout=output, stderr=subprocess.STDOUT)
        try:
            async with aiohttp.ClientSession(trust_env=False) as session:
                while time.perf_counter() - started < 120:
                    if process.poll() is not None:
                        raise RuntimeError(f"Petclinic exited {process.returncode}: {prefix}.log")
                    try:
                        async with session.get(f"http://127.0.0.1:{args.port}/actuator/health") as r:
                            if r.status == 200 and (await r.json())["status"] == "UP":
                                break
                    except (aiohttp.ClientError, OSError):
                        pass
                    await asyncio.sleep(.05)
                else:
                    raise RuntimeError("Petclinic did not become ready")
            ready = time.perf_counter() - started
            text = prefix.with_suffix(".log").read_text()
            four = bool(re.search(r"UseFourByteObjectHeaders\s+= true", text))
            if four != (layout == "default4"):
                raise RuntimeError("Unexpected header layout: " + layout)
            await load(args.port, args.warmup, args.concurrency, False)
            before = process_memory(process.pid)
            client_start = time.process_time()
            measured = await load(args.port, args.seconds, args.concurrency, True)
            client_cpu = time.process_time() - client_start
            after = process_memory(process.pid)
            measured.update({"layout": layout, "gc": args.gc, "fork": fork,
                             "ready_seconds": ready, "four_byte_headers": four,
                             "rss_before_bytes": before["VmRSS"],
                             "rss_after_bytes": after["VmRSS"], "peak_rss_bytes": after["VmHWM"],
                             "server_cpu_seconds": after["cpu_seconds"] - before["cpu_seconds"],
                             "load_driver_cpu_seconds": client_cpu,
                             "command": command, "concurrency": args.concurrency})
            measured["profiled"] = bool(args.profile_library)
            subprocess.run([str(image / "bin/jcmd"), "-J-XX:ActiveProcessorCount=1",
                            "-J-XX:+UseSerialGC", str(process.pid), "GC.run"],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True, timeout=30)
            async with aiohttp.ClientSession(trust_env=False) as session:
                measured["post_gc_heap_bytes"] = await heap_usage(session, args.port)
            measured["post_gc_rss_bytes"] = process_memory(process.pid)["VmRSS"]
            prefix.with_suffix(".json").write_text(json.dumps(measured, indent=2) + "\n")
            print(layout, fork, "rps", round(measured["requests_per_second"], 2),
                  "heap", measured["post_gc_heap_bytes"], flush=True)
        finally:
            if process.poll() is None:
                process.terminate()
                try:
                    process.wait(timeout=30)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait()
            if process.returncode not in (0, 143, -15):
                raise RuntimeError(f"Unexpected Petclinic exit {process.returncode}")


async def main(args):
    args.results.mkdir(parents=True, exist_ok=True)
    args.fixture = args.results / "petclinic-fixture.sql"
    args.fixture.write_text("""INSERT INTO owners (first_name,last_name,address,city,telephone)
SELECT 'Owner' || X, 'Bench' || LPAD(CAST(X AS VARCHAR),5,'0'),
       '123 Test Street', 'Madison', '6085550000' FROM SYSTEM_RANGE(11,10000);
INSERT INTO pets (name,birth_date,type_id,owner_id)
SELECT 'Pet' || X, DATE '2020-01-01', MOD(X,6)+1, X FROM SYSTEM_RANGE(11,10000);
INSERT INTO visits (pet_id,visit_date,description)
SELECT id, DATE '2025-01-01', 'Routine check' FROM pets WHERE owner_id >= 11;
""")
    for fork in range(1, args.forks + 1):
        layouts = ["baseline8", "default4"]
        if args.layout:
            layouts = [args.layout]
        elif args.control:
            layouts = [["baseline8", "candidate8", "default4"],
                       ["default4", "candidate8", "baseline8"],
                       ["candidate8", "baseline8", "default4"],
                       ["default4", "baseline8", "candidate8"],
                       ["baseline8", "default4", "candidate8"],
                       ["candidate8", "default4", "baseline8"]][(fork - 1) % 6]
        elif fork % 2 == 0:
            layouts.reverse()
        for layout in layouts:
            await run_vm(args, layout, fork)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ["baseline", "candidate", "jar", "results"]:
        parser.add_argument(name, type=lambda value: Path(value).resolve())
    parser.add_argument("--gc", choices=["default", "Serial", "G1", "Z"], default="default")
    parser.add_argument("--forks", type=int, default=6)
    parser.add_argument("--warmup", type=float, default=30)
    parser.add_argument("--seconds", type=float, default=60)
    parser.add_argument("--concurrency", type=int, default=8)
    parser.add_argument("--port", type=int, default=18080)
    parser.add_argument("--control", action="store_true")
    parser.add_argument("--layout", choices=["baseline8", "candidate8", "default4"],
                        help="Select one layout for a separate diagnostic run")
    parser.add_argument("--profile-library", type=lambda value: Path(value).resolve(),
                        help="Async-profiler library; diagnostic results must be separate from timings")
    asyncio.run(main(parser.parse_args()))
