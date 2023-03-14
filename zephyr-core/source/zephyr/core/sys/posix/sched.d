module zephyr.core.sys.posix.sched;

extern (C):
nothrow:
@nogc:

enum SCHED_FIFO = 1;
enum SCHED_RR = 2;

struct sched_param
{
    int priority;
}
