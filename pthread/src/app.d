import zephyr.core.stdc.stdio;
import zephyr.core.stdc.stdlib;
import zephyr.core.stdc.string;
import zephyr.core.sys.posix.pthread;
import zephyr.core.sys.posix.sched;

@nogc:
nothrow:

enum STACKSIZE = 2048;

extern(C) void* user_function(void*)
{
    printf("Hello World!\n");
    return null;
}

extern (C) int d_main()
{
    pthread_t thread;
    pthread_attr_t attr = void;
    sched_param sched_param = { 0 };

    if (pthread_attr_init(&attr))
    {
        perror("Error initializing thread attributes");
        return 1;
    }

    void* stack = malloc(STACKSIZE);
    if (stack is null)
    {
        perror("Error allocating thread stack");
        return 1;
    }
    memset(stack, 0x0, STACKSIZE);
    if (pthread_attr_setstack(&attr, &stack, STACKSIZE))
    {
        perror("Error initializing thread stack");
        return 1;
    }

    void* stackaddr;
    size_t stacksize;
    if (pthread_attr_getstack(&attr, &stackaddr, &stacksize))
    {
        perror("Error while getting thread stack");
        return 1;
    }
    printf("thread stack: %p\n", stackaddr);

    if (pthread_attr_setschedpolicy(&attr, SCHED_FIFO))
    {
        perror("Error initializing thread scheduling policy");
        return 1;
    }
    if (pthread_attr_setschedparam(&attr, &sched_param))
    {
        perror("Error creating thread");
        return 1;
    }

    if (pthread_create(&thread, &attr, &user_function, null))
    {
        perror("Error creating thread");
        return 1;
    }

    if (pthread_attr_destroy(&attr))
    {
        perror("Error destroying thread attributes");
        return 1;
    }

    if (pthread_join(thread, null))
    {
        perror("Unable to join thread");
        return 1;
    }

    return 0;
}
