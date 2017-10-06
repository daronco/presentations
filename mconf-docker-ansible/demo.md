# prep

docker rmi nginx:1.13

# docker

--- Instalar
https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/


--- demo geral

docker run nginx:1.13
docker ps
docker ps --no-trunc
docker inspect --format '{{ .NetworkSettings.IPAddress }}' 123123123
http://172.17.0.2/
CTRL+c
docker ps -a
docker run -p 5000:80 nginx:1.13
docker exec -ti 123123 bash

CTRL+c
docker ps -a
docker start 123123 
docker ps
docker stop 123123 
docker ps

http://hub.docker.com -> procurar nginx
docker run --rm -p 5000:80 -v /home/daronco/Dev/daronco/presentations/mconf-docker-ansible/docker:/usr/share/nginx/html:ro nginx:1.13


docker run -ti ruby:2.3
docker run -ti ruby:2.3 ruby --version
docker run -ti ruby:2.2.0 ruby --version

docker run -ti ruby:2.3 ruby -e 'puts "123"'
docker run -ti ruby:2.3 ruby mconf-docker-ansible/docker/shrug.rb
docker run -ti ruby:2.3 pwd
docker run --rm -ti -v /home/daronco/Dev/daronco/presentations/mconf-docker-ansible/docker/:/demo ruby:2.3 ruby /demo/shrug.rb


--- Criar Dockerfile
* Dockerfile base ruby:2.3
docker build -t demo .
docker run -ti --rm demo
* Modificar o config.yml local, não vai funcionar
docker run -ti -v /home/daronco/Dev/daronco/presentations/mconf-docker-ansible/docker/config.yml:/demo/config.yml --rm demo

--- via env
* Adicionar puts do ENV no print-file.rb

--- via envsubst
* Criar config.yml.template
* Mudar Dockerfile
* Criar wrapper
  envsubst '${MYAPP_VAR1} ${'MYAPP_VAR2'}' < config.yml.template > config.yml
* build, run

--- daemon, logs -f
* mudar para ele rodar o shrug.rb
docker run -ti --rm -d demo
docker logs 123123 -f

--- mostrar mconftec/mconf-rec-proxy
https://github.com/mconftec/mconf-rec-proxy


--- DOCKER COMPOSE


# ansible

--- Instalar
http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu


--- demo
-- mostrar hosts
ansible demo -i hosts -m command -a "uptime"
ansible demo -i hosts -m command -a "uptime" -u ubuntu -k --extra-vars "ansible_python_interpreter=/usr/bin/python3"

ansible demo -i hosts -m ping -u ubuntu -k --extra-vars "ansible_python_interpreter=/usr/bin/python3"

ansible demo -i hosts -m apt -a "name=wget state=latest" -u ubuntu -k -K -b --extra-vars "ansible_python_interpreter=/usr/bin/python3"
-- rodar de novo, não vai mudar

-- group_vars
ansible demo -i hosts -m command -a "whoami"
ansible demo -i hosts -m command -a "python3 --version"

--- playbook
ansible-playbook -l demo -i hosts -u ubuntu -k -K setup.yml
ansible demo -i hosts -m command -a "whoami" -u mconf

ansible demo -i hosts -m command -a "sleep 3" -u mconf -f 1

ansible-playbook -l demo -i hosts -u mconf setup.yml

--- mudanças, -C
-- mudar algo no setup.yml
ansible-playbook -C -l demo -i hosts -u mconf setup.yml
ansible-playbook -C -l demo -i hosts -u mconf setup.yml

ansible-playbook -l demo -i hosts -u mconf setup.yml
ansible-playbook -l demo -i hosts -u mconf setup.yml


--- mostrar mconf-ansihub

