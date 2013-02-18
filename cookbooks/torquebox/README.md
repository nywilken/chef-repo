Description
===========
This cookbook includes recipes to install a torquebox server instance on a vagrant vm running Ubuntu 12.04. It also includes a chef definition called jruby_app which can be used to deploy a jruby_app to the torquebox instance.

Requirements
==========
This cookbook installs openjdk-7-jdk so it is important that you run the apt recipe before calling recipe[torquebox]. 

Attributes
==========
- dir: install location for the torquebox binaries.
- home: symlink name that will point to the torquebox binaries.
- log_dir: directory for storing torquebox console logs
- conf_dir: location of the login profile scripts (defaults /etc/profile.d). 
- bind_addr: default interface which the torquebox instance will bind to (default 0.0.0.0).
- bind_port: default port which the torquebox instance will listen on
- user: owner of the torquebox binaries; also used for deploying jruby_apps (default vagrant). 


Usage
=====
Put recipe[torquebox] in the run list. 
