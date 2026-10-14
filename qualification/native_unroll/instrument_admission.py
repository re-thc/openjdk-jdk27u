import pathlib
p=pathlib.Path('traced-source/src/hotspot/share/opto/loopTransform.cpp')
s=p.read_text()
anchor='  uint estimate = est_loop_clone_sz(2);\n\n  if (cl->has_passed_slp()) {'
assert s.count(anchor)==1
logger=r'''  uint estimate = est_loop_clone_sz(2);

  // PR14 diagnostic only: observe the original policy without changing decisions.
  auto pr14_decision = [&](const char* branch, bool admitted) {
#ifndef PRODUCT
    if (TraceLoopOpts && phase->C->method()->holder()->name()->equals("PhaseVectorKernels") &&
        phase->C->method()->name()->equals("conversion")) {
      tty->print_cr("PR14_UNROLL compile=%d osr=%d loop=%u branch=%s raw_body=%u body_size=%u limit=%d current=%d future=%d slp=%d slp_max=%d vectorized=%d should=%d estimate=%u admitted=%d",
                    phase->C->compile_id(), phase->C->is_osr_compilation(), cl->_idx, branch,
                    _body.size(), body_size, _local_loop_unroll_limit, cl->unrolled_count(),
                    future_unroll_cnt, cl->has_passed_slp(), cl->slp_max_unroll(),
                    cl->is_vectorized_loop(), should_unroll, estimate, admitted);
      for (uint k = 0; k < _body.size(); k++) {
        Node* n = _body.at(k);
        if (n->Opcode() == Op_AddReductionVF || n->Opcode() == Op_AddReductionVD) {
          const TypeVect* vt = n->in(2)->bottom_type()->is_vect();
          tty->print_cr("PR14_REDUCTION compile=%d loop=%u node=%u opcode=%d width=%u type=%d strict=%d",
                        phase->C->compile_id(), cl->_idx, n->_idx, n->Opcode(),
                        vt->length(), vt->element_basic_type(), n->as_Reduction()->requires_strict_order());
        }
      }
    }
#endif
    return admitted;
  };

  if (cl->has_passed_slp()) {'''
s=s.replace(anchor,logger)
start=s.index('  // PR14 diagnostic only')
end=s.index('\nvoid IdealLoopTree::policy_unroll_slp_analysis',start)
block=s[start:end]
old='return should_unroll && phase->may_require_nodes(estimate);'
assert block.count(old)==3
block=block.replace(old,'return pr14_decision("slp_allow", should_unroll && phase->may_require_nodes(estimate));',1)
block=block.replace('return false; // Loop too big.','return pr14_decision("slp_limit", false); // Loop too big.',1)
block=block.replace(old,'return pr14_decision("subword_or_crc_allow", should_unroll && phase->may_require_nodes(estimate));',1)
block=block.replace('return false; // Loop too big.','return pr14_decision("body_size_limit", false); // Loop too big.',1)
block=block.replace(old,'return pr14_decision("body_size_allow", should_unroll && phase->may_require_nodes(estimate));',1)
s=s[:start]+block+s[end:]
p.write_text(s)
