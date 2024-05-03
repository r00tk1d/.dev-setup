#!/bin/bash

echo "starting task: node-setup"

sudo apt update
sudo apt install -y nodejs npm

sudo npm install -g n

echo "finished task: node-setup"