@nogc:
nothrow:

// newlib
extern (C)
{
    // stdio.h
    pragma(printf)
    int printf(scope const char* fmt, ...);

    // errno.h
    ref int __errno();
    alias errno = __errno;

    // sys/time.h
    struct timeval
    {
        time_t tv_sec;
        suseconds_t tv_usec;
    }
    int gettimeofday(timeval*, void*);

    // sys/types.h
    alias time_t = long;
    alias suseconds_t = long;

    // time.h
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

    // unistd.h
    uint sleep(uint);
}

extern (C) int d_main()
 {
    timeval tv = void;

    while (true)
    {
        int res = gettimeofday(&tv, null);
        time_t now = time(null);
        tm tm;
        localtime_r(&now, &tm);

        if (res < 0)
        {
            printf("Error in gettimeofday(): %d\n", errno);
            return 1;
        }

		printf("gettimeofday(): HI(tv_sec)=%d, LO(tv_sec)=%d, "
		       ~ "tv_usec=%d\n\t%s\n", cast(uint)(tv.tv_sec >> 32),
		       cast(uint)tv.tv_sec, cast(uint)tv.tv_usec,
		       asctime(&tm));
		sleep(1);
    }
}
