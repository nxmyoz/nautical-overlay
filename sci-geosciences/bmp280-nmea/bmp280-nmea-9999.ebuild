# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

#inherit distutils-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE=""

DEPEND="
	dev-python/bmp280-python
	dev-python/pynmea2
	dev-python/python-daemon"

RDEPEND="${DEPEND}"
BDEPEND=""
