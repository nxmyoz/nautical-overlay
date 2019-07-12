# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

WX_GTK_VER="3.0"
MY_PN="polar_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	SRC_URI="
		https://github.com/rgleason/${MY_PN}/archive/v${PV}-ov50a.tar.gz -> ${P}.tar.gz
	"
	inherit cmake-utils wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}-ov50"
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
	need-wxwidgets unicode
	cmake-utils_src_prepare
}
