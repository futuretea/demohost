#!/bin/bash
./uninstall_k3s.sh
cp ../bin/k3s /usr/local/bin/
cd /vagrant/scripts
export INSTALL_K3S_SKIP_DOWNLOAD=true
export INSTALL_K3S_BIN_DIR=/usr/local/bin
./install_k3s_selinux.sh
./install_k3s.sh
find /vagrant/images -type f | while read -r IMAGE;do /usr/local/bin/k3s ctr image import $IMAGE; done
./get_kube_config.sh