import zephyr.core.stdc.stdio;
import zephyr.core.stdc.errno;
import zephyr.core.sys.posix.time;
import zephyr.core.sys.posix.sys.time;
import zephyr.core.sys.posix.sys.types;
import zephyr.core.sys.posix.unistd;

@nogc:
nothrow:

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
