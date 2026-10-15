"""Compile the actual production classifier against a deterministic graph adapter.

This is a structural and traversal-cost test, not native C2 qualification.
Run with --out to retain the exact extracted C++ and operation-count evidence.
"""
import argparse
import hashlib
import json
import pathlib
import re
import subprocess

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--out', type=pathlib.Path, required=True)
p.add_argument('--cxx', default='g++')
p.add_argument('--sanitize', action='store_true')
a = p.parse_args()
source = pathlib.Path(__file__).resolve().parents[2]
model = pathlib.Path(__file__).with_name('roundtrip_classifier_model.cpp')
m4 = source / 'src/hotspot/cpu/aarch64/aarch64_vector_ad.m4'
header = source / 'src/hotspot/cpu/aarch64/matcher_aarch64.hpp'
matcher = source / 'src/hotspot/share/opto/matcher.cpp'
text = m4.read_text()
begin = text.index('  static Node* float_roundtrip_reduction_input(')
end = text.index('  typedef void (C2_MacroAssembler::* sve_mem_insn_predicate)', begin)
production = text[begin:end]
assert 'live_nodes()' not in production
assert 'path.clear()' not in production
declarations = header.read_text().split('private:', 1)[1].split('  // false =>', 1)[0]
declarations = 'private:' + declarations
assert 'Node_Array* _float_roundtrip_accumulations' in declarations
assert 'FloatRoundTripClassificationMark' in declarations
common = matcher.read_text()
main = common.split('void Matcher::match( ) {', 1)[1].split('//------------------------------Fixup_Save_On_Entry', 1)[0]
assert main.index('FloatRoundTripClassificationMark') < main.index('init_spill_mask(')
assert main.index('find_shared( C->top() );') < main.index('prepare_float_roundtrip_accumulations();') < main.index('swap_old_and_new()')
clear = main.index('clear_float_roundtrip_accumulations();')
assert clear < main.index('old->destruct_contents()')
assert clear < main.index('NOT_DEBUG( old->destruct_contents() )')
assert 'AARCH64_ONLY(if (opcode == Op_AddF) { collect_float_roundtrip_add(n); })' in common
assert '(*_float_roundtrip_accumulations)[n->_idx] == n' in production
assert '->contains(n)' not in production  # Arena::contains can scan chunks.
instrumented = production.replace('static Node* float_roundtrip_reduction_input(',
                                  'static Node* float_roundtrip_reduction_input_impl(', 1)
where = instrumented.index('  void Matcher::collect_float_roundtrip_add(')
instrumented = instrumented[:where] + '''  static Node* float_roundtrip_reduction_input(const Node* n) {
    ++metrics.helper;
    return float_roundtrip_reduction_input_impl(n);
  }
''' + instrumented[where:]
a.out.mkdir(parents=True, exist_ok=False)
(a.out / 'roundtrip-classifier.inc').write_text(instrumented)
(a.out / 'roundtrip-declarations.inc').write_text(declarations)
binary = a.out / 'classifier-model'
command = [a.cxx, '-std=c++17', '-O2', '-Wall', '-Wextra', '-Werror', '-I' + str(a.out), str(model), '-o', str(binary)]
if a.sanitize:
    command[command.index('-O2')] = '-O1'
    command += ['-fsanitize=address,undefined', '-fno-omit-frame-pointer']
compiled = subprocess.run(command, text=True, capture_output=True)
(a.out / 'compile.log').write_text(compiled.stdout + compiled.stderr)
assert compiled.returncode == 0, compiled.stderr
run = subprocess.run([str(binary)], text=True, capture_output=True)
(a.out / 'model.log').write_text(run.stdout + run.stderr)
assert run.returncode == 0, run.stdout + run.stderr
assert re.search(r'STRUCTURAL_PASS cases=\d+', run.stdout)
report = dict(passed=True, native_JVMs=0, production_cpp_sha256=hashlib.sha256(production.encode()).hexdigest(),
    declaration_sha256=hashlib.sha256(declarations.encode()).hexdigest(), command=command, output=run.stdout,
    scope='Extracted production C++ with a counter wrapper, structural graph/container adapters, and exact integration-site assertions. Real HotSpot interface/ADLC checks are separate; no native C2 or runtime performance claim.')
(a.out / 'result.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
