#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade

wget https://raw.github.com/reddit/reddit/master/install-reddit.sh
chmod +x install-reddit.sh
sudo ./install-reddit.sh

