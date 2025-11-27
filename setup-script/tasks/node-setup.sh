#!/bin/bash

sudo apt-get -q install -y nodejs || handle_fail "nodejs" 
sudo apt-get -q install -y npm || handle_fail "npm" 

(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash) || handle_fail "nvm" 