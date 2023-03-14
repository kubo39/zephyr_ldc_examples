module zephyr.core.sys.posix.posix_types;

extern (C):
nothrow:
@nogc:

alias pthread_t = uint;

struct pthread_attr_t
{
 int priority;
	void *stack;
 uint stacksize;
	uint flags;
 uint delayedstart;
	uint schedpolicy;
 int detachstate;
	uint initialized;
}
