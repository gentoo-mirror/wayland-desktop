# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

ACCT_USER_ID=398
ACCT_USER_GROUPS=( greetd )
ACCT_USER_HOME=/var/lib/amavishome
DESCRIPTION="User for gui-libs/greetd"

acct-user_add_deps
