/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @summary Correlate medium ZGC hash growth with old-to-young remset migration
 * @requires vm.gc.Z & vm.bits == "64"
 * @requires os.arch == "amd64" | os.arch == "aarch64"
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver/timeout=180 FourByteHeaderZGCMediumRemset
 */

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.internal.misc.Unsafe;
import jdk.test.lib.Utils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class FourByteHeaderZGCMediumRemset {
    private static final int OWNERS = 20;
    private static final int SOURCE_SIZE = 384 * 1024;
    private static final int GROWN_SIZE = SOURCE_SIZE + 8;
    private static final int YOUNG_FILLERS_PER_TOKEN = 128;
    private static final long SMALL_PAGE_SIZE = 2L * 1024 * 1024;
    private static final long MEDIUM_PAGE_SIZE = 4L * 1024 * 1024;
    private static final String PREFIX = "FIXTURE ";
    private static final String FIXTURE_CLASS =
            FourByteHeaderZGCMediumRemset.class.getName() + "$Fixture";

    public static void main(String[] args) throws Exception {
        if (args.length == 1 && args[0].equals("child")) {
            Fixture.run();
            return;
        }
        check(args.length == 0, "Unexpected arguments");
        runVariant(false);
        runVariant(true);
    }

    private static void runVariant(boolean inPlace) throws Exception {
        String fixture = FIXTURE_CLASS;
        List<String> options = new ArrayList<>(List.of(
                "-XX:+UnlockDiagnosticVMOptions",
                "-XX:+WhiteBoxAPI",
                "-Xbootclasspath/a:.",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "-XX:+UseZGC",
                "-XX:+UseFourByteObjectHeaders",
                "-XX:ObjectAlignmentInBytes=8",
                "-Xms128m", "-Xmx128m",
                "-Xshare:off",
                "-XX:-ZUseMediumPageSizeRange",
                "-XX:+ZCollectionIntervalOnly",
                "-XX:ZCollectionIntervalMajor=-1",
                "-XX:ZCollectionIntervalMinor=-1",
                "-XX:ZTenuringThreshold=15",
                "-XX:+ZVerifyForwarding",
                "-XX:+ZVerifyRemembered",
                // Keep allocation and inspection temporaries out of the collection frames.
                "-XX:CompileCommand=dontinline," + fixture + "::allocateFixture",
                "-XX:CompileCommand=dontinline," + fixture + "::installYoungTokens",
                "-XX:CompileCommand=dontinline," + fixture + "::inspectAfterMajor",
                "-Xlog:gc=info,gc+init=info,gc+page=trace,gc+reloc=trace"
                        + ":stdout:uptimemillis,level,tags",
                inPlace ? "-XX:+ZStressRelocateInPlace"
                        : "-XX:-ZStressRelocateInPlace",
                FourByteHeaderZGCMediumRemset.class.getName(), "child"));
        OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new));
        output.outputTo(System.out).errorTo(System.out).shouldHaveExitValue(0);
        Oracle.check(output.getStdout(), inPlace);
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static String hex(long value) {
        return "0x" + Long.toUnsignedString(value, 16);
    }

    static final class Token {
        final long value;
        final long complement;

        Token(long value) {
            this.value = value;
            this.complement = ~value;
        }
    }

    static final class Fixture {
        private static final WhiteBox WB = WhiteBox.getWhiteBox();
        private static final Unsafe U = Unsafe.getUnsafe();
        private static final GarbageCollectorMXBean MAJOR = bean("ZGC Major Cycles");
        private static final GarbageCollectorMXBean MINOR = bean("ZGC Minor Cycles");
        private static final int BASE = Math.toIntExact(U.arrayBaseOffset(Object[].class));
        private static final int SCALE = U.arrayIndexScale(Object[].class);
        private static final int LENGTH = (SOURCE_SIZE - BASE) / SCALE;

        // During collections, Tokens are rooted only through the old owners.
        private static Object[][] owners;
        private static volatile Object[][] fillers;
        private static volatile Object[] youngFillers;
        private static final long[] childrenBeforeYoung = new long[2 * OWNERS];
        private static final long[] source = new long[OWNERS];
        private static final int[] hashes = new int[OWNERS];

        static void run() throws Exception {
            check(BASE == 8 && SCALE == 8, "Unexpected reference-array layout");
            check(BASE + (long) LENGTH * SCALE == SOURCE_SIZE, "Array has hash padding");
            check(SOURCE_SIZE > 256 * 1024 && GROWN_SIZE <= 512 * 1024,
                    "Owner is outside the medium size class");
            check(SOURCE_SIZE % 512 == 0, "Growth must cross medium alignment");

            allocateFixture();
            WB.fullGC(); // The one permitted setup major, before hashing/children.
            expectCounts(1, 0);
            installYoungTokens();
            expectCounts(1, 0);

            System.out.println(PREFIX + "ARM major=1 minor=0 base=" + BASE
                    + " scale=" + SCALE + " length=" + LENGTH);
            try {
                interval(1.0);
                long deadline = System.nanoTime()
                        + Utils.adjustTimeout(60_000L) * 1_000_000L;
                while (count(MAJOR) == 1) {
                    check(count(MINOR) == 0, "Unexpected minor before timer completion");
                    check(System.nanoTime() < deadline, "Timer major did not complete");
                    Thread.sleep(10);
                }
            } finally {
                interval(-1.0);
            }
            expectCounts(2, 0);
            System.out.println(PREFIX + "MAJOR_DONE major=2 minor=0");
            inspectAfterMajor();
            expectCounts(2, 0);
            youngFillers = null;

            System.out.println(PREFIX + "YOUNG major=2 minor=0");
            WB.youngGC();
            expectCounts(2, 1);
            verifyAfterYoung();
            expectCounts(2, 1);
            System.out.println(PREFIX + "DONE major=2 minor=1");
        }

        private static GarbageCollectorMXBean bean(String name) {
            return ManagementFactory.getGarbageCollectorMXBeans().stream()
                    .filter(b -> b.getName().equals(name)).findFirst().orElseThrow();
        }

        private static long count(GarbageCollectorMXBean bean) {
            long count = bean.getCollectionCount();
            check(count >= 0, "Unsupported collection counter: " + bean.getName());
            return count;
        }

        private static void expectCounts(long major, long minor) {
            check(count(MAJOR) == major && count(MINOR) == minor,
                    "Unexpected completed collection count");
        }

        private static void interval(double value) {
            WB.setDoubleVMFlag("ZCollectionIntervalMajor", value);
            Double actual = WB.getDoubleVMFlag("ZCollectionIntervalMajor");
            check(actual != null && actual.doubleValue() == value,
                    "Could not set major interval");
        }

        private static void allocateFixture() {
            owners = new Object[OWNERS][];
            fillers = new Object[OWNERS][];
            for (int i = 0; i < OWNERS; i++) {
                owners[i] = new Object[LENGTH];
                fillers[i] = new Object[LENGTH];
                check(WB.getObjectSize(owners[i]) == SOURCE_SIZE,
                        "Unexpected initial owner size");
            }
        }

        private static void installYoungTokens() {
            fillers = null;
            youngFillers = new Object[2 * OWNERS * YOUNG_FILLERS_PER_TOKEN];
            for (int i = 0; i < OWNERS; i++) {
                Object[] owner = owners[i];
                check(WB.isObjectInOldGen(owner), "Owner was not promoted");
                source[i] = WB.getObjectAddress(owner);
                check(WB.getObjectSize(owner) == SOURCE_SIZE, "Owner already expanded");
                hashes[i] = System.identityHashCode(owner);
                check(WB.getObjectSize(owner) == SOURCE_SIZE, "Hash unexpectedly grew in place");
                Token first = new Token(2L * i + 1);
                retainYoungFillers(2 * i);
                Token last = new Token(2L * i + 2);
                retainYoungFillers(2 * i + 1);
                owner[0] = first;
                owner[LENGTH - 1] = last;
                check(!WB.isObjectInOldGen(first) && !WB.isObjectInOldGen(last),
                        "Fresh Token is not young");
            }
        }

        private static void retainYoungFillers(int token) {
            // Consume the Token thread's TLAB so Tokens span multiple small pages.
            for (int j = 0; j < YOUNG_FILLERS_PER_TOKEN; j++) {
                youngFillers[token * YOUNG_FILLERS_PER_TOKEN + j] = new byte[1024];
            }
        }

        private static void inspectAfterMajor() {
            Set<Long> smallPages = new HashSet<>();
            for (int i = 0; i < OWNERS; i++) {
                Object[] owner = owners[i];
                long destination = WB.getObjectAddress(owner);
                long size = WB.getObjectSize(owner);
                int hash = System.identityHashCode(owner);
                check(WB.isObjectInOldGen(owner), "Relocated owner is not old");
                check(hash == hashes[i], "Owner hash changed");
                check(size == (destination == source[i] ? SOURCE_SIZE : GROWN_SIZE),
                        "Moved owner did not grow exactly one heap word");
                Token first = (Token) owner[0];
                Token last = (Token) owner[LENGTH - 1];
                check(first != null && last != null, "Missing Token after major");
                check(!WB.isObjectInOldGen(first) && !WB.isObjectInOldGen(last),
                        "Timer major precleaned/promoted Token");
                payload(first, 2L * i + 1);
                payload(last, 2L * i + 2);
                childrenBeforeYoung[2 * i] = WB.getObjectAddress(first);
                childrenBeforeYoung[2 * i + 1] = WB.getObjectAddress(last);
                smallPages.add(childrenBeforeYoung[2 * i] & -SMALL_PAGE_SIZE);
                smallPages.add(childrenBeforeYoung[2 * i + 1] & -SMALL_PAGE_SIZE);
                System.out.println(PREFIX + "OWNER id=" + i + " src=" + hex(source[i])
                        + " dst=" + hex(destination) + " sizeBefore=" + SOURCE_SIZE
                        + " sizeAfter=" + size + " hashBefore=" + hashes[i]
                        + " hashAfter=" + hash);
            }
            check(smallPages.size() >= 2, "Young Tokens did not span multiple small pages");
            System.out.println(PREFIX + "SMALL_PAGES count=" + smallPages.size());
        }

        private static void verifyAfterYoung() {
            for (int i = 0; i < OWNERS; i++) {
                Token first = (Token) owners[i][0];
                Token last = (Token) owners[i][LENGTH - 1];
                check(first != null && last != null, "Token was not live in young GC");
                payload(first, 2L * i + 1);
                payload(last, 2L * i + 2);
                check(System.identityHashCode(owners[i]) == hashes[i],
                        "Owner hash changed after young GC");
                // The parser requires both children of a correlated grown
                // owner to have moved. Readable bytes without GC forwarding
                // are not accepted as proof of survival.
                System.out.println(PREFIX + "SURVIVE id=" + i
                        + " firstBefore=" + hex(childrenBeforeYoung[2 * i])
                        + " firstAfter=" + hex(WB.getObjectAddress(first))
                        + " lastBefore=" + hex(childrenBeforeYoung[2 * i + 1])
                        + " lastAfter=" + hex(WB.getObjectAddress(last)));
            }
        }

        private static void payload(Token token, long expected) {
            check(token.value == expected && token.complement == ~expected,
                    "Token payload changed");
        }
    }

    static final class Oracle {
        private static final String ADDRESS = "(0x[0-9a-fA-F]+)";
        private static final Pattern GC = Pattern.compile(
                "\\bGC\\((\\d+)\\) (?:([YOy]): )?(.*)$");
        private static final Pattern START = Pattern.compile(
                "(Major|Minor) Collection \\(([^)]*)\\)");
        private static final Pattern END = Pattern.compile(
                "(Major|Minor) Collection \\(([^)]*)\\) .+ [0-9.]+s");
        private static final Pattern PAGE = Pattern.compile(
                "Medium\\s+" + ADDRESS + "\\s+" + ADDRESS + "\\s+" + ADDRESS
                        + "\\s+O/(\\d+)\\s+.*\\(relocate page"
                        + "(?: done (in-place|normal))?\\)");
        private static final Pattern REMEMBER = Pattern.compile(
                "Remember: from: " + ADDRESS + " to: " + ADDRESS + " .*");
        private static final Pattern SELECT = Pattern.compile(
                "Relocation Set \\(Medium Pages\\): ([1-9][0-9]*)->.*");
        private static final Pattern SMALL_SELECT = Pattern.compile(
                "Relocation Set \\(Small Pages\\): ([0-9]+)->([0-9]+),.*");
        private static final Pattern OWNER = Pattern.compile(
                "FIXTURE OWNER id=(\\d+) src=" + ADDRESS + " dst=" + ADDRESS
                        + " sizeBefore=(\\d+) sizeAfter=(\\d+)"
                        + " hashBefore=(-?\\d+) hashAfter=(-?\\d+)");
        private static final Pattern SURVIVE = Pattern.compile(
                "FIXTURE SURVIVE id=(\\d+) firstBefore=" + ADDRESS
                        + " firstAfter=" + ADDRESS + " lastBefore=" + ADDRESS
                        + " lastAfter=" + ADDRESS);

        private record Cycle(long id, String kind, String cause, int line) {}
        private record End(String kind, String cause, int line) {}
        private record Page(long gc, long start, long end, long seq, String done, int line) {
            boolean contains(long offset) {
                return Long.compareUnsigned(start, offset) <= 0
                        && Long.compareUnsigned(offset + SOURCE_SIZE, end) <= 0;
            }

            boolean same(Page other) {
                // In-place relocation resets this page to allocating and
                // updates its sequence. Identity here is the unique original
                // source range within this GC, not an invariant sequence.
                return gc == other.gc && start == other.start && end == other.end;
            }
        }
        private record Remember(long gc, long from, long to, int line) {}
        private record Selection(int from, int to, int line) {}
        private record Owner(int id, long from, long to, long before, long after,
                             int hashBefore, int hashAfter, int line) {}
        private record Survival(int id, long firstBefore, long firstAfter,
                                long lastBefore, long lastAfter, int line) {
            boolean moved() {
                return firstBefore != firstAfter && lastBefore != lastAfter;
            }
        }

        static void check(String stdout, boolean inPlace) {
            List<String> lines = stdout.lines().toList();
            for (String helper : List.of("allocateFixture", "installYoungTokens", "inspectAfterMajor")) {
                require(lines.contains("CompileCommand: dontinline " + FIXTURE_CLASS
                                + "." + helper + " bool dontinline = true"),
                        "Missing accepted dontinline directive for " + helper);
            }
            int arm = marker(lines, "ARM major=1 minor=0 base=8 scale=8 length=49151");
            int majorDone = marker(lines, "MAJOR_DONE major=2 minor=0");
            int young = marker(lines, "YOUNG major=2 minor=0");
            int done = marker(lines, "DONE major=2 minor=1");
            require(arm < majorDone && majorDone < young && young < done,
                    "Invalid fixture phase ordering");
            require(lines.stream().anyMatch(l -> l.endsWith("Page Size Medium: 4M")),
                    "Fixed 4 MiB medium pages were not enabled");

            List<Cycle> cycles = new ArrayList<>();
            Map<Long, End> ends = new HashMap<>();
            List<Page> pages = new ArrayList<>();
            List<Remember> remembered = new ArrayList<>();
            Map<Long, Integer> mediumSelections = new HashMap<>();
            Map<Long, Selection> smallSelections = new HashMap<>();
            Map<Integer, Owner> owners = new HashMap<>();
            Map<Integer, Survival> survivors = new HashMap<>();

            // Scan the whole child output, including after DONE. An extra
            // collection that started but did not complete must also reject.
            for (int i = 0; i < lines.size(); i++) {
                String line = lines.get(i);
                Matcher owner = OWNER.matcher(line);
                if (owner.matches()) {
                    Owner o = new Owner(Integer.parseInt(owner.group(1)), addr(owner, 2),
                            addr(owner, 3), Long.parseLong(owner.group(4)),
                            Long.parseLong(owner.group(5)), Integer.parseInt(owner.group(6)),
                            Integer.parseInt(owner.group(7)), i);
                    require(owners.put(o.id, o) == null, "Duplicate owner row");
                }
                Matcher survive = SURVIVE.matcher(line);
                if (survive.matches()) {
                    Survival s = new Survival(Integer.parseInt(survive.group(1)),
                            addr(survive, 2), addr(survive, 3), addr(survive, 4),
                            addr(survive, 5), i);
                    require(survivors.put(s.id, s) == null, "Duplicate survival row");
                }
                Matcher gc = GC.matcher(line);
                if (!gc.find()) {
                    continue;
                }
                long id = Long.parseLong(gc.group(1));
                String tag = gc.group(2);
                String body = gc.group(3);
                require(!body.contains("Aborted"), "Aborted collection");
                Matcher start = START.matcher(body);
                Matcher end = END.matcher(body);
                if (start.matches()) {
                    cycles.add(new Cycle(id, start.group(1), start.group(2), i));
                } else if (end.matches()) {
                    require(ends.put(id, new End(end.group(1), end.group(2), i)) == null,
                            "Duplicate collection completion");
                }
                Matcher smallSelection = SMALL_SELECT.matcher(body);
                if ("y".equals(tag) && smallSelection.matches()) {
                    require(smallSelections.put(id, new Selection(
                                    Integer.parseInt(smallSelection.group(1)),
                                    Integer.parseInt(smallSelection.group(2)), i)) == null,
                            "Duplicate verification small-page selection");
                }
                if (!"O".equals(tag)) {
                    continue;
                }
                Matcher page = PAGE.matcher(body);
                if (page.matches()) {
                    long first = addr(page, 1);
                    long top = addr(page, 2);
                    long last = addr(page, 3);
                    require(last - first == MEDIUM_PAGE_SIZE, "Unexpected medium page extent");
                    require(Long.compareUnsigned(first, top) <= 0
                                    && Long.compareUnsigned(top, last) <= 0,
                            "Invalid page top");
                    pages.add(new Page(id, first, last, Long.parseLong(page.group(4)),
                            page.group(5), i));
                }
                Matcher remember = REMEMBER.matcher(body);
                if (remember.matches()) {
                    remembered.add(new Remember(id, addr(remember, 1), addr(remember, 2), i));
                }
                if (SELECT.matcher(body).matches()) {
                    require(mediumSelections.put(id, i) == null,
                            "Duplicate old medium selection");
                }
            }

            require(cycles.size() == 3 && ends.size() == 3,
                    "Expected setup major, one timer major and one verification minor only");
            Cycle setup = cycles.get(0);
            Cycle timer = cycles.get(1);
            Cycle verification = cycles.get(2);
            complete(setup, ends, "Major", "WhiteBox Initiated Full GC", -1, arm);
            // The serviceability counter can advance before the collection-end
            // log: ZDriverScopeMajor destroys its tracer before its stat timer.
            // Require work/page completion before observation, but allow that
            // final log until the synchronous verification minor starts.
            require(timer.line < majorDone, "Timer started after major observation");
            complete(timer, ends, "Major", "Timer", arm, verification.line);
            complete(verification, ends, "Minor", "WhiteBox Initiated Young GC", young, done);
            Selection smallSelection = smallSelections.get(verification.id);
            require(smallSelection != null && smallSelection.from >= 2
                            && smallSelection.to < smallSelection.from
                            && verification.line < smallSelection.line
                            && smallSelection.line < ends.get(verification.id).line,
                    "Verification minor lacked profitable multi-small-page selection");
            Integer selection = mediumSelections.get(timer.id);
            require(selection != null && timer.line < selection && selection < majorDone,
                    "No old medium relocation selection for timer major");
            require(owners.size() == OWNERS, "Missing owner observations");
            require(survivors.size() == OWNERS, "Missing post-young observations");

            List<String> correlations = new ArrayList<>();
            long heapBase = 0;
            Set<Long> smallPages = new HashSet<>();
            for (int i = 0; i < OWNERS; i++) {
                Owner owner = owners.get(i);
                Survival survival = survivors.get(i);
                require(owner != null && majorDone < owner.line && owner.line < young,
                        "Owner observed outside returned inspection frame");
                require(owner.before == SOURCE_SIZE && owner.hashBefore == owner.hashAfter,
                        "Invalid initial size or changed hash");
                require(owner.after == (owner.from == owner.to ? SOURCE_SIZE : GROWN_SIZE),
                        "Invalid movement/growth observation");
                require(survival != null && ends.get(verification.id).line < survival.line
                                && survival.line < done,
                        "Survival observed before the synchronous verification minor ended");
                // On both supported CPUs ZAddressHeapBaseShift equals
                // ZAddressOffsetBits. The uncolored oop's highest bit is the
                // heap base; ZPage::print_on_msg prints offsets without it.
                long base = Long.highestOneBit(owner.from);
                require(base != 0 && (heapBase == 0 || heapBase == base)
                                && Long.highestOneBit(owner.to) == base
                                && Long.highestOneBit(survival.firstBefore) == base
                                && Long.highestOneBit(survival.firstAfter) == base
                                && Long.highestOneBit(survival.lastBefore) == base
                                && Long.highestOneBit(survival.lastAfter) == base,
                        "Inconsistent uncolored heap base");
                heapBase = base;
                smallPages.add(survival.firstBefore & -SMALL_PAGE_SIZE);
                smallPages.add(survival.lastBefore & -SMALL_PAGE_SIZE);
                long sourceOffset = owner.from ^ base;
                if (owner.from == owner.to) {
                    continue;
                }
                List<Page> candidates = pages.stream().filter(p -> p.gc == timer.id
                        && p.done == null && p.line > selection && p.contains(sourceOffset))
                        .toList();
                require(candidates.size() == 1, "Grown owner has no unique source page");
                Page from = candidates.get(0);
                List<Page> completions = pages.stream().filter(p -> p.same(from)
                        && p.done != null && p.line > from.line).toList();
                require(completions.size() == 1, "Source page has no unique completion");
                Page finished = completions.get(0);
                require(finished.line < majorDone, "Page completed after major observation");
                if (!finished.done.equals(inPlace ? "in-place" : "normal")) {
                    continue;
                }
                require(inPlace ? finished.seq > from.seq : finished.seq == from.seq,
                        "Unexpected source-page sequence transition");
                // Both edge slots must migrate on this owner's exact source
                // page, in this major's old phase, before that page completes.
                boolean edges = true;
                for (long offset : new long[] {8, SOURCE_SIZE - 8L}) {
                    edges &= remembered.stream().anyMatch(r -> r.gc == timer.id
                            && from.line < r.line && r.line < finished.line
                            // The trace's from is a zoffset; to is a zaddress.
                            && r.from == sourceOffset + offset && r.to == owner.to + offset);
                }
                if (edges && survival.moved()) {
                    correlations.add("CORRELATED variant=" + (inPlace ? "in-place" : "normal")
                            + " gc=" + timer.id + " owner=" + i + " sourcePage="
                            + hex(from.start) + ".." + hex(from.end)
                            + " seq=" + from.seq + "->" + finished.seq);
                }
            }
            int smallLayout = marker(lines, "SMALL_PAGES count=" + smallPages.size());
            require(smallPages.size() >= 2 && majorDone < smallLayout && smallLayout < young,
                    "Missing measured multi-small-page layout before verification minor");
            require(!correlations.isEmpty(),
                    "No grown medium owner with exact-page remset edges and moved young children");
            correlations.forEach(System.out::println);
        }

        private static void complete(Cycle cycle, Map<Long, End> ends,
                                     String kind, String cause, int after, int before) {
            End end = ends.get(cycle.id);
            require(cycle.kind.equals(kind) && cycle.cause.equals(cause)
                            && cycle.line > after && cycle.line < before
                            && end != null && end.kind.equals(kind) && end.cause.equals(cause)
                            && end.line > cycle.line && end.line < before,
                    "Unexpected collection cause, identity or phase");
        }

        private static int marker(List<String> lines, String body) {
            int found = -1;
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).equals(PREFIX + body)) {
                    require(found == -1, "Duplicate marker: " + body);
                    found = i;
                }
            }
            require(found != -1, "Missing marker: " + body);
            return found;
        }

        private static long addr(Matcher matcher, int group) {
            return Long.parseUnsignedLong(matcher.group(group).substring(2), 16);
        }

        private static void require(boolean condition, String message) {
            FourByteHeaderZGCMediumRemset.check(condition, message);
        }
    }
}
