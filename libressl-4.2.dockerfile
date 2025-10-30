FROM alpine

WORKDIR /tmp/libressl

RUN apk add --no-cache \
        bash \
        g++ \
        gcc \
        libc-dev \
        linux-headers \
        make \
        perl \
        pkgconf

ADD https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.2.1.tar.gz libressl-src.tar.gz

RUN tar \
        --extract \
        --file libressl-src.tar.gz \
        --strip 1 \
    && ./config \
        --openssldir=/srv/libressl \
        --prefix=/build/libressl \
        -static \
        no-tests \
        no-apps \
    && make -j \
    && make install_sw

WORKDIR /build/libressl

RUN rm -rf /tmp/libressl

ENV PKG_CONFIG_PATH=/build/libressl/lib64/pkgconfig/:/build/libressl/lib/pkgconfig/

LABEL org.opencontainers.image.source=https://github.com/woodruffw/openssl-dockerfiles
LABEL org.opencontainers.image.description="Dockerfiles for some versions of OpenSSL. Not suitable for production use."
