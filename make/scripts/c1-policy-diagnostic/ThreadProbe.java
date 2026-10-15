import java.util.concurrent.CountDownLatch;

/** Readiness only; no measurements or compiler requests. */
public class ThreadProbe {
    public static void main(String[] args) throws Exception {
        CountDownLatch ready = new CountDownLatch(4);
        CountDownLatch release = new CountDownLatch(1);
        Thread[] threads = new Thread[4];
        try {
            for (int i = 0; i < threads.length; i++) {
                threads[i] = new Thread(() -> {
                    ready.countDown();
                    try { release.await(); }
                    catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                });
                threads[i].start();
            }
            if (!ready.await(5, java.util.concurrent.TimeUnit.SECONDS)) {
                throw new AssertionError("Four threads did not start");
            }
            System.out.println("FOUR_THREADS_PASS");
        } finally {
            release.countDown();
            for (Thread thread : threads) {
                if (thread != null) thread.join(5000);
            }
        }
    }
}
