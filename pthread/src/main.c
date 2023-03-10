#include <zephyr/kernel.h>

#define STACKSIZE 2048

int stacksize = STACKSIZE;
K_THREAD_STACK_DEFINE(stack_0, STACKSIZE);
void* stack = stack_0;

extern int d_main();

int main() {
    return d_main();
}
