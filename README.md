<div align="left">
	<img width="300" height="225" src="artwork/nautical-gentoo.svg" alt="Nautical Gentoo">
	<br>
	<br>
	<br>
</div>


# Nautical Gentoo


## Preface

Although many charter yachts are considered seaworthy from a legal standpoint of view, navigating with onboard devices makes usually no fun.
Many charter bases keep the minimal required maintenance of these essential functions, many devices are outdated or barely functional at all.

Sometimes the crews on these yachts lack nessesary attitude towards the devices on board.

Simply put: if the safety of yourself, your crew and guests is important to you - as it always should be for a skipper - you will seek to mitigate the often found desolate condition.

Why not make a robust solution yourself?

## What's the point of this?
Given the existance of OpenPlotter, why create something what seems to be already there?

I had a robust solution in mind, that has these requirements:
* Robustness: powerlos, restarts and reboots shouldn't be a problem.
* Fire-and-forget: give that thing power and everything should run as desired.
* Plug and Play: connect or disconnect your devices (sdr/gps) shouldn't cause any trouble.
* Minimalism: only those things that really matter should be present.
* Devices such a distribution would run on, should be as mainlined as possible.
Give it power, connect your OpenCPN to the network - done. Smooth. That's the idea.

First tests onboard showed very good results that were a little bit dampened by the bad kernel mainling process of a RaspberryPi 3.

### Why not a RaspberryPi
Because of Broadcom and the rather bad mainlining efforts (I am biased towards this.)

There is a ton of better SBCs out there. Look into the Linux kernel source for clues.

I think that even an Odroid-C2 has better mainline support in the kernel by now than all of the RaspberryPi boards together.

## Why Gentoo?

Gentoo has proven itself as a very robust, highly customizable and adjustable and easy (from a developer standtpoint) Linux distribution.

As such, it can be specifically tailored to our needs.

## What is included in this overlay?

At this moment these are:
* rtl_ais
* signalk-server-node (not maintained atm.)
* kplex
* gpsd (more recent version as in the mainline portage tree - includint the ubxtool)
* opencpn
* various opencpn plugins
* XyGrib

Please note, that those desktop applications like OpenCPN and XyGrib are of course not intended for use on a SBC.

## Set up this overlay

Be an advanced Gentoo user.

```
curl -s "https://raw.githubusercontent.com/nxmyoz/nautical-overlay/master/install.sh" | bash
```

## Embeded Devices
As a fire-and-forget solution,

## Main Components

### kplex

#### Configuration

Additional command options to `kplex` can be placed in `/etc/conf.d/kplex`.

Also there is `/etc/kplex/kplex.conf` which might be of further interest.

Please refer to the upstream kplex [documentation](http://www.stripydog.com/kplex/configuration.html).

### rtl_ais

#### Configuration

There is a `/etc/conf.d/rtl_ais` configuration file available, where you can set command options to `rtl_ais`.

Command options for `rtl_ais` can be found [here](https://github.com/dgiardini/rtl-ais).
