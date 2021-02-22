# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 git-r3

DESCRIPTION="Python library for the NMEA 0183 protcol"
HOMEPAGE="https://github.com/Knio/pynmea2"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

EGIT_REPO_URI="https://github.com/Knio/pynmea2.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

IUSE=""

RDEPEND=""

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
