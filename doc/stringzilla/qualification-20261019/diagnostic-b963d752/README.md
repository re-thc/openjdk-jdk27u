# Complete-image probe recheck

These three serial C2 comparisons use complete baseline 416d7db3 and candidate b963d752 images built with matching GCC 16.2 settings. They qualify this diagnostic scope only, not the subsequent shared-verifier correction.

The four-code-unit UTF-16 immediate match now measures 5.360 ns original, 3.121 ns enabled and 5.360 ns disabled, reversing the preceding loss. Its paired original/enabled median ratio is 1.670, with all three rounds favoring enabled. The Latin-1 bulk miss retains a 3.438 paired speedup.

The nine-byte Latin-1 immediate match still measures 8.834 ns original versus 14.215 ns enabled and 8.608 ns disabled. Its paired original/enabled ratios are 0.6516, 0.5729 and 0.6023. That unchanged shared verifier motivates the next correction: keep required bounds inline and avoid the prefix helper for short word windows. All 27 original JMH files and 135 samples remain with [the full table](COMPARISONS.md).
