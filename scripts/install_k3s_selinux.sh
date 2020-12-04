#!/bin/bash
# yum install -y container-selinux selinux-policy-base
# rpm -i https://github.com/rancher/k3s-selinux/releases/download/v0.2.stable.1/k3s-selinux-0.2-1.el7_8.noarch.rpm
yum install -y /vagrant/rpms/k3s/*
