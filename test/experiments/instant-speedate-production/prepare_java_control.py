#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Proposed source-only Java control, applied before its normal JDK build."""
from pathlib import Path
import sys

def control_source(text):
    anchor='    static final class InstantPrinterParser implements DateTimePrinterParser {\n'
    assert text.count(anchor)==1 and 'class CachedInstantQualificationParser' not in text
    start=text.index('            CompositePrinterParser parser = new DateTimeFormatterBuilder()',text.index(anchor))
    end=text.index(';',start)+1
    expression=text[start:end].split(' = ',1)[1][:-1]
    cached=expression.replace('minDigits','0').replace('maxDigits','9')
    replacement='            CompositePrinterParser parser = fractionalDigits < 0 ? CachedInstantQualificationParser.PARSER : '+expression+';'
    text=text[:start]+replacement+text[end:]
    holder='        private static final class CachedInstantQualificationParser {\n            static final CompositePrinterParser PARSER = '+cached+';\n        }\n\n'
    return text.replace(anchor,anchor+holder)

if __name__=='__main__':
    root=Path(sys.argv[1]).resolve()
    path=root/'src/java.base/share/classes/java/time/format/DateTimeFormatterBuilder.java'
    path.write_text(control_source(path.read_text()))
