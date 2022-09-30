#!/usr/bin/env bash
set -ex
cd /tmp

if [ ! -f "llvm-${LLVM_VERSION}.tar.gz" ]; then
  wget --no-check-certificate -q "https://github.com/apple/llvm-project/archieve/${LLVM_VERSION}.tar.gz" -O "llvm-${LLVM_VERSION}.tar.gz"
fi
tar -xzf "llvm${LLVM_VERSION}.tar.gz"
rm "llvm-${LLVM_VERSION}.tar.gz"
cd "llvm-${LLVM_VERSION}" && mkdir build
cd build
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang" -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" ../llvm


cd / && rm -rf /tmp/*