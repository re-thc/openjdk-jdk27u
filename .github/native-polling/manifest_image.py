#!/usr/bin/env python3
import sys
from pathlib import Path
from controller import image_manifest
image_manifest(Path(sys.argv[1]), Path(sys.argv[2]), sys.argv[3])
