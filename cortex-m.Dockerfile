FROM modm/modm-build:base
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de"
LABEL Description="Image for building and debugging modm for ARM Cortex-M"

RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 | tar -xj -C /opt

ENV PATH "/opt/gcc-arm-none-eabi-9-2020-q2-update/bin:$PATH"
