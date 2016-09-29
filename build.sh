#!/bin/bash
set -e

function build() {
  echo "TAG=$1 CC=$2 CFLAGS=$3"
  docker build -t r-"$1" --build-arg R_CC=clang --build-arg R_CFLAGS="$3" r-base
  echo ""
}

build "clang-o2" "clang" "-O2"
build "clang-debug" "clang" "-Wall -O0 -g3 -gdwarf-4 -DDEBUG"
build "clang-std" "clang" "-g -O2"
build "clang-o3" "clang" "-O3"
build "clang-ofast" "clang" "-Ofast"
build "gcc-debug" "/usr/local/bin/gcc-6" "-Wall -O0 -g3 -gdwarf-4 -DDEBUG"
build "gcc-std" "/usr/local/bin/gcc-6" "-g -O2"
build "gcc6-o2" "/usr/local/bin/gcc-6" "-O2"
build "gcc6-o3" "/usr/local/bin/gcc-6" "-O3"
build "gcc6-ofast" "/usr/local/bin/gcc-6" "-Ofast"

docker build -t r-vanilla r-vanilla
