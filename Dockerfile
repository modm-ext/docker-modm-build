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
      python-pip && \
    apt clean && \
    pip install -r requirements.txt
