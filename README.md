# nautical-overlay

This is an overlay for Gentoo of open source software useful to have on a (sailing)yacht.

At this moment these are:
* rtl_ais
* signalk-server-node


## signalk-server-node

signalk-server-node is a NodeJS project and such, it is a beast when it comes to dependencies.
When `npm install` is done, it says around 600 packages have been installed.

Also, Gentoo doesn't provide any means of installing a nodejs package via npm at the moment, so to install signalk-server-node via portage requires some sort of trickery - the network-sandbox has to be disabled, in order to allow `npm` to get nodejs packages whil in compile phase.

To do so do:

```
mkdir -p /etc/portage/env
echo 'FEATURES="-network-sandbox"' > /etc/portage/env/wo-network-sandbox
echo "sci-geosciences/signalk-server-node wo-network-sandbox" >> /etc/portage/package.env
```
Now it should be possible to merge signalk-server-node.
