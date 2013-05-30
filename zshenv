export _JAVA_AWT_WM_NONREPARENTING=1
export CC=clang
export CXX=clang++
export CFLAGS="-Wall -Wextra"
export CXXFLAGS="$CFLAGS -std=c++11"
export ARDUINO_SKETCHBOOK=~/docs/arduino

typeset -U path
path=(~/bin $path ~/src/ucpp/ucpp)
