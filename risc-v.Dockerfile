FROM ghcr.io/modm-ext/modm-build-base:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for RISC-V"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://buildbot.embecosm.com/job/riscv32-gcc-ubuntu2204-release/4/artifact/riscv32-embecosm-ubuntu2204-gcc12.2.0.tar.gz | tar xz -C /opt

ENV PATH "/opt/riscv32-embecosm-ubuntu2204-gcc12.2.0/bin:$PATH"
