# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0 OR ISC

FROM alpine

WORKDIR /tmp

RUN apk add --no-cache \
    cmake \
    g++ \
    gcc \
    libc-dev \
    ninja \
    perl \
    pkgconf \
    git \
    go \
    make \
    linux-headers

RUN git clone --depth 1 --branch v1.71.0 https://github.com/aws/aws-lc.git

WORKDIR /tmp/aws-lc

RUN cmake -G Ninja -B build \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_PREFIX=/build/aws-lc \
        -DBUILD_TESTING=OFF && \
    ninja -C build install

WORKDIR /build/aws-lc

RUN rm -rf /tmp/aws-lc

ENV PKG_CONFIG_PATH=/build/aws-lc/lib/pkgconfig/

LABEL org.opencontainers.image.source=https://github.com/woodruffw/openssl-dockerfiles
LABEL org.opencontainers.image.description="Dockerfiles for some versions of OpenSSL. Not suitable for production use."
