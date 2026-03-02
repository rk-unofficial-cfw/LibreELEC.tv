# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bluez-alsa"
PKG_VERSION="6f70074dbed8fd343da1a2cad34ad478d6e03fba"
PKG_SHA256="c507492922ce5198f6ce39f9e3c607c95afafcd821892282127f9e11c56d8253"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Arkq/bluez-alsa"
PKG_URL="https://github.com/Arkq/bluez-alsa/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain dbus alsa sbc bluez"
PKG_LONGDESC="A free software implementation of an IEEE 802.11i supplicant."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET=" --enable-cli \
		  --enable-systemd \
		  --enable-upower \
		  --disable-aplay --with-alsaplugindir=/usr/lib/alsa "

post_install() {
  enable_service bluealsa.service
}
