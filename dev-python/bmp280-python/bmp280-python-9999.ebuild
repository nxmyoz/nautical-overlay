# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1 git-r3

DESCRIPTION="BMP280 Temperature, Pressure, & Altitude Sensor"
HOMEPAGE="https://github.com/pimoroni/bmp280-python"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

EGIT_REPO_URI="https://github.com/pimoroni/bmp280-python.git"


LICENSE="MIT"
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
	dev-python/i2cdevice-python[${PYTHON_USEDEP}]"

S="${WORKDIR}/${P}/library"

python_test() {
	test.py
}
