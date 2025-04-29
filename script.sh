#!/bin/bash
cd /tmp
wget https://apt.puppet.com/puppet7-release-bullseye.deb
dpkg -i puppet7-release-bullseye.deb

apt update
apt install vim puppet-agent -y
