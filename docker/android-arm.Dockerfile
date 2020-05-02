ARG BASE_TAG=latest
FROM i96751414/cross-compiler-base:${BASE_TAG}

ENV CROSS_TRIPLE arm-linux-androideabi
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN apt-get update && apt-get install -y python

ENV NDK android-ndk-r20
ENV ANDROID_NDK_API 21
ENV ANDROID_ARCH arm

# Local testing, uncomment below and comment wget
# COPY files/${NDK}-linux-x86_64.zip /build/

COPY scripts/build_android_toolchain.sh /tmp
RUN ./tmp/build_android_toolchain.sh

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-clang ${CROSS_TRIPLE}-cc
