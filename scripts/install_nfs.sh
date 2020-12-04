#!/bin/bash
# yum install nfs-utils -y
yum install /vagrant/rpms/nfs/*
systemctl enable --now nfs-server.service
