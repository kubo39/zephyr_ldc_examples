module zephyr.core.stdc.stdlib;

extern (C):
nothrow:
@nogc:

void* malloc(size_t size);
void free(void* ptr);
