# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Meta ebuild to pull in opencpn plugins"
HOMEPAGE="https://www.gentoo.org"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=sci-geosciences/opencpn-${PV}
	sci-geosciences/opencpn-plugin-aisradar
	sci-geosciences/opencpn-plugin-calculator
	sci-geosciences/opencpn-plugin-climatology
	sci-geosciences/opencpn-plugin-deviation
	sci-geosciences/opencpn-plugin-dr
	sci-geosciences/opencpn-plugin-findit
	sci-geosciences/opencpn-plugin-iacfleet
	sci-geosciences/opencpn-plugin-launcher
	sci-geosciences/opencpn-plugin-logbookkonni
	sci-geosciences/opencpn-plugin-nmeaconverter
	sci-geosciences/opencpn-plugin-objsearch
	sci-geosciences/opencpn-plugin-ocpndebugger
	sci-geosciences/opencpn-plugin-ocpn_draw
	sci-geosciences/opencpn-plugin-oesenc
	sci-geosciences/opencpn-plugin-otcurrent
	sci-geosciences/opencpn-plugin-plots
	sci-geosciences/opencpn-plugin-polar
	sci-geosciences/opencpn-plugin-projections
	sci-geosciences/opencpn-plugin-radar
	sci-geosciences/opencpn-plugin-rotationctrl
	sci-geosciences/opencpn-plugin-route
	sci-geosciences/opencpn-plugin-rtlsdr
	sci-geosciences/opencpn-plugin-s63
	sci-geosciences/opencpn-plugin-sar
	sci-geosciences/opencpn-plugin-shipdriver
	sci-geosciences/opencpn-plugin-squiddio
	sci-geosciences/opencpn-plugin-statusbar
	sci-geosciences/opencpn-plugin-vfkaps
	sci-geosciences/opencpn-plugin-watchdog
	sci-geosciences/opencpn-plugin-weatherfax
	sci-geosciences/opencpn-plugin-weather_routing
"
