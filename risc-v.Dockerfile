FROM modm/modm-build:base
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de"
LABEL Description="Image for building and debugging modm for RISC-V"

RUN wget -qO- https://github.com/modm-ext/riscv-gcc/releases/download/v10.2.0/modm-riscv-gcc.tar.bz2 | tar xj -C /opt

ENV PATH "/opt/modm-riscv-gcc/bin:$PATH"
