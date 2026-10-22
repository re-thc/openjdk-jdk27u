# Final combined PR4 and PR63 assessment

Source `f7148bae3645efcfdf57e2a63b041bd62334dc23` contains PR63's complete history, the measured integration corrections, a separate C2 bulk scalar reverse-search fallback, earlier selection of the existing short UTF16 C1 loop, and the explicit native test allocation header. PR4 remains draft while exact-source CI and complete-image comparisons run.

The bounded final comparison covers 83 Linux case groups across serial/AVX2/AVX512 and 62 cases each on native NEON and MSVC. Every case uses independent original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`, prior `b19af25c4ccac240e017ca15bfbfc955d4798aa4`, final enabled and final disabled complete images. Four balanced rotating rounds retain three 300 ms warmups and five 300 ms measurements per ordinary JMH fork. All losses and paired spread will be published. Earlier [b19 results](../integration-20261021/RESULTS.md) remain diagnostic evidence under that source identity.
