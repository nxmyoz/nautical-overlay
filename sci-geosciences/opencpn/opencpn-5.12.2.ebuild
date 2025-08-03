# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"
inherit cmake wxwidgets

if [[ "${PV}" == 9999 ]] || [[ ${PV} = *_beta* ]] || [[ ${PV} = *_rc* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/OpenCPN/OpenCPN.git"

	if [[ ${PV} = *_beta* ]]; then
		EGIT_COMMIT=""
	fi

	if [[ ${PV} = *_rc* ]]; then
		EGIT_COMMIT=""
	fi

else
	SRC_URI="https://github.com/OpenCPN/OpenCPN/archive/refs/tags/Release_${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="a free, open source software for marine navigation"
HOMEPAGE="https://opencpn.org/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lzma +opengl gles-shim +garminhost +gshhs +tcdata +docs +portaudio sndfile +crashreport"

REQUIRED_USE="^^ ( portaudio sndfile )"

RDEPEND="
	app-arch/bzip2
	lzma? ( app-arch/xz-utils )
	dev-libs/tinyxml
	media-libs/freetype:2
	portaudio? ( media-libs/portaudio )
	net-misc/curl
	sys-libs/zlib
	opengl? ( virtual/opengl )
	media-libs/glew
	dev-libs/rapidjson
	dev-cpp/gtest
	x11-libs/gtk+:3
	x11-libs/wxGTK:3.2-gtk3[X]
	sci-libs/shapelib
"

DEPEND="
	${RDEPEND}
	sys-devel/gettext
"

MY_PN="OpenCPN"

if [[ "${PV}" == 9999 ]] || [[ ${PV} = *_beta* ]] || [[ ${PV} = *_rc* ]]; then
	S="${WORKDIR}/${P}"
else
	S="${WORKDIR}/${MY_PN}-Release_${PV}"
fi

src_prepare() {
	setup-wxwidgets
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOCPN_USE_GARMINHOST="$(usex garminhost)"
		-DOCPN_BUNDLE_GSHHS="$(usex gshhs)"
		-DOCPN_BUNDLE_TCDATA="$(usex tcdata)"
		-DOCPN_BUNDLE_DOCS="$(usex docs)"
		-DOCPN_USE_GL="$(usex opengl)"
		-DOCPN_USE_GLES_SHIM="$(usex gles-shim)"
		-DOCPN_USE_LZMA="$(usex lzma)"
		-DOCPN_ENABLE_PORTAUDIO="$(usex portaudio)"
		-DOCPN_ENABLE_SNDFILE="$(usex sndfile)"
		-DOCPN_USE_CRASHREPORT="$(usex crashreport)"
		-DSHAPELIB_INCLUDE_DIR="/usr/include/libshp"
		-DSHAPELIB_LIBRARY="/usr/lib64/libshp.so"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	doenvd "${FILESDIR}/99opencpn" || die "doenvd failed"
}
