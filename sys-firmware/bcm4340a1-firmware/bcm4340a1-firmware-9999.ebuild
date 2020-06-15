# Copyright (c) 2017 sakaki <sakaki@deciban.com>
# Copyright (c) 2020 nxmyoz <nxmyoz@gmail.com>
# License: GPL v3+
# NO WARRANTY

EAPI=7
inherit git-r3

KEYWORDS="~arm ~arm64"

DESCRIPTION="Firmware for integrated bluetooth on the Raspberry Pi 3"
HOMEPAGE="https://aur.archlinux.org/packages/pi-bluetooth/"
SRC_URI=""
LICENSE="Broadcom"
SLOT="0"
IUSE=""
RESTRICT="mirror binchecks strip"

EGIT_REPO_URI="https://github.com/RPi-Distro/bluez-firmware.git"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default

	rm -rf configure*
	rm -rf Makefile*
	rm -rf aclocal.m4
	rm -rf install-sh
}

src_install() {
	insinto "/etc/firmware"
	doins broadcom/BCM43430A1.hcd
	doins broadcom/BCM4345C0.hcd
	dodoc broadcom/BCM-LEGAL.txt
}


