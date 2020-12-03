#!/bin/bash
yum install -y qemu-kvm qemu-img libvirt libvirt-python virt-* libguestfs-tools
systemctl enable libvirtd
systemctl start libvirtd
modprobe kvm kvm_intel
modprobe vhost-net fuse
