# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="git://git.denx.de/u-boot.git"

if [[ ${PV} = 9999 ]]; then
        GIT_ECLASS="git-r3"
fi

inherit ${GIT_ECLASS}

DESCRIPTION="Mainline U-Boot for Raspberry Pi"
HOMEPAGE="https://www.denx.de/wiki/U-Boot"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND="
	sys-apps/dtc
	dev-lang/python:3
"

RDEPEND="${DEPEND}"


if [[ ${PV} == 9999 ]] ; then
	SRC_URI=""
else
	MY_PV=${PV/_/-}
	SRC_URI="ftp://ftp.denx.de/pub/u-boot/u-boot-${MY_PV}.tar.bz2"
	S=${WORKDIR}/u-boot-${MY_PV}
	KEYWORDS="~arm ~arm64"
fi

src_compile() {
	emake rpi_3_defconfig
	emake
}

src_install() {
	dodir /boot
	insinto /boot

	newins u-boot.bin kernel8.img
}

