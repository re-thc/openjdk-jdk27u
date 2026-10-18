# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Retain exact existing JMH JSON bytes inside an already verified result ZIP."""
import base64
import hashlib
import json
import math
import re


def extract_raw_jmh(bundle, records, binding, emit, prefix=""):
    # The caller verifies ZIP/job/source/image/manifest receipts before this call.
    assert prefix in ("", "periodic/", "utf16-probe/", "stock-interpreter/",
                      "stock-interpreter/periodic/", "stock-c2/", "stock-c2/periodic/", "s54-c2/")
    assert all(key in binding for key in ("source", "baseline", "workflow", "phase", "backend", "tier"))
    assert records and isinstance(binding["workflow"], dict)
    index, seen = [], set()
    backend, tier = binding["backend"], binding["tier"]
    normalize = lambda value: value.replace("\\", "/").lower() if backend == "msvc" else value
    for record in records:
        assert record["backend_control"] == backend and record["tier"] == tier
        case, control = record["case"], record["control"]
        assert re.fullmatch(r"[A-Za-z0-9_.-]+", case)
        assert control in ("original", "enabled", "disabled")
        assert record["source"] == (binding["baseline"] if control == "original" else binding["source"])
        path = prefix + "-".join((backend, tier, case, control)) + ".json"
        assert path not in seen
        seen.add(path)
        raw = bundle.read(path)
        assert 0 < len(raw) <= 1024 * 1024
        digest = hashlib.sha256(raw).hexdigest()
        assert digest == record["json_sha256"]
        data = json.loads(raw)
        assert isinstance(data, list) and len(data) == 1
        value = data[0]
        assert value["benchmark"] == record["benchmark"] and value["params"] == record["params"]
        assert normalize(value["jvm"]) == normalize(record["java"])
        assert value["jvmArgs"] == record["jvmArgs"]
        assert value["forks"] == 2 and value["warmupIterations"] == 3 and value["measurementIterations"] == 5
        assert value["warmupTime"] == value["measurementTime"] == "500 ms"
        metric = value["primaryMetric"]
        assert metric["scoreUnit"] == "ns/op" and metric["rawData"] == record["rawData"]
        assert metric["score"] == record["score"] and metric["scoreError"] == record["error"]
        assert all(math.isfinite(metric[key]) for key in ("score", "scoreError"))
        samples = metric["rawData"]
        assert len(samples) == 2 and all(len(fork) == 5 for fork in samples)
        assert all(math.isfinite(x) and x > 0 for fork in samples for x in fork)
        payload = {**binding, "schema": 1, "case": case, "control": control,
                   "runtime_source": record["source"], "path": path, "bytes": len(raw),
                   "sha256": digest, "encoding": "base64",
                   "content": base64.b64encode(raw).decode("ascii")}
        emit("SAVED_JMH_JSON", payload)
        index.append({key: value for key, value in payload.items() if key != "content"})
    assert len(index) == len(records)
    return index
