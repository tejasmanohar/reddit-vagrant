reddit-vagrant
==============

This is a vagrant setup for reddit - it's likely temporary and will be merged into
reddit/reddit once we have a stable baseline comfort level for using vagrant
in-house.

To begin, install vagrant for your platform. https://www.vagrantup.com/downloads.html If you are
on linux, odds are you can just use your package manager to install vagrant.

Usage
-----

####Simple

    git clone https://github.com/reddit/reddit-vagrant.git
    cd reddit-vagrant
    vagrant plugin install vagrant-bindfs
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-hostsupdater
    sudo chmod +w /etc/hosts
    vagrant up

Afterwards, visit http://reddit.local and enjoy your fresh new local reddit install!

####Advanced

* OPTIONAL, Copy `vagrant_config.yml.example` to `vagrant_config.yml`. Change values as necessary.
    * Note: If you intend on having your source tree mounted from your host, copy
      vagrant_config.yml.devexample instead
* Install vagrant (Get the latest from https://www.vagrantup.com/downloads.html)
* Install vagrant-bindfs `vagrant plugin install vagrant-bindfs`
* Install your preferred vmware provider(VirtualBox, KVM, and VMWare are supported)
  * VirtualBox - works out of the box, install VirtualBox on your host machine.
  * KVM - `vagrant plugin install vagrant-kvm` (you'll also need libvirt-dev on your host).
  * VMWare - `vagrant plugin install vagrant-vmware-fusion` (you'll also need vmware-fusion)
  * NOTE - You will also need to choose the appropriate box for a particular provider in your
    vagrant_config.yml. VirtualBox is default
* Install vagrant-hostsupdater - this will add the appropriate hosts entries for your local system.
  `vagrant plugin install vagrant-hostsupdater`. Note::This will require that your hosts file be
  writeable by the user vagrant is being run as.
* OPTIONAL, but recommended. Install the cachier plugin for vagrant
  (`vagrant plugin install vagrant-cachier`). This will make future provisions MUCH faster.
* Run `vagrant up --provider=:provider`, wait for it to finish.
* Visit `http://reddit.local` and revel in your beautiful new reddit development environment.


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
If reddit.local cannot be resolved, first check your /etc/hosts file and see if that hostname
is in there. If it is not, run `vagrant ssh-config` inside of your reddit-vagrant folder. You
should then add an entry to /etc/hosts that corresponds to the IP address from the command and
try again. This happens when the user vagrant is running as does not have access to write to
your /etc/hosts file.

If you browse to reddit.local and see a 503 error, run `vagrant ssh` in your reddit-vagrant
folder and then, using your favorite command line text editor, edit the
/var/log/upstart/reddit-paster.log log file to see what went wrong.

If vagrant up terminates relatively quickly, shows
`Stderr: VBoxManage: error: DHCP server already exists`, and you are using VirtualBox then
run the command `VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0`
and try again. This happens because of a bug in the vagrant-virtualbox plugin. It does not
check to see if an existing dhcp server is set up before creating a new one.

If you are using KVM, the most recent version has a bug in it that breaks private networks.
Please uninstall vagrant-kvm and reinstall it with the --plugin-version=0.1.7 switch.

First, try to `git clean -f -d` each of your local source trees. The build process is messy.
Then, try a `vagrant provision` if the install script didn't complete. If that doesn't fix
it, as a last resort try a `vagrant destroy` and then a `vagrant up`. Sometimes packages don't
download properly.

