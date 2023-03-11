module zephyr.core.sys.posix.pthread;

public import zephyr.core.sys.posix.posix_types;
import zephyr.core.sys.posix.sched;

extern (C):
nothrow:
@nogc:

int pthread_create(pthread_t*, const scope pthread_attr_t*, void* function(void*), void*);
int pthread_attr_init(pthread_attr_t*);
int pthread_attr_setstack(pthread_attr_t*, void*, size_t);
int pthread_attr_setstacksize(pthread_attr_t*, size_t);
int pthread_attr_setschedpolicy(pthread_attr_t*, int);
int pthread_attr_setschedparam(const scope pthread_attr_t*, sched_param*);
int pthread_attr_destroy(pthread_attr_t*);
int pthread_join(pthread_t, void** status);
pthread_t pthread_self();
int pthread_attr_getstack(const scope pthread_attr_t*, void**, size_t*);
