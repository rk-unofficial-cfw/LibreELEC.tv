# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bluealsa-autoconfig"
PKG_VERSION="c55a355beb9fe74c0b01fd21ece18120aeda433b"
PKG_SHA256="5739a284318ee114a24d6a66bad62e331bd8e7227a7c877a30956cdf2da25344"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Arkq/bluez-alsa"
PKG_URL="https://github.com/borine/bluealsa-autoconfig/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain bluez-alsa bash-completion"
PKG_LONGDESC="A free software implementation of an IEEE 802.11i supplicant."
PKG_TOOLCHAIN="meson"

PKG_MESON_OPTS_TARGET=" -Dc_link_args=-lbluetooth "

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/alsa/conf.d/
  cp -r ${PKG_DIR}/config/* ${INSTALL}/etc/alsa/conf.d/

  rm -rf ${INSTALL}/usr/lib/systemd
}

post_install() {
  enable_service bluealsa-autoconfig.service
}
