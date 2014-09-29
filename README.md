reddit-vagrant
==============

Vagrant setup for le reddit.


Usage
-----

* OPTIONAL, Copy `vagrant_config.yml.example` to `vagrant_config.yml`. Change values as necessary.
    * Note: If you intend on having your source tree mounted from your host, copy
      vagrant_config.yml.devexample instead
* Install vagrant
* Install vagrant-bindfs `vagrant plugin install vagrant-bindfs`
* Install your preferred vmware provider(VirtualBox, KVM, and VMWare are supported)
  * VirtualBox - works out of the box, install VirtualBox on your host machine.
  * KVM - `vagrant plugin install vagrant-kvm` (you'll also need libvirt-dev on your host).
  * VMWare - `vagrant plugin install vagrant-vmware-fusion` (you'll also need vmware-fusion)
  * NOTE - You will also need to choose the appropriate box for a particular provider in your
    vagrant_config.yml. VirtualBox is default

* OPTIONAL, but recommended. Install the cachier plugin for vagrant
  (`vagrant plugin install vagrant-cachier`). This will make future provisions MUCH faster.
* Run `vagrant up --provider=:provider`, wait for it to finish.
* Visit `localhost:8001` and revel in your beautiful new reddit development environment.
* NOTE, to get cookie auth working properly, you need to add a line to /etc/hosts for `reddit.local`
  that points to either `127.0.0.1`(access via reddit.local:port` or the VM's private ip to access on
  port 80.


Protips
-------
* Read `vagrant_config.yml`.
* Setting testData to false can speed up provisioning times dramatically.
* Setting nfs to false is a good idea on vmware and also on osx.
* Read the bash_helpers script for aliases to common commands.

Q & A
-----

* Why use a config file? (vagrant_config.yml)
  * So your config isn't in git and you can change things willy-nilly.


When Things Go Wrong
--------------------
If you are using KVM, the most recent version has a bug in it that breaks private networks.
Please uninstall vagrant-kvm and reinstall it with the --plugin-version=0.1.7 switch.

First, try to `git clean -f -d` each of your local source trees. The build process is messy.
Then, try a `vagrant provision` if the install script didn't complete. If that doesn't fix
it, as a last resort try a `vagrant destroy` and then a `vagrant up`. Sometimes packages don't
download properly.
