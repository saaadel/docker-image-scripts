#!/bin/sh
## Description: Do clean update, and install packages with yum, without any docs. Clear the cache at finish.

## HOW TO USE (as root):
# curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/clean-update-install.sh | sh /dev/stdin [package1 [package2...]]


yum clean all && \
yum update -y
yum install -y --setopt=tsflags=nodocs which
yum install -y --setopt=tsflags=nodocs curl $*
yum clean all && \
rm -rf /var/cache/yum/*
