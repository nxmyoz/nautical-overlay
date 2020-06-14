#!/bin/bash

if [[ ! -d /etc/portage/repos.conf ]]; then
	mkdir -p /etc/portage/repos.conf
fi

if [[ ! -d /usr/local/portage ]]; then
	mkdir -p /usr/local/portage
fi

if [[ ! -f /etc/portage/repos.conf/nautical.conf ]]; then
	wget "https://raw.githubusercontent.com/nxmyoz/nautical-overlay/master/nautical.conf" -O /etc/portage/repos.conf/nautical.conf
	emaint sync -r nautical
fi

echo "Nautical Overlay has been set up."

