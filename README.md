Role Name
=========

This role automates the creation of Vagrantfiles on one or more host machines, based on a YAML definition file provided as a variable. The YAML file should list the target host machines using keys that match the ansible_host entries in the inventory. Under each host entry, users can define one or more VMs using standard Vagrant configuration options as documented in the official Vagrant documentation.

Additionally, if both Vagrant and VirtualBox are installed on the host machine(s), the role can optionally bring up the defined VMs automatically. This behavior is controlled using the vagrantoption key under each machine in the YAML file.

Requirements
------------

Vagrant and VirtualBox must be installed on the host machine in order to execute the vagrant command using the `vagrantoptions` var.

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):


Dependencies
------------

None.

Example Playbook
----------------
    - hosts: servers
      roles:
        - aIrseneO.vm
      vars:
        ## Options to be used when running vagrant (optional)
        #   vagrantoptions: "up VM21"
        #   vagrantoptions: "status"
        
        ## List of host machines to run the playbook and create the VM(s)
        machines:
        
        ## host matching the host in the inventory file
        - host: localhost
        
          ## working directory on the host machine
          working_dir: "/home/ansible/.ansible-role-vm"
        
          ## List of VM(s) to create
          vnodes:
          - name: VM21
            hostname: VM21
            image: generic/ubuntu2204
            tag: 4.3.12
            provider: 
              type: virtualbox
              gui: false
              cpus: 1
              memory: 1024
              name: VM21
            network: 
              type: private_network
              ip: "192.168.42.21"
            sync:
            - local: "."
              remote: "/vagrant"
              disable: true

License
-------

MIT

Author Information
------------------

This role was create in 2023 by [AIrseneO](https://github.com/aIrseneO)