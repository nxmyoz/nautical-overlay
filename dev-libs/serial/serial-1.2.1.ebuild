# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )

inherit cmake python-r1

DESCRIPTION="Serial is a crossplatform, simple to use library for using serial ports."
HOMEPAGE="http://wjwwood.github.com/serial/"
SRC_URI="https://github.com/wjwwood/serial/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/catkin
	dev-cpp/gtest"
RDEPEND="${DEPEND}"
BDEPEND=""

ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

#src_configure() {
#	cmake_src_configure
#}
#
#src_install() {
#	cmake_src_install
#}
