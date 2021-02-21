# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="ocpn_draw_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/jongough/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	#EGIT_COMMIT="416b2fe23c67a4f1e7f287b4a720c1c19b656e8d"
	#EGIT_REPO_URI="https://github.com/jongough/${MY_PN}.git"
	SRC_URI="
		https://github.com/jongough/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"
	inherit cmake-utils wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="Draw Plugin for OpenCPN"
HOMEPAGE="https://github.com/jongough/ocpn_draw_pi"

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
