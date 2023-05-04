# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"
MY_PN="o-charts_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets udev
	KEYWORDS=""
else
	inherit git-r3 cmake wxwidgets udev
	EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
	EGIT_COMMIT="1.0.34.0"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="oeSENC Charts Plugin for OpenCPN"
HOMEPAGE="https://github.com/bdbcat/oesenc_pi"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-5.0.0
	sys-devel/gettext
	dev-libs/tinyxml
	virtual/libusb:*
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	setup-wxwidgets
	cmake_src_prepare
}

src_compile() {
	cmake_build
	#emake tarball

}

src_install() {
	die
	#udev_dorules libs/oeserverd/linux64/98-sglock.rules
}
