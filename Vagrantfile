# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.vm.define "puppet" do |puppet|
	puppet.vm.box = "shekeriev/debian-11"
	puppet.vm.hostname = "puppet"
	puppet.vm.network "private_network", ip: "172.17.177.200"
	puppet.vm.provider "virtualbox" do |vb|
		vb.name = "puppet"
		vb.memory = "4096"
		vb.cpus = 2
	end 
	puppet.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
	puppet.vm.provision "shell", path: "script.sh", run: "once"
    end

    config.vm.define "puppetagent" do |puppetagent|
        puppetagent.vm.box = "shekeriev/debian-11"
        puppetagent.vm.hostname = "puppetagent"
        puppetagent.vm.network "private_network", ip: "172.17.177.201"
        puppetagent.vm.provider "virtualbox" do |vb|
                vb.name = "puppetagent"
                vb.memory = "512"
                vb.cpus = 2
        end
        puppetagent.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
        puppetagent.vm.provision "shell", path: "script.sh", run: "once"
    end

    config.vm.define "controle" do |controle|
        controle.vm.box = "shekeriev/debian-11"
        controle.vm.hostname = "controle"
        controle.vm.network "private_network", ip: "172.17.177.100"
        controle.vm.provider "virtualbox" do |vb|
                vb.name = "controle"
                vb.memory = "512"
                vb.cpus = 2
        end
	controle.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
	controle.vm.provision "shell", path: "script.sh", run: "once"
	controle.vm.provision "ansible_local" do |controle|
		controle.playbook = "playbook.yml"
		controle.install_mode = "pip"
	end
    end

    config.vm.define "web" do |web|
        web.vm.box = "shekeriev/debian-11"
        web.vm.hostname = "web"
        web.vm.network "private_network", ip: "172.17.177.101"
        web.vm.provider "virtualbox" do |vb|
                vb.name = "web"
                vb.memory = "512"
                vb.cpus = 2
        end
        web.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
        web.vm.provision "shell", path: "script.sh", run: "once"
    end

    config.vm.define "db" do |db|
        db.vm.box = "shekeriev/debian-11"
        db.vm.hostname = "db"
        db.vm.network "private_network", ip: "172.17.177.102"
        db.vm.provider "virtualbox" do |vb|
                vb.name = "db"
                vb.memory = "512"
                vb.cpus = 2
        end
        db.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
        db.vm.provision "shell", path: "script.sh", run: "once"
    end
end