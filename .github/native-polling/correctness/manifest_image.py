#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
import importlib.util
from pathlib import Path
import sys

spec = importlib.util.spec_from_file_location('correctness_controller', Path(__file__).with_name('controller.py'))
controller = importlib.util.module_from_spec(spec)
spec.loader.exec_module(controller)
controller.image_manifest(Path(sys.argv[1]), Path(sys.argv[2]), sys.argv[3])
