"""One ordinary matched baseline build; invoke only through the approved runbook.

This module is inert on import. GNU timeout's process group and the retained
VM's init/reaper own timeout cleanup; no child is launched during offline tests.
"""

import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess


def require(condition, message):
    if not condition:
        raise ValueError(message)


def replace_options(args, values):
    result, index = [], 0
    while index < len(args):
        arg = args[index]
        name = arg.split("=", 1)[0]
        if name in values:
            if "=" not in arg:
                index += 1
                require(index < len(args) and not args[index].startswith("--"),
                        "missing original configure option value")
        elif arg == "--enable-ccache" or arg == "--disable-ccache" or arg.startswith("--enable-ccache="):
            pass
        else:
            result.append(arg)
        index += 1
    return result + [name + "=" + value for name, value in values.items()] + ["--disable-ccache"]


def commands(cfg, inherited_env):
    require(type(cfg.get("caller_args")) is list
            and all(type(a) is str for a in cfg["caller_args"]), "original configure argv required")
    require(type(cfg.get("jobs")) is int and 1 <= cfg["jobs"] <= 10, "invalid fixed jobs")
    require(type(cfg.get("source_date")) is str and cfg["source_date"].isdigit(), "resolved epoch required")
    require(type(cfg.get("conf_name")) is str and cfg["conf_name"], "fixed configuration required")
    tool_env = cfg.get("tool_env")
    require(type(tool_env) is dict and all(type(k) is str and type(v) is str
                                         for k, v in tool_env.items()), "frozen tool environment required")
    require(all(tool_env.get(k) for k in ["PATH", "CC", "CXX", "LD"]), "PATH/CC/CXX/LD must be pinned")
    require(all(Path(tool_env[k]).is_absolute() for k in ["CC", "CXX", "LD"]), "resolved absolute tools required")
    for key in ["build_user", "version_opt"]:
        require(type(cfg.get(key)) is str and bool(cfg[key]), "resolved metadata required: " + key)
    options = {"--with-source-date": cfg["source_date"],
               "--with-build-user": cfg["build_user"], "--with-version-opt": cfg["version_opt"],
               "--with-conf-name": cfg["conf_name"]}
    argv = ["bash", "bin/configure-dev", *replace_options(cfg["caller_args"], options)]
    env = dict(inherited_env)
    for name in ["CFLAGS", "CXXFLAGS", "CPPFLAGS", "LDFLAGS", "CONFIGURE_DEV_NO_MOLD"]:
        env.pop(name, None)
    env.update(tool_env)
    env["SOURCE_DATE_EPOCH"] = cfg["source_date"]
    build = ["make", "CONF=" + cfg["conf_name"], "JOBS=" + str(cfg["jobs"]), "images"]
    return argv, build, env


def main():
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--config", type=Path, required=True)
    parser.add_argument("--logs", type=Path, required=True)
    args = parser.parse_args()
    cfg = json.loads(args.config.read_text())
    configure, build, env = commands(cfg, os.environ)
    tools = cfg.get("tool_files")
    require(type(tools) is dict and bool(tools), "actual tool/support file hashes required")
    require(all(path in tools for path in [env["CC"], env["CXX"], env["LD"], cfg["mold_path"]]),
            "compiler/linker hash set incomplete")
    for path, expected in tools.items():
        require(Path(path).is_absolute() and hashlib.sha256(Path(path).read_bytes()).hexdigest() == expected,
                "retained compiler/tool support identity changed: " + path)
    require(shutil.which("mold", path=env["PATH"]) is not None
            and Path(shutil.which("mold", path=env["PATH"])).resolve() == Path(cfg["mold_path"]).resolve(),
            "mold resolves outside the frozen toolchain")
    args.logs.mkdir()  # exclusive attempt outputs
    record = dict(configure=configure, build=build, fixed_tool_environment=cfg["tool_env"],
                  supervisor_pid=os.getppid(), owner="GNU timeout process group; retained VM init/reaper",
                  source=str(args.source.resolve()), status="PREPARING")
    receipt = args.logs / "replay.json"
    receipt.write_text(json.dumps(record, indent=2) + "\n")
    for name, argv in [("configure", configure), ("images", build)]:
        with (args.logs / (name + ".log")).open("xb") as log:
            result = subprocess.run(argv, cwd=args.source, env=env, stdout=log, stderr=subprocess.STDOUT)
        record[name + "_exit"] = result.returncode
        receipt.write_text(json.dumps(record, indent=2) + "\n")
        require(result.returncode == 0, "ordinary " + name + " failed; no retry")
    record["status"] = "BUILD_EXIT_ZERO_INPUT_COMPARISON_PENDING"
    receipt.write_text(json.dumps(record, indent=2) + "\n")


if __name__ == "__main__":
    main()
