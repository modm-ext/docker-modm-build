# Doxypress built from source with the patches in doxypress/ applied, because the upstream
# v2.1.0 binary is not optimized and needs several fixes to generate the modm docs.
# FIXME: Remove this stage and the patches once a Doxypress release contains the fixes.
FROM ubuntu:24.04 AS doxypress
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && \
    apt-get install -y -qq build-essential cmake ninja-build git wget bzip2 zlib1g-dev libzstd-dev
RUN mkdir /opt/copperspice /opt/clang && \
    wget -qO- https://github.com/copperspice/copperspice/releases/download/cs-2.1.0/copperspice-2.1.0-ubuntu24.04-x64.tar.bz2 | tar xj -C /opt/copperspice && \
    wget -qO- https://download.copperspice.com/doxypress/libClang/clang-18.1.8-ubuntu24.04-x64.tar.bz2 | tar xj -C /opt/clang
ADD doxypress /patches
RUN git clone -q --depth 1 --branch dp-2.1.0 https://github.com/copperspice/doxypress.git /doxypress && \
    cd /doxypress && git apply /patches/*.patch && ln -s /opt/clang/clang_lib clang_lib && \
    cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_PREFIX_PATH=/opt/copperspice && \
    ninja -C build

FROM ubuntu:24.04
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL description="Image for building and debugging modm"
LABEL org.opencontainers.image.source=https://github.com/modm-ext/docker-modm-build

WORKDIR /work

ADD requirements3.txt /work

ENV LANG="en_US.UTF-8"
ENV SCONSFLAGS="-j4"
ENV MAKEFLAGS="-j4"

ENV TZ=Europe/Berlin
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq \
      build-essential \
      gcc g++ \
      git \
      bzip2 \
      wget \
      python3 \
      python3-dev \
      python3-pip \
      python-is-python3 \
      libboost-all-dev \
      libsdl1.2-dev \
      libsdl-image1.2-dev \
      libgtkmm-2.4-dev \
      libmpc-dev \
      libmpfr-dev \
      libgmp-dev \
      cmake \
      locales \
      texlive-latex-base \
      texlive-fonts-recommended \
      doxygen \
      graphviz \
      curl \
      gnupg2 \
      libncursesw6 \
      clang-format && \
    apt-get clean -qq
RUN locale-gen en_US.UTF-8
RUN pip3 install --break-system-packages -r requirements3.txt && rm requirements3.txt
RUN mkdir /opt/doxypress && \
    wget -qO- https://github.com/copperspice/doxypress/releases/download/dp-2.1.0/doxypress-2.1.0-ubuntu24.04-x64.tar.bz2 | tar xj -C /opt/doxypress
# Keep the libraries of the release, only replace the binary
COPY --from=doxypress /doxypress/build/bin/doxypress /opt/doxypress/doxypress

ENV PATH="/opt/doxypress:$PATH"
