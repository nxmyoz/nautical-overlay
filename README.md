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

### Configuration

The configuration folder for signalk-server-node is located in `/etc/signalk`.

Run `/opt/signalk-server-node/bin/signalk-server-setup` to create your initial configuration files. Use the configuration folder mentioned above.

If you wish to add additional configuration options to `signalk-server` look into `/etc/conf.d/signalk-server-node`.

For all options available, please refer to the SignalK Node Server [documentation](https://github.com/SignalK/signalk-server-node).

## kplex

### Configuration

Additional command options to `kplex` can be placed in `/etc/conf.d/kplex`.

Also there is `/etc/kplex/kplex.conf` which might be of further interest.

Please refer to the upstream kplex [documentation](http://www.stripydog.com/kplex/configuration.html).

## rtl_ais

### Configuration

There is a `/etc/conf.d/rtl_ais` configuration file available, where you can set command options to `rtl_ais`.

Command options for `rtl_ais` can be found [here](https://github.com/dgiardini/rtl-ais).
