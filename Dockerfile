FROM modm/arm-none-eabi-gcc:latest
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>"
LABEL Description="Image for building and debugging modm for ARM and AVR from git"
WORKDIR /work

ADD requirements3.txt /work

ENV LANG="en_US.UTF-8"
ENV SCONSFLAGS="-j4"

ENV TZ=Europe/Berlin
ARG DEBIAN_FRONTEND=noninteractive

# Install any needed packages specified in requirements.txt
RUN apt-get update -qq && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq \
      python3 \
      python3-dev \
      python3-pip \
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
      curl && \
    apt-get clean -qq
RUN locale-gen en_US.UTF-8 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    update-alternatives --set python /usr/bin/python3.8
RUN pip3 install -r requirements3.txt && rm requirements3.txt
RUN wget -qO- https://github.com/modm-ext/docker-avr-gcc/releases/download/v10.2.0/avr-gcc.tar.bz2 | tar xj -C /opt
RUN mkdir /opt/doxypress && \
    wget -qO- https://download.copperspice.com/doxypress/binary/doxypress-1.4.0-ubuntu20.04-x64.tar.bz2 | tar xj -C /opt/doxypress

ENV PATH "/opt/doxypress:/opt/avr-gcc/avr-gcc/bin:/opt/avr-gcc/avr-binutils/bin:$PATH"
