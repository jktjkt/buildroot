NETOPEER2_SERVER_VERSION = tmp-merged-devel-server-notifications
NETOPEER2_SERVER_SITE = https://github.com/jktjkt/Netopeer2.git
NETOPEER2_SERVER_SITE_METHOD = git
NETOPEER2_SERVER_SUBDIR = server
NETOPEER2_SERVER_INSTALL_STAGING = NO
NETOPEER2_SERVER_LICENSE = BSD-3c
NETOPEER2_SERVER_LICENSE_FILES = LICENSE
NETOPEER2_SERVER_DEPENDENCIES = libyang libnetconf2 sysrepo netopeer2-keystored

define NETOPEER2_SERVER_COPY_YANG_FILES
	mkdir -p $(TARGET_DIR)/etc/yang-setup/03-netopeer
	cp $(@D)/modules/*.yang $(TARGET_DIR)/etc/yang-setup/03-netopeer/
	cp $(@D)/server/stock_config.xml $(TARGET_DIR)/etc/yang-setup/03-netopeer/
	cp package/netopeer2-server/install-yang.sh $(TARGET_DIR)/etc/yang-setup/03-netopeer/
endef

NETOPEER2_SERVER_POST_INSTALL_TARGET_HOOKS += NETOPEER2_SERVER_COPY_YANG_FILES

$(eval $(cmake-package))
