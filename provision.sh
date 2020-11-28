#!/bin/bash
sed -ri 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
cat >>/etc/ssh/sshd_config <<EOF
PermitRootLogin yes
UseDNS no
EOF
systemctl restart sshd
yum install nfs-utils -y
systemctl enable --now nfs-server.service
