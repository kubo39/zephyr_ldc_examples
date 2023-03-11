module zephyr.core.stdc.string;

extern (C):
nothrow:
@nogc:

void* memset(return scope void* s, int c, size_t n) pure;
