# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="polar_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	EGIT_COMMIT="ac13eb70e6fc41f635d2c63ba879f272a3b6c74b"
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${PV}-ov50"
fi

DESCRIPTION="Polar Diagram Plugin for OpenCPN"
HOMEPAGE="https://github.com/rgleason/polar_pi"

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
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake_src_configure
}
