# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC

PKG_NAME="optee-os"
PKG_VERSION="4.2.0"
PKG_SHA256="ce70f0d177001bf4855cd6cd6396f515af6126e4bba9b12c716a437a5cb40c7b"
PKG_ARCH="arm"
PKG_LICENSE="BSD-3c"
PKG_SITE="https://github.com/OP-TEE/optee_os"
PKG_URL="https://github.com/OP-TEE/optee_os/archive/refs/tags/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ARM Trusted Firmware is a reference implementation of secure world software, including a Secure Monitor executing at Exception Level 3 and various Arm interface standards."
PKG_TOOLCHAIN="manual"

[ -n "${KERNEL_TOOLCHAIN}" ] && PKG_DEPENDS_TARGET+=" gcc-${KERNEL_TOOLCHAIN}:host"

make_target() {
  CROSS_COMPILE="${TARGET_KERNEL_PREFIX}" LDFLAGS="" CFLAGS="" make CFG_CRYPTO=n CFG_REE_FS=n CFG_BUILD_IN_TREE_TA=y CFG_WITH_USER_TA=n PLATFORM=${OPTEE_PLATFORM} 
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/bootloader
  cp -a out/*/core/${ATF_BL31_BINARY:-tee-raw.bin} ${INSTALL}/usr/share/bootloader
}
