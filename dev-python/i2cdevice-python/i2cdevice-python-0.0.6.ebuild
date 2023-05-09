# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

MY_PN="i2cdevice"
DESCRIPTION="Domain-specific language for describing smbus/i2c register maps "
HOMEPAGE="https://pypi.org/project/i2cdevice-python/"
SRC_URI="$(pypi_sdist_url i2cdevice)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE=""

RDEPEND=""

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_PN}-${PV}"
