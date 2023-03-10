#include <zephyr/kernel.h>

#define STACKSIZE 2048

int stacksize = STACKSIZE;
K_THREAD_STACK_DEFINE(stack, STACKSIZE);

extern int d_main();

int main() {
    return d_main();
}
