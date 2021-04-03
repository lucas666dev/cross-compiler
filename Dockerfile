FROM debian:stretch

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https gnupg ca-certificates \
    curl wget \
    pkg-config build-essential make cmake automake autogen libtool \
    libpcre3-dev bison yodl \
    tar xz-utils bzip2 gzip unzip \
    git \
    file \
    rsync \
    upx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
