Vagrant.configure("2") do |config|
  config.vm.define "redis" do |redis|
    redis.vm.box = "hashicorp/precise64"
    redis.vm.hostname = 'redis.devops.com'

    redis.vm.network :private_network, ip: "10.127.0.30"

    redis.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 256]
      v.customize ["modifyvm", :id, "--name", "redis"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end

  config.vm.define "php" do |php|
    php.vm.box = "hashicorp/precise64"
    php.vm.hostname = 'php.devops.com'

    php.vm.network :private_network, ip: "10.127.0.20"

    php.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "php"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "hashicorp/precise64"
    nginx.vm.hostname = 'nginx.devops.com'

    nginx.vm.network :private_network, ip: "10.127.0.10"

    nginx.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "nginx"]
      v.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    #ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
  end
end
