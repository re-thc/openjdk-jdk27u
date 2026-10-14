#include <stdint.h>
#include <errno.h>
#include <stdarg.h>
void noop(void) { }
int id_i(int x) { return x; }
int id_i2(int x) { return x; }
int add_i(int x, int y) { return (int)((uint32_t)x + (uint32_t)y); }
long long id_j(long long x) { return x; }
float id_f(float x) { return x; }
double id_d(double x) { return x; }
int sum3(int x, int y, int z) { return x + y + z; }
int read_ptr(const int *x) { return *x; }
void *ptr_id(void *x) { return x; }
int8_t id_b(int8_t x) { return x; }
int16_t id_s(int16_t x) { return x; }
uint16_t id_c(uint16_t x) { return x; }
static int (*blocker)(int);
void install_callback(int (*f)(int)) { blocker = f; }
int block_i(int x) { return blocker(x); }
int callback(int (*f)(int), int x) { return f(x); }
int set_errno(int x) { errno = x; return x; }
struct pair { int x, y; };
struct pair pair_id(struct pair x) { return x; }
int sum_var(int x, ...) { va_list a; va_start(a, x); int y = va_arg(a, int); va_end(a); return x + y; }
