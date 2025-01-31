module zephyr.core.stdc.stdlib;

extern (C):
nothrow:
@nogc:

enum EXIT_SUCCESS = 0;
enum EXIT_FAILURE = 1;

noreturn exit(int status);

void* malloc(size_t size);
void free(void* ptr);

ulong strtoull(const char* nptr, char** endptr, int base);
