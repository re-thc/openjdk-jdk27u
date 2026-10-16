"""Byte-preserving UTF-8 evidence frames. Does not normalize newline bytes."""
from pathlib import Path
import hashlib,json

def encode(files):
    out=bytearray(b'EVIDENCE_PACKET_V2\n')
    for name,body in files:
        body.decode('utf-8')
        h=dict(path=name,bytes=len(body),sha256=hashlib.sha256(body).hexdigest())
        out+=b'FILE_JSON '+json.dumps(h,sort_keys=True,separators=(',',':')).encode()+b'\n'
        out+=body+b'\nEND_FILE\n'
    return bytes(out)

def decode(packet):
    prefix=b'EVIDENCE_PACKET_V2\n';assert packet.startswith(prefix)
    pos=len(prefix);files={}
    while pos<len(packet):
        end=packet.index(b'\n',pos);header=packet[pos:end];assert header.startswith(b'FILE_JSON ')
        h=json.loads(header[len(b'FILE_JSON '):]);pos=end+1
        name=h['path'];assert name not in files and not Path(name).is_absolute() and '..' not in Path(name).parts
        body=packet[pos:pos+h['bytes']];pos+=h['bytes']
        assert len(body)==h['bytes'] and hashlib.sha256(body).hexdigest()==h['sha256']
        assert packet[pos:pos+10]==b'\nEND_FILE\n';pos+=10;files[name]=body
    return files
