#!/bin/bash
## Description: Install NodeJS

## HOW TO USE (as root):
# curl https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | bash /dev/stdin
## OR
# bundle=nodejs7 bash -c 'curl https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | bash /dev/stdin'


nodejs7=https://rpm.nodesource.com/setup_7.x

[ -z $bundle ] && bundle='nodejs7'
[ -z $bundle_url ] && bundle_url=$(eval echo "\$${bundle}")

curl -sjkL "${bundle_url}" | bash -
yum install -y --setopt=tsflags=nodocs git subversion nodejs npm
yum clean all
rm -rf /var/cache/yum/*
