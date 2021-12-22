# -*- mode: ruby -*-
# vi: set ft=ruby :

###################################################################
# Script Name   : Vagrantfile
# Description   : Ansible lab with mixed OSs
# Modified Date : 10/22/2021
# Args          : None
# Author        : James Cox
# Email         : jpaulcox@hotmail.com
# GitHub Repo   : https://github.com/jpaulcox/ansible-lab-mixed
###################################################################

SUBNET = "10.0.0"
BRIDGE = "wlp1s0"

servers = [
    {
        # Windows Servers
    {
        :name => "Windows-Lab-01",
        :type => "win",
        :box => "gusztavvargadr/windows-server",
        :network => "public_network",
        :eth1 => "#{SUBNET}.201",
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    }
    {
        :name => "Windows-Lab-02",
        :type => "win",
        :box => "gusztavvargadr/windows-server",
        :network => "public_network",
        :eth1 => "#{SUBNET}.202",
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    }
    {
        :name => "Windows-Lab-03",
        :type => "win",
        :box => "gusztavvargadr/windows-server",
        :network => "public_network",
        :eth1 => "#{SUBNET}.203",
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    }
        # Linux Servers
        :name => "Linux-Lab-01",
        :type => "linux",
        :box => "aspyatkin/ubuntu-18.04-server",
        :box_version => "1.0.1",
        :network => "public_network", #"private_network, bridged" "public_network" "bridged"
        :eth1 => "#{SUBNET}.204", # Network needs to match your home network
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    },
    {
        :name => "Linux-Lab-02",
        :type => "linux",
        :box => "aspyatkin/ubuntu-18.04-server",
        :box_version => "1.0.1",
        :network => "public_network",
        :eth1 => "#{SUBNET}.205",
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    },
    {
        :name => "Linux-Lab-03",
        :type => "linux",
        :box => "aspyatkin/ubuntu-18.04-server",
        :box_version => "1.0.1",
        :network => "public_network",
        :eth1 => "#{SUBNET}.206",
        :mem => "3064",
        :cpu => "2",
        :role => "" # "Grafana, Wordpress"
    }

]



Vagrant.configure("2") do |config|

    servers.each do |opts|
        config.vm.define opts[:name] do |config|

            config.vm.box = opts[:box]
            config.vm.box_version = opts[:box_version]
            config.vm.hostname = opts[:name]
            config.vm.network opts[:network],:bridge => BRIDGE, ip: opts[:eth1], autoconfig: false

            config.vm.provider "virtualbox" do |v|

                v.name = opts[:name]
            	 # v.customize ["modifyvm", :id, "--groups", "DevOps"]
                v.customize ["modifyvm", :id, "--memory", opts[:mem]]
                v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
            end

            # System Configurations
             # config.vm.provision "shell", path: "scripts/base-setup.sh"
             if opts[:type] == "master"
               # config.vm.provision "shell", path: "scripts/master.sh"
             else
              # config.vm.provision "shell", path: "scripts/node.sh"
             end
           end
         end
end