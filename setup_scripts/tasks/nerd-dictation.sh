#!/bin/bash

# Install dependencies for nerd-dictation
sudo apt install pulseaudio-utils

python -m venv venv
source venv/bin/activate
pip install vosk


# Clone the nerd-dictation repository and download the Vosk model
git clone https://github.com/ideasman42/nerd-dictation.git
cd nerd-dictation

# Download the German Vosk model
wget https://alphacephei.com/kaldi/models/vosk-model-small-de-0.15.zip
unzip vosk-model-small-de-0.15.zip
mv vosk-model-small-de-0.15 de-de-small-model

# Download the English Vosk model
wget https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip
unzip vosk-model-small-en-us-0.15.zip
mv vosk-model-small-en-us-0.15 en-us-small-model

# Use the following command to start nerd-dictation in english
# /venv/bin/python ./nerd-dictation begin --vosk-model-dir=./en-us-small-model &

# Use the following command to start nerd-dictation in german
# /venv/bin/python ./nerd-dictation begin --vosk-model-dir=./de-de-small-model &

# To stop the service, use the following command
# ./nerd-dictation end