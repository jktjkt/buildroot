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
	mkdir -p $(TARGET_DIR)/etc/yang-setup/01-sysrepo
	cp $(@D)/yang/*.yang $(TARGET_DIR)/etc/yang-setup/01-sysrepo/
	cp package/sysrepo/install-yang.sh $(TARGET_DIR)/etc/yang-setup/01-sysrepo/
endef

SYSREPO_POST_INSTALL_TARGET_HOOKS += SYSREPO_COPY_YANG_FILES

$(eval $(cmake-package))
