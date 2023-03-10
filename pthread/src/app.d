@nogc:
nothrow:

// pre-allocated thread stack.
extern (C) extern  __gshared int stacksize;
extern (C) extern __gshared void** stack;

// zephyr poisx layer.
extern (C)
{
    // sched.h
    enum SCHED_FIFO = 1;
    enum SCHED_RR = 2;

    struct sched_param
    {
        int priority;
    }

    // pthread.h
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

    int pthread_create(
        pthread_t* newthread,
        const pthread_attr_t* attr,
        void* function(void*) threadroutine,
        void* arg
    );

    int pthread_attr_init(pthread_attr_t* attr);
    int pthread_attr_setstack(
        pthread_attr_t* attr,
        void* stackaddr,
        size_t stacksize
    );
    int pthread_attr_setstacksize(
        pthread_attr_t* attr,
        size_t stacksize
    );
    int pthread_attr_setschedpolicy(
        pthread_attr_t* attr,
        int policy
    );
    int pthread_attr_setschedparam(
        pthread_attr_t* attr,
        const(sched_param)* schedparam
    );
    int pthread_join(
        pthread_t thread,
        void** status
    );
    pthread_t pthread_self();
    int pthread_attr_getstack(
        const(pthread_attr_t)* attr,
        void** stackaddr,
        size_t* stacksize
    );
}

// newlib
extern (C)
{
    // stdio.h
    pragma(printf)
    int printf(scope const char* fmt, ...);
    void perror(const scope char*);
}

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

    if (pthread_attr_setstack(&attr, &stack, stacksize))
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

    if (pthread_join(thread, null))
    {
        perror("Unable to join thread");
        return 1;
    }

    return 0;
}
