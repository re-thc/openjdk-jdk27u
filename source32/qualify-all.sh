#!/usr/bin/env bash
set -euo pipefail
python3 /workspace/sz-evidence/run-bench.py --phase qualify --config c2-avx2 --rounds 5
python3 /workspace/sz-evidence/summarize.py /workspace/sz-evidence/qualify/c2-avx2
python3 /workspace/sz-evidence/run-bench.py --phase tier --config c1-avx2 --rounds 5
python3 /workspace/sz-evidence/summarize.py /workspace/sz-evidence/tier/c1-avx2
python3 /workspace/sz-evidence/run-bench.py --phase tier --config int-avx2 --rounds 5
python3 /workspace/sz-evidence/summarize.py /workspace/sz-evidence/tier/int-avx2
python3 /workspace/sz-evidence/run-cold.py
