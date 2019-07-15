#!/bin/bash

echo deb-src http://ftp.debian.org/debian/ unstable main contrib non-free > /etc/apt/sources.list.d/deb-src.list
dpkg --add-architecture armhf
apt-get update -y && apt-get upgrade -y
apt-get install -y build-essential cmake ninja-build wget curl git zip unzip gcc-arm-linux-gnueabihf haskell-platform m4 autoconf automake libtool llvm-6.0 python3 xz-utils libtinfo-dev libgmp-dev libncurses-dev lld libtinfo-dev:armhf libgmp-dev:armhf libncurses-dev:armhf
