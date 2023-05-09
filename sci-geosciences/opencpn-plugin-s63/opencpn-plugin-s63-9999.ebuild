# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"
MY_PN="oesenc_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bdbcat/s63_pi.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	SRC_URI="https://github.com/mschiff/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit cmake wxwidgets
	S="${WORKDIR}/${MY_PN}-${PV}"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="S63 Plugin for OpenCPN"
HOMEPAGE="https://github.com/bdbcat/s63_pi"

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
