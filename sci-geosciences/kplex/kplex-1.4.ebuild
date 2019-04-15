# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An NMEA-1083 Multiplexer"
HOMEPAGE=""
SRC_URI="https://github.com/stripydog/kplex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

DEPEND="app-admin/logrotate"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin kplex
	doman kplex.1
	dodoc README

	dodir /etc/kplex
	insinto /etc/kplex
	newins kplex.conf.ex kplex.conf.ex
	newins "${FILESDIR}/kplex.conf" kplex.conf

	newconfd "${FILESDIR}/kplex.confd" kplex
	newinitd "${FILESDIR}/kplex.initd" kplex

	dodir /var/log/kplex
	insinto /etc/logrotate.d
	newins "${FILESDIR}/kplex.logrotated" kplex
}
