# Compilation diagnostics

These 24 untimed witnesses use the complete original `416d7db3` and fork `916ba895` images from the preceding measurement campaign, with the same saved benchmark classes. [INDEX.json](INDEX.json) binds the actual workflow, source, images, flags and diagnostic artifacts.

The JSON contains compilation and inlining summaries, code hashes, sizes, stack adjustments and instruction counts. Full machine-code listings remain in the authenticated workflow artifact. Counts include cold paths and do not identify executed calls or prove hot spills. Equal mnemonic hashes ignore operands and do not prove identical hot paths. Diagnostic JMH scores are excluded from performance results.

The forward UTF-16 character witness retained the existing JDK intrinsic in every control. Its final printed stubs had equal sizes and mnemonic counts; the earlier measured loss remains visible. Mixed-coder immediate witnesses exposed larger enabled graphs, supporting a separate dispatch investigation. These observations do not qualify later source changes or establish the cause of a timing difference.
