#!/bin/sh
## Description: Do clean update, and install packages with apt-get, without any docs. Clear the cache at finish.

## HOW TO USE (as root):
# curl https://raw.githubusercontent.com/saaadel/scripts/master/linux/apt-get/clean-update-install.sh | sh /dev/stdin [package1 [package2...]]


apt-get update && \
apt-get --no-install-recommends install -y curl sudo which $* && \
rm -rf /var/lib/apt/lists/*
