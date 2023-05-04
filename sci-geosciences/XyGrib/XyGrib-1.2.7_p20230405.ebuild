# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop eutils

MY_VERSION="88c425ca2d7f4ba5d7ab75bfa25e177bee02d310"

DESCRIPTION="XyGrib is a Grib file reader and visualizes meteorological data."
HOMEPAGE="https://opengribs.org"
SRC_URI="https://github.com/opengribs/XyGrib/archive/${MY_VERSION}.tar.gz -> ${P}.tar.gz
	https://github.com/opengribs/XyGrib/raw/master/debian/xygrib.png -> ${PN}-icon.png
	maps?   (
		https://github.com/opengribs/XyGrib/releases/download/v1.1.1/XyGrib___High_Resolution_Maps.tar.gz -> ${PN}-High_Resolution_Maps-1.1.1.tar.gz
		https://github.com/opengribs/XyGrib/releases/download/v1.1.1/XyGrib___cities_files.tar.gz -> ${PN}-cities-1.1.1.tar.gz
	)"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+maps"

DEPEND="app-arch/bzip2
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	media-libs/libpng:*
	media-libs/openjpeg:*
	sci-libs/libnova
	sci-libs/proj
	sys-libs/zlib
	x11-libs/qwt:6[qt5(+)]"
RDEPEND="${DEPEND}"
BDPEND=""

PATCHES=(
	"${FILESDIR}/locations.patch"
	"${FILESDIR}/openjpeg-2.5.patch"
	"${FILESDIR}/proj8-fixup.patch"
	"${FILESDIR}/qt-deprecated-api.patch"
)

S="${WORKDIR}/${PN}-${MY_VERSION}"

src_unpack() {
	unpack ${A}

	if use maps; then
		cd "${WORKDIR}"
		mv data/data/maps/gshhs gshhs
		mkdir gis
		mv cities*.gz gis
	fi
}

src_configure() {
	sed -i 's,set(PREFIX_BIN ${PROJECT_NAME}),set(PREFIX_BIN ""),' CMakeLists.txt
	sed -i 's,set(PREFIX_PKGDATA ${PROJECT_NAME}),set(PREFIX_PKGDATA "share/${PROJECT_NAME}"),' CMakeLists.txt
	cmake_src_configure
}

src_install() {
	cmake_src_install
	doicon -s 32 "${DISTDIR}/${PN}-icon.png"
	domenu "${FILESDIR}/xygrib.desktop"

	if use maps; then
		insinto "/usr/share/${PN}/data/maps"
		doins -r "${WORKDIR}/gshhs"

		insinto "/usr/share/$PN}/data"
		doins -r "/${WORKDIR}/gis"
	fi
}
