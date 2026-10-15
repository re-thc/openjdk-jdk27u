"""Read the actual native CPU and kernel SVE capability before running any JDK."""
import ctypes, json, os, platform, re, struct, subprocess
from pathlib import Path

root = Path(os.environ['RUNNER_TEMP']) / 'pr18-arm'
root.mkdir(exist_ok=True)
evidence = root / 'evidence'
evidence.mkdir(exist_ok=True)
with open(os.environ['GITHUB_ENV'], 'a') as f:
    f.write(f'ARM_ROOT={root}\n')
libc = ctypes.CDLL(None, use_errno=True)
libc.getauxval.restype = ctypes.c_ulong
libc.prctl.argtypes = [ctypes.c_int, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_ulong]
elf = Path('/proc/self/exe').read_bytes()[:64]
machine = struct.unpack('<H', elf[18:20])[0]
hwcap, hwcap2 = libc.getauxval(16), libc.getauxval(26)
sve = bool(hwcap & (1 << 22))
lscpu = subprocess.check_output(['lscpu', '-J'], text=True)
fields = {x['field'].rstrip(':'): x['data'] for x in json.loads(lscpu)['lscpu']}
cpu = fields.get('Model name') or fields.get('CPU part') or platform.processor() or 'unknown'
probe = []
initial = libc.prctl(51, 0, 0, 0, 0) if sve else -1
if sve and initial >= 0:
    for vl in [16, 32, 64, 128, 256]:
        ctypes.set_errno(0)
        result = libc.prctl(50, vl, 0, 0, 0)
        probe.append({'requested_bytes': vl, 'result': result, 'errno': ctypes.get_errno(), 'actual_bytes': (result & 65535) if result >= 0 else None})
    restored = libc.prctl(50, initial & 65535, 0, 0, 0)
    assert restored >= 0 and (restored & 65535) == (initial & 65535)
maximum = max([p['actual_bytes'] for p in probe if p['actual_bytes'] is not None] or [0])
fs = subprocess.check_output(['findmnt', '-J', '-T', str(root)], text=True)
assert json.loads(fs)['filesystems'][0]['fstype'] not in ['tmpfs', 'ramfs'], fs
record = {'machine': platform.machine(), 'python_elf_machine': machine, 'native': platform.machine() == 'aarch64' and machine == 183,
          'cpu': cpu, 'lscpu': json.loads(lscpu), 'cpuinfo': Path('/proc/cpuinfo').read_text(), 'hwcap': hex(hwcap), 'hwcap2': hex(hwcap2),
          'sve': sve, 'sve2': bool(hwcap2 & 2), 'initial_sve_vl_bytes': initial & 65535 if initial >= 0 else None,
          'vl_probes': probe, 'maximum_sve_vl_bytes': maximum, 'affinity': sorted(os.sched_getaffinity(0)),
          'kernel': platform.uname()._asdict(), 'filesystem': json.loads(fs), 'df': subprocess.check_output(['df', '-h', str(root)], text=True),
          'virtualization': subprocess.run(['systemd-detect-virt'], text=True, capture_output=True).stdout.strip(),
          'execution': 'Native AArch64 binaries; virtualization, if present, is recorded above. No QEMU launcher.'}
(evidence / 'hardware.json').write_text(json.dumps(record, indent=2))
print(json.dumps(record, indent=2), flush=True)
with open(os.environ['GITHUB_OUTPUT'], 'a') as f:
    f.write(f"cpu={re.sub('[^A-Za-z0-9-]', '-', cpu)[:65]}\nsve={int(sve)}\nmax_vl={maximum}\nnative={int(record['native'])}\n")
assert record['native'], 'This validation requires native AArch64 execution'
