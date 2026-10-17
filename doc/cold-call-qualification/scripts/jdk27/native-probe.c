#include <zstd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static double now(void) {
    struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
static void check(size_t n) {
    if (ZSTD_isError(n)) { fprintf(stderr, "%s\n", ZSTD_getErrorName(n)); exit(1); }
}
static unsigned char *read_file(const char *path, size_t *size) {
    FILE *f = fopen(path, "rb"); if (!f) { perror(path); exit(1); }
    fseek(f, 0, SEEK_END); *size = ftell(f); rewind(f);
    unsigned char *p = malloc(*size + 1);
    if (fread(p, 1, *size, f) != *size) exit(1);
    fclose(f); return p;
}
static int compare(const void *a, const void *b) {
    double x = *(const double *)a, y = *(const double *)b; return (x > y) - (x < y);
}
int main(int argc, char **argv) {
    if (argc == 2 && strcmp(argv[1], "--version") == 0) {
        printf("libzstd %s (headers %s)\n", ZSTD_versionString(), ZSTD_VERSION_STRING);
        return 0;
    }
    if (argc != 5) return 2;
    if (strcmp(argv[1], "encode") && strcmp(argv[1], "decode")) return 2;
    int encode = strcmp(argv[1], "encode") == 0, level = atoi(argv[3]);
    size_t size, frame_size, capacity;
    unsigned char *source = read_file(argv[2], &size), *frame;
    ZSTD_CCtx *cc = ZSTD_createCCtx(); ZSTD_DCtx *dc = ZSTD_createDCtx();
    if (encode) {
        frame = malloc(ZSTD_compressBound(size));
        frame_size = ZSTD_compressCCtx(cc, frame, ZSTD_compressBound(size), source, size, level);
        check(frame_size); FILE *f = fopen(argv[4], "wb");
        if (!f || fwrite(frame, 1, frame_size, f) != frame_size) return 1;
        fclose(f);
    } else frame = read_file(argv[4], &frame_size);
    capacity = encode ? ZSTD_compressBound(size) : size;
    unsigned char *destination = malloc(capacity);
    double rates[5], stop = now() + 2; size_t result;
    for (int sample = -1; sample < 5; sample++) {
        double start = now(); size_t count = 0;
        if (sample >= 0) stop = start + .7;
        do {
            result = encode ? ZSTD_compressCCtx(cc, destination, capacity, source, size, level)
                            : ZSTD_decompressDCtx(dc, destination, capacity, frame, frame_size);
            check(result); count++;
        } while (now() < stop);
        if (sample >= 0) rates[sample] = size * (double)count / (now() - start) / 1e6;
    }
    if (!encode && (result != size || memcmp(source, destination, size))) return 1;
    double sorted[5];
    memcpy(sorted, rates, sizeof(rates));
    qsort(sorted, 5, sizeof(double), compare);
    printf("%s L%d input=%zu frame=%zu median=%.1f MB/s samples=", argv[1], level, size, frame_size, sorted[2]);
    for (int i = 0; i < 5; i++) printf(" %.1f", rates[i]); puts("");
    ZSTD_freeCCtx(cc); ZSTD_freeDCtx(dc); free(source); free(frame); free(destination);
}
