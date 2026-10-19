#!/usr/bin/env python3
import json
import os
from pathlib import Path
import sys

os.environ.setdefault('MPLCONFIGDIR','/workspace/work/spill-sharing/matplotlib-cache')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

analysis = json.loads(Path(sys.argv[1]).read_text())
destination = Path(sys.argv[2])
labels = {'decode-source':'Source', 'decode-repetitive':'Repetitive', 'decode-dense':'Dense',
          'decode-long-offset':'Long offsets', 'decode-random':'Random / raw',
          'allocating-source':'Source, allocating', 'spill-kernel4':'Original pressure control',
          'positive-trigger':'Positive mechanism control', 'copy-control':'Array-copy control'}
groups = [[row for row in analysis if row['cell'].startswith(('decode-','allocating-'))],
          [row for row in analysis if not row['cell'].startswith(('decode-','allocating-'))]]
fig, axes = plt.subplots(2,1,figsize=(9,7.2),gridspec_kw={'height_ratios':[6,3]},layout='constrained')
for ax, rows, title in zip(axes,groups,['Decoder workloads','Controls']):
    for y, row in enumerate(rows):
        points = [(pair['ratio']-1)*100 for pair in row['pairs_data']]
        ax.scatter(points,[y+(.055 if pair['order']=='AB' else -.055) for pair in row['pairs_data']],
                   color='#9aabc0',s=14,alpha=.7,zorder=2)
        estimate=(row['median_paired_ratio']-1)*100
        lo,hi=[(x-1)*100 for x in row['bootstrap95']]
        ax.errorbar(estimate,y,xerr=[[estimate-lo],[hi-estimate]],fmt='o',color='#164e63',
                    capsize=4,markersize=5,zorder=3)
    ax.axvline(0,color='#64748b',lw=1,ls='--')
    ax.set_yticks(range(len(rows)),[labels[row['cell']] for row in rows])
    ax.invert_yaxis();ax.set_title(title,loc='left',fontsize=11)
    ax.grid(axis='x',alpha=.15);ax.set_xlabel('Candidate throughput change (%) — positive is faster')
    ax.spines[['top','right']].set_visible(False)
fig.suptitle('C2 sibling reload sharing: balanced JVM forks',fontsize=14)
fig.supxlabel('Dots: all 12 paired forks. Dark marker: median paired ratio. Bars: 95% paired bootstrap intervals.',fontsize=9)
fig.savefig(destination,dpi=180)
