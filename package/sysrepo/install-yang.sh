#!/bin/sh
set -ex

cd /etc/yang-setup/01-sysrepo/

sysrepoctl --install --yang ietf-netconf-acm@2012-02-22.yang --owner root:root --permissions 644
sysrepoctl --install --yang ietf-netconf-notifications.yang --owner root:root --permissions 666
sysrepoctl --install --yang nc-notifications.yang --owner root:root --permissions 666
