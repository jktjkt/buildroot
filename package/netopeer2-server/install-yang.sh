#!/bin/sh
set -ex

cd /etc/yang-setup/03-netopeer/

sysrepoctl --install --yang ietf-netconf-server.yang --owner root:root --permissions 600
for yang_feature in listen ssh-listen tls-listen call-home ssh-call-home tls-call-home; do
	sysrepoctl --module ietf-netconf-server --feature-enable $yang_feature
done

sysrepoctl --install --yang ietf-system.yang --owner root:root --permissions 600
for yang_feature in authentication local-users; do
	sysrepoctl --module ietf-system --feature-enable $yang_feature
done

sysrepocfg --datastore startup -i stock_config.xml ietf-netconf-server
