# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="go"
PKG_VERSION="1.24.0"
PKG_SHA256="4f47402534b970bcf9f92a7af40de20f77ed7c1a295c5aec650b0f1e52c5e026"
PKG_LICENSE="BSD"
PKG_SITE="https://golang.org"
PKG_URL="https://github.com/golang/go/archive/${PKG_NAME}${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_LONGDESC="An programming language that makes it easy to build simple, reliable, and efficient software."
PKG_TOOLCHAIN="manual"

configure_host() {
  export GOROOT_FINAL=${TOOLCHAIN}/lib/golang
  if [ -x /usr/local/go/bin/go ]; then
    export GOROOT_BOOTSTRAP=/usr/local/go
  elif [ -x /usr/lib/go/bin/go ]; then
    export GOROOT_BOOTSTRAP=/usr/lib/go
  else
    export GOROOT_BOOTSTRAP=/usr/lib/golang
  fi

  if [ ! -d ${GOROOT_BOOTSTRAP} ]; then
    cat <<EOF
####################################################################
# On Fedora 'dnf install golang' will install go to /usr/lib/golang
#
# On Ubuntu you need to install golang:
# $ sudo apt install golang-go
####################################################################
EOF
    return 1
  fi
}

make_host() {
  cd ${PKG_BUILD}/src
  bash make.bash --no-banner
}

pre_makeinstall_host() {
  # need to cleanup old golang version when updating to a new version
  rm -rf ${TOOLCHAIN}/lib/golang
}

makeinstall_host() {
  mkdir -p ${TOOLCHAIN}/lib/golang
  cp -av ${PKG_BUILD}/* ${TOOLCHAIN}/lib/golang/
}
