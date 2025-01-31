import zephyr.core.sys.posix.unistd;
import zephyr.core.sys.posix.sys.types;
import zephyr.core.sys.zephyr.sys.eventfd;
import zephyr.core.stdc.stdio;
import zephyr.core.stdc.stdlib;

extern(C):
@nogc:
nothrow:

noreturn fatal(string msg)
{
    perror(msg.ptr);
    exit(EXIT_FAILURE);
}

/* As Zephyr doesn't provide command-line args, emulate them. */
__gshared string[] input_argv = ["argv0", "1", "2", "3", "4"];

__gshared int efd;
__gshared int g_argc;
__gshared string[] g_argv;

void writer()
{
    foreach (j; 1 .. g_argc)
    {
        printf("Writing %s to efd\n", g_argv[j].ptr);
        ulong u = strtoull(g_argv[j].ptr, null, 10);
        ssize_t s = write(efd, &u, ulong.sizeof);
        if (s != ulong.sizeof)
        {
            fatal("write");
        }
    }
    printf("Complete write loop\n");
}

void reader()
{
    sleep(1);

    ulong u;
    printf("About to read\n");
    ssize_t s = read(efd, &u, ulong.sizeof);
    if (s != ulong.sizeof)
    {
        fatal("read");
    }
    printf("Read %llu (0x%llx) from efd\n",
           cast(ulong)u, cast(ulong)u);
}

int d_main()
{
    auto argv = input_argv;
    auto argc = argv.length;

    if (argc < 2)
    {
        printf("Usage: %s <num>...\n", argv[0].ptr);
        exit(EXIT_FAILURE);
    }

    g_argc = argc;
    g_argv = argv;

    efd = eventfd(0, 0);
    if (efd == -1)
    {
        fatal("eventfd");
    }

    writer();
    reader();

    printf("Finished!\n");

    return 0;
}
