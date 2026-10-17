#!/usr/bin/env python3
"""Offline parser/policy tests. No compiler, JVM, native code or subprocesses."""
import copy
import unittest
from unittest.mock import patch

from mechanism_evidence import analyze_capture, compare_captures, apply_semantic_review, semantic_review_digest, _reference_paths, _transport


def synthetic_capture(cell="release-off", debug=False, stores=19, activation=False, shift=0,
                      hot_frame=(), cold_frame=(), tail_frame=()):
    """Minimal executable-x86 loop fixture; return (PrintAssembly, XML, objdump)."""
    start = 0x1000 + shift
    rows = []
    def emit(data, text):
        pc = start + sum(len(r[1]) for r in rows)
        rows.append((pc, bytes.fromhex(data), text))
        return pc
    roots = [emit("48 8b 03", "mov rax,QWORD PTR [rbx]"),
             emit("48 8b 4b 08", "mov rcx,QWORD PTR [rbx+0x8]"),
             emit("48 8b 53 10", "mov rdx,QWORD PTR [rbx+0x10]")]
    for slot in range(stores):
        emit("89 44 24 %02x" % (slot * 4), "mov DWORD PTR [rsp+0x%x],eax" % (slot * 4))
    for data, text in hot_frame:
        emit(data, text)
    emit("85 c0", "test eax,eax")
    pc = start + sum(len(r[1]) for r in rows)
    displacement = start - (pc + 6)
    emit("0f 85 " + displacement.to_bytes(4, "little", signed=True).hex(), "jne 0x%x" % start)
    call = start + sum(len(r[1]) for r in rows)
    displacement = (0x9000 + shift) - (call + 5)
    emit("e8 " + displacement.to_bytes(4, "little", signed=True).hex(), "call 0x%x" % (0x9000 + shift))
    for data, text in cold_frame:
        emit(data, text)
    pc = start + sum(len(r[1]) for r in rows)
    displacement = start - (pc + 5)
    emit("e9 " + displacement.to_bytes(4, "little", signed=True).hex(), "jmp 0x%x" % start)
    for data, text in tail_frame:
        emit(data, text)
    stop = rows[-1][0] + len(rows[-1][1])
    header = "Compiled method (c2) 100  17             dev.jzstd.internal.BlockDecoder::decodeSequencesRolling (991 bytes)"
    trace = []
    if debug:
        for i, bci in enumerate((360, 373, 386)):
            trace.append(" %d loadL === _ 1 2 [[ 7 ]] long !jvms: BlockDecoder::decodeSequencesRolling @ bci:%d (line 1)" % (100 + i, bci))
        if activation:
            for i in range(3):
                trace.append("CCDEFER def=N%d L%d B7 freq=1024 constraint_freq=1 loadL=1" % (100 + i, 200 + i))
            for first, second, block, pred in ((100, 300, 20, 10), (300, 400, 30, 20)):
                for i in range(3):
                    trace.extend([
                        "CCPHI def=N%d L%d B%d freq=1024 up_freq=1023 down_freq=1 constraint_freq=1 inputs=2 pressure_down=1" % (second + i, 200 + i, block),
                        "CCPHI_INPUT phi=N%d L%d B%d pred=B%d def=N%d up=1 deferred=1 freq=1023" % (second + i, 200 + i, block, pred, first + i),
                        "CCPHI_INPUT phi=N%d L%d B%d pred=B99 def=N%d up=0 deferred=0 freq=1" % (second + i, 200 + i, block, 700 + i),
                        "CCHRP def=N%d L%d B%d keep=1 freq=1024 constraint_freq=1" % (second + i, 200 + i, block)])
        trace.extend(["OptoAssembly for Compile_id = 17", "0000 B1: # Freq: 1024"])
    mach = []
    if debug:
        mach.append(" ;; B1: # Freq: 1024")
    for pc, data, text in rows:
        if pc in roots:
            bci = (360, 373, 386)[roots.index(pc)]
            # JVM comments commonly land inside the instruction encoding.
            mach.extend(["  0x%x: ;*laload {reexecute=0}" % (pc + 1),
                         " ; - dev.jzstd.internal.BlockDecoder::decodeSequencesRolling@%d (line 1)" % bci])
        if pc == call:
            if debug:
                mach.append(" ;; B2: # Freq: 1")
            mach.extend(["  0x%x: ; {static_call}" % (pc + 1),
                         " ;*invokestatic readPartialLong {reexecute=0}",
                         " ; - dev.jzstd.internal.BlockDecoder::decodeSequencesRolling@684 (line 1)"])
        mach.append("  0x%x: %s" % (pc, data.hex()))
    log = "\n".join(trace + [header, "main code [0x%x,0x%x]" % (start, stop), "[MachCode]"] + mach + ["[/MachCode]", ""])
    asm = header + "\n\n" + "\n".join(" %x:\t%s\t%s" % (pc, " ".join("%02x" % b for b in data), text) for pc, data, text in rows) + "\n"
    xml = ("<hotspot_log><nmethod compile_id='17' compiler='c2' method='dev.jzstd.internal.BlockDecoder decodeSequencesRolling ()V'/>"
           "<task compile_id='17' method='dev.jzstd.internal.BlockDecoder decodeSequencesRolling ()V'>"
           "<klass id='1' name='dev.jzstd.internal.BlockDecoder'/><type id='2' name='int'/>"
           "<method id='3' holder='1' name='decodeSequencesRolling' return='2'/>"
           "<parse method='3'><bc bci='1' code='153'/><branch target_bci='7' taken='1' not_taken='1023' prob='0.001'/></parse>"
           "<regalloc attempts='0' success='1'/><task_done success='1'/></task></hotspot_log>")
    return log, xml, asm


def capture(cell="release-off", **options):
    debug = cell.startswith("debug-")
    args = synthetic_capture(cell, debug, **options)
    return analyze_capture(*args, cell, debug)


class CaptureTests(unittest.TestCase):
    def test_complete_release(self):
        proof = capture()
        self.assertTrue(proof["complete"], proof)
        self.assertEqual(19, proof["totals"]["common_unique_stores"])
        self.assertEqual(2, len(proof["cycles"]))

    def test_complete_debug_activation(self):
        proof = capture("debug-on", activation=True)
        self.assertTrue(proof["complete"], proof)
        self.assertEqual({"360", "373", "386"}, set(proof["activation"]["chains"]))
        self.assertEqual(19 * 1024, proof["totals"]["common_unique_weighted_cost"])

    def test_root_comments_inside_instructions(self):
        self.assertEqual([0x1000, 0x1003, 0x1007], list(capture()["roots"].values()))

    def test_xml_compile_id_tie(self):
        log, xml, asm = synthetic_capture()
        proof = analyze_capture(log, xml.replace("'17'", "'18'"), asm, "release-off", False)
        self.assertFalse(proof["complete"])
        self.assertIn("CompileID", proof["errors"][0])

    def test_nonentrant_rejected(self):
        log, xml, asm = synthetic_capture()
        xml = xml.replace("</hotspot_log>", "<make_not_entrant compile_id='17'/></hotspot_log>")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_osr_rejected(self):
        log, xml, asm = synthetic_capture()
        xml = xml.replace("compiler='c2'", "compiler='c2' compile_kind='osr'")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_final_compilation_failure_recorded(self):
        log, xml, asm = synthetic_capture()
        xml = xml.replace("<regalloc", "<failure reason='retry'/><regalloc")
        proof = analyze_capture(log, xml, asm, "release-off", False)
        self.assertFalse(proof["complete"])
        self.assertEqual("retry", proof["compilation"]["target_compilations"][0]["failures"][0]["reason"])

    def test_missing_bytes_rejected(self):
        log, xml, asm = synthetic_capture()
        proof = analyze_capture(log.replace("488b03", "488b"), xml, asm, "release-off", False)
        self.assertFalse(proof["complete"])

    def test_wrong_objdump_bytes_rejected(self):
        log, xml, asm = synthetic_capture()
        proof = analyze_capture(log, xml, asm.replace("48 8b 03", "48 8b 02"), "release-off", False)
        self.assertFalse(proof["complete"])

    def test_bad_instruction_rejected(self):
        log, xml, asm = synthetic_capture()
        self.assertFalse(analyze_capture(log, xml, asm.replace("test eax,eax", "(bad)"), "release-off", False)["complete"])

    def test_indirect_jump_rejected(self):
        log, xml, asm = synthetic_capture()
        asm = asm.replace("jne 0x1000", "jne rax")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_nonload_root_rejected(self):
        log, xml, asm = synthetic_capture()
        asm = asm.replace("mov rax,QWORD PTR [rbx]", "add rax,QWORD PTR [rbx]")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_missing_root_rejected(self):
        log, xml, asm = synthetic_capture()
        log = log.replace("decodeSequencesRolling@373", "decodeSequencesRolling@374")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_retained_call_bci_required(self):
        log, xml, asm = synthetic_capture()
        log = log.replace("decodeSequencesRolling@684", "decodeSequencesRolling@683")
        self.assertFalse(analyze_capture(log, xml, asm, "release-off", False)["complete"])

    def test_debug_requires_frequencies(self):
        log, xml, asm = synthetic_capture(debug=False)
        self.assertFalse(analyze_capture(log, xml, asm, "debug-off", True)["complete"])

    def test_on_requires_connected_phis(self):
        self.assertFalse(capture("debug-on")["complete"])

    def test_disabled_rejects_activation(self):
        self.assertFalse(capture("debug-off", activation=True)["complete"])

    def test_incidental_second_phi_rejected(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("def=N300 up=1", "def=N100 up=1")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_missing_kept_boundary_rejected(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("CCHRP def=N400 L200 B30 keep=1", "CCHRP def=N400 L200 B30 keep=0")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_production_already_up_phi_needs_no_synthetic_boundary(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("inputs=2 pressure_down=1", "inputs=2 pressure_down=0")
        log = "\n".join(line for line in log.splitlines() if not line.startswith("CCHRP "))
        self.assertTrue(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_constraint_frequency_immutable_across_original_lrg(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("B30 freq=1024 up_freq=1023 down_freq=1 constraint_freq=1", "B30 freq=1024 up_freq=1023 down_freq=1 constraint_freq=2")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_phi_input_wrong_lrg(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("CCPHI_INPUT phi=N300 L200", "CCPHI_INPUT phi=N300 L299")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_phi_input_missing_record(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = "\n".join(line for line in log.splitlines() if not line.startswith("CCPHI_INPUT phi=N300 L200 B20 pred=B99"))
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_phi_input_totals_disagree(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("up_freq=1023", "up_freq=1000")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_phi_unproven_up_node(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("def=N100 up=1 deferred=1", "def=N999 up=1 deferred=1")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_hrp_wrong_block(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("CCHRP def=N300 L200 B20", "CCHRP def=N300 L200 B99")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_hrp_wrong_range(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("CCHRP def=N300 L200", "CCHRP def=N300 L201")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_all_roots_need_same_two_join_blocks(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = "\n".join(line.replace(" B30", " B31") if "N402 " in line else line for line in log.splitlines())
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_definition_cold_margin_enforced(self):
        log, xml, asm = synthetic_capture(debug=True, activation=True)
        log = log.replace("B7 freq=1024 constraint_freq=1", "B7 freq=5 constraint_freq=1")
        self.assertFalse(analyze_capture(log, xml, asm, "debug-on", True)["complete"])

    def test_bound_64bit_cisc_stack_read_counted(self):
        log, xml, asm = synthetic_capture()
        asm = asm.replace("mov DWORD PTR [rsp+0x0],eax", "shrx rax,QWORD PTR [rsp],rcx")
        proof = analyze_capture(log, xml, asm, "release-off", False)
        self.assertTrue(proof["complete"], proof)
        self.assertEqual(1, next(row["stack_reads"] for row in proof["transport"] if "shrx" in row["instruction"]))

    def test_unclassified_stack_effect_stops(self):
        log, xml, asm = synthetic_capture()
        asm = asm.replace("mov DWORD PTR [rsp+0x0],eax", "unknown QWORD PTR [rsp],rax")
        proof = analyze_capture(log, xml, asm, "release-off", False)
        self.assertFalse(proof["complete"])
        self.assertFalse(proof["checks"]["all_stack_effects_classified"])

    def test_cycle_enumeration_bound_stops(self):
        with patch("mechanism_evidence.MAX_CYCLES", 1):
            proof = capture()
        self.assertFalse(proof["complete"])
        self.assertIn("bound", proof["errors"][0])

    def test_parse_shape_resolves_unstable_method_ids(self):
        log, xml, asm = synthetic_capture()
        a = analyze_capture(log, xml, asm, "off", False)
        xml = (xml.replace("id='1'", "id='101'").replace("holder='1'", "holder='101'")
               .replace("id='2'", "id='102'").replace("return='2'", "return='102'")
               .replace("id='3'", "id='103'").replace("method='3'", "method='103'"))
        b = analyze_capture(log, xml, asm, "off", False)
        self.assertTrue(b["complete"], b)
        self.assertEqual(a["compilation"]["parse_inlining_branch_shape"]["sha256"], b["compilation"]["parse_inlining_branch_shape"]["sha256"])

    def test_parse_shape_unresolved_method_fails(self):
        log, xml, asm = synthetic_capture()
        proof = analyze_capture(log, xml.replace("<parse method='3'>", "<parse method='99'>"), asm, "off", False)
        self.assertFalse(proof["complete"])
        self.assertFalse(proof["checks"]["parse_inlining_branch_signature_resolved"])

    def test_unidentified_call_operand_preserved(self):
        log, xml, asm = synthetic_capture()
        proof = analyze_capture(log.replace(";*invokestatic readPartialLong", "; unrelated-comment"), xml, asm, "off", False)
        self.assertTrue(proof["normalization"]["unresolved_external_calls"])
        self.assertTrue(any(row[2] == "0x9000" for row in proof["normalization"]["instructions"]))

    def test_xchg_memory_second_operand_writes(self):
        instruction = {"pc": 0x1000, "offset": 0, "block": 0x1000, "mnemonic": "xchg",
                       "operands": "rax,QWORD PTR [rsp+0x8]", "text": "xchg rax,QWORD PTR [rsp+0x8]",
                       "frequency": 100.0, "annotations": []}
        rows, frame, unknown = _transport([instruction])
        self.assertFalse(unknown)
        self.assertEqual((1, 1), (rows[0]["stack_reads"], rows[0]["stack_writes"]))

    def test_vector_extract_memory_destination_is_store(self):
        instruction = {"pc": 0x1000, "offset": 0, "block": 0x1000, "mnemonic": "vpextrq",
                       "operands": "QWORD PTR [rsp+0x8],xmm0,0x0", "text": "vpextrq QWORD PTR [rsp+0x8],xmm0,0x0",
                       "frequency": 100.0, "annotations": []}
        rows, frame, unknown = _transport([instruction])
        self.assertFalse(unknown)
        self.assertEqual((0, 1), (rows[0]["stack_reads"], rows[0]["stack_writes"]))

    def test_unsupported_vector_memory_form_is_unknown(self):
        instruction = {"pc": 0x1000, "offset": 0, "block": 0x1000, "mnemonic": "vunknown",
                       "operands": "xmm0,QWORD PTR [rsp+0x8]", "text": "vunknown xmm0,QWORD PTR [rsp+0x8]",
                       "frequency": 100.0, "annotations": []}
        rows, frame, unknown = _transport([instruction])
        self.assertTrue(unknown)

    def test_implicit_frame_stack_effects_separate(self):
        instructions = [{"pc": 0x1000 + n, "offset": n, "block": 0x1000, "mnemonic": op,
                         "operands": arg, "text": op + " " + arg, "frequency": 1.0, "annotations": []}
                        for n, (op, arg) in enumerate((("push", "rbp"), ("pop", "rbp"), ("call", "0x9000"), ("ret", "")))]
        rows, frame, unknown = _transport(instructions)
        self.assertFalse(unknown)
        self.assertEqual(2, sum(row["implicit_stack_reads"] for row in frame))
        self.assertEqual(2, sum(row["implicit_stack_writes"] for row in frame))
        self.assertEqual(16, sum(row["implicit_stack_reads"] * row["implicit_stack_bytes"] for row in frame))
        self.assertEqual(16, sum(row["implicit_stack_writes"] * row["implicit_stack_bytes"] for row in frame))

    def test_frame_allocation_bytes_explicit(self):
        proof = capture(hot_frame=(("48 83 ec 20", "sub rsp,0x20"), ("48 83 c4 20", "add rsp,0x20")))
        self.assertTrue(proof["complete"], proof)
        summary = proof["frame_summary"]["metrics"]
        self.assertEqual(32, summary["frame_allocation_bytes"])
        self.assertEqual(32, summary["frame_release_bytes"])
        self.assertEqual(32, summary["max_frame_allocation_bytes"])

    def test_dynamic_stack_alignment_is_unproven(self):
        proof = capture(hot_frame=(("48 83 e4 e0", "and rsp,0xffffffffffffffe0"),))
        self.assertFalse(proof["complete"])
        self.assertFalse(proof["frame_summary"]["complete"])

    def test_unrecognized_stack_pointer_mutations_are_unproven(self):
        for data, text in (("48 94", "xchg rax,rsp"), ("48 ff c4", "inc rsp"), ("5c", "pop rsp")):
            with self.subTest(instruction=text):
                proof = capture(hot_frame=((data, text),))
                self.assertFalse(proof["complete"])
                self.assertFalse(proof["checks"]["all_stack_effects_classified"])


class ComparisonTests(unittest.TestCase):
    def proofs(self, new_stores=18, on_options=None, all_options=None):
        return {cell: capture(cell, stores=new_stores if cell.endswith("-on") else 19,
                              activation=cell == "debug-on", shift=index * 0x100000,
                              **dict(all_options or {}, **(on_options or {} if cell.endswith("-on") else {})))
                for index, cell in enumerate(("release-base", "release-default", "release-off", "release-on", "debug-off", "debug-on"))}

    def test_missing_capture_inconclusive(self):
        ledger = compare_captures({})
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertEqual(6, len(ledger["missing_cells"]))

    def test_relocations_normalized_constants_retained(self):
        proofs = self.proofs()
        ledger = compare_captures(proofs)
        self.assertTrue(ledger["checks"]["default_off_base_relocation_aware_equal"], ledger["equivalences"])
        self.assertFalse(ledger["equivalences"][0]["constant_masking"])

    def test_real_constant_difference_fails_equivalence(self):
        proofs = self.proofs()
        proofs["release-default"]["normalization"]["instructions"][3][2] += ",0xabcdef"
        self.assertEqual("MECHANISM_NO_GO", compare_captures(proofs)["verdict"])

    def test_all_nineteen_stores_have_rows(self):
        ledger = compare_captures(self.proofs())
        self.assertEqual(19, len(ledger["store_accounting"]["debug"]["old_stores"]))
        self.assertEqual(19, len(ledger["store_accounting"]["release"]["old_stores"]))

    def test_semantic_mapping_not_invented(self):
        ledger = compare_captures(self.proofs())
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertTrue(ledger["semantic_review_required"])
        self.assertFalse(ledger["checks"]["changed_transport_semantically_bound"])

    def test_no_improvement_no_go(self):
        self.assertEqual("MECHANISM_NO_GO", compare_captures(self.proofs(19))["verdict"])

    def test_compensating_hot_spill_no_go(self):
        self.assertEqual("MECHANISM_NO_GO", compare_captures(self.proofs(20))["verdict"])

    def test_incomplete_capture_never_passes(self):
        proofs = self.proofs()
        proofs["debug-on"]["complete"] = False
        self.assertNotEqual("MECHANISM_PASS", compare_captures(proofs)["verdict"])

    def test_both_complete_reference_paths_required(self):
        proof = capture()
        stores = [{"offset": hex(row["offset"]), "instruction": row["instruction"]}
                  for row in proof["common_store_inventory"]]
        reference = {"paths": {name: {"stores": copy.deepcopy(stores)} for name in ("cross_word", "within_word")}}
        matches = _reference_paths(proof, reference)
        self.assertTrue(all(path["matched"] for path in matches.values()))
        reference["paths"]["cross_word"]["stores"][0]["instruction"] += ",changed"
        matches = _reference_paths(proof, reference)
        self.assertFalse(matches["cross_word"]["matched"])
        self.assertTrue(matches["within_word"]["matched"])

    def test_different_branch_profile_inconclusive(self):
        proofs = self.proofs()
        proofs["release-on"]["compilation"]["parse_inlining_branch_shape"]["sha256"] = "different-profile"
        ledger = compare_captures(proofs)
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertFalse(ledger["checks"]["off_on_parse_inlining_branch_shape_equal"])

    def test_valid_weighted_regression_no_go(self):
        proofs = self.proofs()
        proofs["debug-on"]["totals"]["all_weighted_transport_cost"] = 1e9
        ledger = compare_captures(proofs)
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertFalse(ledger["checks"]["debug_less_all_path_weighted_transport"])

    def test_explicit_savings_cannot_hide_push_or_pop(self):
        for data, text, kind in (("55", "push rbp", "frame-push"), ("5d", "pop rbp", "frame-pop")):
            with self.subTest(kind=kind):
                ledger = compare_captures(self.proofs(on_options={"hot_frame": ((data, text),)}))
                self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
                self.assertTrue(ledger["checks"]["release_less_total_common_transport"])
                self.assertFalse(ledger["checks"]["release_no_increased_common_path_implicit_frame_work"])
                increases = ledger["store_accounting"]["debug"]["implicit_frame_comparison"]["increases"]
                self.assertTrue(any(row["metric"] == kind for row in increases))

    def test_explicit_savings_cannot_hide_extra_cold_call(self):
        proofs = self.proofs(on_options={"cold_frame": (("e8 00 00 00 00", "call 0x9000"),)})
        ledger = compare_captures(proofs)
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertTrue(ledger["checks"]["debug_less_total_common_transport"])
        self.assertFalse(ledger["checks"]["debug_no_increased_method_implicit_frame_work"])
        self.assertFalse(ledger["checks"]["debug_no_increased_all_path_weighted_implicit_frame_work"])

    def test_explicit_savings_cannot_hide_extra_return(self):
        ledger = compare_captures(self.proofs(on_options={"tail_frame": (("c3", "ret"),)}))
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertTrue(ledger["checks"]["debug_less_total_common_transport"])
        self.assertFalse(ledger["checks"]["release_no_increased_method_implicit_frame_work"])

    def test_explicit_savings_cannot_hide_larger_frame(self):
        before = (("48 83 ec 20", "sub rsp,0x20"), ("48 83 c4 20", "add rsp,0x20"))
        after = (("48 83 ec 40", "sub rsp,0x40"), ("48 83 c4 40", "add rsp,0x40"))
        ledger = compare_captures(self.proofs(all_options={"hot_frame": before}, on_options={"hot_frame": after}))
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertFalse(ledger["checks"]["debug_no_increased_common_path_implicit_frame_work"])
        self.assertTrue(any(row["metric"] == "max_frame_allocation_bytes"
                            for row in ledger["store_accounting"]["debug"]["implicit_frame_comparison"]["increases"]))

    def test_existing_implicit_work_moved_hotter_no_go(self):
        proofs = self.proofs()
        proofs["debug-on"]["frame"][0]["frequency"] = 2.0
        ledger = compare_captures(proofs)
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertTrue(ledger["checks"]["debug_no_increased_method_implicit_frame_work"])
        self.assertFalse(ledger["checks"]["debug_no_increased_all_path_weighted_implicit_frame_work"])

    def test_equal_aggregate_allocation_reordered_is_unproven(self):
        reserve = ("48 83 ec 20", "sub rsp,0x20")
        release = ("48 83 c4 20", "add rsp,0x20")
        proofs = self.proofs(all_options={"hot_frame": (reserve, release, reserve, release)},
                             on_options={"hot_frame": (reserve, reserve, release, release)})
        ledger = compare_captures(proofs)
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertTrue(ledger["checks"]["release_no_increased_method_implicit_frame_work"])
        self.assertFalse(ledger["checks"]["release_implicit_frame_layout_proven"])

    def test_increased_return_cleanup_no_go(self):
        ledger = compare_captures(self.proofs(all_options={"tail_frame": (("c2 10 00", "ret 0x10"),)},
                                            on_options={"tail_frame": (("c2 20 00", "ret 0x20"),)}))
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        self.assertFalse(ledger["checks"]["release_no_increased_method_implicit_frame_work"])

    def test_common_path_unproven_mapping_inconclusive(self):
        proofs = self.proofs()
        # Same work, but control correspondence is unavailable.
        next(ins for ins in proofs["release-on"]["instructions"] if ins["branch"])["mnemonic"] = "jz"
        ledger = compare_captures(proofs)
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertFalse(ledger["checks"]["release_common_implicit_frame_paths_proven"])

    def test_unproven_implicit_width_inconclusive(self):
        proofs = self.proofs()
        del proofs["debug-on"]["frame"][0]["implicit_stack_bytes"]
        ledger = compare_captures(proofs)
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertFalse(ledger["checks"]["debug_implicit_frame_effects_proven"])


class SemanticReceiptTests(unittest.TestCase):
    def ledger(self, proofs=None):
        proofs = proofs or ComparisonTests().proofs()
        stores = [{"offset": hex(row["offset"]), "instruction": row["instruction"]}
                  for row in proofs["release-off"]["common_store_inventory"]]
        reference = {"schema": 1, "paths": {name: {"stores": copy.deepcopy(stores), "stack_mov_stores": 19}
                                               for name in ("cross_word", "within_word")}}
        with patch("mechanism_evidence._load_reference", return_value=(reference, "fixture-reference-sha")):
            return compare_captures(proofs)

    def receipt(self, ledger):
        bindings = []
        for flavor, group in ledger["store_accounting"].items():
            for row in group["old_stores"]:
                replacement = row["new_instruction"]
                bindings.append({"flavor": flavor, "old_pc": row["old_store"]["pc"],
                    "disposition": "retained" if replacement is not None else "removed",
                    "on_pcs": [replacement["pc"]] if replacement is not None else [],
                    "value_evidence": "Synthetic eax has the same input definition and is not modified in this loop.",
                    "path_evidence": "The complete fixture has one common no-call cycle; this slot's last store is unused."})
        return {"decision": "accept", "all_replacement_transport_reviewed": True,
                "ledger_sha256": semantic_review_digest(ledger), "evidence_sha256": ledger["evidence_sha256"],
                "capture_sha256": {cell: p["input_sha256"] for cell, p in ledger["captures"].items()},
                "bindings": bindings}

    def test_exact_complete_independent_receipt(self):
        ledger = self.ledger()
        self.assertEqual(["changed_transport_semantically_bound"], [k for k, v in ledger["checks"].items() if not v])
        reviewed = apply_semantic_review(ledger, self.receipt(ledger))
        self.assertEqual("MECHANISM_PASS", reviewed["verdict"])
        self.assertEqual("INCONCLUSIVE_INFRA", ledger["verdict"])
        self.assertFalse(reviewed["semantic_review_required"])

    def test_rejects_no_go_override(self):
        ledger = self.ledger()
        ledger["verdict"] = "MECHANISM_NO_GO"
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, self.receipt(ledger))

    def test_rejects_hard_gate_override(self):
        ledger = self.ledger()
        ledger["checks"]["all_capture_evidence_complete"] = False
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, self.receipt(ledger))

    def test_rejects_revised_ledger(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        ledger["extra"] = "unreviewed change"
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_capture_hash_change(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["capture_sha256"]["on"] = {"log": "wrong"}
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_missing_binding(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["bindings"].pop()
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_duplicate_binding(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["bindings"].append(receipt["bindings"][0])
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_nonexistent_replacement(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["bindings"][0]["on_pcs"] = [0xdeadbeef]
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_nontransport_replacement(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["bindings"][0]["on_pcs"] = [ledger["captures"]["on"]["instructions"][0]["pc"]]
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_unexplained_value(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["bindings"][0]["value_evidence"] = " "
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_rejects_unreviewed_replacement_traffic(self):
        ledger = self.ledger()
        receipt = self.receipt(ledger)
        receipt["all_replacement_transport_reviewed"] = False
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, receipt)

    def test_unchanged_implicit_work_allows_legitimate_pass(self):
        effects = (("55", "push rbp"), ("5d", "pop rbp"),
                   ("48 83 ec 20", "sub rsp,0x20"), ("48 83 c4 20", "add rsp,0x20"))
        ledger = self.ledger(ComparisonTests().proofs(all_options={"hot_frame": effects}))
        self.assertEqual(["changed_transport_semantically_bound"], [k for k, v in ledger["checks"].items() if not v])
        self.assertEqual("MECHANISM_PASS", apply_semantic_review(ledger, self.receipt(ledger))["verdict"])

    def test_review_cannot_waive_implicit_frame_regression(self):
        ledger = self.ledger(ComparisonTests().proofs(on_options={"hot_frame": (("55", "push rbp"),)}))
        self.assertEqual("MECHANISM_NO_GO", ledger["verdict"])
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, self.receipt(ledger))

    def test_review_cannot_waive_unproven_implicit_frame_mapping(self):
        ledger = self.ledger()
        ledger["checks"]["release_common_implicit_frame_paths_proven"] = False
        with self.assertRaises(ValueError):
            apply_semantic_review(ledger, self.receipt(ledger))


if __name__ == "__main__":
    unittest.main()
