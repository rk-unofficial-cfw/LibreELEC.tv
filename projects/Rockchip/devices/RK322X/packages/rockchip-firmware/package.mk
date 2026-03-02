# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rockchip-firmware"
PKG_VERSION="firmware"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/rockchip-linux"
PKG_URL=""
PKG_DEPENDS_TARGET="rkbin"
PKG_LONGDESC="rockchip firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
    mkdir -p $INSTALL/$(get_full_firmware_dir)/{ssv6051,rtl_bt,brcm}

    cp -v $(get_build_dir rkbin)/firmware/wifi/ssv6051-sw.bin $INSTALL/$(get_full_firmware_dir)/
    cp -v $(get_build_dir rkbin)/firmware/wifi/ssv6051-wifi.cfg $INSTALL/$(get_full_firmware_dir)/
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/rtl8723cs_xx_config.bin $INSTALL/$(get_full_firmware_dir)/rtl_bt
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/rtl8723cs_xx_fw.bin $INSTALL/$(get_full_firmware_dir)/rtl_bt
    cp -v $(get_build_dir rkbin)/firmware/wifi/eagle_fw_ate_config_v19.bin $INSTALL/$(get_full_firmware_dir)/
    cp -v $(get_build_dir rkbin)/firmware/wifi/eagle_fw_first_init_v19.bin $INSTALL/$(get_full_firmware_dir)/
    cp -v $(get_build_dir rkbin)/firmware/wifi/eagle_fw_second_init_v19.bin $INSTALL/$(get_full_firmware_dir)/
    cp -v $(get_build_dir rkbin)/firmware/wifi/brcmfmac43342-sdio.bin $INSTALL/$(get_full_firmware_dir)/brcm/brcmfmac43342-sdio.bin
    cp -v $(get_build_dir rkbin)/firmware/wifi/brcmfmac43342-sdio.txt $INSTALL/$(get_full_firmware_dir)/brcm/brcmfmac43342-sdio.txt
}
