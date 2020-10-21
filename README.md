# scripts
Cyber - Security Scripts  
Azure Cloud Playbooks README 

Filebeat Installation Playbook 

filebeat.yml
---
- name: installing and launching filebeat
  hosts: webservers
  become: yes
  tasks:

  - name: download filebeat deb
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-$

  - name: install filebeat deb
    command: sudo dpkg -i filebeat-7.6.1-amd64.deb

  - name: save and drop in filebeat.yml
    copy:
      src: /etc/ansible/files/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml

  - name: enable and configure system module
    command: filebeat modules enable system

  - name: setup filebeat
    command: filebeat setup

  - name: start filebeat service
    command: service filebeat start
------------------------------------

Metricbeat Playbook 

metricbeat.yml

---
  - name: Install and Launch Metricbeat
    hosts: webservers
    become: yes
    tasks:

    - name: Download metricbeat .deb metric
      command: curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$

    - name: Install metricbeat .deb
      command: dpkg -i --force-confnew metricbeat-7.6.1-amd64.deb

    - name: Copy over and drop in metricbeat.yml
      copy:
        src: /etc/ansible/files/metricbeat-config.yml
        dest: /etc/metricbeat/metricbeat.yml

    - name: Enable and Configure Docker Module
      command: metricbeat modules enable docker

    - name: Setup metricbeat
      command: metricbeat setup

    - name: Start metricbeat service
      command: service metricbeat start
-------------------------------------

Elk Stack Install 

/etc/ansible/install-elk.yml

---
  - name: Configure Elk VM with Docker
    hosts: elk
    remote_user: Joe
    become: true
    tasks:
      - name: Install apache httpd  (state=present is optional)
        apt:
           name: apache2
           state: absent

      - name: Use more memory
        sysctl:
          name: vm.max_map_count
          value: "262144"
          state: present
          reload: yes

      - name: Install docker.io
        apt:
          name: docker.io
          update_cache: yes
          state: present

      - name: Install Python3-pip
        apt:
          name: python3-pip
          state: present

      - name: Install Docker using pip
        pip:
          name: docker
          state: present

      - name: Install ELK
        docker_container:
          name: elk
          image: sebp/elk:761
          state: started
          restart_policy: always
          published_ports:

----------------------------------

READY TO FINISH -- READ ME - JOE
