#!/bin/bash
## Description: Do clean update, and install packages with yum, wuthout any docs. Clear the cache at finish.

## HOW TO USE (as root):
# curl https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/clean-update-install.sh | bash /dev/stdin [package1 [package2...]]


yum clean all
yum update -y
yum install -y --setopt=tsflags=nodocs $*
yum clean all
rm -rf /var/cache/yum/*
