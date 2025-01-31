module zephyr.core.sys.zephyr.sys.eventfd;

extern(C):
nothrow:
@nogc:

enum EFD_SEMAPHORE = 2;
enum EFD_NONBLOCK = 0x4000;

alias eventfd_t = ulong;

int eventfd(uint initval, int flags);
int eventfd_read(int fd, eventfd_t *value);
int eventfd_write(int fd, eventfd_t value);
