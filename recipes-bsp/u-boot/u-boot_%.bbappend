FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DESCRIPTION="Upstream's U-boot configured for sunxi devices"

COMPATIBLE_MACHINE = "(sun4i|sun5i|sun7i|sun8i)"

DEFAULT_PREFERENCE_sun8i="1"

SRC_URI += "file://boot.cmd \
            file://001-added-cherrypi-v3s-moudle-dts-defconfig.patch \
           "

UBOOT_ENV_SUFFIX = "scr"
UBOOT_ENV = "boot"

do_compile:append() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${UNPACKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
