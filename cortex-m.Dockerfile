FROM ghcr.io/modm-ext/modm-build-base:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for ARM Cortex-M"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v12.3.1-1.1/xpack-arm-none-eabi-gcc-12.3.1-1.1-linux-x64.tar.gz | tar -xz -C /opt

ENV PATH "/opt/xpack-arm-none-eabi-gcc-12.3.1-1.1/bin:$PATH"
