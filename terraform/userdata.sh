#!/bin/bash

sudo apt-get update && sudo apt-get install -y ansible

cat << 'EOF' > /etc/ansible/hosts
[web]
localhost
EOF

cat << 'EOF' > /etc/ansible/playbook.yml
- hosts: web
  become: true
  tasks:
    - name: Install Docker
      become: true
      apt:
        name: docker.io
        state: present
      tags: [docker]

    - name: Install Docker-Compose
      become: true
      shell: curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
      tags: [docker-compose]

    - name: Configure Nginx
      become: true
      copy:
        src: /etc/ansible/files/nginx.conf
        dest: /etc/nginx/sites-available/default
      notify:
        - restart nginx
      tags: [nginx]

  handlers:
    - name: restart nginx
      become: true
      service:
        name: nginx
        state: restarted
      tags: [nginx]
EOF

ansible-playbook -i /etc/ansible/hosts
