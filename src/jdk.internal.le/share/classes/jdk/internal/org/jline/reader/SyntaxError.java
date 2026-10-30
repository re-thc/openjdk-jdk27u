/*
 * Copyright (c) 2023, the original author(s).
 *
 * This software is distributable under the BSD license. See the terms of the
 * BSD license in the documentation provided with this software.
 *
 * https://opensource.org/licenses/BSD-3-Clause
 */
package jdk.internal.org.jline.reader;

@SuppressWarnings("serial") // Serial version compatibility is not maintained.
public class SyntaxError extends RuntimeException {

    private final int line;
    private final int column;

    public SyntaxError(int line, int column, String message) {
        super(message);
        this.line = line;
        this.column = column;
    }

    public int column() {
        return column;
    }

    public int line() {
        return line;
    }
}
