module zephyr.core.sys.posix.sys.time;

import zephyr.core.sys.posix.sys.types;

extern (C):
nothrow:
@nogc:

struct timeval
{
    time_t tv_sec;
    suseconds_t tv_usec;
}

int gettimeofday(timeval*, void*);
