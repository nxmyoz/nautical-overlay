# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs user

DESCRIPTION="A simple AIS tuner and generic dual-frequency FM demodulator"
HOMEPAGE="https://github.com/dgiardini/rtl-ais"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dgiardini/${PN}.git"
	KEYWORDS=""
else
	KEYWORDS="~arm ~amd64 ~x86"
	SRC_URI="https://github.com/dgiardini/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="net-wireless/rtl-sdr
		virtual/libusb:1"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	emake CC="$(tc-getCC)" \
		UNAME="Linux"
		CFLAGS="$($(tc-getPKG_CONFIG) --cflags librtlsdr) ${CFLAGS}" \
		LIBS="${LDFLAGS} $($(tc-getPKG_CONFIG) --libs librtlsdr) -lm -lpthread"
}

src_install() {
	newinitd "${FILESDIR}/rtl_ais.initd" rtl_ais
	newconfd "${FILESDIR}/rtl_ais.confd" rtl_ais

	dodoc README
	dobin rtl_ais
}
