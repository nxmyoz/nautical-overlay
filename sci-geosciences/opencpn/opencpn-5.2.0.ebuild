# Copyriglwx_gtk3u_auiht 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


WX_GTK_VER="3.0-gtk3"

inherit cmake-utils wxwidgets

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
	SRC_URI="https://github.com/OpenCPN/OpenCPN/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi


DESCRIPTION="a free, open source software for marine navigation"
HOMEPAGE="https://opencpn.org/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lzma +opengl gles-shim +garminhost +gshhs +tcdata +docs +force-gtk3 +portaudio sndfile +crashreport"

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
	x11-libs/gtk+:3
	x11-libs/wxGTK:${WX_GTK_VER}[X]
"

DEPEND="
	${RDEPEND}
	sys-devel/gettext
"

if [[ "${PV}" == 9999 ]] || [[ ${PV} = *_beta* ]] || [[ ${PV} = *_rc* ]]; then
	S="${WORKDIR}/${P}"
else
	S="${WORKDIR}/${P}"
fi

src_prepare() {
	setup-wxwidgets
	cmake-utils_src_prepare

	local sedcmds=(
		-e 's/-lwx_gtk3u_aui-3.0/-lwx_gtk3u_aui-3.0-gtk3/g'
		-e 's/-lwx_gtk3u_gl-3.0/-lwx_gtk3u_gl-3.0-gtk3/g'
	)

	sed -i "${sedcmds[@]}" CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DOCPN_USE_GARMINHOST="$(usex garminhost)"
		-DOCPN_BUNDLE_GSHHS="$(usex gshhs)"
		-DOCPN_BUNDLE_TCDATA="$(usex tcdata)"
		-DOCPN_BUNDLE_DOCS="$(usex docs)"
		-DOCPN_FORCE_GTK3="$(usex force-gtk3)"
		-DOCPN_USE_GL="$(usex opengl)"
		-DOCPN_USE_GLES_SHIM="$(usex gles-shim)"
		-DOCPN_USE_LZMA="$(usex lzma)"
		-DOCPN_ENABLE_PORTAUDIO="$(usex portaudio)"
		-DOCPN_ENABLE_SNDFILE="$(usex sndfile)"
		-DOCPN_USE_CRASHREPORT="$(usex crashreport)"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	doenvd "${FILESDIR}/99opencpn" || die "doenvd failed"
}
