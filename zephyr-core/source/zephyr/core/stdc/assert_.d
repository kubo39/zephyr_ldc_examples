module zephyr.core.stdc.assert_;

extern (C):
nothrow:
@nogc:

noreturn __assert_func(scope const char* file, int line, scope const char* func, scope const char* failedexpr);
