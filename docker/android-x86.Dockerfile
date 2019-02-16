FROM cross-compiler:base

ENV CROSS_TRIPLE i686-linux-android
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN apt-get update && apt-get install -y python

ENV NDK android-ndk-r14b

# Local testing, uncomment below and comment wget
# COPY files/${NDK}-linux-x86_64.zip /build/

RUN set -ex && \
    mkdir -p /build && \
    cd build && \
    wget -nv https://dl.google.com/android/repository/${NDK}-linux-x86_64.zip && \
    unzip ${NDK}-linux-x86_64.zip 1>log 2>err && \
    cd ${NDK} && \
    ./build/tools/make_standalone_toolchain.py --arch=x86 --api=21 --install-dir=${CROSS_ROOT} && \
    cd /build && mv ${NDK} /usr/ && \
    cd / && rm -rf /build

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc
