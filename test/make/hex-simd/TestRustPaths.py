#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Exercise real Hex SIMD configure/export/make code with normalized fake tools.

Requires bash, make, autoconf and Python 3; no Rust, Cargo or Windows installation.
Windows path conversion is simulated, not Windows build/run qualification.
"""
import json
import os
from pathlib import Path
import shlex
import subprocess
import sys
import tempfile

REPO = Path(__file__).resolve().parents[3]


def run(argv, cwd, env, success=True):
    p = subprocess.run(argv, cwd=cwd, env=env, text=True,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if (p.returncode == 0) != success:
        raise AssertionError(f"{argv}: exit {p.returncode}\n{p.stdout}")
    return p.stdout


def executable(path, source):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(f"#!{sys.executable}\n" + source)
    path.chmod(0o755)


with tempfile.TemporaryDirectory(prefix="hex-rust-paths-") as tmp:
    root = Path(tmp)
    rustc = root / "rustc"
    cargo = root / "cargo"
    fixpath = root / "fixpath"
    executable(rustc, '''import os, sys
from pathlib import Path
args = sys.argv[1:]
if args == ['--version']: print('rustc 1.85.0 (fixture)')
elif args == ['-vV']: print('host: ' + os.environ['FIXTURE_TARGET'])
elif args == ['--print', 'sysroot']: print(os.environ['FIXTURE_SYSROOT'])
elif '--print' in args and 'native-static-libs' in args:
    Path(args[args.index('-o') + 1]).touch()
    print('note: native-static-libs: -lm', file=sys.stderr)
else: raise AssertionError(args)
''')
    executable(cargo, '''import json, os, subprocess, sys
from pathlib import Path
args = sys.argv[1:]
assert args[:2] == ['--color', 'never'], args
args = args[2:]
if args == ['--version']: print('cargo 1.85.0 (fixture)')
else:
    assert args[:5] == ['build', '--locked', '--release', '--jobs', '2'], args
    assert os.environ['RUSTC'] == os.environ['FIXTURE_EXPECTED_RUSTC'], os.environ['RUSTC']
    assert os.environ['MAKEFLAGS'] == os.environ['CARGO_MAKEFLAGS'] == ''
    subprocess.run([os.environ['RUSTC'], '--version'], check=True)
    out = Path(args[args.index('--target-dir') + 1])
    target = args[args.index('--target') + 1]
    manifest = Path(args[args.index('--manifest-path') + 1])
    assert manifest.is_file(), manifest
    archive = out / target / 'release' / 'libjdk_hex_codec.a'
    archive.parent.mkdir(parents=True, exist_ok=True)
    archive.touch()
    Path('cargo-result.json').write_text(json.dumps({'args': args,
        'rustc': os.environ['RUSTC'], 'rustflags': os.environ['RUSTFLAGS']}))
''')
    executable(fixpath, '''import json, os, subprocess, sys
args = sys.argv[1:]
with open('fixpath-calls.jsonl', 'a') as f: f.write(json.dumps(args) + '\\n')
if args[0] == 'print':
    assert len(args) == 2, args  # One bare path, never a wrapped command.
    print('Z:/toolchain/rustc.exe' if args[1] == os.environ['FIXTURE_RAW_RUSTC'] else args[1])
elif args[0] == 'exec':
    assert 'exec' not in args[1:], args  # No nested fixpath around Cargo.
    sys.exit(subprocess.call(args[1:]))
else: raise AssertionError(args)
''')
    shell_fixpath = root / "fixpath.sh"
    shell_fixpath.write_text(f'exec {shlex.quote(str(fixpath))} "$@"\n')
    notices = root / "sysroot/share/doc/rust"
    notices.mkdir(parents=True)
    (notices / "COPYRIGHT").touch()
    (notices / "LICENSE-MIT").touch()

    # Use the real macro and executable extraction, stubbing only prior tool
    # lookup/path normalization. Inputs obey JDK's space-free path contract.
    (root / "configure.ac").write_text('''AC_INIT([hex-rust-path-fixture], [1])
AC_CONFIG_SRCDIR([configure.ac])
m4_include([util.m4])
m4_include([lib-hexsimd.m4])
AC_DEFUN([UTIL_REQUIRE_PROGS], [$1="[$]FIXTURE_$1"])
AC_DEFUN([UTIL_FIXUP_PATH], [])
COMPILE_TYPE="${FIXTURE_COMPILE:-native}"
OPENJDK_TARGET_OS="$FIXTURE_OS"
OPENJDK_TARGET_CPU="${FIXTURE_CPU:-x86_64}"
OPENJDK_TARGET_LIBC="${FIXTURE_LIBC:-gnu}"
CUT=cut
ECHO=echo
SED=sed
RM='rm -f'
LIB_SETUP_HEX_SIMD
AC_CONFIG_FILES([spec.gmk])
AC_OUTPUT
''')
    names = {"ENABLE_HEX_SIMD", "CARGO", "RUSTC", "RUSTC_EXECUTABLE",
             "RUSTC_VERSION", "HEX_SIMD_RUST_TARGET"}
    # Test the actual spec substitutions rather than a duplicated export list.
    spec_lines = [line for line in (REPO / "make/autoconf/spec.gmk.template").read_text().splitlines()
                  if line.split(" := ", 1)[0] in names]
    assert len(spec_lines) == len(names), spec_lines
    (root / "spec.gmk.in").write_text("\n".join(spec_lines) + "\n")
    env = os.environ.copy()
    run([env.get("AUTOCONF", "autoconf"), "-I", str(REPO / "make/autoconf")], root, env)
    stubs = root / "stubs"
    (stubs / "lib").mkdir(parents=True)
    for name in ["CopyFiles.gmk", "LibCommon.gmk", "lib/CoreLibraries.gmk"]:
        (stubs / name).touch()

    for variant in ["linux", "windows-generated", "windows-shell"]:
        case = root / variant
        case.mkdir()
        windows = variant.startswith("windows")
        base = (f"bash {shell_fixpath}" if variant == "windows-shell" else str(fixpath)) if windows else ""
        prefix = base + " exec " if windows else ""
        env.update(FIXTURE_CARGO=prefix + str(cargo) + " --color never",
                   FIXTURE_RUSTC=prefix + str(rustc), RUSTC="",
                   FIXTURE_TARGET="x86_64-pc-windows-msvc" if windows else "x86_64-unknown-linux-gnu",
                   FIXTURE_OS="windows" if windows else "linux",
                   FIXTURE_SYSROOT=str(root / "sysroot"), FIXPATH=prefix.strip(),
                   FIXTURE_EXPECTED_RUSTC="Z:/toolchain/rustc.exe" if windows else str(rustc))
        # Keep the bare path separate from the normalized tool command.
        env["FIXTURE_RAW_RUSTC"] = str(rustc)
        (case / "Z:/toolchain").mkdir(parents=True)
        (case / "Z:/toolchain/rustc.exe").symlink_to(rustc)
        run(["bash", str(root / "configure"), "--enable-hex-simd"], case, env)
        spec = (case / "spec.gmk").read_text()
        assert f"RUSTC_EXECUTABLE := {rustc}\n" in spec, spec
        makefile = case / "Makefile"
        makefile.write_text(f'''SPEC := {case}/spec.gmk
include $(SPEC)
TOPDIR := {REPO}
TOPDIR_ALT := $(TOPDIR)
WORKSPACE_ROOT := $(TOPDIR)
OUTPUTDIR := {case}/out
SUPPORT_OUTPUTDIR := $(OUTPUTDIR)/support
MAKESUPPORT_OUTPUTDIR := $(OUTPUTDIR)/make-support
OPENJDK_TARGET_OS := {env['FIXTURE_OS']}
OPENJDK_BUILD_OS := linux
FIXPATH_BASE := {base}
FIXPATH := {prefix.strip()}
NO_CUSTOM_EXTENSIONS := true
MODULE := java.base
SHELL := /bin/bash
RM := rm -f
MKDIR := mkdir -p
CP := cp
TOUCH := touch
TEE := tee
ECHO := echo
PRINTF := printf
FIND := find
CAT := cat
TR := tr
LOG_LEVEL := info
LIBRARY_PREFIX := lib
STATIC_LIBRARY_SUFFIX := .a
include {REPO}/make/common/MakeBase.gmk
# Native JDK library setup is unrelated; exercise the real Cargo recipe only.
SetupJdkLibrary =
include {REPO}/make/modules/java.base/Lib.gmk
.PHONY: check
check: $(HEX_SIMD_RUST_ARCHIVE)
''')
        output = run(["make", "--no-print-directory", "-I", str(stubs), "-I", str(REPO / "make/common"), "check"], case, env)
        assert "command not found" not in output, output
        result = json.loads((case / "cargo-result.json").read_text())
        assert result["rustc"] == env["FIXTURE_EXPECTED_RUSTC"], result
        if windows:
            calls = [json.loads(line) for line in (case / "fixpath-calls.jsonl").read_text().splitlines()]
            cargo_calls = [args for args in calls if args[:2] == ["exec", str(cargo)] and "build" in args]
            assert len(cargo_calls) == 1, calls
        # Extra compiler flags cannot be silently lost in the bare export.
        env["FIXTURE_RUSTC"] += " --cfg fixture"
        rejected = run(["bash", str(root / "configure"), "--enable-hex-simd"], case, env, success=False)
        assert "RUSTC must name a single executable without arguments" in rejected, rejected
        # Disabled configuration must not look up or execute either tool.
        env["FIXTURE_RUSTC"] = env["FIXTURE_CARGO"] = "/missing/tool"
        run(["bash", str(root / "configure"), "--disable-hex-simd"], case, env)
        assert "ENABLE_HEX_SIMD := false" in (case / "spec.gmk").read_text()
        print(f"PASS {variant}: configure exports, real make recipe, flags rejection, disabled tools")

    # Automatic enablement is confined to native Linux x64. Other defaults
    # must not even probe Rust/Cargo; the explicit opt-out works on Linux too.
    case = root / "defaults"
    case.mkdir()
    for target_os, cpu, compile_type in [("linux", "aarch64", "native"),
            ("macosx", "aarch64", "native"), ("windows", "x86_64", "native"),
            ("linux", "x86_64", "cross")]:
        env.update(FIXTURE_OS=target_os, FIXTURE_CPU=cpu, FIXTURE_COMPILE=compile_type,
                   FIXTURE_RUSTC="/missing/tool", FIXTURE_CARGO="/missing/tool")
        run(["bash", str(root / "configure")], case, env)
        assert "ENABLE_HEX_SIMD := false" in (case / "spec.gmk").read_text()
    env.update(FIXTURE_OS="linux", FIXTURE_CPU="x86_64", FIXTURE_COMPILE="native",
               FIXTURE_TARGET="x86_64-unknown-linux-gnu", FIXTURE_RUSTC=str(rustc),
               FIXTURE_CARGO=str(cargo) + " --color never")
    run(["bash", str(root / "configure")], case, env)
    assert "ENABLE_HEX_SIMD := true" in (case / "spec.gmk").read_text()
    env.update(FIXTURE_LIBC="musl", FIXTURE_RUSTC="/missing/tool", FIXTURE_CARGO="/missing/tool")
    run(["bash", str(root / "configure")], case, env)
    assert "ENABLE_HEX_SIMD := false" in (case / "spec.gmk").read_text()
    print("PASS native Linux x64 default and non-Linux/cross defaults")
