#!/usr/bin/env bash

# Update all the things.
sudo apt-get update
sudo apt-get -y upgrade

# Download the reddit install file.
wget https://raw.github.com/reddit/reddit/master/install-reddit.sh
chmod +x install-reddit.sh

# Use the local reddit folder instead of cloning it from git.
sed -i 's/clone_reddit_repo reddit reddit\/reddit/ln -s \/reddit src\/reddit/' install-reddit.sh

# Install reddit and all its dependencies.
REDDIT_USER=vagrant REDDIT_GROUP=vagrant sudo ./install-reddit.sh

# The script starts it, but it always fails for me, so starting it here too seems
# more reliable.
sudo service cassandra start

# Install some helpful bash functions.
cat bash_helpers >> .bashrc


