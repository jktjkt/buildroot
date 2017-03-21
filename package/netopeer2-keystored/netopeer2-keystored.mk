NETOPEER2_KEYSTORED_VERSION = tmp-merged-devel-server-notifications
NETOPEER2_KEYSTORED_SITE = https://github.com/jktjkt/Netopeer2.git
NETOPEER2_KEYSTORED_SITE_METHOD = git
NETOPEER2_KEYSTORED_SUBDIR = keystored
NETOPEER2_KEYSTORED_INSTALL_STAGING = NO
NETOPEER2_KEYSTORED_LICENSE = BSD-3c
NETOPEER2_KEYSTORED_LICENSE_FILES = LICENSE
NETOPEER2_KEYSTORED_DEPENDENCIES = openssl sysrepo

define NETOPEER2_KEYSTORED_COPY_YANG_FILES
	mkdir -p $(TARGET_DIR)/etc/yang-setup/02-keystored
	cp $(@D)/modules/ietf-keystore.yang $(TARGET_DIR)/etc/yang-setup/02-keystored/
	cp $(@D)/keystored/stock_key_config.xml $(TARGET_DIR)/etc/yang-setup/02-keystored/
	cp package/netopeer2-keystored/install-yang.sh $(TARGET_DIR)/etc/yang-setup/02-keystored/
endef

NETOPEER2_KEYSTORED_POST_INSTALL_TARGET_HOOKS += NETOPEER2_KEYSTORED_COPY_YANG_FILES

$(eval $(cmake-package))
