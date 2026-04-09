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

# HACK: manually copy libpki into the install prefix, since it's
# not part of a public API yet.
RUN cmake -G Ninja -B build \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_PREFIX=/build/boringssl && \
    ninja -C build pki install && \
    cp build/libpki.a /build/boringssl/lib

WORKDIR /build/boringssl

RUN rm -rf /tmp/boringssl

# HACK: generate a pkg-config file for libcrypto, since BoringSSL doesn't provide one.
RUN mkdir -p lib/pkgconfig && \
    echo 'prefix=/build/boringssl' > lib/pkgconfig/libcrypto.pc && \
    echo 'includedir=${prefix}/include' >> lib/pkgconfig/libcrypto.pc && \
    echo 'libdir=${prefix}/lib' >> lib/pkgconfig/libcrypto.pc && \
    echo '' >> lib/pkgconfig/libcrypto.pc && \
    echo 'Name: libcrypto' >> lib/pkgconfig/libcrypto.pc && \
    echo 'Description: BoringSSL crypto library' >> lib/pkgconfig/libcrypto.pc && \
    echo 'Version: 0.0.0' >> lib/pkgconfig/libcrypto.pc && \
    echo 'Libs: -L${libdir} -lcrypto -lpthread' >> lib/pkgconfig/libcrypto.pc && \
    echo 'Cflags: -I${includedir}' >> lib/pkgconfig/libcrypto.pc

ENV PKG_CONFIG_PATH=/build/boringssl/lib/pkgconfig/

LABEL org.opencontainers.image.source=https://github.com/woodruffw/openssl-dockerfiles
LABEL org.opencontainers.image.description="Dockerfiles for some versions of OpenSSL. Not suitable for production use."
