# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="oesenc_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
	inherit git-r3 cmake wxwidgets udev
	KEYWORDS=""
else
	inherit git-r3 cmake wxwidgets udev
	EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
	EGIT_COMMIT="10fa2c706d0c51688134bcd79532e603c30d60e7"
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
	virtual/libusb:*
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	setup-wxwidgets
	cmake_src_prepare
}

src_compile() {
	cmake_build tarball
}

src_install() {
	cmake_src_install
	udev_dorules buildlinux/oeserverd/98-sglock.rules
}
