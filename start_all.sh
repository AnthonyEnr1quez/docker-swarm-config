#!/bin/bash
source .nfs_conn
# run this only on master node rn

docker network create -d overlay --attachable proxy # attachable for qbittorrent until swarmable

docker-compose -f nfs_server.yml up -d
docker-compose -f qbittorrent up -d

base="NFS_CONN=${NFS_CONN} docker stack deploy"
caddy="${base} -c caddy.yml caddy"
pihole="${base} -c pihole.yml pihole"
portainer="${base} -c portainer.yml portainer"
media="${base} -c jackett.yml -c plex.yml -c radarr.yml -c sonarr.yml media"
misc="${base} -c shepherd.yml -c whoogle.yml misc"

eval $caddy
eval $portainer

eval $pihole

docker network create -d overlay --attachable dns # for stubby_unbound
#todo ssh into beluga, pipe in docker-compose? and start stubby_unbound

eval $media
eval $misc
