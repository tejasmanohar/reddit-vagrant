reddit-vagrant
==============

Vagrant setup for le reddit.

Usage
-----

* Clone your version of reddit to `../reddit` (location configurable in `vagrant_config.yml`)
* Copy `vagrant_config.yml.example` to `vagrant_config.yml`. Change values as necessary.
* Install vagrant and virtualbox (or vmware and the provider, or whatever you prefer.)
* Run `vagrant up` (optionally with `--provider=vmware_fusion` or whatever.)
* Optionally run `vagrant ssh` and follow the output to add test data to the database
   (follow prompts in output.)
* Visit `localhost:8080` and revel in your beautiful new reddit development environment.

Protips
-------

If on OSX, [sshfs](http://osxfuse.github.io/) works well for mounting the home folder if you
want to edit more than just the home folder; for example, plugin development.

When Things Go Wrong
--------------------

Try a `vagrant reload --provision` if the install script didn't complete. If that doesn't fix
it, as a last resorty ty a `vagrant destroy` and then a `vagrant up`. Sometimes packages don't
download properly.

