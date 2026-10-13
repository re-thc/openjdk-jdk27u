#include <stdint.h>
#include <stdio.h>
#include <string.h>
extern void __attribute__((ms_abi)) assign_fixed(int64_t, int64_t *, int64_t *, int);
extern void __attribute__((ms_abi)) assign_original(int64_t, int64_t *, int64_t *, int);
int main(void) {
    int64_t source[34], actual[34], original[2] = {0,0};
    source[0] = 1;
    for (int i = 1; i < 34; i++) source[i] = 9;
    assign_original(1, original, source, 2);
    printf("Original Windows-ABI loop: [%lld,%lld]\n", (long long)original[0], (long long)original[1]);
    if (original[0] != 1 || original[1] != 0) return 1;
    for (int n = 0; n <= 33; n++) {
        memset(actual, 0, sizeof(actual));
        assign_fixed(1, actual, source, n);
        if (memcmp(actual, source, n*sizeof(*actual))) return 2;
        assign_fixed(0, actual, source+1, n);
        if (memcmp(actual, source, n*sizeof(*actual))) return 3;
        assign_fixed(1, actual, actual, n);
        if (memcmp(actual, source, n*sizeof(*actual))) return 4;
    }
    puts("Fixed Windows-ABI scalar loop: lengths 0..33, select 0/1 and alias pass");
}
