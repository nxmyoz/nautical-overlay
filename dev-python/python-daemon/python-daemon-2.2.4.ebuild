# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="Library to implement a well-behaved Unix daemon process"
HOMEPAGE="https://pypi.org/project/python-daemon/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/lockfile[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	test? (
		dev-python/unittest2[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
	)"

python_test() {
	esetup.py test
}
