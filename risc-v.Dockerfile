FROM ghcr.io/modm-ext/modm-build-base:latest
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de"
LABEL Description="Image for building and debugging modm for RISC-V"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://github.com/modm-io/riscv-gcc/releases/download/v11.1.0/modm-riscv-gcc.tar.bz2 | tar xj -C /opt

ENV PATH "/opt/modm-riscv-gcc/bin:$PATH"
