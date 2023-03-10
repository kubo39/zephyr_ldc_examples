import ldc.attributes : cold;

import zephyr.core.stdc.stdio;

@nogc:
nothrow:

version(D_NoBoundsChecks) {}
else
{
    import zephyr.core.stdc.assert_ : __assert_func;

    // Wrapping newlib's __assert_func.
    //
    // LDC: https://github.com/ldc-developers/ldc/blob/9976807e0e1acf24edfb4ba35d28c19a3f0227f2/gen/runtime.cpp#L367
    //     void __assert(const char *msg, const char *file, unsigned line)
    // newlib: https://github.com/bminor/newlib/blob/80cda9bbda04a1e9e3bee5eadf99061ed69ca5fb/newlib/libc/stdlib/assert.c#L68-L70
    //     void __assert(const char *file, int line, const char *failedexpr)
    private extern (C) @cold noreturn __assert_fail(const(char)* msg, const(char)* file, int line, const(char)* func)
    {
        __assert_func(file, line, func, msg);
    }
}

extern (C) noreturn d_main()
 {
    int[2] arr;
    // arrayboundscheck.
    foreach (i; 0..3)
        arr[i]++;  // assertion "array index out of bounds" failed!
    while (true) {}
}
