#!/bin/bash

echo "starting task: core-setup"

# Install System Packages 1
sudo apt install -q -y build-essential || handle_fail "build-essential" 
sudo apt install -q -y cmake || handle_fail "cmake" 
sudo apt install -q -y pkg-config || handle_fail "pkg-config" 
sudo apt install -q -y libpthread-stubs0-dev || handle_fail "libpthread-stubs0-dev" 

# Install System Packages 2
sudo apt install -q -y unzip || handle_fail "unzip"
sudo apt install -q -y libtool || handle_fail "libtool"
sudo apt install -q -y libtool-bin || handle_fail "libtool-bin"

# Install System Packages 3
sudo apt install -q -y htop || handle_fail "htop"
sudo apt install -q -y lsof || handle_fail "lsof"
sudo apt install -q -y python3-pip || handle_fail "python3-pip"
sudo apt install -q -y moreutils || handle_fail "moreutils"


echo "finished task: core-setup"