module zephyr.core.sys.posix.unistd;

import zephyr.core.sys.posix.sys.types;

extern (C):
nothrow:
@nogc:

uint sleep(uint);

ssize_t read(int, void*, size_t);
ssize_t write(int, const scope void*, size_t);
