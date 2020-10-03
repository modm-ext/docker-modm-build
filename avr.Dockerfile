FROM modm/modm-build:base
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de"
LABEL Description="Image for building and debugging modm for AVR"

RUN wget -qO- https://github.com/modm-ext/docker-avr-gcc/releases/download/v10.2.0/avr-gcc.tar.bz2 | tar xj -C /opt

ENV PATH "/opt/avr-gcc/avr-gcc/bin:/opt/avr-gcc/avr-binutils/bin:$PATH"
