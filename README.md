# LDC on Zephyr examples

## Prerequiresites

- LDC
- Dub

For Zephyr, read https://docs.zephyrproject.org/latest/develop/getting_started/index.html

For Qemu on Zephyr, read https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu

## How to build

Currently requires upstream ldc compiler: https://github.com/ldc-developers/ldc

### Example: pthread

```console
$ cd $ZEPHYR_BASE
$ west build -b qemu_cortex_m3 samples/ldc_examples/pthread
$ west build -t run
(...)
*** Booting Zephyr OS build zephyr-v3.3.0-592-gcaa88b2cfdf2 ***
thread stack: 0x20000698
Hello World!
QEMU: Terminated
```
