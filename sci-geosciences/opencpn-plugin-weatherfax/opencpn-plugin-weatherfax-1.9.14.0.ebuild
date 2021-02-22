# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="weatherfax_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	EGIT_COMMIT="d5cf038e4c2a6e6f5091ea6ad131b5cc8462a639"
	EGIT_CLONE_TYPE="single+tags"
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${PV}"
fi

DESCRIPTION="Weatherfax Plugin for OpenCPN"
HOMEPAGE="https://github.com/rgleason/weatherfax_pi"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-5.0.0
	sys-devel/gettext
"
DEPEND="${RDEPEND}"

src_prepare() {
	setup-wxwidgets
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake_src_configure
}
