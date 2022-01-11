FROM ghcr.io/modm-ext/modm-build-base:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for AVR"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://github.com/modm-io/avr-gcc/releases/download/v11.2.0/modm-avr-gcc.tar.bz2 | tar xj -C /opt

ENV PATH "/opt/avr-gcc/bin:$PATH"
