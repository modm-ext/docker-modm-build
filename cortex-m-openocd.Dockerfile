FROM ghcr.io/modm-ext/modm-build-cortex-m:TAG
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL Description="Image for building, debugging and programming modm for ARM Cortex-M with OpenOCD"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

RUN wget -qO- https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.12.0-1/xpack-openocd-0.12.0-1-linux-x64.tar.gz | tar -xvz -C /opt

ENV PATH "/opt/xpack-openocd-0.12.0-1/bin:$PATH"
