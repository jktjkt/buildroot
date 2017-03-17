DOCOPT_CPP_VERSION = master
DOCOPT_CPP_SITE = https://github.com/docopt/docopt.cpp.git
DOCOPT_CPP_SITE_METHOD = git
DOCOPT_CPP_INSTALL_STAGING = YES
# FIXME: looks like it's a dual-license with Boost-1.0
DOCOPT_CPP_LICENSE = MIT
DOCOPT_CPP_LICENSE_FILES = LICENSE-MIT LICENSE-Boost-1.0

$(eval $(cmake-package))
