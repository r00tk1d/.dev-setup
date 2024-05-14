#!/bin/bash

# Install System Packages 1
sudo apt-get -q install -y build-essential || handle_fail "build-essential" 
sudo apt-get -q install -y cmake || handle_fail "cmake" 
sudo apt-get -q install -y pkg-config || handle_fail "pkg-config" 
sudo apt-get -q install -y libpthread-stubs0-dev || handle_fail "libpthread-stubs0-dev" 

# Install System Packages 2
sudo apt-get -q install -y unzip || handle_fail "unzip"
sudo apt-get -q install -y libtool || handle_fail "libtool"
sudo apt-get -q install -y libtool-bin || handle_fail "libtool-bin"

# Install System Packages 3
sudo apt-get -q install -y htop || handle_fail "htop"
sudo apt-get -q install -y lsof || handle_fail "lsof"
sudo apt-get -q install -y python3-pip || handle_fail "python3-pip"
sudo apt-get -q install -y moreutils || handle_fail "moreutils"