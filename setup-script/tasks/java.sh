#!/bin/bash

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Source SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Java JDK with SDKMAN
sdk install java

# Print installed Java versions
echo "Java versions installed:"
sdk list java | grep installed

# Set default Java version (optional)
# sdk default java <version>

# Install Maven
sudo apt install maven -y