#!/usr/bin/env bash

set -ex
cd /tmp
wget -nv "https://dl.google.com/android/repository/${NDK}-linux-x86_64.zip"
unzip "${NDK}-linux-x86_64.zip" 1>log 2>err
"./${NDK}/build/tools/make_standalone_toolchain.py" \
  --arch="${ANDROID_ARCH}" \
  --api="${ANDROID_NDK_API}" \
  --stl=libc++ \
  --install-dir="${CROSS_ROOT}"
mv "${NDK}" /usr/
cd / && rm -rf /tmp/*
