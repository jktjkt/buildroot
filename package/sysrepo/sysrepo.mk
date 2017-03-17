SYSREPO_VERSION = devel
SYSREPO_SITE = https://github.com/sysrepo/sysrepo.git
SYSREPO_SITE_METHOD = git
SYSREPO_INSTALL_STAGING = YES
SYSREPO_LICENSE = Apache-2.0
SYSREPO_LICENSE_FILES = LICENSE
SYSREPO_DEPENDENCIES = \
		       pcre \
		       libev \
		       libredblack \
		       libyang \
		       protobuf-c \
		       host-pkgconf \
		       host-swig

ifeq ($(BR2_INIT_SYSTEMD),y)
SYSREPO_CONF_OPTS += -DWITH_SYSTEMD=ON
endif

define SYSREPO_COPY_YANG_FILES
	mkdir -p $(TARGET_DIR)/usr/share/yang-for-install/01-sysrepo
	cp \
		$(@D)/yang/ietf-netconf-acm@2012-02-22.yang \
		$(@D)/yang/ietf-netconf-notifications.yang \
		$(@D)/yang/nc-notifications.yang \
		$(@D)/examples/yang/turing-machine.yang \
		$(@D)/examples/yang/turing-machine.data.xml \
		$(@D)/examples/yang/iana-if-type.yang \
		$(@D)/examples/yang/ietf-ip@2014-06-16.yang \
		$(@D)/examples/yang/ietf-interfaces@2014-05-08.yang \
		$(@D)/examples/yang/ietf-interfaces.data.xml \
		$(TARGET_DIR)/usr/share/yang-for-install/01-sysrepo/
endef

SYSREPO_POST_INSTALL_TARGET_HOOKS += SYSREPO_COPY_YANG_FILES

$(eval $(cmake-package))
