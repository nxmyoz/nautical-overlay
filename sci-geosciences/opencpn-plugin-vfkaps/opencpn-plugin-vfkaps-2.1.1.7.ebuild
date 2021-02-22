# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="vfkaps_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/Rasbats/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	EGIT_COMMIT="2f8c611f6c5dca45f8fa45c66d048132748907ef"
	EGIT_REPO_URI="https://github.com/Rasbats/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${PV}"
fi

DESCRIPTION="VentureFarther Plugin for OpenCPN"
HOMEPAGE="https://github.com/Rasbats/vfkaps_pi"

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
	sed -i 's,git remote get-url ${GIT_REPOSITORY_REMOTE},echo "NO_REMOTE",' cmake/PluginConfigure.cmake
	sed -i 's,string(SUBSTRING ${GIT_REPOSITORY_URL} ${START_URL} ${STRING_LENGTH} GIT_REPOSITORY),set(GIT_REPOSITORY ""),' cmake/PluginConfigure.cmake

	setup-wxwidgets
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	cmake_src_configure
}
