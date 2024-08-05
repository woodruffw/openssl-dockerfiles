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

OpenSSL is licensed under the [OpenSSL License](https://spdx.org/licenses/OpenSSL.html)
prior to 3.0, and under Apache 2.0 afterwards.

[BoringSSL is licensed] partially under the OpenSSL License and partially
under the ISC license.

[LibreSSL is licensed] partially under the OpenSSL license, partially under
the ISC license, or placed into the public domain.

[BoringSSL is licensed]: https://github.com/google/boringssl/blob/master/LICENSE

[LibreSSL is licensed]: https://github.com/libressl/openbsd/blob/master/src/lib/libssl/LICENSE
