FROM ubuntu:rolling

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install dput jq python3 && \
    rm -r /var/cache/apt/archives /var/lib/apt/lists

ADD bin /opt/resource
