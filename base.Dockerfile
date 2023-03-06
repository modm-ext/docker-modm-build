FROM ubuntu:22.04
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>, Raphael Lehmann <raphael+docker@rleh.de>, Christopher Durand <christopher.durand@rwth-aachen.de>"
LABEL description="Image for building and debugging modm"
LABEL org.opencontainers.image.source https://github.com/modm-ext/docker-modm-build

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
      gcc-12 g++-12 \
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
      clang-format-13 && \
    apt-get clean -qq
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 90 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-13 100
RUN locale-gen en_US.UTF-8
RUN pip3 install -r requirements3.txt && rm requirements3.txt
RUN mkdir /opt/doxypress && \
    wget -qO- https://github.com/copperspice/doxypress/releases/download/dp-1.5.1/doxypress-1.5.1-ubuntu22.04-x64.tar.bz2 | tar xj -C /opt/doxypress

ENV PATH "/opt/doxypress:$PATH"
