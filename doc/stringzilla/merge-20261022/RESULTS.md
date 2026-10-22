# Final actual-merge assessment

Product `2538e2fd80a363ea19d45044950701df62a0162f` includes PR63, the native kernel optimization correction, bounded reverse-search fixes, direct Java-only whitespace fallbacks and the existing compiler-tier query moved to initialized String. Ordinary CI builds actual merge `cd785f1c66fb72404c12b150d5f3d8e0fe0a4776`, with parents current master `8d030adbd245b19e6339e3ccd052eb7fe3635319` and that product commit. PR4 is unmerged.

The bounded final study has 30 Linux groups and 22 groups on each of native ARM and Windows. Five complete-image controls compare independent original416, matched master8d, prior branch922, actual merge enabled and actual merge disabled. Five balanced rotating rounds use ordinary JMH forks, three 300 ms warmups and five 300 ms samples. Original, master and candidate builds have matched compiler, boot JDK and build settings within each platform. The explicit internal version label matches the independent originals. Every loss and paired spread is retained.

Eight balanced ordinary-process rounds per platform also compare startup, javac and fixed source-indexing with default tiering/CDS and checked outputs.

Final execution is pending. Planned scope is not a result. Earlier [branch922 results](../selected-20261022/RESULTS.md), actual2883 diagnosis and L/M prototype evidence remain source-labelled and are not final qualification.
