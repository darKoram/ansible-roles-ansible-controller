#!/bin/bash

# {{ansible_managed}}
# ansible_controller/files/initialize_docker_repos.sh

if [ `boot2docker status` != 'running' ];
then
 echo "Starting boot2docker ..."
 boot2docker start &> /dev/null
fi

if [ `boot2docker status` = 'running' ];
then
 # Intitalize docker env
 $(boot2docker shellinit)

 # Add local insecure repos to docker config
 boot2docker ssh 'sudo sh -c "echo \
   \"EXTRA_ARGS=\\\"--insecure-registry nova.registry.c1.io:5000 \
                    --insecure-registry registry.vpc.c1.io\\\"\" \
     > /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"'
fi