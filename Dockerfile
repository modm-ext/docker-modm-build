FROM stronglytyped/arm-none-eabi-gcc
MAINTAINER Sascha Schade (strongly-typed) <stronglytyp3d@gmail.com>
LABEL Description="Image for building and debugging xpcc for ARM from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
# Development files
      scons \
      python \
      python-dev \
      python-pip \
      libboost-all-dev \
      libsdl1.2-dev \
      libsdl-image1.2-dev \
      libgtkmm-2.4-dev \
      libzmqpp-dev && \
    apt clean && \
    pip install -r requirements.txt
