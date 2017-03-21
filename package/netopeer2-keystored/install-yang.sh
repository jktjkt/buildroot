#!/bin/sh
set -ex

ssh-keygen -A
cd /etc/keystored/keys/
cp -a /etc/ssh/ssh_host_rsa_key ssh_host_rsa_key.pem
openssl rsa -pubout -in ssh_host_rsa_key.pem -out ssh_host_rsa_key.pub.pem
cd /etc/yang-setup/02-keystored/
sysrepoctl --install --yang ietf-keystore.yang --owner root:root --permissions 600
sysrepocfg --datastore startup -i stock_key_config.xml ietf-keystore
