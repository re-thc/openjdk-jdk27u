# Clean-image qualification checkpoint for 0fb3e86a

Both release and fastdebug images were built from cleaned output directories.
The symbol-enabled fastdebug build resumed unchanged after disk capacity was
reclaimed. The disk/configure failures and corrected executions are preserved.
Release has 130 passed records; fastdebug common has 21 passed so far. Its
remaining archive/AOT/flagless/redefinition selections are still active.

All 1399 native gtests passed (15 disabled), including the three source-location
checks that failed without native symbols. All 720 functional flag/collector
probes passed. Both images passed 40 concurrent first-use product probes under
five collectors and both compressed-oop settings, with 2570 actual GC cycles.
All interpreter/C1 probes generated the compiler blob after the first-use gate.
These are correctness results, not performance results.

Final timing matrices and tier2 are pending. Original ARM packets remain
unreadable in this executor: the approved existing artifact is available through
GitHub, but the returned storage transfer is blocked by proxy tunnel 403 after
one bounded local retry. No signed URL or proxy bypass was attempted. Native
ARM and Windows qualification remain open. PR head/draft state are unchanged;
no hosted campaign, init change, merge, force-push or competing task was made.
