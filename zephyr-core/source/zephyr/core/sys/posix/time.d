module zephyr.core.sys.posix.time;

import zephyr.core.sys.posix.sys.types;

extern (C):
nothrow:
@nogc:

struct tm
{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
}
char* asctime(const scope tm*);
tm* localtime_r(const scope time_t*, tm*);
time_t time(time_t*);
