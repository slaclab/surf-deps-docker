FROM ubuntu:22.04

# Install system tools
RUN DEBIAN_FRONTEND=noninteractive \
   apt-get update && \
   apt-get install -y --no-install-recommends tzdata && \
   apt-get install -y \
   python3 \
   python3-dev \
   python3-pip \
   git \
   git-lfs \
   build-essential \
   tclsh \
   gtkwave \
   ghdl \
   locales

RUN pip3 install \
   cocotb \
   cocotbext-axi \
   cocotb-test \
   coverage \
   pytest \
   pytest-cov 

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

ARG uid
ARG user
RUN useradd -m -N --gid 0 --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs
RUN mkdir /myhome

USER ${user}
WORKDIR /u1/${user}

RUN git lfs install
