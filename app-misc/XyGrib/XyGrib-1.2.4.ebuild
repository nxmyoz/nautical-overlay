# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="XyGrib is a Grib file reader and visualizes meteorological data."
HOMEPAGE="https://opengribs.org"
SRC_URI="https://github.com/opengribs/XyGrib/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/opengribs/XyGrib/raw/master/linux_online_installer/packages/org.opengribs.xygrib.core.linux/data/icons/xyGrib_32.png -> ${PN}-icon.png
	maps?   (
		https://github.com/opengribs/XyGrib/releases/download/v1.1.1/XyGrib___High_Resolution_Maps.tar.gz -> ${PN}-High_Resolution_Maps-1.1.1.tar.gz
		https://github.com/opengribs/XyGrib/releases/download/v1.1.1/XyGrib___cities_files.tar.gz -> ${PN}-cities-1.1.1.tar.gz
	)"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="maps"

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
	#if use maps; then
	#	unpack "${DISTDIR}/${PN}-High_Resolution_Maps-1.1.1.tar.gz"
	#fi
	sed -i 's,set(PREFIX_BIN ${PROJECT_NAME}),set(PREFIX_BIN ""),' CMakeLists.txt
	sed -i 'set(PREFIX_PKGDATA ${PROJECT_NAME}),set(PREFIX_PKGDATA share/${PROJECT_NAME}),' CMakeLists.txt
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	doicon -s 32 "${DISTDIR}/${PN}-icon.png"
	domenu "${FILESDIR}/xygrib.desktop"

	#if use maps; then
	#	insinto "/usr/share/${PN}"

}


