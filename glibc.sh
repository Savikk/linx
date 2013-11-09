#!/bin/bash
# deb http://ftp.debian.org/debian sid main
apt-get update
apt-get -t sid install libc6-amd64 libc6-dev
