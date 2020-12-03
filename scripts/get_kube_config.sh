#!/bin/bash
CONFIGFILE="/vagrant/configs/config.$(hostname)"
cp /etc/rancher/k3s/k3s.yaml ${CONFIGFILE}
ETH0IP=$(ip addr | grep 'eth0' | grep inet | awk '{print $2}' | cut -f1  -d'/')
sed -i "s/server: https:\/\/.*:/server: https:\/\/${ETH0IP}:/g" ${CONFIGFILE}
