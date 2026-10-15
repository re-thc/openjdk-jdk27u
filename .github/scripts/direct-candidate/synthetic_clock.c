/* VALIDATION ONLY. These timestamps are deterministic tokens, never timings.
 * Linked only into the smoke executables using --wrap=clock_gettime.
 * The conditioning_driver.c bytes remain unchanged.
 */
#include <errno.h>
#include <stdint.h>
#include <time.h>
int __wrap_clock_gettime(clockid_t clock, struct timespec *value) {
    static uint64_t token = UINT64_C(1000000000);
    if (clock != CLOCK_MONOTONIC && clock != CLOCK_THREAD_CPUTIME_ID) {
        errno = EINVAL;
        return -1;
    }
    token += 1000;
    value->tv_sec = (time_t)(token / UINT64_C(1000000000));
    value->tv_nsec = (long)(token % UINT64_C(1000000000));
    return 0;
}
