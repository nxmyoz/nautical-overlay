# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="GPS-Odometer_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/LennartG-Sve/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	SRC_URI="https://github.com/LennartG-Sve/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="The GPS Odometer is a plugin for OpenCPN"
HOMEPAGE="https://github.com/LennartG-Sve/GPS-Odometer_pi"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-5.0.0
	sys-devel/gettext
"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i 's,git remote get-url ${GIT_REPOSITORY_REMOTE},echo "NO_REMOTE",' cmake/PluginConfigure.cmake
	sed -i 's,string(SUBSTRING ${GIT_REPOSITORY_URL} ${START_URL} ${STRING_LENGTH} GIT_REPOSITORY),set(GIT_REPOSITORY ""),' cmake/PluginConfigure.cmake

	setup-wxwidgets
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake_src_configure
}
