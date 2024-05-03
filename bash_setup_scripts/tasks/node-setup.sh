#!/bin/bash

sudo apt -qq install -y nodejs || handle_fail "nodejs" 
sudo apt -qq install -y npm || handle_fail "npm" 

sudo npm install -g n || handle_fail "n" 