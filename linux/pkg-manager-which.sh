#!/bin/bash
## Description: Test for yum or apt based linux

export IS_YUM_PKG_MANAGER=`which yum &>/dev/null && echo 1 || echo ''`
export IS_APT_GET_PKG_MANAGER=`which apt-get &>/dev/null && echo 1 || echo ''`
export PKG_MANAGER=$( which -v yum || which apt-get ) || exit 1
