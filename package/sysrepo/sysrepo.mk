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

$(eval $(cmake-package))
