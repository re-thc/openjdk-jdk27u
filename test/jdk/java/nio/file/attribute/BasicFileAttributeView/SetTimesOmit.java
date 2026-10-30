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

/* @test
 * @summary Single Unix timestamp updates preserve the omitted timestamp
 * @requires (os.family != "windows")
 * @library ../..
 * @run main SetTimesOmit
 */

import java.io.IOException;
import java.nio.file.ClosedDirectoryStreamException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SecureDirectoryStream;
import java.nio.file.attribute.BasicFileAttributeView;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import static java.nio.file.LinkOption.NOFOLLOW_LINKS;
import static java.util.concurrent.TimeUnit.NANOSECONDS;
import static java.util.concurrent.TimeUnit.SECONDS;

public class SetTimesOmit {
    private static final FileTime M = FileTime.from(1_600_000_000_123456789L, NANOSECONDS);
    private static final FileTime A = FileTime.from(1_500_000_000_987654321L, NANOSECONDS);
    private static final FileTime NEXT = FileTime.from(1_700_000_000_234567891L, NANOSECONDS);

    public static void main(String[] args) throws Exception {
        Path dir = TestUtil.createTemporaryDirectory();
        try {
            Path file = Files.createFile(dir.resolve("file"));
            var view = view(file);
            exercise(view);
            extremes(view, true);
            concurrent(view);
            errors(dir, file);
            links(dir, file);
            secure(dir);
        } finally {
            TestUtil.removeAll(dir);
        }
    }

    private static BasicFileAttributeView view(Path file) {
        return Files.getFileAttributeView(file, BasicFileAttributeView.class);
    }

    private static void equal(Object actual, Object expected) {
        if (!actual.equals(expected))
            throw new AssertionError(actual + " != " + expected);
    }

    private static void exercise(BasicFileAttributeView view) throws IOException {
        view.setTimes(M, A, null);
        BasicFileAttributes initial = view.readAttributes();
        view.setTimes(NEXT, NEXT, null);
        BasicFileAttributes roundedNext = view.readAttributes();
        view.setTimes(M, A, null);
        view.setTimes(NEXT, null, null);
        equal(view.readAttributes().lastModifiedTime(), roundedNext.lastModifiedTime());
        equal(view.readAttributes().lastAccessTime(), initial.lastAccessTime());
        view.setTimes(null, NEXT, null);
        BasicFileAttributes bothNext = view.readAttributes();
        equal(bothNext.lastModifiedTime(), roundedNext.lastModifiedTime());
        equal(bothNext.lastAccessTime(), roundedNext.lastAccessTime());
        view.setTimes(null, null, null);
        equal(view.readAttributes().lastModifiedTime(), bothNext.lastModifiedTime());
        equal(view.readAttributes().lastAccessTime(), bothNext.lastAccessTime());
    }

    private static void extremes(BasicFileAttributeView view, boolean retry) throws IOException {
        // Derive expected rounding/range handling from an explicit both-times
        // update on this filesystem, including saturated FileTime conversions.
        for (FileTime time : List.of(FileTime.from(-1, NANOSECONDS),
                                    FileTime.from(-2, NANOSECONDS),
                                    FileTime.from(-1, SECONDS),
                                    FileTime.from(Long.MIN_VALUE, NANOSECONDS),
                                    FileTime.from(Long.MAX_VALUE, NANOSECONDS),
                                    FileTime.from(Long.MIN_VALUE, SECONDS),
                                    FileTime.from(Long.MAX_VALUE, SECONDS))) {
            view.setTimes(M, A, null);
            BasicFileAttributes initial = view.readAttributes();
            boolean rejected = false;
            BasicFileAttributes expected = null;
            try {
                view.setTimes(time, time, null);
                expected = view.readAttributes();
            } catch (IOException e) {
                rejected = true;
            }
            if (!retry && time.to(NANOSECONDS) < 0 &&
                time.to(NANOSECONDS) % 1_000_000_000L != 0 && !rejected)
                throw new AssertionError("Negative fraction accepted as a native token: " + time);
            for (boolean modification : List.of(true, false)) {
                view.setTimes(M, A, null);
                try {
                    view.setTimes(modification ? time : null,
                                  modification ? null : time, null);
                    if (rejected)
                        throw new AssertionError("Single-time update unexpectedly accepted " + time);
                    BasicFileAttributes actual = view.readAttributes();
                    equal(actual.lastModifiedTime(), modification ? expected.lastModifiedTime()
                                                                 : initial.lastModifiedTime());
                    equal(actual.lastAccessTime(), modification ? initial.lastAccessTime()
                                                               : expected.lastAccessTime());
                } catch (IOException e) {
                    if (!rejected) throw e;
                }
            }
        }
        // Retrying an invalid supplied fraction must not clamp an omitted
        // pre-epoch timestamp, where the filesystem supports such a timestamp.
        if (retry) {
            view.setTimes(FileTime.from(-1, SECONDS), FileTime.from(-1, SECONDS), null);
            BasicFileAttributes before = view.readAttributes();
            view.setTimes(FileTime.from(-1, NANOSECONDS), null, null);
            equal(view.readAttributes().lastAccessTime(), before.lastAccessTime());
            view.setTimes(null, FileTime.from(-2, NANOSECONDS), null);
            equal(view.readAttributes().lastModifiedTime(), FileTime.from(0, SECONDS));
        }
    }

    private static void concurrent(BasicFileAttributeView view) throws Exception {
        FileTime start = FileTime.from(1_400_000_000, SECONDS);
        view.setTimes(start, start, null);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        CountDownLatch ready = new CountDownLatch(1);
        Thread[] workers = new Thread[2];
        for (int n = 0; n < 2; n++) {
            final boolean modification = n == 0;
            workers[n] = new Thread(() -> {
                try {
                    ready.await();
                    for (int i = 1; i <= 5_000 && failure.get() == null; i++) {
                        FileTime next = FileTime.from(1_400_000_000L + i, SECONDS);
                        view.setTimes(modification ? next : null,
                                      modification ? null : next, null);
                        BasicFileAttributes attrs = view.readAttributes();
                        FileTime observed = modification ? attrs.lastModifiedTime()
                                                         : attrs.lastAccessTime();
                        if (observed.compareTo(next) < 0)
                            throw new AssertionError("Concurrent update restored stale time: " +
                                                     observed + " < " + next);
                    }
                } catch (Throwable t) {
                    failure.compareAndSet(null, t);
                }
            });
            workers[n].start();
        }
        ready.countDown();
        for (Thread worker : workers) worker.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
    }

    private interface Action { void run() throws Exception; }

    private static void fails(Class<? extends Exception> type, Action action) throws Exception {
        try {
            action.run();
        } catch (Exception e) {
            if (type.isInstance(e)) return;
            throw e;
        }
        throw new AssertionError("Expected " + type.getName());
    }

    private static void errors(Path dir, Path file) throws Exception {
        var missing = view(dir.resolve("missing"));
        missing.setTimes(null, null, null); // ordinary all-null is already a no-op
        for (FileTime time : List.of(NEXT, FileTime.from(-1, NANOSECONDS),
                                    FileTime.from(-2, NANOSECONDS))) {
            fails(IOException.class, () -> missing.setTimes(time, null, null));
            fails(IOException.class, () -> missing.setTimes(null, time, null));
        }
        var permissions = Files.getPosixFilePermissions(file);
        try {
            Files.setPosixFilePermissions(file, Set.of());
            if (!Files.isReadable(file)) {
                fails(IOException.class, () -> view(file).setTimes(NEXT, null, null));
                fails(IOException.class, () -> view(file).setTimes(null, NEXT, null));
            }
        } finally {
            Files.setPosixFilePermissions(file, permissions);
        }
    }

    private static void links(Path dir, Path file) throws Exception {
        if (!TestUtil.supportsSymbolicLinks(dir)) return;
        Path link = Files.createSymbolicLink(dir.resolve("link"), file.getFileName());
        exercise(view(link));
        var nofollow = Files.getFileAttributeView(link, BasicFileAttributeView.class, NOFOLLOW_LINKS);
        BasicFileAttributes target = view(file).readAttributes();
        exercise(nofollow);
        extremes(nofollow, true);
        equal(view(file).readAttributes().lastModifiedTime(), target.lastModifiedTime());
        // Following a symlink can update the link's access time, so compare the
        // target's timestamps only after all nofollow operations complete.
        equal(view(file).readAttributes().lastAccessTime(), target.lastAccessTime());
        Files.delete(file);
        fails(IOException.class, () -> view(link).setTimes(FileTime.from(-1, NANOSECONDS), null, null));
        Files.createFile(file);
        Files.delete(link);
        Path loop = Files.createSymbolicLink(dir.resolve("loop"), Path.of("loop"));
        for (FileTime time : List.of(NEXT, FileTime.from(-1, NANOSECONDS),
                                    FileTime.from(-2, NANOSECONDS))) {
            fails(IOException.class, () -> view(loop).setTimes(time, null, null));
        }
        Files.delete(loop);
    }

    @SuppressWarnings("unchecked")
    private static void secure(Path dir) throws Exception {
        Path child = Files.createDirectory(dir.resolve("child"));
        Path entry = Path.of("entry");
        Files.createFile(child.resolve(entry));
        try (var stream = Files.newDirectoryStream(child)) {
            if (!(stream instanceof SecureDirectoryStream)) {
                System.out.println("SecureDirectoryStream unavailable");
                return;
            }
            var secure = (SecureDirectoryStream<Path>)stream;
            var self = secure.getFileAttributeView(BasicFileAttributeView.class);
            var view = secure.getFileAttributeView(entry, BasicFileAttributeView.class);
            Files.move(child, dir.resolve("renamed"));
            exercise(self);
            exercise(view);
            extremes(view, false);
            concurrent(view);
            if (TestUtil.supportsSymbolicLinks(dir)) {
                Path renamed = dir.resolve("renamed");
                Path link = Path.of("link");
                Files.createSymbolicLink(renamed.resolve(link), entry);
                exercise(secure.getFileAttributeView(link, BasicFileAttributeView.class));
                // Secure nofollow retains its O_NOFOLLOW open/error behavior.
                var nofollow = secure.getFileAttributeView(link, BasicFileAttributeView.class,
                                                          NOFOLLOW_LINKS);
                fails(IOException.class, () -> nofollow.setTimes(NEXT, null, null));
                secure.deleteFile(link);
            }
            var missing = secure.getFileAttributeView(Path.of("missing"), BasicFileAttributeView.class);
            fails(IOException.class, () -> missing.setTimes(null, null, null));
            secure.deleteFile(entry);
            fails(IOException.class, () -> view.setTimes(NEXT, null, null));
            stream.close();
            for (FileTime time : List.of(NEXT, FileTime.from(-1, NANOSECONDS),
                                        FileTime.from(-2, NANOSECONDS))) {
                fails(ClosedDirectoryStreamException.class, () -> view.setTimes(time, null, null));
                fails(ClosedDirectoryStreamException.class, () -> self.setTimes(null, time, null));
            }
            fails(ClosedDirectoryStreamException.class, () -> self.setTimes(null, null, null));
        }
        // The read lock must keep an update's descriptors valid during close.
        try (var stream = Files.newDirectoryStream(dir.resolve("renamed"))) {
            var secure = (SecureDirectoryStream<Path>)stream;
            var self = secure.getFileAttributeView(BasicFileAttributeView.class);
            AtomicReference<Throwable> failure = new AtomicReference<>();
            CountDownLatch started = new CountDownLatch(1);
            Thread updater = new Thread(() -> {
                try {
                    self.setTimes(NEXT, null, null);
                    started.countDown();
                    for (int i = 0; i < 1_000; i++) self.setTimes(null, NEXT, null);
                } catch (ClosedDirectoryStreamException expected) {
                } catch (Throwable t) {
                    failure.set(t);
                } finally {
                    started.countDown();
                }
            });
            updater.start();
            started.await();
            stream.close();
            updater.join();
            if (failure.get() != null) throw new AssertionError(failure.get());
        }
    }
}
