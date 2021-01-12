#!/bin/bash
CONFIGFILE="/vagrant/configs/config.$(hostname)"
ETH0IP=$(ip addr | grep 'eth0' | grep inet | awk '{print $2}' | cut -f1  -d'/')
sudo sed "s/server: https:\/\/.*:/server: https:\/\/${ETH0IP}:/g" /etc/rancher/k3s/k3s.yaml > ${CONFIGFILE}
