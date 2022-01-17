# docker-modm-build

Docker containers for building modm for different architectures:

* ARM Cortex-M (STM32, SAMD, ...): `docker pull ghcr.io/modm-ext/modm-build-cortex-m:latest`
* Atmel/Microchip AVR: `docker pull ghcr.io/modm-ext/modm-build-avr:latest`
* RISC-V: `docker pull ghcr.io/modm-ext/modm-build-risc-v:latest`
* Hosted (Linux): `docker pull ghcr.io/modm-ext/modm-build-base:latest`
* ARM Cortex-M with OpenOCD: `docker pull ghcr.io/modm-ext/modm-build-cortex-m-openocd:latest`


## Image `modm-ext/modm-build-cortex-m-openocd` with OpenOCD

You can program ARM Cortex-M (STM32, SAMD, ...) targets using the `cortex-m-openocd.Dockerfile` image like this:

```
docker run -it --rm -v $PWD:$PWD --user $(id -u $USER) -e DIR=$PWD --device=/dev/bus/usb/003/007:/dev/bus/usb/003/007 ghcr.io/modm-ext/modm-build-cortex-m-openocd:latest /bin/bash -c 'cd $DIR && ls && scons program'
```

Where `$PWD` is your modm project directory and `/dev/bus/usb/003/007:/dev/bus/usb/003/007` is the device, where your programmer is located (for example `ST-LINK/V2.1`).


## Build images

```bash
make all -j4

# Push to ghcr.io
make push
```
