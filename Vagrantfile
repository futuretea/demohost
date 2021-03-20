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
  (21..21).each do |i|
    config.vm.define "demohost#{i}" do |node|
      # node.ssh.username = 'root'
      # node.ssh.password = 'vagrant'
      node.ssh.insert_key = false
      node.vm.box = 'centos-7-1905.1-libvirt'
      node.vm.hostname = "demohost#{i}"
      node.vm.synced_folder '.', '/vagrant', create: true, type: "nfs", nfs_udp: false, nfs_version: 4
      node.vm.provider :libvirt do |domain|
        domain.driver = 'kvm'
        domain.memory = 4096
        domain.cpus = 4
        domain.nested = true
        domain.management_network_name = "dev"
        domain.management_network_address = "10.5.6.0/24"
        domain.management_network_mac = ip2mac("50:50","10.5.6.#{i}")
      end
      node.vm.provision :shell, :path => 'scripts/config_ssh.sh'
      node.vm.provision :shell, :path => 'scripts/install_nfs.sh'
      node.vm.provision :shell, inline: <<-SHELL
      export K3S_TOKEN="token"
      export INSTALL_K3S_EXEC="server --cluster-init"
      cd /vagrant/scripts
      ./reinstall_k3s.sh
SHELL
    end
  end
end

Vagrant.configure("2") do |config|
  (22..23).each do |i|
    config.vm.define "demohost#{i}" do |node|
      # node.ssh.username = 'root'
      # node.ssh.password = 'vagrant'
      node.ssh.insert_key = false
      node.vm.box = 'centos-7-1905.1-libvirt'
      node.vm.hostname = "demohost#{i}"
      node.vm.synced_folder '.', '/vagrant', create: true, type: "nfs", nfs_udp: false, nfs_version: 4
      node.vm.provider :libvirt do |domain|
        domain.driver = 'kvm'
        domain.memory = 4096
        domain.cpus = 4
        domain.nested = true
        domain.management_network_name = "dev"
        domain.management_network_address = "10.5.6.0/24"
        domain.management_network_mac = ip2mac("50:50","10.5.6.#{i}")
      end
      node.vm.provision :shell, :path => 'scripts/config_ssh.sh'
      node.vm.provision :shell, :path => 'scripts/install_nfs.sh'
      node.vm.provision :shell, inline: <<-SHELL
      export K3S_TOKEN="token"
      export K3S_URL="https://10.5.6.21:6443"
      export INSTALL_K3S_EXEC="agent"
      cd /vagrant/scripts
      ./reinstall_k3s.sh
SHELL
    end
  end
end
