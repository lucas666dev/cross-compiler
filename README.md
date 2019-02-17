cross-compiler [![Build Status](https://travis-ci.org/scakemyer/cross-compiler.svg?branch=master)](https://travis-ci.org/scakemyer/cross-compiler)
==============

C/C++ Cross compiling environment containers

This has been designed to run `libtorrent-go` cross compilation and is not meant to be perfect nor minimal. Adapt as required.

## Overview

### Environment variables

- CROSS_TRIPLE
- CROSS_ROOT
- LD_LIBRARY_PATH
- PKG_CONFIG_PATH

Also adds CROSS_ROOT/bin in your PATH.

### Installed packages

Based on Debian Stretch:
- bash
- curl
- wget
- pkg-config
- build-essential
- make
- automake
- autogen
- libtool
- libpcre3-dev
- bison
- yodl
- tar
- xz-utils
- bzip2
- gzip
- unzip
- file
- rsync
- sed
- upx

And a selection of platform specific packages (see below).

### Platforms built

- android-arm (android-ndk-r14b with api 19, clang)
- android-arm64 (android-ndk-r18b with api 21, clang)
- android-x64 (android-ndk-r18b with api 21, clang)
- android-x86 (android-ndk-r18b with api 21, clang)
- darwin-x64 (clang-4.0, llvm-4.0-dev, libtool, libxml2-dev, uuid-dev, libssl-dev patch make cpio)
- linux-arm (gcc-4.8-arm-linux-gnueabihf with hardfp support for RaspberryPi)
- linux-armv7 (gcc-6-arm-linux-gnueabihf)
- linux-arm64 (aarch64-linux-gnu-gcc-6)
- linux-x64
- linux-x86 (gcc-multilib, g++-multilib)
- windows-x64 (mingw-w64)
- windows-x86 (mingw-w64)

## Building

Either build all images with:

    make

Or selectively build platforms:

    make darwin-x64
