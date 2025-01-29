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
$ west build -b qemu_cortex_m3 pthread
$ west build -t run
(...)
*** Booting Zephyr OS build v4.0.0-4204-gcef0c1af0d8f ***
thread stack: 0x200026e4
Hello World!
QEMU: Terminated
```

#### native sim

```console
$ source ~/zephyrproject/.venv/bin/activate
$ west build -b native_sim pthread
$ west build -t run
(...)
*** Booting Zephyr OS build v4.0.0-4204-gcef0c1af0d8f ***
thread stack: 0xf7416218
Hello World!
^C
```
