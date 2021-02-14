#!/bin/bash
echo "downloading ppa "
path='/install/ansible_playbook/prod/files/ansible_src/'
apt-get install ansible $path*.deb -y



