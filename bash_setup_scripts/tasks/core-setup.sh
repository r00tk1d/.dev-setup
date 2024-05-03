#!/bin/bash

echo "starting task: core-setup"

# Install System Packages 0
sudo apt install -y curl git software-properties-common

# Install System Packages 1
sudo apt install -y build-essential cmake pkg-config libpthread-stubs0-dev

# Install System Packages 2
sudo apt install -y unzip libtool libtool-bin

# Install System Packages 3
sudo apt install -y htop lsof python3-pip moreutils

echo "finished task: core-setup"