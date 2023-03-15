import ldc.attributes : cold;

import zephyr.core.stdc.stdio;

@nogc:
nothrow:

extern (C) noreturn d_main()
 {
    int[2] arr;
    // arrayboundscheck.
    foreach (i; 0..3)
        arr[i]++;  // assertion "array index out of bounds" failed!
    while (true) {}
}
