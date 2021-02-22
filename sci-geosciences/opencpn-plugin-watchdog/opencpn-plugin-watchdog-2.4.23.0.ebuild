# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="watchdog_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	inherit git-r3 cmake wxwidgets
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	EGIT_COMMIT="2c4bf428615941c92d61e53f7a159dfd1c8c96e2"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Watchdog Plugin for OpenCPN"
HOMEPAGE="https://github.com/rgleason/watchdog_pi"

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
	export GIT_REPOSITORY=${EGIT_REPO_URI}
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake_src_configure
}