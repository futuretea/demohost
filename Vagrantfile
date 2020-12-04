# -*- mode: ruby -*-
# vi: set ft=ruby :

def ip2mac(prefix, str_ip)
	@mac=prefix
	str_ip.split('.').each do |k|
		k="%02x" % k
		@mac=@mac+":"+k.to_s
	end
	return @mac
end

Vagrant.configure("2") do |config|
  (11..11).each do |i|
    config.vm.define "demohost#{i}" do |node|
      # node.ssh.username = 'root'
      # node.ssh.password = 'vagrant'
      node.ssh.insert_key = true
      node.vm.box = 'centos-7-1905.1-libvirt'
      node.vm.hostname = "demohost#{i}"
      node.vm.synced_folder '.', '/vagrant', create: true, type: "nfs", nfs_udp: false, nfs_version: 4
      node.vm.provider :libvirt do |domain|
        domain.driver = 'kvm'
        domain.memory = 4096
        domain.cpus = 4
        domain.nested = true
        domain.management_network_name = "demohost"
        domain.management_network_address = "10.5.2.0/24"
        domain.management_network_mac = ip2mac("50:50","10.5.2.#{i}")
        domain.storage :file, :size => '20G', :bus => 'virtio'
        domain.storage :file, :size => '10G', :bus => 'virtio'
      end
      node.vm.provision :shell, :path => 'provision.sh'
      node.vm.provision :shell, inline: <<-SHELL
      export K3S_TOKEN="token"
      export INSTALL_K3S_EXEC="server --disable=traefik"
      cd /vagrant/scripts
      ./onekey.sh
      ./get_kube_config.sh
SHELL
    end
  end
end
Vagrant.configure("2") do |config|
  (12..20).each do |i|
    config.vm.define "demohost#{i}" do |node|
      # node.ssh.username = 'root'
      # node.ssh.password = 'vagrant'
      node.ssh.insert_key = true
      node.vm.box = 'centos-7-1905.1-libvirt'
      node.vm.hostname = "demohost#{i}"
      node.vm.synced_folder '.', '/vagrant', create: true, type: "nfs", nfs_udp: false, nfs_version: 4
      node.vm.provider :libvirt do |domain|
        domain.driver = 'kvm'
        domain.memory = 4096
        domain.cpus = 4
        domain.nested = true
        domain.management_network_name = "demohost"
        domain.management_network_address = "10.5.2.0/24"
        domain.management_network_mac = ip2mac("50:50","10.5.2.#{i}")
        domain.storage :file, :size => '20G', :bus => 'virtio'
        domain.storage :file, :size => '10G', :bus => 'virtio'
      end
      node.vm.provision :shell, :path => 'provision.sh'
      node.vm.provision :shell, inline: <<-SHELL
      export K3S_TOKEN="token"
      export K3S_URL="https://10.5.2.11:6443"
      export INSTALL_K3S_EXEC="agent"
      cd /vagrant/scripts
      ./onekey.sh
SHELL
    end
  end
end
