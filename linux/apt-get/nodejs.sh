#!/bin/sh
## Description: Install NodeJS

## HOW TO USE (as root):
# curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/apt-get/nodejs.sh | sh /dev/stdin

apt-get update && \
apt-get --no-install-recommends install -y git subversion nodejs npm
rm -rf /var/lib/apt/lists/*
