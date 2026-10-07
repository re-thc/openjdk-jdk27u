| Workload | Metric | Original 8 bytes | Fork default 4 bytes | Change (95% interval) |
| --- | --- | ---: | ---: | ---: |
| db-shootout | duration (ms) | 4434.45 | 4535.91 | +2.6% [-4.0, +9.6] |
| db-shootout | post-GC heap (MiB) | 71.74 | 65.48 | -7.7% [-33.6, +28.3] |
| db-shootout | post-GC RSS (MiB) | 1096.67 | 1099.18 | +0.2% [-0.6, +1.1] |
| Spring Petclinic | throughput (requests/s) | 161.84 | 159.29 | -1.6% [-5.6, +2.5] |
| Spring Petclinic | p50 latency (ms) | 8.58 | 8.67 | +1.1% [-2.9, +5.3] |
| Spring Petclinic | p95 latency (ms) | 178.41 | 179.84 | +0.8% [-2.8, +4.5] |
| Spring Petclinic | p99 latency (ms) | 216.89 | 219.16 | +1.0% [-2.6, +4.8] |
| Spring Petclinic | post-GC heap (MiB) | 40.19 | 35.70 | -11.2% [-11.3, -11.0] |
| Spring Petclinic | RSS after load (MiB) | 719.61 | 705.27 | -1.9% [-5.5, +1.8] |
| Spring Petclinic | post-GC RSS (MiB) | 723.37 | 708.49 | -2.0% [-5.6, +1.7] |
| Spring Petclinic | ready startup (seconds) | 6.14 | 6.17 | +0.5% [-7.9, +9.6] |
| Spring Petclinic | busy heap (MiB) | 204.59 | 195.83 | -4.4% [-16.9, +10.0] |

Validated measured HTTP responses: 115,741; errors: zero.
Maximum load-driver CPU use: 0.07 CPU cores.
Database benchmark uses its upstream dummy validator; normal termination does not establish result correctness.
