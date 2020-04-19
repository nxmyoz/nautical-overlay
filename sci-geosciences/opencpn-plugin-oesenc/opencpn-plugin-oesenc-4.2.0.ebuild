# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0"
MY_PN="oesenc_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bdbcat/${MY_PN}.git"
	inherit git-r3 cmake-utils wxwidgets udev
	KEYWORDS=""
else
SRC_URI="https://github.com/bdbcat/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit cmake-utils wxwidgets udev
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
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
	dev-libs/libusb-compat
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eapply -p1 -l "${FILESDIR}"/lib-4.2.0.patch
	need-wxwidgets unicode
	cmake-utils_src_prepare
}

src_install() {
	cmake-utils_src_install
	udev_dorules buildlinux/oeserverd/98-sglock.rules
}
