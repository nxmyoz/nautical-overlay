# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0"
inherit cmake-utils wxwidgets

if [[ ${PV} = *_beta* ]] || [[ ${PV} = *_rc* ]] ; then
	MY_PV="V${PV/_beta/_Beta}"
	#MY_PV="${MY_PV/_rc/RC}"
else
	MY_PV="v${PV}"
fi


DESCRIPTION="a free, open source software for marine navigation"
HOMEPAGE="https://opencpn.org/"
SRC_URI="https://github.com/OpenCPN/OpenCPN/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
shom? ( https://github.com/nxmyoz/distfiles/raw/master/shom-color-palette.tar.gz )
"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lzma opengl shom"

RDEPEND="
	app-arch/bzip2
	lzma? ( app-arch/xz-utils )
	dev-libs/tinyxml
	media-libs/freetype:2
	media-libs/portaudio
	net-misc/curl
	sys-libs/zlib
	opengl? ( virtual/opengl )
	x11-libs/gtk+:2
	x11-libs/wxGTK:${WX_GTK_VER}[X]
"

DEPEND="
	${RDEPEND}
	sys-devel/gettext
"

#S="${WORKDIR}/OpenCPN-${MY_PV}"
S="${WORKDIR}"

#PATCHES=(
#	"${FILESDIR}/wxWidgets.patch"
#)

src_prepare() {
	default
	cmake-utils_src_prepare
}

src_configure() {
	setup-wxwidgets
	local mycmakeargs=(
		-DUSE_S57=ON
		-DUSE_GARMINHOST=ON
		-DBUNDLE_GSHHS=CRUDE
		-DBUNDLE_TCDATA=ON
	)

	cmake-utils_src_configure
}

src_install() {
	if use shom; then
		cp -rf "${WORKDIR}/shom-color-palette/chartsymbols_O4.2.xml" \
			"${S}/data/s57data/chartsymbols.xml"
	fi

	cmake-utils_src_install

	doenvd "${FILESDIR}/99opencpn" || die "doenvd failed"
}

pkg_postinst() {
	if use doc; then
		einfo "Documentation is available at file:///usr/share/doc/${PF}/html/help_en_US.html"
	fi
}
