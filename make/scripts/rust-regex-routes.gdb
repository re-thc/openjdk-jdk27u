# Copyright (c) 2026, re-thc. All rights reserved.
# This file is distributed under the GNU General Public License version 2.
# See LICENSE for the full terms.
# Untimed call-route validation only. Do not use these runs as timings.
set pagination off
set confirm off
set breakpoint pending on
set print thread-events off
set debuginfod enabled off
set $leaf = 0
set $jni = 0
handle SIGSEGV nostop noprint pass
handle SIGBUS nostop noprint pass
break RustRegex::match
commands
silent
set $leaf = $leaf + 1
continue
end
break RR_match
commands
silent
set $jni = $jni + 1
continue
end
run
printf "native_leaf_calls=%ld jni_entry_calls=%ld\n", $leaf, $jni
