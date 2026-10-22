# Selected combined PR4 and PR63 source

Product source `92221215d9e350b8c2b6ae9d9238cfc96ebe81ee`. Exact-source complete-image qualification is running. The bounded qualification contains 74 Linux groups across serial/AVX2/AVX512 and 50 groups each on native NEON and MSVC. Independent original416, prior f714, candidate enabled and candidate disabled use four balanced rotating rounds and ordinary JMH forks. All losses, raw means/errors/samples, and paired ranges are retained. No performance conclusion is claimed before these runs complete.

The selected implementation simplifies the UTF16 tier dispatch, reuses bounded native equality for the one/two-candidate C1 gap, and derives dense scalar C2 loop bounds within a compact compilation. Physical checks, maximum native windows and fallback behavior remain enforced. PR63's history is integrated; PR4 remains unmerged.

[Previous complete-image diagnosis](../final-20261022/RESULTS.md), [exploratory G–K archive receipt](diagnostic-g-to-k.receipt.json). Exploratory image results are not relabelled as qualification of this committed source.
