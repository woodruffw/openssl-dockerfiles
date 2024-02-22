# openssl-dockerfiles

Dockerfiles and images (on GHCR) for a few versions of OpenSSL.

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
