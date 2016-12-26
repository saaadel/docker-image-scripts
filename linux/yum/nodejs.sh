#!/bin/sh
## Description: Install NodeJS

## HOW TO USE (as root):
# curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | sh /dev/stdin
## OR
# bundle=nodejs7 sh -c 'curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | sh /dev/stdin'


nodejs7=https://rpm.nodesource.com/setup_7.x

[ -z $bundle ] && bundle='nodejs7'
[ -z $bundle_url ] && bundle_url=$(eval echo "\$${bundle}")

curl -sjkL "${bundle_url}" | bash -
yum install -y --setopt=tsflags=nodocs git subversion nodejs npm
yum clean all
rm -rf /var/cache/yum/*
