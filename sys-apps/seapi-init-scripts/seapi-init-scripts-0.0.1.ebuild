# Copyright (c) 2017 sakaki <sakaki@deciban.com>
# License: GPL v3+
# NO WARRANTY

EAPI=7

KEYWORDS="~arm64"

DESCRIPTION="Misc init scripts for the SeaPi image"
HOMEPAGE="https://github.com/nxmyoz"
SRC_URI=""
LICENSE="GPL-3+"
SLOT="0"
IUSE=""
RESTRICT="mirror"
AR_SVCNAME="autoexpand-root"

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	>=sys-apps/openrc-0.21
	>=app-shells/bash-4.0"

src_install() {
	newinitd "${FILESDIR}/init.d_autoexpand_root-4" "${AR_SVCNAME}"
	insinto "/etc/sysctl.d"
	newins "${FILESDIR}/35-low-memory-cache-settings.conf-1" "35-low-memory-cache-settings.conf"
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		rc-update add "${AR_SVCNAME}" boot
		elog "The first-boot root partition resizing service has been activated."
		elog "To have it run (which also force-sets the root and demouser"
		elog "passwords, and starts an Xfce session for demouser), create (touch)"
		elog "the sentinel file /boot/autoexpand_root_partition."
		elog "To do the same (but skipping the autoexpand step) create"
		elog "(touch) the file /boot/autoexpand_root_none instead."
		elog "To disable entirely, run:"
		elog "  rc-update del ${AR_SVCNAME} boot"
	fi
}


