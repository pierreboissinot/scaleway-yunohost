## -*- docker-image-name: "scaleway/yunohost:latest" -*-
FROM scaleway/debian:x86_64-latest

MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter

RUN echo "APT::Install-Recommends "0"; \nAPT::Install-Suggests "0";" > /etc/apt/apt.conf.d/60recommends

RUN apt-get update &&\
    apt-get dist-upgrade -y &&\
    apt-get install -y apt-transport-https curl

# Run yunohost install
RUN curl https://install.yunohost.org | bash

# Patch rootfs
COPY ./overlay/ /

RUN update-rc.d firstboot defaults
RUN rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

# Export port for container-based runtime
EXPOSE 80 443

# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
