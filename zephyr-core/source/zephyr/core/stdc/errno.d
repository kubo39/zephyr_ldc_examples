module zephyr.core.stdc.errno;

extern (C):
nothrow:
@nogc:

ref int __errno();
alias errno = __errno;
