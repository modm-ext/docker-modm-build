# docker-modm-build

Docker containers for building modm for different architectures:

* ARM Cortex-M (STM32, SAMD, ...): `docker pull ghcr.io/modm-ext/modm-build-cortex-m:latest`
* Atmel/Microchip AVR: `docker pull ghcr.io/modm-ext/modm-build-avr:latest`
* RISC-V: `docker pull ghcr.io/modm-ext/modm-build-risc-v:latest`
* Hosted (Linux): `docker pull ghcr.io/modm-ext/modm-build-base:latest`

## Build images

```bash
make all -j4

# Push to ghcr.io
make push
```
