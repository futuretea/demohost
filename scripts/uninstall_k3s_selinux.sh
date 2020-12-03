#!/bin/sh
set -x
[ $(id -u) -eq 0 ] || exec sudo $0 $@

if type yum >/dev/null 2>&1; then
    yum remove -y k3s-selinux
    rm -f /etc/yum.repos.d/rancher-k3s-common*.repo
fi
