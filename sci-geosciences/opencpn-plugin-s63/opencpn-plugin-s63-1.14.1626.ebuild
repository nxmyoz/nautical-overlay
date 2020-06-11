# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"
MY_PN="oesenc_pi"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bdbcat/s63_pi.git"
	inherit git-r3 cmake-utils wxwidgets
	KEYWORDS=""
else
	inherit git-r3 cmake-utils wxwidgets
	EGIT_REPO_URI="https://github.com/bdbcat/s63_pi.git"
	EGIT_COMMIT="4e77ed9dbf9f639f3f5f15b7ea988839ff457933"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="S63 Plugin for OpenCPN"
HOMEPAGE="https://github.com/bdbcat/s63_pi"

LICENSE=""
SLOT="0"
IUSE=""

RDEPEND="
	x11-libs/wxGTK:${WX_GTK_VER}
	>=sci-geosciences/opencpn-5.0.0
	sys-devel/gettext
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/lib.patch"
)

src_prepare() {
	need-wxwidgets unicode
	cmake-utils_src_prepare
}
