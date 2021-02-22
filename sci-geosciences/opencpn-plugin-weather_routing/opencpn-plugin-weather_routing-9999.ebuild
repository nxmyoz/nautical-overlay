# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="weather_routing_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	SRC_URI="
		https://github.com/rgleason/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"
	inherit cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="Weather Routing Plugin for OpenCPN"
HOMEPAGE="https://github.com/rgleason/weather_routing_pi/"

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
