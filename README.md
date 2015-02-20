ansible_controller

=========

Set up a machine to develop roles and run ansible-playbook tasks.
Include all the bells and whistles for a great ansible
dev environment and package dependencies.

For a bare bones ansible installer see geerlingguy.ansible role.
on ansible-galaxy.  This role sets you up to develop ansible like a boss.

# Use Case I
Install ansible to remote machines from an existing 
ansible_controller
ansible-playbook -i hosts ansible_controller_site.yml

# Use Case II
Auto-installing to localhost.  
We don't have ansible yet, so can't run ansible-playbook!
First, copy files/ansible_bootstrap.sh (web-copy is fine)
to your desired installation directory.  
ansible_controller_project_home> chmod a+x ansible_bootstrap.sh
ansible_controller_project_home> ./ansible_bootstrap.sh


Requirements
------------

Darwin/OSX
X code commandline tools

OSX or Debian family
Installs ansible, git, pip then clones this repo and runs
ansible-playbook -i hosts ansible_controller_site.yml -K -vvvv
to complete the installation

Redhat/Centos family (Not supported, pull requests welcome)


Role Variables
--------------

You can pick and chose or add to the vars below defined
in defaults/main.yml
ansible_controller_dmgs is a list of osx dmgs to install
ansible_controller_apt_packages for Debian/Ubuntu family
ansible_controller_pip_packages: python packages for OSX or Debian/Ubuntu
ansible_controller_gems: ruby packages

Control the type of ansible installation:
You may wish to have multiple installations and
switch between them as needed.
ansible_controller_from_pip: True
ansible_controller_from_apt: False
ansible_controller_from_homebrew: False
ansible_controller_from_git_source: False

Dependencies
------------

OSX
geerlingguy.homebrew


Example Playbook for Use Case II
----------------

Create a project directory, for example
> mkdir deploy_controllers; cd !$

This will be a canonical ansible tree:
> tree /path/to/deploy_controllers
|-hosts 
|-ansible_controller_site.yml 
|-roles/
|---ansible_controller/

You may want to add other deployment roles here as submodules
in the roles/ directory, such as
gce_controller - Google Compute Engine
aws_controller - AWS 
jenkins - continuous builds (build binaries)
GoCD - continuous delivery pipelines 

Add hosts and ansible_controller_site.yml to deploy_controllers:

> cat ansible_controller_site.yml
    - hosts: all
      roles:
         - { role: darKoram.ansible-roles-ansible-controller }

Or (recommended) strip off the common prefix "ansible-roles" by 
specifying the name of the folder to clone to:
> clone https://github.com/darKoram/ansible-roles-ansible-controller.git adarKoram.ansible_controller
> cd ansible_controller
> ansible-controller -i hosts ansible_controller_site.yml -K -vvvv
We use -K to request the sudo password for localhost
and -vvvv for max verbosity

> cat ansible_controller_site.yml

    - hosts: ansible_controller
      roles:
         - { role: darKoram.ansible_controller }

> cat hosts
[ansible_controller]
localhost connecton=local ansible_python_interpreter=/usr/bin/python

Example Playbook Use Case I
----------------------------
This would be helpful if you are setting up a shared cloud
hosted ansible controller, or if you need multiple build
agents to parallelize bottleneck steps in the CI process.

> cat hosts
[ansible_controller]
agent1
agent2
agent3

License
-------

BSD

Author Information
------------------

Kesten Broughton
