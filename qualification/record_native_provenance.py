# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
# This code is distributed without any warranty; see the LICENSE file.
import json, pathlib, os, urllib.request
expected = [(38172262610,11714738068,'87edd79d3104ff502f7befec034716b081436f49','sha256:4892f07a1858c5d8bfd71f4a12cfacdd7151a3edb2582b167339f3d181e55c66'),
            (38349570655,11791270117,'b3ce67e362c3b1678fcf3d18ee714182b2395c86','sha256:688ca45c71852fc63876c2a44b562e9e5162a1396feec88e353ce0287f8c006a')]
# Public read-only metadata; no credentials are serialized or printed.
records=[]
for run,artifact,sha,digest in expected:
 url=f'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/{artifact}'
 request=urllib.request.Request(url,headers={'Accept':'application/vnd.github+json','User-Agent':'vector-api-qualification','Authorization':'Bearer '+os.environ['QUALIFICATION_API_TOKEN']})
 with urllib.request.urlopen(request,timeout=30) as response:data=json.load(response)
 assert data['workflow_run']['id']==run and data['workflow_run']['head_sha']==sha
 assert data['digest']==digest and not data['expired']
 records.append(data)
out=pathlib.Path('native-results');out.mkdir(exist_ok=True)
(out/'artifact-provenance.json').write_text(json.dumps({'native_arch':os.uname().machine,'qualification_commit':os.environ['GITHUB_SHA'],'artifacts':records},indent=2)+'\n')
