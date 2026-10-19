/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;

/** A fixed source-indexing task using ordinary, default-tiered Java processes. */
public class SourceScan {
    private static final String[] TOKENS = {
        "class ", "return ", "String", "UTF16", "indexOf", "lastIndexOf",
        "@IntrinsicCandidate", "@ForceInline", "static ", "private ", "public "
    };

    public static void main(String[] args) throws Exception {
        var texts = new ArrayList<String>();
        for (String file : Files.readAllLines(Path.of(args[0]))) {
            texts.add(Files.readString(Path.of(file)));
        }
        int passes = Integer.parseInt(args[1]);
        long checksum = 0;
        for (int pass = 0; pass < passes; pass++) {
            for (String text : texts) {
                for (String token : TOKENS) {
                    int from = 0;
                    int found;
                    while ((found = text.indexOf(token, from)) >= 0) {
                        checksum += found;
                        from = found + token.length();
                    }
                    checksum += text.lastIndexOf(token);
                }
                int from = 0;
                int end;
                while ((end = text.indexOf('\n', from)) >= 0) {
                    String line = text.substring(from, end).trim();
                    checksum += line.lastIndexOf('}');
                    if (line.equals("}") || line.equals("return -1;")) {
                        checksum++;
                    }
                    from = end + 1;
                }
            }
        }
        System.out.println(checksum);
    }
}
