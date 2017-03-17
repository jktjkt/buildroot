LIBREDBLACK_VERSION = 1.3
LIBREDBLACK_SOURCE = libredblack-$(LIBREDBLACK_VERSION).tar.gz
LIBREDBLACK_SITE = http://downloads.sourceforge.net/project/libredblack/libredblack/$(LIBREDBLACK_VERSION)
LIBREDBLACK_INSTALL_STAGING = YES
LIBREDBLACK_CONF_OPTS = --with-rbgen=no
LIBREDBLACK_LICENSE = LGPLv2.1+
LIBREDBLACK_LICENSE_FILES = COPYING

$(eval $(autotools-package))
