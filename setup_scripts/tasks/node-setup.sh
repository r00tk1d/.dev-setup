#!/bin/bash

sudo apt -q install -y nodejs || handle_fail "nodejs" 
sudo apt -q install -y npm || handle_fail "npm" 

sudo npm install -g n || handle_fail "n" 