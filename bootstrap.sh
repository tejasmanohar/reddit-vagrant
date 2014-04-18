#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

wget https://raw.github.com/reddit/reddit/master/install-reddit.sh
chmod +x install-reddit.sh
$REDDIT_USER=vagrant $REDDIT_GROUP=vagrant ./install-reddit.sh

service cassandra start

