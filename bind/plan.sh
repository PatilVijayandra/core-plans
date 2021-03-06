pkg_name=bind
pkg_origin=core
pkg_version=9.16.0
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="Versatile, Classic, Complete Name Server Software"
pkg_upstream_url="https://www.isc.org/downloads/bind/"
pkg_license=("MPL-2.0")
pkg_source="https://ftp.isc.org/isc/bind9/${pkg_version}/bind-${pkg_version}.tar.xz"
pkg_shasum=af4bd9bdaeb1aa7399429972f3a8aa01dd6886b7ae046d703ab8da45330f2e28
pkg_deps=(
  core/glibc
  core/libxml2
  core/openssl
  core/zlib
  core/libcap
  core/busybox-static
  core/python
  core/libuv
)
pkg_build_deps=(
  core/diffutils
  core/file
  core/gcc
  core/make
  core/perl
  core/pkg-config
)
pkg_bin_dirs=(
  bin
  sbin
)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

ply_version="3.11"

do_prepare() {
  # The configure script expects `file` binaries to be in `/usr/bin`
  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi

  pip install \
    --target "${pkg_prefix}/pip" \
    --ignore-installed \
    "ply==${ply_version}"
}

do_build() {
  PYTHONPATH="${pkg_prefix}/pip"
  export PYTHONPATH
  ./configure \
    --prefix="${pkg_prefix}" \
    --with-openssl="$(pkg_path_for "core/openssl")" \
    --with-python="$(pkg_path_for core/python)/bin/python"
  make
}

do_end() {
  # Clean up
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
