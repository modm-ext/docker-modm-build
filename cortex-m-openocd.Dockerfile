FROM ghcr.io/modm-ext/modm-build-cortex-m:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>, Nick Fiege <nickfiege999@gmail.com>"
LABEL Description="Image for building, debugging and programming modm for ARM Cortex-M"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-3/xpack-openocd-0.11.0-3-linux-x64.tar.gz | tar -xvz -C /opt

ENV PATH "/opt/xpack-openocd-0.11.0-3/bin:$PATH"
