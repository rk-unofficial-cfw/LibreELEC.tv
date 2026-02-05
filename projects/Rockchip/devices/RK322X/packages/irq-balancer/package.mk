# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="irq-balancer"
PKG_VERSION="1.0"
PKG_LICENSE="GPLv2"
PKG_LONGDESC="irq-balancer: script that config irqs"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp ${PKG_DIR}/scripts/irq-balancer ${INSTALL}/usr/bin
}

post_install() {
  enable_service irq-balancer.service
}
