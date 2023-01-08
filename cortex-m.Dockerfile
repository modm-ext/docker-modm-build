FROM ghcr.io/modm-ext/modm-build-base:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for ARM Cortex-M"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz | tar -xJ -C /opt

ENV PATH "/opt/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi/bin:$PATH"
