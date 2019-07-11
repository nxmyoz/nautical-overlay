# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Meta ebuild to pull in opencpn plugins"
HOMEPAGE="https://www.gentoo.org"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=sci-geosciences/opencpn-${PV}
	opencpn-plugin-aisradar
	opencpn-plugin-calculator
	opencpn-plugin-celestial_navigation
	opencpn-plugin-climatology
	opencpn-plugin-deviation
	opencpn-plugin-dr
	opencpn-plugin-findit
	opencpn-plugin-iacfleet
	opencpn-plugin-launcher
	opencpn-plugin-logbookkonni
	opencpn-plugin-nmeaconverter
	opencpn-plugin-objsearch
	opencpn-plugin-ocpndebugger
	opencpn-plugin-ocpn_draw
	opencpn-plugin-oesenc
	opencpn-plugin-otcurrent
	opencpn-plugin-photolayer
	opencpn-plugin-plots
	opencpn-plugin-polar
	opencpn-plugin-projections
	opencpn-plugin-radar
	opencpn-plugin-rotationctrl
	opencpn-plugin-route
	opencpn-plugin-rtlsdr
	opencpn-plugin-s63
	opencpn-plugin-sar
	opencpn-plugin-shipdriver
	opencpn-plugin-squiddio
	opencpn-plugin-statusbar
	opencpn-plugin-tactics
	opencpn-plugin-vfkaps
	opencpn-plugin-watchdog
	opencpn-plugin-weatherfax
	opencpn-plugin-weather_routing
"
