#!/bin/bash
source .nfs_conn
# run this only on master node rn

docker network create -d overlay --attachable proxy # attachable for qbittorrent until swarmable
docker-compose -f nfs_server.yml up -d

base="NFS_CONN=${NFS_CONN} docker stack deploy"
caddy="${base} -c caddy.yml -c pihole.yml caddy"
portainer="${base} -c portainer.yml portainer"
media="${base} -c jackett.yml -c plex.yml -c radarr.yml -c sonarr.yml media"
misc="${base} -c gitea.yml -c shepherd.yml -c whoogle.yml misc"

eval $caddy
eval $portainer
eval $media
eval $misc
