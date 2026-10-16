"""Verify once-compiled repository inputs for a fresh source-built experiment."""
import json
from pathlib import Path
from classifier_images import git, payload_manifest, record, require


def verify(path, frozen, controller=None, source=Path('.')):
    value=json.loads(Path(path).read_text())
    require(value['schema']==1 and value['experiment']=='pr14-native-source-v1', 'Wrong source-input experiment')
    require(git(source,'rev-parse','HEAD')==value['source_head'] and
            not git(source,'status','--porcelain','--','src','test','make','bin','qualification','.github/workflows'),
            'Source changed since compilation')
    require(Path(frozen).resolve()==Path(value['frozen']).resolve(), 'Different compiled input root')
    if controller is not None:require(Path(controller).resolve()==Path(value['controller']).resolve(),'Different controller root')
    roots={'classes':Path(frozen)/'qualification/classes','whitebox':Path(frozen)/'qualification/whitebox',
           'controller':Path(value['controller'])}
    require({n:payload_manifest(p) for n,p in roots.items()}==value['payloads'], 'Once-compiled input payload changed')
    require(all(record(Path(source)/n)==v for n,v in value['sources'].items()), 'Probe source changed')
    require(value['same_toolchain'] is True, 'Unmatched source-built toolchain')
    require(value.get('scope','complete') in ('complete','correctness'),'Unknown source experiment scope')
    roles={'b3-release','b3-fastdebug','candidate-release','candidate-fastdebug'}
    if value.get('scope','complete')=='complete':roles.add('base87-release')
    require(set(value['images'])==roles and set(value['build_receipts'])==roles,'Incomplete source-built image roles')
    require(all(v['same_tools']==value['build_toolchain'] for v in value['build_receipts'].values()),'Unmatched build tools')
    refs={'base87-release':'87edd79d3104ff502f7befec034716b081436f49','b3-release':'b3ce67e362c3b1678fcf3d18ee714182b2395c86','b3-fastdebug':'b3ce67e362c3b1678fcf3d18ee714182b2395c86','candidate-release':value['source_head'],'candidate-fastdebug':value['source_head']}
    require(all(value['build_receipts'][role]['source_head']==ref for role,ref in refs.items() if role in roles),'Build source role differs')
    for level in ['release','fastdebug']:
        control=value['images']['b3-'+level]['files'];candidate=value['images']['candidate-'+level]['files']
        vm='lib/server/libjvm.dylib' if 'lib/server/libjvm.dylib' in control else 'lib/server/libjvm.so'
        require(all(control[n]==candidate[n] for n in control if n!=vm) and
                control[vm]!=candidate[vm],'Invalid source-built overlay identity')
    for key,names,group in [('kernel_classes',['PhaseVectorKernels.class','PhaseVectorProbe.class'],'classes'),
                            ('controller_classes',['FixedVectorProbe.class','ProbeControllerPrimer.class'],'controller')]:
        require(set(value[key])==set(names) and all(value[key][n]==value['payloads'][group][n]['sha256'] for n in names),
                'Incomplete/inconsistent compiled class map')
    for role,image in value['images'].items():
        require({n:record(Path(image['root'])/n) for n in image['files']}==image['files'], 'Source-built image changed: '+role)
    return value
