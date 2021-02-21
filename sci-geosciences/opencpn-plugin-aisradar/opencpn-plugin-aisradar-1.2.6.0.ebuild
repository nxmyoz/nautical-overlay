# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="AISradar_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	GIT_COMMIT="5bdce7d0b18b7629b0f4a1335c60da3f8897e168"
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	#SRC_URI="
	#	https://github.com/rgleason/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	#"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="AIS Radar View Plugin for OpenCPN"
HOMEPAGE="https://github.com/rgleason/AISradar_pi"

LICENSE="GPL-2+"
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
	cmake-utils_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake-utils_src_configure
}
