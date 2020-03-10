FROM modm/arm-none-eabi-gcc:latest
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for ARM and AVR from git"
WORKDIR /work

ADD . /work

ENV SCONS_LIB_DIR="/usr/local/lib/python3.7/dist-packages/scons"
ENV LANG="en_US.UTF-8"
ENV SCONSFLAGS="-j4"

# Install any needed packages specified in requirements.txt
RUN apt update -qq && \
    apt upgrade -y -qq && \
    apt install -y -qq \
      python3 \
      python3-dev \
      python3-pip \
      libboost-all-dev \
      libsdl1.2-dev \
      libsdl-image1.2-dev \
      libgtkmm-2.4-dev \
      libzmqpp-dev \
      libmpc-dev \
      libmpfr-dev \
      libgmp-dev \
      cmake \
      locales \
      texlive-latex-base \
      texlive-fonts-recommended \
      doxygen \
      graphviz \
      curl && \
    apt clean -qq && \
    locale-gen en_US.UTF-8 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1 && \
    update-alternatives --set python /usr/bin/python3.7 && \
    pip3 install -r requirements3.txt && \
    wget -qO- https://github.com/modm-ext/docker-avr-gcc/releases/download/v9.2.0/avr-gcc.tar.bz2 | tar xj && \
    mkdir doxypress && \
    wget -qO- https://download.copperspice.com/doxypress/binary/doxypress-1.3.7-ubuntu18.04-x64.tar.bz2 | tar xj -C doxypress

ENV PATH "/work/doxypress:/work/avr-gcc/avr-gcc/bin:/work/avr-gcc/avr-binutils/bin:$PATH"
