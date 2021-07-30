#!/bin/bash

# run this only on master node rn
# this script assumes the plex server is already setup

base="env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy"

running_check () {
  until docker stack ps -f "name=$1" --format '{{.Name}} {{.CurrentState}}' dns | grep 'Running'
  do
    sleep 10
  done
}

caddy="${base} -c caddy.yml caddy"
portainer="${base} -c portainer.yml portainer"
stubby="${base} -c stubby.yml dns"
unbound="docker stack deploy -c unbound.yml dns"
pihole="${base} -c pihole.yml dns"
media="${base} -c transmission.yml -c plex/plex.yml -c prowlarr.yml -c sonarr.yml -c radarr.yml media"
misc="${base} -c shepherd.yml misc" #untested
whoogle="${base} -c whoogle.yml misc"

docker network create -d overlay proxy

docker-compose -f nfs_server.yml up -d

eval $caddy
eval $portainer

docker network create -d overlay dns
eval $stubby
echo 'Waiting for stubby service to be running for proper unbound service init...'
running_check dns_stubby
eval $unbound
# TODO add something that will update pihole dns to unbound, listener container?
eval $pihole

eval $media
# eval $misc
eval $whoogle
