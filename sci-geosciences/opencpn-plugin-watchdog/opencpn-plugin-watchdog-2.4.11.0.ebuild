# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="watchdog_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	#SRC_URI="
	#	https://github.com/rgleason/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	#"
	inherit git-r3 cmake-utils wxwidgets
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	EGIT_COMMIT="7245d4e235143f5b7b98cf50376636dedad74bd5"
	KEYWORDS=""
	#S="${WORKDIR}/${MY_PN}-${PV}"
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
	cmake-utils_src_prepare
}