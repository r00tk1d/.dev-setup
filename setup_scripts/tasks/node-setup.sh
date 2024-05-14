#!/bin/bash

sudo apt-get -q install -y nodejs || handle_fail "nodejs" 
sudo apt-get -q install -y npm || handle_fail "npm" 

sudo npm install -g n || handle_fail "n" 