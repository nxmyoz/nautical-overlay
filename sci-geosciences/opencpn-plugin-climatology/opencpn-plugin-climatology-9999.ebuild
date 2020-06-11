# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="climatology_pi"
DATA_VER="006120320bde2c1ad8da10a911cdf2b0f3bffe0d"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/rgleason/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	SRC_URI="
		https://github.com/rgleason/${MY_PN}/archive/v${PV}-ov50.tar.gz -> ${P}.tar.gz
		https://github.com/seandepagnier/climatology_pi_data/archive/${DATA_VER}.zip -> ${PN}-data.zip
	"
	inherit cmake-utils wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}-ov50"
fi

DESCRIPTION="Climatology Plugin for OpenCPN (includes CL-DATA)"
HOMEPAGE="https://github.com/rgleason/climatology_pi"

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
	cmake-utils_src_prepare
}
src_install() {
	cmake-utils_src_install
	insinto "/usr/share/opencpn/plugins/${MY_PN}/data/"
	doins "${WORKDIR}"/climatology_pi_data-${DATA_VER}/*
}
