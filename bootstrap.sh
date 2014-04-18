#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install curl

wget https://raw.github.com/reddit/reddit/master/install-reddit.sh
chmod +x install-reddit.sh
sudo ./install-reddit.sh

# replace the folder from install-reddit with our local folder

