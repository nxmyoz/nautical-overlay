# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

MY_PN="i2cdevice"
DESCRIPTION="Domain-specific language for describing smbus/i2c register maps "
HOMEPAGE="https://pypi.org/project/i2cdevice-python/"
SRC_URI="mirror://pypi/i/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE=""

RDEPEND=""

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_PN}-${PV}"
