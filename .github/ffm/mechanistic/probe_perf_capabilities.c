#define _GNU_SOURCE
#include <errno.h>
#include <linux/perf_event.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

/* Capability smoke probe for this process only. No FFM/JVM, sudo, sysctl,
 * capability changes or attachment to another process. Counts are not an
 * application benchmark. A successful open alone is never called usable. */
static volatile uint64_t sink;

static void work(void) {
    uint64_t value = sink + 1;
    for (unsigned i = 0; i < 200000; i++) {
        value = value * 6364136223846793005ULL + i;
        __asm__ volatile("" : "+r"(value));
    }
    sink = value;
}

static int open_event(struct perf_event_attr *attr, int group) {
    return (int)syscall(__NR_perf_event_open, attr, 0, -1, group, PERF_FLAG_FD_CLOEXEC);
}

static struct perf_event_attr counter_attr(uint32_t type, uint64_t config) {
    struct perf_event_attr attr;
    memset(&attr, 0, sizeof(attr));
    attr.size = sizeof(attr);
    attr.type = type;
    attr.config = config;
    attr.disabled = 1;
    attr.exclude_kernel = 1;
    attr.exclude_hv = 1;
    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
    return attr;
}

static void counter(const char *name, uint32_t type, uint64_t config, int require_positive) {
    struct perf_event_attr attr = counter_attr(type, config);
    int fd = open_event(&attr, -1);
    if (fd < 0) {
        printf("{\"name\":\"%s\",\"usable_requested_mode\":false,\"open_errno\":%d}", name, errno);
        return;
    }
    int error = 0;
    uint64_t result[3] = {0, 0, 0};
    if (ioctl(fd, PERF_EVENT_IOC_RESET, 0) || ioctl(fd, PERF_EVENT_IOC_ENABLE, 0)) error = errno;
    work();
    if (ioctl(fd, PERF_EVENT_IOC_DISABLE, 0) && !error) error = errno;
    ssize_t bytes = read(fd, result, sizeof(result));
    if (bytes != (ssize_t)sizeof(result) && !error) error = bytes < 0 ? errno : EIO;
    int usable = !error && result[1] > 0 && result[2] > 0 && (!require_positive || result[0] > 0);
    printf("{\"name\":\"%s\",\"usable_requested_mode\":%s,\"operation_errno\":%d,"
           "\"count\":%llu,\"time_enabled\":%llu,\"time_running\":%llu}",
           name, usable ? "true" : "false", error,
           (unsigned long long)result[0], (unsigned long long)result[1], (unsigned long long)result[2]);
    close(fd);
}

static void hardware_group(void) {
    const uint64_t configs[] = {PERF_COUNT_HW_CPU_CYCLES, PERF_COUNT_HW_INSTRUCTIONS,
                                PERF_COUNT_HW_REF_CPU_CYCLES};
    int fds[3] = {-1, -1, -1};
    int error = 0;
    for (int i = 0; i < 3; i++) {
        struct perf_event_attr attr = counter_attr(PERF_TYPE_HARDWARE, configs[i]);
        attr.pinned = i == 0;
        attr.read_format |= PERF_FORMAT_GROUP;
        fds[i] = open_event(&attr, i == 0 ? -1 : fds[0]);
        if (fds[i] < 0) { error = errno; break; }
    }
    uint64_t result[6] = {0, 0, 0, 0, 0, 0}; /* nr, enabled, running, three values */
    if (!error) {
        if (ioctl(fds[0], PERF_EVENT_IOC_RESET, PERF_IOC_FLAG_GROUP) ||
            ioctl(fds[0], PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP)) error = errno;
        work();
        if (ioctl(fds[0], PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP) && !error) error = errno;
        ssize_t bytes = read(fds[0], result, sizeof(result));
        if (bytes != (ssize_t)sizeof(result) && !error) error = bytes < 0 ? errno : EIO;
    }
    int usable = !error && result[0] == 3 && result[1] > 0 && result[2] == result[1] &&
                 result[3] > 0 && result[4] > 0 && result[5] > 0;
    printf("{\"name\":\"pinned_cycles_instructions_ref_cycles_group\",\"usable_unmultiplexed\":%s,"
           "\"operation_errno\":%d,\"nr\":%llu,\"time_enabled\":%llu,\"time_running\":%llu,"
           "\"counts\":[%llu,%llu,%llu]}", usable ? "true" : "false", error,
           (unsigned long long)result[0], (unsigned long long)result[1], (unsigned long long)result[2],
           (unsigned long long)result[3], (unsigned long long)result[4], (unsigned long long)result[5]);
    for (int i = 2; i >= 0; i--) if (fds[i] >= 0) close(fds[i]);
}

static void software_ip_sampling(void) {
    struct perf_event_attr attr = counter_attr(PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CPU_CLOCK);
    attr.sample_period = 1000000; /* one millisecond of CPU clock */
    attr.sample_type = PERF_SAMPLE_IP | PERF_SAMPLE_TID | PERF_SAMPLE_TIME | PERF_SAMPLE_CPU;
    attr.use_clockid = 1;
    attr.clockid = CLOCK_MONOTONIC;
    attr.wakeup_events = 1;
    int fd = open_event(&attr, -1);
    if (fd < 0) {
        printf("{\"name\":\"software_cpu_clock_ip_samples\",\"usable_requested_mode\":false,\"open_errno\":%d}", errno);
        return;
    }
    long page = sysconf(_SC_PAGESIZE);
    size_t length = (size_t)page * 9;
    void *mapping = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    int error = mapping == MAP_FAILED ? errno : 0;
    unsigned samples = 0, lost_records = 0, malformed = 0;
    uint64_t first_time = 0, last_time = 0;
    if (!error) {
        struct perf_event_mmap_page *meta = mapping;
        if (ioctl(fd, PERF_EVENT_IOC_ENABLE, 0)) error = errno;
        struct timespec start, now;
        if (clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start)) error = errno;
        do {
            work();
            if (clock_gettime(CLOCK_THREAD_CPUTIME_ID, &now)) { error = errno; break; }
        } while (!error && (now.tv_sec - start.tv_sec) * 1000000000LL + now.tv_nsec - start.tv_nsec < 20000000);
        if (ioctl(fd, PERF_EVENT_IOC_DISABLE, 0) && !error) error = errno;
        uint64_t head = __atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE);
        uint64_t offset = meta->data_offset, size = meta->data_size, tail = meta->data_tail;
        if (!size || offset + size > length || head - tail > size) {
            malformed = 1;
        } else {
            unsigned char *data = (unsigned char *)mapping + offset;
            while (tail < head) {
                struct perf_event_header header;
                unsigned char *bytes = (unsigned char *)&header;
                for (size_t i = 0; i < sizeof(header); i++) bytes[i] = data[(tail + i) % size];
                if (header.size < sizeof(header) || tail + header.size > head) { malformed = 1; break; }
                if (header.type == PERF_RECORD_SAMPLE && header.size >= sizeof(header) + 4 * sizeof(uint64_t)) {
                    uint64_t fields[4] = {0, 0, 0, 0}; /* IP, pid/tid, monotonic time, cpu/reserved */
                    bytes = (unsigned char *)fields;
                    for (size_t i = 0; i < sizeof(fields); i++) bytes[i] = data[(tail + sizeof(header) + i) % size];
                    if (fields[0] && fields[2]) {
                        if (!first_time) first_time = fields[2];
                        if (fields[2] < last_time) malformed = 1;
                        last_time = fields[2];
                        samples++;
                    }
                }
                if (header.type == PERF_RECORD_LOST) lost_records++;
                tail += header.size;
            }
        }
        munmap(mapping, length);
    }
    close(fd);
    printf("{\"name\":\"software_cpu_clock_ip_samples\",\"usable_requested_mode\":%s,"
           "\"operation_errno\":%d,\"nonzero_ip_samples\":%u,\"first_monotonic_time\":%llu,"
           "\"last_monotonic_time\":%llu,\"lost_records\":%u,\"malformed\":%u}",
           !error && samples && !lost_records && !malformed ? "true" : "false", error, samples,
           (unsigned long long)first_time, (unsigned long long)last_time, lost_records, malformed);
}

int main(void) {
    printf("{\"scope\":\"current process and executor only; no FFM benchmark\",\"events\":[");
    counter("cycles", PERF_TYPE_HARDWARE, PERF_COUNT_HW_CPU_CYCLES, 1); printf(",");
    counter("instructions", PERF_TYPE_HARDWARE, PERF_COUNT_HW_INSTRUCTIONS, 1); printf(",");
    counter("ref_cycles", PERF_TYPE_HARDWARE, PERF_COUNT_HW_REF_CPU_CYCLES, 1); printf(",");
    counter("task_clock", PERF_TYPE_SOFTWARE, PERF_COUNT_SW_TASK_CLOCK, 1); printf(",");
    counter("context_switches", PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CONTEXT_SWITCHES, 0); printf(",");
    counter("cpu_migrations", PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CPU_MIGRATIONS, 0); printf(",");
    hardware_group(); printf(","); software_ip_sampling(); printf("]}\n");
    return 0; /* Unsupported events are a preserved capability result, not a crash. */
}
