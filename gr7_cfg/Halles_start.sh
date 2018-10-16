#!/bin/bash

ip -6 rule add from fd00:200:7::/48 table 200
ip -6 rule add from fd00:300:7::/48 table 300

ip -6 addr add fd00:200::7/48 dev belnetb

ip addr add fd00:200:7:13::1/64 dev Halles-eth0
ip addr add fd00:200:7:12::1/64 dev Halles-eth1

ip addr add fd00:300:7:13::1/64 dev Halles-eth0
ip addr add fd00:300:7:12::1/64 dev Halles-eth1

puppet apply --verbose --parser future --hiera_config=/etc/puppet/hiera.yaml /etc/puppet/site.pp --modulepath=/puppetmodules

echo "[HALL] setting firewall"
firewalls/./HALL.sh
echo "[HALL] firewall set"
