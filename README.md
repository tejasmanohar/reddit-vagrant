reddit-vagrant
==============

Vagrant setup for le reddit.

Usage
-----

* Copy `vagrant_config.yml.example` to `vagrant_config.yml`. Change values as necessary.
* Install vagrant and virtualbox (or vmware and the provider, or whatever you prefer.)
* Run `vagrant up` (optionally with `--provider=vmware_fusion or whatever.)
* Optionally run `vagrant ssh` and follow the output to add test data to the database (follow prompts in output.)
* Visit `localhost:8080` and revel in your beautiful new reddit development environment.

Configuration
-------------

Configuration happens through an optional `vagrant_config.yml` file. View the example file to see example configuration.
