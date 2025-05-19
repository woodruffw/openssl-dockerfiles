FROM alpine

WORKDIR /tmp/openssl

RUN apk add --no-cache \
        bash \
        g++ \
        gcc \
        libc-dev \
        linux-headers \
        make \
        perl \
        pkgconf

ADD https://github.com/openssl/openssl/releases/download/openssl-3.1.8/openssl-3.1.8.tar.gz openssl-src.tar.gz

RUN tar \
        --extract \
        --file openssl-src.tar.gz \
        --strip 1 \
    && ./config \
        --openssldir=/srv/openssl \
        --prefix=/build/openssl \
        -static \
        no-tests \
    && make -j \
    && make install_sw

WORKDIR /build/openssl

RUN rm -rf /tmp/openssl

ENV PKG_CONFIG_PATH=/build/openssl/lib64/pkgconfig/:/build/openssl/lib/pkgconfig/

LABEL org.opencontainers.image.source=https://github.com/woodruffw/openssl-dockerfiles
LABEL org.opencontainers.image.description="Dockerfiles for some versions of OpenSSL. Not suitable for production use."
