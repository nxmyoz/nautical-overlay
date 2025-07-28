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
	EGIT_REPO_URI="https://github.com/bdbcat/o-charts_pi.git"
	EGIT_COMMIT="${PV}"
	EGIT_SUBMODULES=()
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="O-Charts Plugin for OpenCPN"
HOMEPAGE="https://github.com/bdbcat/o-charts_pi"

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

S="${WORKDIR}/o-charts_pi-${PV}"

src_prepare() {
	default
	setup-wxwidgets
	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
	emake tarball
}

src_install() {
	# Plugin‑Tarball suchen
	local tarball=$(find "${BUILD_DIR}" -name "*.tar.gz" | head -n 1)
	[[ -z "${tarball}" ]] && die "Plugin tarball not found"

	mkdir "${T}/plugin"
	tar -xzf "${tarball}" -C "${T}/plugin" || die "Extraction failed"

	local plugindir=$(find "${T}/plugin" -mindepth 1 -maxdepth 1 -type d)
	[[ -z "${plugindir}" ]] && die "Plugin‑Verzeichnis nicht gefunden"

	insinto /usr/$(get_libdir)/opencpn/plugins/$(basename "${plugindir}")
	doins -r "${plugindir}/"*
}

pkg_pretend_install() {
	elog "o‑charts_pi ${PV} installed to /usr/$(get_libdir)/opencpn/plugins"
}
