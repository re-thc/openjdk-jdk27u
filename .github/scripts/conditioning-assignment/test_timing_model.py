"""Synthetic timestamps/statistical vectors only. No native work or clocks."""
import collections,math,unittest
from fractions import Fraction as F
import timing_model as M

def delivered(order=0,condition='balanced',swap=0,durations=None,late_row=None):
    labels=[0,1,1,0] if order==0 else [1,0,0,1];anchor=10**18;previous=anchor;rows=[]
    for pos,label in enumerate(labels):
        slot=label^swap;target=M.target_start(previous,condition,slot,swap)
        start=target+(100_000 if pos==late_row else 0);duration=(durations or [64_000]*4)[pos]
        rows.append(dict(position=pos,label=label,slot=slot,arm=slot,operations=64,
            target_start_ns=target,fixed_work_end_ns=target-1_000_000,
            begin_ns=start,end_ns=start+duration,warm_wall_ns=10_000_000))
        previous=start+duration
    return anchor,rows

class TimingTests(unittest.TestCase):
    def test_stable_asymmetry_survives_both_orders(self):
        for order in (0,1):
            self.assertEqual(M.centers(M.synthetic(order,[42_200_000,37_800_000],[2_000_000,1_000_000]))['center_ns'],2_200_000)

    def test_balanced_gaps_stable_different_arm_durations(self):
        for order in (0,1):
            self.assertEqual(M.centers(M.synthetic(order,[40_000_000]*2,[3_000_000,1_000_000]))['center_ns'],0)

    def test_assignment_reversal_and_matched_total_budgets(self):
        for condition,center in [('balanced',0),('A_extra',2_200_000),('B_extra',-2_200_000)]:
            for order in (0,1):
                for swap in (0,1):
                    anchor,rows=delivered(order,condition,swap)
                    v=M.delivery(rows,anchor,condition,swap)
                    self.assertTrue(v['valid']);self.assertEqual(sum(v['assigned_gaps_ns']),160_000_000)
                    self.assertEqual(M.centers(rows)['center_ns'],center)

    def test_exact_decomposition_under_actual_duration_burst(self):
        rows=M.synthetic(0,[40_000_000]*2,[64_000]*2,offsets=[0,0,0,192_000])
        v=M.centers(rows)
        self.assertEqual(v['gap_term_ns'],0);self.assertEqual(v['duration_term_ns'],48_000)
        self.assertEqual(v['center_ns'],48_000)
        self.assertEqual(M.contrast(M.ns_per_op_rows(rows),'y'),1500)

    def test_duration_burst_does_not_invalidate_delivery(self):
        anchor,rows=delivered(durations=[64_000,64_000,64_000,464_000])
        self.assertTrue(M.delivery(rows,anchor,'balanced',0)['valid'])
        self.assertEqual(M.centers(rows)['center_ns'],100_000)
        self.assertEqual(M.contrast(M.ns_per_op_rows(rows),'y'),3125)

    def test_late_start_invalid_even_if_target_is_relabelled(self):
        anchor,rows=delivered(late_row=2)
        self.assertFalse(M.delivery(rows,anchor,'balanced',0)['valid'])
        rows[2]['target_start_ns']=rows[2]['begin_ns']
        self.assertFalse(M.delivery(rows,anchor,'balanced',0)['valid'])

    def test_fixed_work_overrun_retained_not_shortened(self):
        anchor,rows=delivered();rows[0]['fixed_work_end_ns']=rows[0]['target_start_ns']+1
        before=[dict(x) for x in rows];self.assertFalse(M.delivery(rows,anchor,'balanced',0)['valid'])
        self.assertEqual(rows,before)

    def test_exact_fractional_ns_translation(self):
        a=M.centers(M.synthetic(0,[102,57],[31,19],origin=0))
        b=M.centers(M.synthetic(0,[102,57],[31,19],origin=10**18))
        self.assertEqual(a,b);self.assertEqual(a['center_ns'],F(45,2))

    def test_coherent_linear_rate_fixture(self):
        # Solve d/ops=base+slope*(begin+d/2), deriving ns/op from actual d.
        # Rational timestamps here are analytic synthetic data, not native rows.
        for order in (0,1):
            labels=[0,1,1,0] if order==0 else [1,0,0,1];t=F(0);rows=[];ops=64;slope=F(1,10**6)
            for pos,a in enumerate(labels):
                if pos:t+=[42_200_000,37_800_000][a]
                duration=ops*(1000+slope*t)/(1-ops*slope/2)
                rows.append(dict(position=pos,label=a,arm=a,begin_ns=t,end_ns=t+duration,
                                 operations=ops,warm_wall_ns=10_000_000));t+=duration
            y=M.ns_per_op_rows(rows)
            for r in y:self.assertEqual(r['y'],1000+slope*(r['begin_ns']+r['end_ns'])/2)
            self.assertEqual(M.contrast(y,'y'),slope*M.centers(rows)['center_ns'])

    def test_center_skew_without_measured_effect(self):
        rows=M.synthetic(0,[42_200_000,37_800_000],[123*64]*2)
        self.assertEqual(M.contrast(M.ns_per_op_rows(rows),'y'),0)
        self.assertEqual(M.centers(rows)['center_ns'],2_200_000)

    def test_common_reference_comes_from_coherent_timed_durations(self):
        block={}
        for c,durations in [('balanced',[64_000]*2),('A_extra',[70_400,64_000]),('B_extra',[64_000,70_400])]:
            gaps=[M.assigned_gap(c,a,0) for a in (0,1)]
            block[c]=[M.synthetic(o,gaps,durations) for o in (0,1)]
        v=M.normalized_block(block)
        self.assertEqual(v['reference_ns_per_op'],F(3100,3))
        self.assertEqual(v['raw_ns_per_op'],dict(balanced=0,A_extra=100,B_extra=-100))
        self.assertEqual(v['pp']['A_extra'],F(300,31))

    def test_joint_balance_without_extra_rows(self):
        p=M.diagnostic_plan();first=p[::2]
        self.assertEqual((len(p),sum(len(x['slots']) for x in p)),(48,192))
        self.assertEqual([x['role_swap'] for x in first[::3]],[0,1,0,1,0,1,0,1])
        for b in range(8):self.assertIn(sum(x['order'] for x in first if x['block']==b),(1,2))
        for c in M.CONDITIONS:
            q=[x for x in first if x['condition']==c];self.assertEqual(len(q),8)
            for role in (0,1):
                z=[x for x in q if x['role_swap']==role]
                self.assertEqual(collections.Counter(x['order'] for x in z),{0:2,1:2})
                for pos in range(3):
                    k=[x for x in z if x['condition_position']==pos];self.assertIn(len(k),(1,2))
                    self.assertLessEqual(abs(sum(x['order']==0 for x in k)-sum(x['order']==1 for x in k)),1)
            for half in (0,1):
                self.assertEqual(collections.Counter(x['order'] for x in q if x['block']//4==half),{0:2,1:2})
            for pos in range(3):
                k=[x for x in q if x['condition_position']==pos];self.assertIn(len(k),(2,3))
                self.assertLessEqual(abs(sum(x['order']==0 for x in k)-sum(x['order']==1 for x in k)),1)
            for b in range(8):
                self.assertEqual({x['order'] for x in p if x['condition']==c and x['block']==b},{0,1})
        for role in (0,1):
            for pos in range(3):
                self.assertEqual(collections.Counter(x['order'] for x in first if x['role_swap']==role and x['condition_position']==pos),{0:2,1:2})
        for x in p:self.assertEqual(sum(x['gaps_ns']),160_000_000)

    def test_informative_response_and_residual_instability_coexist(self):
        r=M.outcomes(dict(balanced=[4]*8,A_extra=[6]*8,B_extra=[-6]*8))
        self.assertTrue(r['assignment_response']);self.assertTrue(r['residual_instability'])
        self.assertFalse(r['indeterminate']);self.assertFalse(r['qualification'])

    def test_imprecise_signed_response_is_indeterminate(self):
        h=[8,9,10,11,12,8,10,12];r=M.outcomes(dict(balanced=[0]*8,A_extra=h,B_extra=[-x for x in h]))
        self.assertTrue(r['observed_signed_H']);self.assertFalse(r['assignment_response'])
        self.assertTrue(r['indeterminate'])

    def test_precise_small_response_bounded_not_zero(self):
        r=M.outcomes(dict(balanced=[0.1]*8,A_extra=[0.2]*8,B_extra=[0.2]*8))
        self.assertTrue(r['bounded_response']);self.assertFalse(r['residual_instability'])
        self.assertFalse(r['indeterminate'])

    def test_small_signed_response_and_bound_both_reported(self):
        r=M.outcomes(dict(balanced=[0]*8,A_extra=[0.1]*8,B_extra=[-0.1]*8))
        self.assertTrue(r['assignment_response']);self.assertTrue(r['bounded_response'])

    def test_no_response_resolution_and_residual_independent(self):
        r=M.outcomes(dict(balanced=[4,-4]*4,A_extra=[4,-4]*4,B_extra=[-4,4]*4))
        self.assertTrue(r['residual_instability']);self.assertTrue(r['indeterminate'])

    def test_invalid_delivery_or_telemetry_forbids_informative_label(self):
        v=dict(balanced=[0]*8,A_extra=[5]*8,B_extra=[-5]*8)
        for kwargs in [dict(delivery_valid=False),dict(telemetry_valid=False)]:
            r=M.outcomes(v,**kwargs);self.assertTrue(r['indeterminate']);self.assertFalse(r['assignment_response'])
            self.assertTrue(r['old_result_unchanged'])

    def test_interval_uses_eight_blocks_not_rows_or_process_pool(self):
        with self.assertRaises(AssertionError):M.interval([0]*192)
        with self.assertRaises(AssertionError):M.interval([0]*4)
        self.assertAlmostEqual(M.interval(list(range(8)))['half'],M.DIAGNOSTIC_T*math.sqrt(.75),places=12)

    def test_plan_calls_return_fresh_objects(self):
        p=M.diagnostic_plan();p[0]['slots'][0]=999
        self.assertNotEqual(M.diagnostic_plan()[0]['slots'][0],999)

if __name__=='__main__':unittest.main(verbosity=2)
