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
    linux-headers

RUN git clone "https://boringssl.googlesource.com/boringssl"

WORKDIR /tmp/boringssl

RUN cmake -G Ninja -B build \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_PREFIX=/build/boringssl && \
    ninja -C build install

WORKDIR /build/boringssl

RUN rm -rf /tmp/boringssl

LABEL org.opencontainers.image.source=https://github.com/woodruffw/openssl-dockerfiles
LABEL org.opencontainers.image.description="Dockerfiles for some versions of OpenSSL. Not suitable for production use."
