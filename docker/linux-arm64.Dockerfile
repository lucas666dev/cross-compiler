ARG BASE_TAG=latest
FROM i96751414/cross-compiler-base:${BASE_TAG}

RUN apt-get update --yes && apt-get install --no-install-recommends --yes \
        flex ncurses-dev gperf gawk texinfo help2man python-dev libtool-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY \
    scripts/install-crosstool-ng-toolchain.sh \
    crosstool-ng/linux-arm64.1.23.0.config \
    /tmp/

ENV XCC_PREFIX /usr/xcc
# Build and install the toolchain, cleaning up artifacts afterwards.
RUN cd /tmp \
    && /tmp/install-crosstool-ng-toolchain.sh -p "${XCC_PREFIX}" -c /tmp/*.config \
    && rm -rf /tmp/*

ENV CROSS_TRIPLE aarch64-unknown-linux-gnueabi
ENV CROSS_ROOT ${XCC_PREFIX}/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
