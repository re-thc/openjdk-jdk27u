"""Keep driver invocation names separate from canonical executable provenance."""
import os
import stat
from pathlib import Path

from classifier_images import record,require


def invocation_path(path):
    # Do not resolve symlinks: clang++/g++ and multi-call wrappers use argv[0].
    # Do not split whitespace or interpret an installation path as shell syntax.
    path=Path(path)
    return path if path.is_absolute() else Path.cwd()/path


def invocation_record(path):
    path=invocation_path(path)
    resolved=path.resolve(strict=True)
    links={}
    pending=[path];seen=set()
    while pending:
        current=pending.pop()
        for component in [*reversed(current.parents),current]:
            if component in seen:continue
            seen.add(component)
            if component.is_symlink():
                target=os.readlink(component);links[str(component)]=target
                destination=Path(target) if Path(target).is_absolute() else component.parent/target
                pending.append(destination)
    return dict(invocation=str(path),resolved=str(resolved),symlinks=links,mode=stat.S_IMODE(path.stat().st_mode),executable=record(path))


def invocation_records(paths):
    return {name:invocation_record(path) for name,path in paths.items()}


def configure_paths(paths):
    # OpenJDK make/autoconf/util_paths.m4 forbids Unix build paths with spaces.
    for name,path in paths.items():
        require(not any(c.isspace() for c in str(path)),
                'OpenJDK configure requires a whitespace-free '+name+' path: '+str(path))
