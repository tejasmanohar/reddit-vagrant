#!/usr/bin/env bash

# Download the reddit install file.
sudo apt-get update
sudo apt-get upgrade

wget https://raw.github.com/reddit/reddit/master/install-reddit.sh
chmod +x install-reddit.sh

# Install reddit and all its dependencies.
REDDIT_USER=vagrant REDDIT_GROUP=vagrant sudo ./install-reddit.sh

# The script starts it, but it always fails for me, so starting it here too seems
# more reliable.
sudo service cassandra start

# Install some helpful bash functions.
cat /vagrant/bash_helpers >> /home/vagrant/.bashrc

