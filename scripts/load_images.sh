#!/bin/bash
find /vagrant/images -type f -name *.tar| while read -r IMAGE;do /usr/local/bin/k3s ctr image import $IMAGE; done
