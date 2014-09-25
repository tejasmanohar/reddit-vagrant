#!/bin/bash
apt_get=/usr/bin/apt-get
wget=/usr/bin/wget
service=/usr/sbin/service
reddit_run=/usr/local/bin/reddit-run
init_ctl=/sbin/initctl

export REDDIT_USER=vagrant
export REDDIT_GROUP=vagrant
export REDDIT_HOME="/host"

export REDDIT_PLUGINS=$1

# Install reddit and all its dependencies.
. /vagrant/install-reddit.sh
if [ $2 ]; then
  $init_ctl emit reddit-stop
  eval "cd $REDDIT_HOME/src/reddit/r2; $reddit_run r2/models/populatedb.py -c 'populate()'"
  $init_ctl emit reddit-start
fi
