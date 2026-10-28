# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bluez-alsa"
PKG_VERSION="v5.0.0"
PKG_SHA256="e1249cbebd24925c977814f62adab71f2ebd771e28e6a4ac58bb1ac97ce3beb5"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Arkq/bluez-alsa"
PKG_URL="https://github.com/Arkq/bluez-alsa/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain dbus alsa sbc bluez"
PKG_LONGDESC="Package for direct integration between BlueZ and ALSA"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET=" --enable-cli \
		  --enable-systemd \
		  --enable-upower \
		  --disable-aplay --with-alsaplugindir=/usr/lib/alsa "

post_install() {
  enable_service bluealsa.service
}
