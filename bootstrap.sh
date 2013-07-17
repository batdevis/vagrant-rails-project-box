#!/usr/bin/env bash

if [ -f "/var/vagrant_provision" ]; then
  exit 0
fi

apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  upgrade

#gem install chef --version 11.4.2 --no-rdoc --no-ri --conservative

touch /var/vagrant_provision
