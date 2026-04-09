# openssl-dockerfiles

Dockerfiles and images (on GHCR) for a few versions of OpenSSL (and forks).

These builds are not suitable for production use. They are for testing
purposes. If you use them in production, you will have a very bad time.

## Constraints

These Dockerfiles produce library builds of OpenSSL only.

* No tests are built or run.
* No OpenSSL "apps" (e.g. the `openssl` binary) are built or run, if the OpenSSL
  version allows them to be disabled at build-time.

## Licensing

The Dockerfiles themselves are licensed under Apache 2.0.

See OpenSSL and its forks for specific licensing terms:

- [OpenSSL](https://github.com/openssl/openssl/blob/master/LICENSE.txt)
- [BoringSSL](https://github.com/google/boringssl/blob/master/LICENSE)
- [LibreSSL](https://github.com/libressl/openbsd/blob/master/src/lib/libssl/LICENSE)
- [AWS-LC](https://github.com/aws/aws-lc/blob/main/LICENSE)
