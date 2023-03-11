module zephyr.core.stdc.stdio;

extern (C):
nothrow:
@nogc:

pragma(printf)
int printf(scope const char* fmt, ...);

void perror(const scope char*);
