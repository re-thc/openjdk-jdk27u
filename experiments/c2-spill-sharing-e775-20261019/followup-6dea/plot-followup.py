#!/usr/bin/env python3
import json
import os
from pathlib import Path
os.environ.setdefault('MPLCONFIGDIR','/workspace/work/spill-sharing/matplotlib-cache')
os.environ.setdefault('XDG_CACHE_HOME','/workspace/toolchains/cache')
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

root=Path('/workspace/work/spill-sharing/followup')
labels={'decode-source':'Source','decode-dense':'Dense','positive-trigger':'Synthetic trigger',
        'copy-control':'Copy'}
def draw(ax,rows,title,placebo=False):
    for y,row in enumerate(rows):
        for order,color,dy in [('AB','#8aa8bd',-.045),('BA','#d6a55a',.045)]:
            points=[(p['ratio']-1)*100 for p in row['pairs_data'] if p['order']==order]
            ax.scatter(points,[y+dy]*len(points),s=16,color=color,alpha=.8)
        estimate=(row['median_paired_ratio']-1)*100
        low,high=[(x-1)*100 for x in row['bootstrap95']]
        ax.errorbar(estimate,y,xerr=[[estimate-low],[high-estimate]],fmt='o',capsize=4,
                    color='#164e63',markersize=5,zorder=4)
    names=[labels[r['cell']] for r in rows]
    if placebo:names[-1]='Copy A/A: identical configuration'
    ax.set_yticks(range(len(rows)),names);ax.invert_yaxis()
    ax.axvline(0,color='#64748b',ls='--',lw=1)
    ax.set_title(title,loc='left',fontsize=12)
    ax.grid(axis='x',alpha=.15);ax.spines[['top','right']].set_visible(False)
    ax.set_xlabel('Nominal B/A throughput change (%)')

rows=json.loads((root/'same-image/analysis.json').read_text())+json.loads((root/'placebo-copy/analysis.json').read_text())
fig,ax=plt.subplots(figsize=(9,5),layout='constrained')
draw(ax,rows,'Same JVM: target sharing on/off, plus a strict null control',True)
fig.supxlabel('All 12 pairs per row. Blue: AB; amber: BA. Dark marker: median. Bars: per-cell 95% paired bootstrap.',fontsize=8)
fig.savefig(root/'targeted-and-placebo.png',dpi=180)

fig,axes=plt.subplots(2,1,figsize=(9,7.5),layout='constrained')
for ax,name,title in zip(axes,('short','hybrid'),('Eight-instruction limit versus v5','Hybrid versus v5')):
    draw(ax,json.loads((root/f'screen/{name}/analysis.json').read_text()),title)
fig.supxlabel('All six exploratory pairs per cell; no observations omitted. Bars are per-cell 95% paired bootstrap intervals.',fontsize=8)
fig.savefig(root/'policy-screen.png',dpi=180)
print('Saved all-observation figures')
