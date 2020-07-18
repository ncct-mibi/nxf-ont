# guppy_cpu image based on https://hub.docker.com/r/genomicpariscentre/guppy/dockerfile

# Set the base image to Ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Angel Angelov <aangeloo@gmail.com>

ARG PACKAGE_VERSION=4.0.14
ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt-get install --yes $BUILD_PACKAGES && \
    cd /tmp && \
    # https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_cpu_4.0.14-1~xenial_amd64.deb
    wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_cpu_${PACKAGE_VERSION}-1~xenial_amd64.deb && \
    apt-get install --yes libzmq5 libhdf5-cpp-11 libcurl4-openssl-dev libssl-dev libhdf5-10 libboost-regex1.58.0 libboost-log1.58.0 libboost-atomic1.58.0 libboost-chrono1.58.0 libboost-date-time1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 libboost-iostreams1.58.0 && \
    dpkg -i *.deb && \
    rm *.deb && \
    apt-get autoremove --purge --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*