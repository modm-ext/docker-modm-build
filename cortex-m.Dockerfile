FROM ghcr.io/modm-ext/modm-build-base:latest
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de"
LABEL Description="Image for building and debugging modm for ARM Cortex-M"

RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 | tar -xj -C /opt

ENV PATH "/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH"
