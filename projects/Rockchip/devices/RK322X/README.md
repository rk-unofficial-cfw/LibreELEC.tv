Build native

BUILDER_NAME=ilmich BUILD_PERIODIC=nightly PROJECT=Rockchip DEVICE=RK322X ARCH=arm UBOOT_SYSTEM=rk322x make image

Build with docker

* create docker image
  docker build --pull -t libreelec tools/docker/noble

* build image
  docker run -it --rm --log-driver none -v `pwd`:/build -w /build -e BUILDER_NAME=ilmich -e BUILD_PERIODIC=nightly -e PROJECT=Rockchip -e DEVICE=RK322X -e ARCH=arm -e UBOOT_SYSTEM=rk322x libreelec make image

