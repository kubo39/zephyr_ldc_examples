# LDC on Zephyr examples

## Prerequiresites

- LDC (>=1.32.1)
- DUB

For Zephyr, read [Getting Started Guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html)

For Qemu on Zephyr, read [Run the Application in QEMU](https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu)

## How to build

### Example: pthread

#### QEMU

```console
$ source ~/zephyrproject/.venv/bin/activate
$ cd $ZEPHYR_BASE
$ west build -b qemu_cortex_m3 samples/ldc_examples/pthread
$ west build -t run
(...)
*** Booting Zephyr OS build zephyr-v3.3.0-592-gcaa88b2cfdf2 ***
thread stack: 0x20000698
Hello World!
QEMU: Terminated
```

#### native sim

```console
$ source ~/zephyrproject/.venv/bin/activate
$ cd $ZEPHYR_BASE
$ west build -b native_sim samples/ldc_examples/pthread
$ west build -t run
(...)
*** Booting Zephyr OS build v4.0.0-4204-gcef0c1af0d8f ***
thread stack: 0xf7416218
Hello World!
^C
```
