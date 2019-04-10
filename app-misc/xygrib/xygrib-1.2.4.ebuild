# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="XyGrib is a Grib file reader and visualizes meteorological data."
HOMEPAGE="https://opengribs.org"
SRC_URI="https://github.com/opengribs/XyGrib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/bzip2
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	media-libs/libpng:*
	sci-libs/libnova
	sci-libs/proj
	sys-libs/zlib
	x11-libs/qwt:6[qt5(+)]"
RDEPEND="${DEPEND}"
BDPEND=""

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}


