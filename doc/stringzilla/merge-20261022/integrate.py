#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Seal a matched master image and add it to the bounded actual-merge study."""
import argparse
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
sys.dont_write_bytecode=True
HERE=Path(__file__).resolve().parent
MASTER='8d030adbd245b19e6339e3ccd052eb7fe3635319'
MERGE='573e785e5d459c2a96f3042c48651c8cf17a75de'
PRODUCT='7ca3eeb4368afdf43961c2c674a663e2d2cdf9b4'
REFERENCE='cd785f1c66fb72404c12b150d5f3d8e0fe0a4776'
def module(name):
 spec=importlib.util.spec_from_file_location(name,HERE/(name+'.py'))
 value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value
support=module('support');prepare=module('prepare')
p=argparse.ArgumentParser(description=__doc__);p.add_argument('mode',choices=['seal-master','controls']);p.add_argument('--backend',choices=['neon','msvc'],required=True);a=p.parse_args()
root=Path('pair');exe='.exe' if a.backend=='msvc' else ''
head=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
assert not subprocess.check_output(['git','status','--porcelain'],text=True).strip()
if a.mode=='seal-master':
 assert head==MASTER
 image=root/'master';shutil.copytree('build/perf/images/jdk',image)
 shutil.copyfile('build/perf/spec.gmk',root/'master-spec.gmk')
 assert support.read_spec(root/'master-spec.gmk')==support.read_spec(root/'original-spec.gmk')
 # The shared verifier additionally checks full Ubuntu package/trunk or MSVC SDK/toolset identities.
 shutil.copyfile(root/'master-spec.gmk',root/'fork-spec.gmk')
 prepare.verify_toolchain(root,a.backend);shutil.copyfile(root/'compiler-identity.json',root/'master-compiler-identity.json')
 prepare.SOURCE=MASTER
 embedded=prepare.verify_release_source((image/'release').read_text(),(root/'master-spec.gmk').read_text(),a.backend)
 shipped=root/'master-shipped-classes';classes={}
 for name in ['String','StringLatin1','StringUTF16']:
  subprocess.run([str(image/('bin/jimage'+exe)),'extract','--include','glob:**/java/lang/'+name+'.class','--dir',str(shipped),str(image/'lib/modules')],check=True)
  built=Path('build/perf/jdk/modules/java.base/java/lang')/(name+'.class');actual=shipped/'java.base/java/lang'/(name+'.class')
  assert support.sha(built)==support.sha(actual);classes[name]=support.sha(actual)
 inventory=support.image(image);(root/'master-inventory.json').write_text(json.dumps(inventory,separators=(',',':'))+'\n')
 receipt={'source':MASTER,'clean_checkout':True,'image_tree_sha256':inventory['tree_sha256'],'source_trees':subprocess.check_output(['git','ls-tree','HEAD','bin','make','src','test'],text=True),'embedded_revision_available':embedded,'shipped_classes_sha256':classes,'shipped_classes_match_build_outputs':True,'matched_build_settings':support.read_spec(root/'master-spec.gmk'),'compiler_identity':json.loads((root/'master-compiler-identity.json').read_text())}
 (root/'master-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
 shutil.copyfile('build/perf/configure.log',root/'master-configure.log')
 print(json.dumps({'source':MASTER,'image_tree_sha256':inventory['tree_sha256']}))
else:
 assert head==MERGE
 assert subprocess.check_output(['git','show','-s','--format=%P',MERGE],text=True).strip().split()==[MASTER,PRODUCT]
 same=['src/java.base/share/classes/java/lang/'+name+'.java' for name in ['String','StringLatin1','StringUTF16','StringZilla']]
 same+=['make/modules/java.base/lib/CoreLibraries.gmk','src/java.base/share/native/libjava/StringZillaKernels.c']
 subprocess.run(['git','diff','--exit-code',PRODUCT,MERGE,'--',*same],check=True)
 values=json.loads((root/'controls.json').read_text());inventory=json.loads((root/'master-inventory.json').read_text())
 assert support.image(root/'master')['files']==inventory['files']
 assert support.read_spec(root/'master-spec.gmk')==support.read_spec(root/'fork-spec.gmk')
 values={name:value for name,value in [('original',values['original']),('master',{'image':str((root/'master').resolve()),'spec':str((root/'master-spec.gmk').resolve()),'source':MASTER,'baseline':True,'expected_tree_sha256':inventory['tree_sha256']}),('prior',values['prior']),('candidate',values['candidate']),('disabled',values['disabled'])]}
 assert values['prior']['source']==REFERENCE and values['candidate']['source']==MERGE
 reference=json.loads((root/'reference.json').read_text())
 prior_receipt=json.loads(Path(reference['inventory']).with_name('pair-receipt.json').read_text())
 current_receipt=json.loads((root/'pair-receipt.json').read_text())
 comparison={'prior_source':REFERENCE,'actual_merge':MERGE,
             'prior_classes':prior_receipt['rebuild']['shipped_classes_sha256'],
             'merged_classes':current_receipt['rebuild']['shipped_classes_sha256']}
 comparison['String_family_classes_equal']=comparison['prior_classes']==comparison['merged_classes']
 (root/'merge-class-comparison.json').write_text(json.dumps(comparison,indent=2)+'\n')
 (root/'controls.json').write_text(json.dumps(values,indent=2)+'\n')
 process={'original':values['original'],'prior':values['master'],'candidate':values['candidate'],'disabled':values['disabled']}
 (root/'process-controls.json').write_text(json.dumps(process,indent=2)+'\n')
 retained=Path('candidate-retained')
 for name in ['master-spec.gmk','master-inventory.json','master-receipt.json','master-compiler-identity.json','master-configure.log','merge-class-comparison.json','controls.json','process-controls.json']:shutil.copyfile(root/name,retained/name)
 if a.backend=='neon':
  with tarfile.open(retained/'master-jdk.tar.gz','w:gz') as t:t.add(root/'master',arcname='master')
  (retained/'master-jdk.tar.gz.sha256').write_text(support.sha(retained/'master-jdk.tar.gz')+'\n')
 print(json.dumps({'master':MASTER,'product':PRODUCT,'actual_merge':MERGE,'controls':list(values),'rounds':5}))
