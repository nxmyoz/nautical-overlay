# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"
MY_PN="calculator_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/Rasbats/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS=""
else
	GIT_COMMIT="f9f486cf55f2a30ead31494d8ca740b9e6b0a6cd"
	EGIT_REPO_URI="https://github.com/Rasbats/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${PV}"
fi

DESCRIPTION="Calculator Plugin for OpenCPN"
HOMEPAGE="https://github.com/Rasbats/calculator_pi"

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
