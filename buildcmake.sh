#!/bin/sh

rm -r projectfiles/cmake_gcc_arm/$1 
progen generate -t cmake_gcc_arm -o generator=Ninja -p $1
# note: build folder *must* be named build. post_build_script.py has this hardcoded.
cmake -GNinja -S projectfiles/cmake_gcc_arm/$1 -B projectfiles/cmake_gcc_arm/$1/build 
cmake --build projectfiles/cmake_gcc_arm/$1/build
# uncomment the next line to upload the new firmware to probe as part of the build (on linux)
cp projectfiles/cmake_gcc_arm/$1/build/$1.hex /media/$USERNAME/MAINTENANCE/