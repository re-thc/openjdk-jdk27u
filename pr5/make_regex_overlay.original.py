from pathlib import Path
p=Path(__file__).parent
s=(p.parent/'sources/master/Pattern.java').read_text()
old='''    static class Slice extends SliceNode {
        Slice(int[] buf) {
            super(buf);
        }
        boolean match(Matcher matcher, int i, CharSequence seq) {
            int[] buf = buffer;'''
new='''    static class Slice extends SliceNode {
        private final String literal;
        Slice(int[] buf) {
            super(buf);
            literal = new String(buf, 0, buf.length);
        }
        boolean match(Matcher matcher, int i, CharSequence seq) {
            if (seq instanceof String text) {
                int available = Math.min(buffer.length, Math.max(0, matcher.to - i));
                if (!text.regionMatches(i, literal, 0, available)) return false;
                if (available < buffer.length) {
                    matcher.hitEnd = true;
                    return false;
                }
                return next.match(matcher, i + buffer.length, seq);
            }
            int[] buf = buffer;'''
assert old in s;s=s.replace(old,new,1)
old='''        BnM(int[] src, int[] lastOcc, int[] optoSft, Node next) {
            this.buffer = src;'''
new='''        private final String literal;
        BnM(int[] src, int[] lastOcc, int[] optoSft, Node next) {
            this.literal = new String(src, 0, src.length);
            this.buffer = src;'''
assert old in s;s=s.replace(old,new,1)
needle='''            int last = matcher.to - patternLength;

            // Loop over all possible match positions in text'''
replacement='''            int last = matcher.to - patternLength;
            if (seq instanceof String text) {
                for (int at = text.indexOf(literal, i); at >= 0 && at <= last;
                     at = text.indexOf(literal, at + 1)) {
                    matcher.first = at;
                    if (next.match(matcher, at + patternLength, seq)) {
                        matcher.first = at;
                        matcher.groups[0] = matcher.first;
                        matcher.groups[1] = matcher.last;
                        return true;
                    }
                }
                matcher.hitEnd = true;
                return false;
            }

            // Loop over all possible match positions in text'''
assert needle in s;s=s.replace(needle,replacement,1)
out=p/'regex-src/java/util/regex/Pattern.java';out.parent.mkdir(parents=True,exist_ok=True);out.write_text(s)
