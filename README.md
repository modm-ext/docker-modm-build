# docker-modm-build

Docker containers for building modm for different architectures:

* ARM Cortex-M (STM32, SAMD, ...): `docker pull modm/modm-build:cortex-m`
* Atmel/Microchip AVR: `docker pull modm/modm-build:avr`
* RISC-V: `docker pull modm/modm-build:risc-v`
* Hosted (Linux): `docker pull modm/modm-build:base`

## Build images

```bash
make all -j4

# Push to dockerhub
make push -j4
```
