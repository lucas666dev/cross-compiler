ARG BASE_TAG=latest
FROM lucas666dev/cross-compiler-base:${BASE_TAG}

ENV CROSS_TRIPLE arm64-apple-darwin17
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH /usr/lib/llvm-4.0/lib:${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
ENV MAC_SDK_VERSION 12.3
ENV CMAKE_TOOLCHAIN_FILE /home/darwin.cmake

COPY cmake/darwin.cmake "${CMAKE_TOOLCHAIN_FILE}"

RUN echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-4.0 main" >> /etc/apt/sources.list \
    && wget --no-check-certificate -qO - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        clang-4.0 llvm-4.0-dev \
        lzma-dev libxml2-dev uuid-dev libssl-dev \
        python3 patch cpio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY "MacOSX${MAC_SDK_VERSION}.sdk.tar.bz2" "/tmp/osxcross/tarballs/MacOSX${MAC_SDK_VERSION}.sdk.tar.bz2"

RUN mkdir -p /tmp/osxcross \
    && curl -sSL "https://github.com/tpoechtrager/osxcross/archive/master.tar.gz" | tar -C /tmp/osxcross --strip=1 -xz \
    && ln -s /usr/bin/clang-4.0 /usr/bin/clang \
    && ln -s /usr/bin/clang++-4.0 /usr/bin/clang++ 

RUN SDK_VERSION=${MAC_SDK_VERSION} UNATTENDED=1 /tmp/osxcross/build.sh 
RUN mv /tmp/osxcross/target "${CROSS_ROOT}" \
    && mkdir -p "${CROSS_ROOT}/lib" \
    && rm -rf /tmp/osxcross
